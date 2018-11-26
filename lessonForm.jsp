<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	div#lesson{
		margin-top:50px;
		margin-bottom:50px;
		margin-left:20%;
		margin-right:20%;
		color:gray;
		font-size:15px;
	}
	div#lesson table{
		width:100%;
		height:500px;
	}
	div#label{
		width:100%;
		font-size:20px;
		text-align:left;
  		color:#D82424;
  		font-weight:bold;
  		margin-bottom:20px;
	}
	div#lesson table{
		border-collapse:collapse;
		border:0px;
		text-align:center;
	}
	div#lesson table tr:nth-child(1){
		background-color:#D82424;
		font-weight:bold;
		color:white;
	}
	div#lesson table tr td{
		border:0px;
		border-bottom:1px solid #eeeeee;
	}
	div#lesson table tr td:nth-child(1){
		width:800px;
	}
	div#lesson table tr td:nth-child(2){
		width:200px;
	}
	div#lesson table tr td a{
		text-decoration:none;
		color:#D82424;
	}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
	
	String userID=null;
	if(session.getAttribute("userID")!=null){
		userID=(String)session.getAttribute("userID");
	}
	if(userID==null){
		out.println("<script>");
		out.println("alert('로그인이 필요합니다.');");
		out.println("location.href='login.jsp';");
		out.println("</script>");
	}
	/*강의 목록*/
	BufferedReader reader = null;
	String a="";
	String tmp = "";
	try{
		String filePath = application.getRealPath("/WEB-INF/lesson.txt");
		reader=new BufferedReader(new InputStreamReader(new FileInputStream(filePath),"UTF-8"));
		while(true){
			a = reader.readLine();
			if(a==null)break;
			
			tmp += a;
		}
	}catch(Exception e){
		//out.println("지정된 파일을 찾을 수 없습니다.");
	}
	String[] lesson = tmp.split(",");

	/*학습체크*/
	String filename=userID+".txt";
	BufferedReader reader2 = null;
	String a2="";
	String tmp2 = "";

	try{
		String filePath2 = application.getRealPath("/WEB-INF/member/"+filename);
		reader2=new BufferedReader(new InputStreamReader(new FileInputStream(filePath2),"UTF-8"));
		while(true){
			a2 = reader2.readLine();
			if(a2==null)break;
			tmp2 += a2;
		}
	}catch(Exception e){
		//out.println("지정된 파일을 찾을 수 없습니다.");
	}
	String[] member = tmp2.split(",");

	/*result*/
	String filename1="result"+userID+".txt";
	BufferedWriter writer = null;
	try{
		String filePath3 = application.getRealPath("/WEB-INF/"+filename1);
		writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(filePath3),"UTF-8"));
		
		for(int i=0; i<lesson.length/5; i++){
			for(int j=0; j<member.length/2; j++){
				if(member[j*2].equals(lesson[i*5])){
					lesson[i*5+4]=member[j*2+1];
				}
			}
			writer.write(lesson[i*5]+","+lesson[i*5+1]+","+lesson[i*5+2]+","+lesson[i*5+3]+","+lesson[i*5+4]+",");
		}
		writer.flush();
	}
	catch(Exception e){
		//out.println("오류 발생");
	}
	finally{
		writer.close();
	}
	//String filename1="result"+userID+".txt";
	
	BufferedReader reader3 = null;
	String a3="";
	String tmp3 = "";
	try{
		String filePath3 = application.getRealPath("/WEB-INF/"+filename1);
		reader3=new BufferedReader(new InputStreamReader(new FileInputStream(filePath3),"UTF-8"));
		while(true){
			a3 = reader3.readLine();
			if(a3==null)break;
			tmp3 += a3;
		}
	}catch(Exception e){
		//out.println("지정된 파일을 찾을 수 없습니다.");
	}
	String[] result = tmp3.split(",");
%>

<div id="lesson">
	<div id="label">전체강의</div>
	<table border>
		<tr>
			<td>강의이름</td>
			<td>강의시간</td>
			<td>학습상태</td>
		</tr>
		
		<%for(int i=0; i<result.length/5; i++){ %>
			<tr>
				<td><a href="video.jsp?re=<%=i+1%>"><%=result[i*5+1]%></a></td>
				<td><%=result[i*5+2]%></td>
				<td><%=result[i*5+4]%></td>
			</tr>
		<%} %>
	</table>
</div>
</body>
</html>
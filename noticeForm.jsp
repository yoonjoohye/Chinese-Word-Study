<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
	div#n{
		margin-top:50px;
		margin-bottom:50px;
		margin-left:20%;
		margin-right:20%;
		color:gray;
		font-size:15px;
	}
	div#n table{
	width:100%;
	height:500px;
	border-collapse:collapse;
	}
	div#n input[type="button"]{
		width:150px;
		height:50px;
		border:0px;
		background-color:#D82424;
		color:white;
	}
	
</style>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	int cnt=Integer.parseInt(request.getParameter("re"));
	
	BufferedReader reader = null;
	String a="";
	String tmp = "";
	
	try{
		String filePath = application.getRealPath("/WEB-INF/notice.txt");
		reader=new BufferedReader(new InputStreamReader(new FileInputStream(filePath),"UTF-8"));
		while(true){
			a = reader.readLine();
			if(a==null)break;
			
			tmp += a;
		}
	}catch(Exception e){
		out.println("지정된 파일을 찾을 수 없습니다.");
	}
	
	String[] Array = tmp.split(",");	
%>
<div id="n">
<center>
	<table border>
		<%for(int i=cnt-1; i<cnt; i++){%>
			<tr><td height="50px">제목: <%=Array[i*3]%></td></tr>
			<tr><td height="30px" align="right">날짜: <%=Array[i*3+2] %></td></tr>
			<tr><td><%=Array[i*3+1]%></td></tr>
		<% }%>
	</table><br/>
	<a href="index.jsp"><input type="button" value="돌아가기"></a>
</center>
</div>
</body>
</html>
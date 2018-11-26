<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String userID=null;
	if(session.getAttribute("userID")!=null){
		userID=(String)session.getAttribute("userID");
	}
	if(userID!=null){
		
		out.println("<script>");
		out.println("alert('이미 로그인 되어있습니다.');");
		out.println("location.href='index.jsp';");
		out.println("</script>");
	}
	
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	
	BufferedReader reader = null;
	String str="";
	String tmp = "";
	
	try{
		String filePath = application.getRealPath("/WEB-INF/member.txt");
		reader=new BufferedReader(new InputStreamReader(new FileInputStream(filePath),"UTF-8"));
		while(true){
			str = reader.readLine();
			if(str==null)break;
			
			tmp += str;
		}
	}catch(Exception e){
		out.println("지정된 파일을 찾을 수 없습니다.");
	}
	
	String[] Array = tmp.split(",");
	//System.out.println(Array[5]);
	
	
	Boolean check=false;
	for(int i=0; i<Array.length/5; i++){
		if(id.equals(Array[i*5])){
			if(pw.equals(Array[i*5+1])){
				check=true;
				break;
			}
			else{
				check=false;
			}
		}
		else{
			check=false;
		}
	}
	if(check==true){
		session.setAttribute("userID",id);
		
		if(id.equals("yoon")){
			out.println("<script>");
			out.println("location.href='admin.jsp';");
			out.println("</script>");
		}
%>
		<script> 
		window.onload=function(){
			alert("로그인 성공!"); 
			location.href="index.jsp";
		}
		</script>	
<%
	}
	else{
%>
		<script> 
		window.onload=function(){
			alert("로그인 실패!"); 
			location.href="login.jsp";
		} 
		</script>
<%}%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("EUC-KR");

	String id=request.getParameter("join_id");
	String pw=request.getParameter("join_pw");
	String name=request.getParameter("name");
	String email1=request.getParameter("email1");
	String email2=request.getParameter("email2");
	String num1=request.getParameter("tel1");
	String num2=request.getParameter("tel2");
	String num3=request.getParameter("tel3");
	
	String email=email1+'@'+email2;
	String num=num1+num2+num3;
	
	BufferedWriter writer = null;
	try{
		String filePath = application.getRealPath("/WEB-INF/member.txt");
		writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(filePath,true),"UTF-8"));
		writer.write(id+","+pw+","+name+","+email+","+num+",");
		writer.flush();
	}
	catch(Exception e){
		out.println("오류 발생");
	}
	finally{
		writer.close();
	}
%>
<meta http-equiv='refresh' content='0; url=join3.jsp'>

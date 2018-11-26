<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");

	String word=request.getParameter("word1");
	String sound=request.getParameter("sound1");
	String mean=request.getParameter("mean1");
	String series=request.getParameter("series");
	
	BufferedWriter writer = null;
	try{
		String filePath = application.getRealPath("/WEB-INF/"+series+".txt");
		writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(filePath,true),"UTF-8"));
		writer.write(word+","+sound+","+mean+",");
		writer.flush();
	}
	catch(Exception e){
		out.println("오류 발생");
	}
	finally{
		writer.close();
	}
%>
</body>
</html>
<meta http-equiv='refresh' content='0; url=admin.jsp'>
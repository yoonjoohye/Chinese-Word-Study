<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.PrintWriter"%>
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
	String str=request.getParameter("str");
	String check=request.getParameter("check");
	//System.out.println(check);
	
	String filename=userID+".txt";
	BufferedWriter writer=null;
	try{
		String filePath=application.getRealPath("/WEB-INF/member/"+filename);
		writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(filePath,true),"UTF-8"));
		writer.write(str+","+check+",");
		writer.flush();
	}catch(Exception e){
		//out.println("오류발생");
	}
%>
</body>
</html>
<meta http-equiv='refresh' content='0; url=lesson.jsp'>
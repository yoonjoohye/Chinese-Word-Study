<%@page import="java.util.Calendar"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	
	Calendar cal = Calendar.getInstance();
	int year = cal.get ( cal.YEAR );
	int month = cal.get ( cal.MONTH ) + 1 ;
	int date = cal.get (cal.DATE) ;

	String d=year+"년 "+month+"월 "+date+"일";
	
	BufferedWriter writer = null;
	try{
		String filePath = application.getRealPath("/WEB-INF/notice.txt");
		writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(filePath,true),"UTF-8"));
		writer.write(title+","+content+","+d+",");
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
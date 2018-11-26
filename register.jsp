<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
	div#register a{
		color:#eeeeee;
		text-decoration:none;
		font-weight:bold;
		margin-left:10px;
		margin-right:10px;
	}
	div#register a:hover{
		color:white;
	}
</style>
</head>
<body>
<%
	String userID=null;
	if(session.getAttribute("userID")!=null){
		userID=(String)session.getAttribute("userID");
	}
	if(userID==null){
%>
	<a href="login.jsp">로그인</a>
	<a href="join1.jsp">회원가입</a>
<%}
	else{
%>
	<%if(userID.equals("yoon")){ %>
	<a href="admin.jsp">관리자 페이지</a>
	<%}%>
	<a href="#"><%=userID %>님</a>
	<a href="logoutAction.jsp">로그아웃</a>
<%} %>
	
</body>
</html>
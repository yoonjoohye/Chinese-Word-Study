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
	<a href="login.jsp">�α���</a>
	<a href="join1.jsp">ȸ������</a>
<%}
	else{
%>
	<%if(userID.equals("yoon")){ %>
	<a href="admin.jsp">������ ������</a>
	<%}%>
	<a href="#"><%=userID %>��</a>
	<a href="logoutAction.jsp">�α׾ƿ�</a>
<%} %>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
	ul#admin{
		list-style:none;
		margin-top:50px;
	}
	ul#admin li{
		width:60%;
		background-color:#D82424;
		margin-bottom:50px;
		cursor:pointer;
		transition:background-color 3s ease-out;
		outline:none;
		border-right:10px solid #FBE202;
		border-left:10px solid #FBE202; 
		box-shadow:0px 0px 10px 3px #aaaaaa;
	}
	ul#admin li:hover{
		background-color:white;
	  	color:#D82424;
	}
	ul#admin li a{
		text-decoration:none;
		font-size:50px;
		font-weight:bold;
		color:white;
	}
</style>
</head>
<body>
<%
	request.getParameter("utf-8");
	String userID=null;
	if(session.getAttribute("userID")!=null){
		userID=(String)session.getAttribute("userID");
	}
	
	if(!userID.equals("yoon")){
		out.println("<script>");
		out.println("alert('관리자 계정으로 접근 가능합니다.');");
		out.println("location.href='index.jsp';");
		out.println("</script>");
	}
%>
<center>
<ul id="admin">
	<li><a href="noticeAdd.jsp">공지사항 추가</a></li>
	<li><a href="fourwordAdd.jsp">사자성어 추가</a></li>
	<li><a href="wordAdd.jsp">한자단어 추가</a></li>
</ul>
</center>
</body>
</html>
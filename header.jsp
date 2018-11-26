<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	div#logo{
		margin-left:20%;
		float:left;
		margin-top:5px;
	}
	div#logo img{
		vertical-align:middle;
	}
	div#logo a{
		text-decoration:none;
		color:white;
		font-size:50pt;
		vertical-align:middle;
	}
	div#menu{
		padding:35px;
		margin-right:20%;
		float:right;
	}
	div#menu a{
		margin-left:15px;
		margin-right:15px;
		color:#eeeeee;
		text-decoration:none;
		font-weight:bold;
		font-size:20pt;
	}
	div#menu a:hover{
		color:white;
	}
</style>
</head>
<body>
<div id="logo">
	<a href="index.jsp"><img src="img/logo.png" width=100px height=100px></a>
	<a href="index.jsp">漢字</a>
</div>
<div id="menu">
	<a href="lesson.jsp">한자 강의</a>
	<a href="word.jsp">한자 단어</a>
	<a href="practice.jsp">한자 연습</a>
</div>
</body>
</html>
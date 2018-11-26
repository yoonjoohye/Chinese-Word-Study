<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	div#notice{
		margin-top:50px;
		margin-bottom:50px;
		margin-left:20%;
		margin-right:20%;
		color:gray;
		font-size:15px;
	}
	div#label{
		width:100%;
		font-size:20px;
		text-align:left;
  		border-bottom:3px solid #D82424;
  		color:#D82424;
  		font-weight:bold;
  		margin-bottom:20px;
	}
	div#notice input[type="text"]{
		width:540px;
		height:40px;
		border:3px solid #D5D5D5;
		border-radius:15px;
	}
	div#notice textarea{
		border:3px solid #D5D5D5;
		border-radius:15px;
		font-size:15px;
	}
	div#notice input[type="submit"]{
		width:150px;
		height:50px;
		border:0px;
		background-color:#D82424;
		color:white;
	}
</style>
</head>
<body>
<div id="notice">
<div id="label">공지사항 추가하기</div>
<center>
<form method="post" action="noticeAddAction.jsp">
	<input type="text" name="title" placeholder="제목"><br><br>
	<textarea name="content" placeholder="내용" rows=20 cols=65></textarea><br><br>
<input type="submit" value="확인"/>
</form> 
</center>
</div>
</body>
</html>
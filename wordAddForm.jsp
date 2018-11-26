<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
	div#word{
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
	div#word input[type="text"]{
		width:500px;
		height:150px;
		border:3px solid #D5D5D5;
		border-radius:15px;
		font-size:50pt;
	}
	div#word input[type="submit"]{
		width:150px;
		height:50px;
		border:0px;
		background-color:#D82424;
		color:white;
	}
	select{
		width:500px;
		height:50px;
		border:3px solid #D5D5D5;
		border-radius:15px;
		color:gray;
		font-size:15px;
	}
	div#word input#a{
		height:50px;
		font-size:15pt;
	}
</style>
</head>
<body>
<div id="word">
<div id="label">한자 추가하기</div>
<center>
<form method="post" action="wordAddAction.jsp">
	<input type="text" name="word1" placeholder="한자"><br><br>
	<input type="text" id="a" name="sound1" placeholder="훈"><br><br>
	<input type="text" id="a" name="mean1" placeholder="음"><br><br>
	<select name="series">
		<option value="eight" selected>8급</option>
		<option value="seven">7급</option>
		<option value="six">6급</option>
	</select><br><br>
	<input type="submit" value="확인"/>
</form> 
</center>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
	form{
		margin-top:50px;
		margin-bottom:50px;
	}
	div#label{
		width:50%;
		font-size:20px;
		text-align:left;
  		border-bottom:3px solid #D82424;
  		color:#D82424;
  		font-weight:bold;
  		margin-bottom:40px;
	}
	input[type="text"],[type="password"]{
		width:300px;
		height:40px;
		border:1px solid #dddddd;
	}
	input[type="submit"]{
		width:300px;
		height:50px;
		border:0px;
		color:white;
		font-weight:bold;
		background-color:#D82424;
		
	}
	input[type="submit"]:hover{
		background-color:#B81A1A;
	}
	table a{
		text-decoration:none;
		color:gray;
	}
	table a:hover{
		color:#B81A1A;
	}
</style>
</head>
<body>
<center>
	<form action="loginAction.jsp" method="post">
	<div id="label">�α���</div>
	<table align="center">
		<tr><td><input type="text" name="id" placeholder="���̵�"></td></tr>
		<tr><td><input type="password" name="pw" placeholder="��й�ȣ"></td></tr>
		<tr><td><input type="checkbox">�α��� ���� ����</td></tr>
		<tr><td><input type="submit" value="�α���"></td></tr>
		<tr>
			<td align="center">
				<a href="join1.jsp">ȸ������</a>
				<a href="#">���̵� ã��</a>
				<a href="#">��й�ȣ ã��</a>
			</td>
		</tr>
	</table>
	</form>
</center>
</body>
</html>
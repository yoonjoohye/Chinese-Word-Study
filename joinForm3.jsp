<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	div#greeting{
	margin-left:20%;
	margin-right:20%;
	margin-bottom:100px;
	}
	p.one{
		color:#D82424;
		font-size:40px;
		font-weight:bold;
	}
	input[type="button"]{
		width:150px;
		height:50px;
		background-color:#D82424;
		border:0px;
		color:white;
	}
</style>
</head>
<body>
<div id="greeting">
	<p class="one">회원가입을 축하드립니다!</p>
	<p class="two">저희 한자 학습사이트  많이 애용해주시길 바랍니다.</p>
	<a href="index.jsp"><input type="button" value="홈으로 가기"></a>
	<a href="login.jsp"><input type="button" value="로그인 하러가기"></a>
</div>
</body>
</html>
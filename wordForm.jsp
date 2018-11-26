<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	div#word{
		margin-top:50px;
		margin-bottom:50px;
		margin-left:20%;
		margin-right:20%;
		color:gray;
		font-size:15px;
	}
	div#word table{
		border-collapse:collapse;
		width:100%;
	}
	div#word table tr#label{
		width:100%;
		height:50px;
		text-align:center;
  		font-weight:bold;
	}
	table tr#label a{
		text-decoration:none;
		font-size:20pt;
		color:#D82424;
	}
	table tr#label a:hover{
		text-decoration:underline;
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
		out.println("<script>");
		out.println("alert('로그인이 필요합니다.');");
		out.println("location.href='login.jsp';");
		out.println("</script>");
	}
%>
<div id="word">
	<table align="center">
		<tr id="label">
			<td><a href="eight.jsp" target="iframe">8급</a></td>
			<td><a href="seven.jsp" target="iframe">7급</a></td>
			<td><a href="six.jsp" target="iframe">6급</a></td>
		</tr>
	</table>	
	<iframe src="eight.jsp" name="iframe" width="100%" height="1400px" frameborder=0 ></iframe>
</div>
</body>
</html>

<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
	div#label{
		background-color:#D82424;
		color:white;
		font-size:30pt;
		font-weight:bold;
	}
	button#card{
		float:left;
		width:160px;
		height:120px;
		border:0px;
		background-color:#FCFAAE;
		margin:30px;
		text-align:center;
		box-shadow:0px 0px 10px 3px #aaaaaa;
	}
	span#a{
		font-size:50pt;
		font-weight:bold;
	}
	span#b{
		font-size:10pt;
		
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<%
request.getParameter("utf-8");
BufferedReader reader = null;
String a="";
String tmp = "";

try{
	String filePath = application.getRealPath("/WEB-INF/seven.txt");
	reader=new BufferedReader(new InputStreamReader(new FileInputStream(filePath),"UTF-8"));
	while(true){
		a = reader.readLine();
		if(a==null)break;
		
		tmp += a;
	}
}catch(Exception e){
	out.println("지정된 파일을 찾을 수 없습니다.");
}
String[] Array = tmp.split(",");
int cnt=0;
%>
<center>
<div id="label">7급</div>
<center>
<div id="word">
<%for(int i=0; i<Array.length; i++){ %>
	<%if(i%3==0){ %>
		<a href="write2.jsp?re=<%=i%>">
		<button id="card">
			<span id="a"><%=Array[i]%></span><br>
			<span id="b"><%=Array[i+1]%> <%=Array[i+2]%></span>
		</button>
		</a>
	<%} %>
<%} %>
</div>
</center>
</center>
</body>
</html>
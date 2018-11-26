<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	body{
		margin:0px;
	}
	#register{
		text-align:center;
		background-color:#B81A1A;
	}
	#header{
		background-color:#D82424;
		height:120px;
		border-bottom: 10px solid #FBE202;
	}
	#content{
		z-index:1;
	}
	#footer{
		position:relative;
		width: 100%;
		bottom: 0;
		clear:both;
		padding:20px;
		background-color:#EEEEEE;
	}
</style>
</head>
<body>
<%
	String content=request.getParameter("content");
%>
<div id="register">
	<jsp:include page="register.jsp"/>
</div>
<div id="header">
	<jsp:include page="header.jsp"/>
</div>
<div id="content">
	<jsp:include page="<%= content %>"/>
</div>
<div id="footer">
	<jsp:include page="footer.jsp"/>
</div>
</body>
</html>
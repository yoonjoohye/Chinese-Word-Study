<%@page import="java.util.Random"%>
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
	div#problem{
		margin-top:150px;
		margin-left:20%;
		margin-right:20%;
		height:200px;
	}
	input[type="button"]{
		width:150px;
		height:50px;
		border:0px;
		background-color:#D82424;
		color:white;
	}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String userID=null;
	if(session.getAttribute("userID")!=null){
		userID=(String)session.getAttribute("userID");
	}
	if(userID==null){
		
		out.println("<script>");
		out.println("alert('�α����� �ʿ��մϴ�.');");
		out.println("location.href='login.jsp';");
		out.println("</script>");
	}
	request.getParameter("utf-8");
	BufferedReader reader = null;
	String a="";
	String tmp = "";

	try{
		String filePath = application.getRealPath("/WEB-INF/eight.txt");
		reader=new BufferedReader(new InputStreamReader(new FileInputStream(filePath),"UTF-8"));
		while(true){
			a = reader.readLine();
			if(a==null)break;
			
			tmp += a;
		}
	}catch(Exception e){
		out.println("������ ������ ã�� �� �����ϴ�.");
	}
	String[] Array = tmp.split(",");
	
	Random rand=new Random();
	int num;
	while(true){
		num=rand.nextInt(Array.length);
		if(num%3==0){
			break;
		}
	}
%>
<div id="problem">
<center>
<%=Array[num+1] %> <%=Array[num+2] %>��(��) �����ϱ����˿�~?!<br>
���⿡ ���ڸ� �����~<br><br>
<input type="text" id="hanza" name="hanza" placeholder="���⿡ ���ڸ� �Է����ּ���"><br><br>
<input type="button" onclick="checkHanza()" value="Ȯ��">
</center>
</div>
<script>
function checkHanza(){
	var hanza=document.getElementById("hanza").value;
	//bool=true;
	if(hanza==""){
		alert("���ڸ� �Է����ּ���");
	}
	else{
		if(hanza=='<%=Array[num]%>'){
			alert("�´�");
			location.href='practice.jsp';
		}
		else{
			alert("Ʋ����");
		}
	}
}
</script>
</body>
</html>
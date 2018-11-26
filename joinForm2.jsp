<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	request.getParameter("utf-8");
	BufferedReader reader = null;
	String str="";
	String tmp="";
	try{
		String filePath = application.getRealPath("/WEB-INF/member.txt");
		reader=new BufferedReader(new InputStreamReader(new FileInputStream(filePath),"UTF-8"));
		while(true){
			str = reader.readLine();
			if(str==null)break;
			
			tmp += str;
		}
	}catch(Exception e){
		out.println("지정된 파일을 찾을 수 없습니다.");
	}
	String[] Array = tmp.split(",");
%>
<script>
	function checkID(){
	var id=document.getElementById("join_id").value;
	bool=true;
	if(id==""){
		alert("아이디를 입력해주세요");
	}
	else{
	<%for(int i=0; i<Array.length/5; i++){%>
		if(id=="<%=Array[i*5]%>"){
			//alert("사용 불가능한 아이디입니다.");
			bool=false;
		}
	<%}%>
		if(bool==true){
			alert("사용 가능한 아이디입니다.");
		}
		else{
			alert("사용 불가능한 아이디입니다.");
		}
	}
	}
	function email_chk(){
		if(joinForm2.email.value!=""){
			joinForm2.email2.value=joinForm2.email.value;
		}
	}
	function join(){
		var id=joinForm2.join_id.value;
		var pw=joinForm2.join_pw.value;
		var pw_chk=joinForm2.pw_chk.value;
		
		if(id=="" || pw==""){
			alert("정보를 모두 입력해주세요!");
			return;
		}
		else if(pw!=pw_chk){
			alert("비밀번호를 확인해주세요!");
			joinForm2.pw_chk.focus();
			return;
		}
		else{
			document.getElementById("joinForm2").submit();
		}
	}
</script>
<style>
	div#label{
		width:50%;
  		border-radius:30px;
  		border:3px solid #D82424;
  		color:#B81A1A;
  		font-size:40px;
  		margin-top:30px;
  		margin-bottom:30px;
	}
	table#join{
		color:gray;
		width:800px;
	}
	input[type="text"],[type="password"]{
		font-size:15px;
		width:300px;
		height:30px;
		border:1px solid #dddddd;
		border-radius:5px;
	}
	input[type="button"]{
		width:150px;
		height:50px;
		border:0px;
		background-color:#D82424;
		color:white;
	}
	input#id_chk{
		width:120px;
		height:40px;
	}
	input#email1{
		width:150px;
	}
	input#email2{
		width:150px;
	}
	select#email{
		width:150px;
		height:30px;
		border:1px solid #dddddd;
		border-radius:5px;
	}
	input#tel1{
		width:100px;
	}
	input#tel2{
		width:100px;
	}
	input#tel3{
		width:100px;
	}
	input#cancel{
		background-color:#BEBEBD;
	}
</style>
</head>
<body>
<center>
	<div id="label">회원가입</div>
	<form id="joinForm2" name="joinForm2" action="joinAction.jsp" method="post">
		<table id="join" align="center">
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="join_id" id="join_id">
					<input type="button" id="id_chk" onclick="checkID()" value="중복확인">
					<br>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="join_pw" id="join_pw"><br></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="pw_chk" id="pw_chk"><br></td>
			</tr>
			<tr>
				<td>성명</td>
				<td><input type="text" name="name"><br></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type="text" id="email1" name="email1"> @
					<input type="text" name="email2" id="email2">
					<select name="email" id="email" onchange="email_chk()">
						<option value="">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
					</select><br>
				</td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td>
					<input type="text" id="tel1" name="tel1"> -
					<input type="text" id="tel2" name="tel2"> -
					<input type="text" id="tel3" name="tel3"><br>
				</td>
			</tr>
		</table> <br/>
		
		<table align="center">
			<tr>
				<td align="center">
					<input type="button" onclick="join()" value="확인">
					<a href="index.jsp"><input type="button" id="cancel"value="취소"></a>
				</td>
			</tr>
		</table> <br/>
	</form>
	
</center>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script>
function check(){
	if(document.getElementById("check1").checked && document.getElementById("check2").checked){
		document.getElementById("joinForm1").submit();
	}
	else{
		alert("이용약관에 동의하셔야합니다.");
	}
}
</script>
<style>
	div#label{
		width:50%;
  		border-radius:30px;
  		border:3px solid #D82424;
  		color:#D82424;
  		font-size:40px;
  		margin-top:30px;
  		margin-bottom:30px;
	}
	table tr:nth-child(1){
		color:#D82424;
		font-size:20px;
		font-weight:bold;
	}
	iframe{
		border-top:3px solid #D82424;
		border-bottom:1px solid gray;
	}
	input[type="button"]{
		width:150px;
		height:50px;
		border:0px;
		background-color:#D82424;
		color:white;
	}
	input#cancel{
		background-color:#BEBEBD;
	}
</style>
</head>
<body>
<center>
<form name="joinForm1" id="joinForm1" action="join2.jsp" method="post">
	<div id="label">약관동의</div>
	<table>
		<tr><td>이용약관</td></tr>
		<tr>
			<td><iframe src="agree1.jsp" id="iframe1" width="800px" height="300px" frameborder=0></iframe></td>
		</tr>
		<tr><td>약관에 동의하십니까?<input type="checkbox" id="check1" value="agree">동의함</td></tr>
	</table><br>
	
	<table>
		<tr><td>개인정보취급방침</td></tr>
		<tr>
			<td><iframe src="agree2.jsp" id="iframe2" width="800px" height="300px" frameborder=0></iframe></td>
		</tr>
		
		<tr><td>약관에 동의하십니까?<input type="checkbox" id="check2"value="agree">동의함</td></tr>
	</table><br>
	<table>
		<tr>
			<td align="center">
				<input type="button" onclick="check()" value="확인"> 
				<a href="index.jsp"><input type="button" id="cancel" value="취소"></a>
			</td>
		</tr>
	</table><br>
</form>
</center>
</body>
</html>
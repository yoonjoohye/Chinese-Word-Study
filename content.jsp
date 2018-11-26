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
	div#banner{
		margin-left:20%;
		margin-right:20%;
	}
	div#slide{
		margin-top:20px;
		position:relative;
		width:670px;
		height:400px;
		overflow:hidden;
		float:left;
		margin-bottom:50px;
	}
	#slide ul{
		width:400%;
		height:100%; 
		transition:1s;
	}
	#slide li{
		list-style:none;
		float:left;
		width:25%;
		height:100%;
	}
	#slide li:nth-child(1){background-image:url(img/banner.jpg);}
	#slide li:nth-child(2){background-image:url(img/banner2.JPG);}
	#slide li:nth-child(3){background-image:url(img/banner3.jpg);}
	#slide li:nth-child(4){background-image:url(img/banner1.gif);}
	
	#slide input{display:none;}
	#slide label{
		display:block;
		vertical-align:top;
		width:10px;
		height:10px;
		margin:10px;
		border:0px solid #666;
		background:#EEEEEE;
		transition:0.3s;
		border-radius:50%;
		cursor:pointer;
	}
	#slide .pos{
		text-align:center;
		position:absolute;
		bottom:10px;
		left:0;
		text-align:center;
	}
	#pos1:checked~ul{margin-left:0%;}
	#pos2:checked~ul{margin-left:-100%;}
	#pos3:checked~ul{margin-left:-200%;}
	#pos4:checked~ul{margin-left:-300%;}
	
	#pos1:checked~.pos>label:nth-child(1){background:#666;}
	#pos2:checked~.pos>label:nth-child(2){background:#666;}
	#pos3:checked~.pos>label:nth-child(3){background:#666;}
	#pos4:checked~.pos>label:nth-child(4){background:#666;}
	div#banner table{
		height:300px;
		border-collapse:collapse;
	}
	div#label1{
		float:right;
		margin-top:20px;
		width:450px;
		font-size:20px;
		text-align:left;
  		border-bottom:3px solid #D82424;
  		color:#D82424;
  		font-weight:bold;
  		margin-bottom:20px;
	}
	div#banner table#word{
		float:right;
		width:450px;
		height:350px;
		margin-bottom:50px;
		background-color:#FCFAAE;
		text-align:center;
	}
	.hanza{
		font-size:60pt;
		font-weight:bold;
		height:100px;
	}
	.sound{
		font-size:20pt;
		font-weight:bold;
		height:50px;
	}
	.mean{
		font-weight:bold;
		height:50px;
	}
	div#label2{
		clear:both;
		width:100%;
		font-size:20px;
		text-align:left;
  		color:#D82424;
  		font-weight:bold;
  		margin-bottom:20px;
	}
	div#banner table#notice{
		width:100%;
		border:0px;
		text-align:center;
	}
	table#notice tr:nth-child(1){
		background-color:#D82424;
		height:50px;
		font-weight:bold;
		color:white;
	}
	table#notice tr td{
		border:0px;
		border-bottom:1px solid #eeeeee;
	}
	table#notice tr td:nth-child(1){
		width:150px;
	}
	table#notice tr td:nth-child(2){
		width:800px;
	}
	table#notice tr td a{
		text-decoration:none;
		color:#D82424;
	}
	div#link{
		clear:both;
		padding-top:20px;
		padding-bottom:20px;
		background-color:#FBF5F3;
	}
	
</style>
</head>
<body>
<%	
	request.setCharacterEncoding("utf-8");
	
	BufferedReader reader1 = null;
	String a1="";
	String tmp1 = "";
	try{
		String filePath1 = application.getRealPath("/WEB-INF/fourword.txt");
		reader1=new BufferedReader(new InputStreamReader(new FileInputStream(filePath1),"UTF-8"));
		while(true){
			a1 = reader1.readLine();
			if(a1==null)break;
			tmp1 += a1;
		}
	}catch(Exception e){
		out.println("지정된 파일을 찾을 수 없습니다.");
	}
	String[]four = tmp1.split(",");

	Random rand=new Random();
	int num;
	while(true){
		num=rand.nextInt(four.length);
		if(num%3==0){
			break;
		}
	}
	
	BufferedReader reader = null;
	String a="";
	String tmp = "";
	try{
		String filePath = application.getRealPath("/WEB-INF/notice.txt");
		reader=new BufferedReader(new InputStreamReader(new FileInputStream(filePath),"UTF-8"));
		while(true){
			a = reader.readLine();
			if(a==null)break;
			tmp += a;
		}
	}catch(Exception e){
		out.println("지정된 파일을 찾을 수 없습니다.");
	}
	String[] notice = tmp.split(",");
%>
<center>
<div id="banner">
	<div id="slide">
		<input type="radio" name="pos" id="pos1" checked>
		<input type="radio" name="pos" id="pos2">
		<input type="radio" name="pos" id="pos3">
		<input type="radio" name="pos" id="pos4">
		<ul>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
		<p class="pos">
			<label for="pos1"></label>
			<label for="pos2"></label>
			<label for="pos3"></label>
			<label for="pos4"></label>
		</p>
	</div>
	
	<div id="label1">사자성어</div>	
	<table id="word">
		<tr><td class="hanza"><%=four[num]%></td></tr>
		<tr><td class="sound"><%=four[num+1] %></td></tr>
		<tr><td class="mean"><%=four[num+2] %></td></tr>
	</table><br/>
	
	<div id="label2">공지사항</div>
	<table id="notice" border >
		<tr>
			<td class="num">번호</td>
			<td class="title">제목</td>
			<td class="date">날짜</td>
		</tr>
		<%for(int i=0; i<notice.length/3; i++){%>
		<tr>
			<td><%=i+1%></td>
			<td><a href="notice.jsp?re=<%=i+1%>"><%=notice[i*3] %></a></td>
			<td><%=notice[i*3+2]%></td>
		</tr>
		<% }%>
	</table>
	</div><br/>
	
<div id="link">
	<a href="http://www.cyberseodang.or.kr/"><img src="img/img1.gif"></a>
	<a href="http://hm.cyberseodang.or.kr/"><img src="img/img2.gif"></a>
	<a href="http://book.cyberseodang.or.kr/"><img src="img/img3.gif"></a>
	<a href="http://etest.cyberseodang.or.kr/"><img src="img/img5.gif"></a>
	<a href="http://db.cyberseodang.or.kr/front/main/main.do"><img src="img/img6.gif"></a>
</div><br/>
</center>
</body>
</html>
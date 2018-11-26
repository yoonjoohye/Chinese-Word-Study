<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
	div#lesson{
		margin-top:50px;
		margin-bottom:50px;
		margin-left:20%;
		margin-right:20%;
		color:gray;
		font-size:15pt;
	}
	div#lesson table{
		width:100%;
		height:500px;
		border-collapse:collapse;
		border:0px;
	}
	div#lesson table tr{
		border:0px;
	}
	div#lesson table tr:nth-child(1){
		height:50px;
		font-size:15pt;
		font-weight:bold;
		color:gray;
	}
	div#label{
		width:100%;
		font-size:23pt;
		text-align:left;
  		border-bottom:3px solid #D82424;
  		color:#D82424;
  		font-weight:bold;
  		margin-bottom:20px;
	}
	input[type="submit"]{
		width:150px;
		height:50px;
		border:0px;
		background-color:#D82424;
		color:white;
	}
	input.a{
		color:white;
		background-color:#D82424;
		border:0;
	}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
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
	String str = request.getParameter("re");
	
	String title="";
	String name="";
	
	if(str.equals("1")){
		title="01강 한자";
		name="video/1.mp4";
	}
	else if(str.equals("2")){
		title="02강 한자";
		name="video/2.mp4";
	}
	else if(str.equals("3")){
		title="03강 한자";
		name="video/3.mp4";
	}
	else if(str.equals("4")){
		title="04강 한자";
		name="video/4.mp4";
	}
	else if(str.equals("5")){
		title="05강 한자";
		name="video/5.mp4";
	}
	else if(str.equals("6")){
		title="06강 한자";
		name="video/6.mp4";
	}
	else if(str.equals("7")){
		title="07강 한자";
		name="video/7.mp4";
	}
	else if(str.equals("8")){
		title="08강 한자";
		name="video/8.mp4";
	}
	else if(str.equals("9")){
		title="09강 한자";
		name="video/9.mp4";
	}
%>
<center>
<div id="lesson">
<div id="label">한자강의</div>
<form method="post" action="lessonAction.jsp">
<table border align="center">
	<tr>
		<td><%=title %></td>
	</tr>
	<tr>
		<td>
			<video oncanplay="initcontrols()" width="100%" height="100%" ontimeupdate="progress()"> 
				<source src="<%=name %>" type="video/mp4">
			</video>			
		</td>
	<tr>
		<td align="center">
			<input class="a" type="button" value="▶" onclick="playPause(this)" id="playButton"></input><!--this: 재생 버튼이 눌렀는지 안눌렀는지-->
			<input type="range" min=0 max=1 value=0 step=0.01 onchange="progress(this)" id="currentPosition"></input><!--업데이트함수 ㅇㅇ-->
			<span id="timePlayed"></span>
			<input type="hidden" id="check" name="check" value="학습중">
			<input type="hidden" name="str" value="<%=str%>">
		</td>
	</tr>
	<tr>
	</tr>
</table><br>
	<input type="submit" value="여기까지 보기">
</form>
</div>
</center>
<script>
window.onload=initcontrols;
var video, playButton, timePlayed, currentPosition,check;
function initcontrols(){
	video=document.querySelector("video");
	playButton=document.getElementById("playButton");
	muteButton=document.getElementById("muteButton");

	timePlayed=document.getElementById("timePlayed");
	timePlayed.innerHTML="0:00";//처음값!
	
	currentPosition=document.getElementById("currentPosition");
	currentPosition.max=video.duration;//미디어 길이 초 단위

	check=document.getElementById("check");
}
function progress(ctrl){//플레이 될때마다 플레이시간을 업데이트
	if(ctrl){
		video.currentTime=ctrl.value;//range 기호를 현재 위치로
	}
	else{
		currentPosition.value=video.currentTime;
	}
	mm=Math.floor(video.currentTime / 60.0); //분구하기
	ss=Math.floor(video.currentTime%60); //초 구하기
	timePlayed.innerHTML=mm+":"+ss;//시간표현하기
}
function playPause(ctrl){//재생 중지
	if(video.paused){
		if(video.currentTime>=video.duration){
			clear();
		}
		_play();
	}else{
		_pause();
	}
}
function _play(){
	video.play();
	playButton.value="■";
}
function _pause(){
	video.pause();
	playButton.value="▶";
}
function clear(){
	alert('학습완료!');
	check.value="학습완료";
}
</script>
</body>
</html>
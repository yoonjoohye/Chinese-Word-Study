<%@page import="java.util.Date"%>
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
	div#card{
		text-align:center;
		background-color:#FCFAAE;
		width:100%;
		height:200px;
	}
	span#a{
		font-size:80pt;
		font-weight:bold;
	}
	span#b{
		font-size:20pt;
	}
	input[type="text"]{
		position:relative;
		float:left;
		width:200px;
		hegiht:30px;
		border:0;
		margin-top:152px;
		margin-right:8px;
		margin-left:10px;
	}
	canvas{
		position:relative;
		margin-top:10px;
		border:0;
		position:fixed;
		width:1095px;
		height:850px;
	}
	div#img{
		clear:both;
		text-align:center;
	}
	button{
		width:150px;
		height:50px;
		border:0px;
		background-color:#D82424;
		color:white;
	}
</style>
<script>
	var canvas;
	var ctx;
	var sx, sy;                      // 현재 위치
	var drawing = false;  // 현재 그리는 중인가?
	var mean1,mean2,mean3,mean4,mean5,mean6,mean7,mean8,mean9,mean10;
	var mean11,mean12,mean13,mean14,mean15,mean16,mean17,mean18,mean19,mean20;
	var mean21, mean22,mean23,mean24,mean25;
	window.onload = function() {
		canvas = document.getElementById("canvas");
		if (canvas == null || canvas.getContext == null) return;
		ctx = canvas.getContext("2d");
		ctx.lineWidth = 1; 
		ctx.lineCap="round";
		
		ctx.beginPath();
		ctx.moveTo(1,0);
		ctx.lineTo(1,840);
		ctx.stroke();
		
		for(var i=1; i<=4; i++){
		ctx.beginPath();
		ctx.moveTo(60*i,0);
		ctx.lineTo(60*i,840);
		ctx.stroke();
		}
		ctx.beginPath();
		ctx.moveTo(299,0);
		ctx.lineTo(299,840);
		ctx.stroke();
		
		ctx.beginPath();
		ctx.moveTo(0,1);
		ctx.lineTo(1095,1);
		ctx.stroke();
		
		for(var i=1; i<=4; i++){
		ctx.beginPath();
		ctx.moveTo(0,30*i-7);
		ctx.lineTo(1095,30*i-7);
		ctx.moveTo(0,30*i);
		ctx.lineTo(1095,30*i);
		ctx.stroke();
		}
		ctx.beginPath();
		ctx.moveTo(0,149);
		ctx.lineTo(1095,149);
		ctx.moveTo(0,143);
		ctx.lineTo(1095,143);
		ctx.stroke();
		
		// 현재 위치를 저장한다.
		canvas.onmousedown = function(e) {
			e.preventDefault();
			sx = canvasX(e.clientX);
			sy = canvasY(e.clientY);
			drawing = true;
		}
		// 현재 위치에서 새로 이동한 곳까지 선을 그린다.
		canvas.onmousemove = function(e) {
			if (drawing) {
				e.preventDefault();
				ctx.beginPath();
				ctx.moveTo(sx, sy);
				sx = canvasX(e.clientX);
				sy = canvasY(e.clientY);
				ctx.lineTo(sx, sy);
				ctx.stroke();
			}
		}
	// 그리기를 종료한다.
		canvas.onmouseup = function(e) {
			drawing = false;
		}            
	}   
	function canvasX(clientX) {
		var bound = canvas.getBoundingClientRect();
		var bw = 5;
		return (clientX - bound.left - bw) * (canvas.width / (bound.width - bw * 2));
	}
	function canvasY(clientY) {
		var bound = canvas.getBoundingClientRect();
		var bw = 5;
		return (clientY - bound.top - bw) * (canvas.height / (bound.height - bw * 2));
	}
	function download(){
	<%for(int i=1; i<=25; i++){%>
		mean<%=i%>=document.getElementById("mean"+<%=i%>).value;
	<%}%>
		ctx.font="6pt Gulim";
		ctx.fillText(mean1,2,30);
		ctx.fillText(mean2,60,30);
		ctx.fillText(mean3,120,30);
		ctx.fillText(mean4,180,30);
		ctx.fillText(mean5,240,30);
		
		ctx.fillText(mean6,2,60);
		ctx.fillText(mean7,60,60);
		ctx.fillText(mean8,120,60);
		ctx.fillText(mean9,180,60);
		ctx.fillText(mean10,240,60);
		
		ctx.fillText(mean11,2,90);
		ctx.fillText(mean12,60,90);
		ctx.fillText(mean13,120,90);
		ctx.fillText(mean14,180,90);
		ctx.fillText(mean15,240,90);
		
		ctx.fillText(mean16,2,120);
		ctx.fillText(mean17,60,120);
		ctx.fillText(mean18,120,120);
		ctx.fillText(mean19,180,120);
		ctx.fillText(mean20,240,120);
		
		ctx.fillText(mean21,2,149);
		ctx.fillText(mean22,60,149);
		ctx.fillText(mean23,120,149);
		ctx.fillText(mean24,180,149);
		ctx.fillText(mean25,240,149);
		
		var download = document.getElementById("download");
		var image = document.getElementById("canvas").toDataURL("image/png").replace("image/png", "image/octet-stream");
		download.setAttribute("href", image);
	}
</script>
</head>
<body>
<%
	int str=Integer.parseInt(request.getParameter("re"));
	//out.println(str);
	
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
		out.println("지정된 파일을 찾을 수 없습니다.");
	}
	
	String[] Array = tmp.split(",");
	
%>
<%for(int i=str; i<=str; i++){ %>
	<div id="card">
		<span id="a"><%=Array[i]%></span><br>
		<span id="b"><%=Array[i+1]%> <%=Array[i+2]%></span>
	</div>
<%} %><br><br>
<canvas id="canvas"></canvas>
<%for(int i=0; i<25; i++){%>
	<input type="text" id="mean<%=i+1%>">
<%} %>
<div id="img">
	<br><br><br><br>
	<a href="eight.jsp"><button>돌아가기</button></a>
	<a id="download" download="practice.png"><button type="button" onClick="download()">이미지로 저장</button></a>
</div>
</body>
</html>
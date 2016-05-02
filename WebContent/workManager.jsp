<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>근무관리</title>
<script type="text/javascript" src="./script/jquery-1.10.1.min.js">
</script>
<script type="text/javascript" src="./script/common.js"></script>
<link href="./css/common.css" media="all" rel="stylesheet"></link>
<style>
body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,textarea,p,blockquote,th,td,input,select,textarea,button
	{
	margin: 0;
	padding: 0
}

body {
	font-family: "Hiragino Kaku Gothic ProN", "Meiryo", "Nanum Gothic",
		"Malgun Gothic", "맑은 고딕", dotum, "돋움", "sans-serif";
	margin: 0px;
	background: #FFF;
}

section {
	height: 800px;
	margin: 0 auto;
}

.contents {
	position: relative;
	height: 800px;
	border: 1px solid;
	top: 70px;
	width: 1%;
	vertical-align: middle;
	display: table-cell;
	text-align: center;
}

.contents_wrapper {
	position: relative;
	width: 750px;
	height: 500px;
	border: 1px solid;
	display: inline-block;
}

select {
	width: 100px;
	height: 40px;
	border: 1px solid #cfcfcf;
	-webkit-border-radius: 5px;
	border-radius: 5px;
}

input[type=text],input[type=password] {
	padding: 8px;
	width: 80px;
	height: 20px;
	border: 1px solid #cfcfcf;
	-webkit-border-radius: 5px; 
	border-radius:5px;
}

.btn {
	width: 80px;
	height: 40px;
	padding: 10px;
	border: 1px solid #ccc;
	-webkit-border-radius: 5px;
	border-radius: 5px;
	text-decoration: none;
	color: #000;
}

.request_join {
	border: 1px solid #cfcfcf;
	width: 100%;
	height: 40px;
	margin: 0 auto;
}

.request_join input[type="button"] {
	height: 100px;
	width: 50px;
}

.staff_commute,.staff_commute td {
	border: 1px solid #cfcfcf;
	width: 300px;
	height: 40px;
	margin: 0 auto;
}

.side_nav {
	position: absolute;
	border: 1px solid;
	width: 100px;
	height: auto;
	margin-left: -115px;
	margin-top: -1px;
}

.side_nav a {
	text-decoration: none;
	color: #000;
	width: 100px;
	height: 45px;
	background: #FFF;
}

.menu1,.menu2,.menu3 {
	display: none;
}
</style>
</head>
<body>
	<!-- 헤더 시작 -->
	<header>
			<jsp:include page="header.jsp"/>
	</header>
	<!-- 헤더 끝 -->
	
	
	<section>
	<div class="contents">
		<div class="contents_wrapper">
			<jsp:include page="printingWorkManagerProcess.jsp" />
		</div>
	</div>
	</section>

	<script>
		$(document).ready(function() {
			$(".menu1").show();
			$(".menu2").hide();
			$(".menu3").hide();
			$(".menu4").hide();
		});
		$("#menu1").click(function() {
			$(".menu1").show();
			$(".menu2").hide();
			$(".menu3").hide();
			$(".menu4").hide();
		});
		$("#menu2").click(function() {
			$(".menu2").show();
			$(".menu1").hide();
			$(".menu3").hide();
			$(".menu4").hide();
		});
		$("#menu3").click(function() {
			$(".menu3").show();
			$(".menu2").hide();
			$(".menu1").hide();
			$(".menu4").hide();
		});
		$("#menu4").click(function() {
			$(".menu4").show();
			$(".menu2").hide();
			$(".menu3").hide();
			$(".menu1").hide();
		});
	</script>

</body>
</html>
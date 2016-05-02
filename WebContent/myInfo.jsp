<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="./script/jquery-1.10.1.min.js">	
</script>
<script type="text/javascript" src="./script/common.js"></script>
<link href="./css/common.css" media="all" rel="stylesheet"></link>
<style>
.inp {
	border: 1 solid #E2EAFF;
	font-family: "굴림체";
	font-size: 10pt;
}

input[type=text],input[type=button],input[type=password] {
	padding: 8px;
	width: 200px;
	border: 1px solid #cfcfcf;
	-webkit-border-radius: 5px;
	<!--
	HTML
	렌더링
	엔진
	다르기
	때문에
	-->
	border-radius
	:
	5px;
}

.line {
	width: 100%;
	height: 3px;
	background: #ccc;
}

.line2 {
	width: 100%;
	height: 1px;
	background: #aaa;
	margin: 10px 0px 20px 0px;
}

.btn {
	padding: 10px;
	border: 1px solid #ccc;
	-webkit-border-radius: 5px;
	border-radius: 5px;
	text-decoration: none;
	color: #000;
}

a,a:link,a:visited,a:active {
	text-decoration: none;
	color: #122293;
}

a:hover {
	text-decoration: none;
	font-size: 10pt
}

body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,textarea,p,blockquote,th,td,input,select,textarea,button
	{
	margin: 0;
	padding: 0
}

body {
	font-family: "Hiragino Kaku Gothic ProN", "Meiryo", "Nanum Gothic",
		"Malgun Gothic", "맑은 고딕", dotum, "돋움", "sans-serif";
	margin: 0px;
}

section {
	margin: 0 auto;
}

.contents {
	position: relative;
	height: auto;
	top: 70px;
}

.contents1 {
	width: 100%;
	height: auto;
	display: table;
	border: 1px dashed #ccc;
}

.contents1_title {
	position: relative;
	width: 100%;
	height: auto;
	display: table-cell;
	vertical-align: middle;
	background-image: url(img/);
	background-size: cover;
}

.description {
	font-size: 13px;
	color: #666;
}

#join {
	margin-top: 70px;
}
</style>

</head>
<body>
	<!-- 헤더 시작 -->
	<header> <jsp:include page="header.jsp" /> </header>
	<!-- 헤더 끝 -->
	<div class="contents">
		<div id="join2">
			<div class="sub_title">
				<img src="img/join.png"> <br />
					<div class="line2"></div>
			</div> 
			<form action="modifyLoginProcess.jsp" method="post">
				비밀번호 : <input type="password" name="userPw">
				<input type="submit" value="확인"><br/>
			</form>
			<span class="description">개인정보 보호를 위해 비밀번호를 다시 입력해주세요.</span>
		</div>
	</div>

</body>
</html>
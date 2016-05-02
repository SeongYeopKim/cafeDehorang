<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<link href="./css/first.css" media="all" rel="stylesheet">
<link href="./css/second.css" media="all" rel="stylesheet">
<link href="./css/common.css" media="all" rel="stylesheet">
<script type="text/javascript" src="./script/jquery-1.10.1.min.js">
<script type="text/javascript" src="./script/common.js">
</script>
<style>
body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,textarea,p,blockquote,th,td,input,select,textarea,button
	{
	margin: 0;
	padding: 0
}

div.footer {
	margin-left: 80px;
	margin-top: 100px;
}

footer {
	position: absolute;
	width: 100%;
	top: 570px;
	margin: 20px;
	color: #555;
}

input {
	width: 250px;
	padding: 15px;
	border: 1px solid #cfcfcf;
	-webkit-border-radius: 2px; 
	border-radius:2px;
}

.login_box {
	position: absolute;
	top: 150px;
	right: 250px;
	width: 250px;
	z-index: 10;
	font-family: Helvetica neue, Apple SD Gothic Neo, 'Apple SD 산돌고딕 Neo',
		NanumGothic, '나눔고딕', ng, sans-serif
}
.logout_box {
	position: absolute;
	top: 260px;
	right: 250px;
	width: 250px;
	z-index: 10;
	font-family: Helvetica neue, Apple SD Gothic Neo, 'Apple SD 산돌고딕 Neo',
		NanumGothic, '나눔고딕', ng, sans-serif
}

.btn_login {
	padding: 15px;
	background: #FF0;
	width: 281px;
	border: 0px;
}
.btn_logout {
	padding: 15px;
	background: #FF0;
	width: 281px;
	border: 0px;
}

.btn_join {
	position: absolute;
	top: 145px;
	color: #FFF;
	font-size: 18px;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

.slideshow {
	margin-top: 70px;
}
</style>
<body>

	<%
		/**
		 * ------- 파라미터 및 참고사항 -------
		 * 로그인 아이디	: userId
		 * 로그인 패스워드  : userPw
		 * 복귀 주소		: returnUrl
		 * 
		 * 폼 액션 loginProcess.jsp
		 **/
	%>

	<!-- 헤더 시작 -->
	<header> <a href="index.jsp"><img src="img/logo.png"></a>
	<a href="company.jsp"><img src="img/company.png" class="menu"></a>
	<!-- <img src="img/startup.png" class="menu"> 창업문의는 제외--> 
	</header>
	<!-- 헤더 끝 -->
	<section> <!-- 이미지 슬라이더 영역 시작  -->
	<div class="slideshow">
		<span style="display: inline;">
			<div class="first"></div>
		</span> <span style="display: none;">
			<div class="second"></div>
		</span> <span style="display: none;">
			<div class="third"></div>
		</span>
	</div>
	<div class="text-area">
		<span style="display: inline;">
			<div class="first"></div>
		</span><span style="display: none;">
			<div class="second"></div>
		</span><span style="display: none;">
			<div class="third"></div>
		</span>
	</div>
	
	<c:if test="${sessionScope.userId == null }">
		<div class="login_box">
			<form action="LoginProcess.jsp" method="post">
				<input name="userId" placeholder="회원 아이디" tabindex="1" type="text">
				<input name="userPw" placeholder="비밀번호" tabindex="2" type="password">
				<input name="returnUrl" type="hidden"
					value="http://localhost:8080/CafeDeHorang/index.jsp"> <input
					class="btn_login" tabindex="4" type="submit" value="로그인"> <a
					class="btn_join" href="join.jsp">회원가입</a>
			</form>
		</div>
	</c:if>
	
	</section>
	<c:if test="${sessionScope.userId != null }">
		<div class="logout_box">
			<input class="btn_logout" tabindex="4" type="submit" value="로그아웃"> 
		</div>
	</c:if>
	<footer> 경기도 시흥시 산기대학로 237, TIP 319 공동대표 이강산 김성엽 최지혜<br />
	창업문의 010 - 3996 - 0036<br />
	Copyright(c) by Cafe De Horang. All right reserved<br />
	</footer>

</body>
</html>
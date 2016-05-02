<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판</title>
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
	border: 1px solid;
	top: 70px;
	width: 1%;
	display: table-cell;
	text-align: center;
}

.contents_wrapper {
	margin: 20px;
	position: relative;
	width: 750px;
	height: 400px;
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
	border-radius: 5px;
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
	<header> <jsp:include page="header.jsp" /> </header>
	<!-- 헤더 끝 -->

	<div class="contents">
		<div class="contents_wrapper">
			<div class="side_nav">
				<a href="#" id="menu1">자유게시판</a><br /> <a href="#" id="menu2">익명게시판
				</a><br />
			</div>



			<table border=1>
				<tr>
					<td width=40>순번</td>
					<td width=300>제목</td>
					<td width=80>작성자</td>
					<td width=100>작성일자</td>
					<td width=80>작성시각</td>
					<td width=50>글삭제</td>
				</tr>


				<c:forEach var="cnt" begin="0" end="${listSize}">
					<tr>
						<td>${BBS_LIST[cnt].seqNo}</td>
						<td><a href="BBSRead?num=${BBS_LIST[cnt].seqNo}">${BBS_LIST[cnt].title}</a></td>
						<td>${BBS_LIST[cnt].writer}</td>
						<td>${BBS_LIST[cnt].wdate}</td>
						<td>${BBS_LIST[cnt].wtime}</td>
						<td><c:choose>
								<c:when
									test="${sessionScope.userPermission == 99||sessionScope.userId==BBS_LIST[cnt].writer}">
									<form action="BBSDelete">
										<input type="hidden" name="num" value="${BBS_LIST[cnt].seqNo}">
										<input type="submit" value="삭제">
									</form>
								</c:when>
								<c:otherwise>

								</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</table>


			<%
				int pageNum;
				if (request.getAttribute("pageNum") != null)
					pageNum = (Integer) request.getAttribute("pageNum");
				else
					pageNum = 0;

				request.setAttribute("pageNum", pageNum);
			%>


			<form action="BBSListServlet">
				<input type="hidden" name="pageNum" value="${pageNum+1}"> <input
					type="submit" value=" 다음페이지">
			</form>
			<form action="BBSListServlet">
				<input type="hidden" name="pageNum" value="${pageNum-1}"> <input
					type="submit" value="이전페이지">
			</form>
			<form action=newWrite.jsp>
				<input type=submit value="글쓰기">
			</form>

			<form action="BBSListServlet">
				<select name="type">
					<option value="writer">글쓴이</option>
					<option value="title">제목</option>
				</select> 
				<input name=value> 
				<input type=submit>
			</form>

		</div>

	</div>

	<script>
		$(document).ready(function() {

			$("#menu1").click(function() {
				location.replace('BBSListServlet');

			});
			$("#menu2").click(function() {
				location.replace('S_BBSListServlet');

			});
		});
	</script>



</body>
</html>
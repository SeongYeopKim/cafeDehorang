<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%!public String calculateTime(String number) {
		if (number.equals(""))
			return "";
		int time = Integer.parseInt(number);
		int hour, minute;
		hour = time / 60;
		minute = time % 60;

		return hour + ":" + minute;
	}%>

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
<%
	Connection conn = null;
	PreparedStatement psmt = null;
	PreparedStatement psmt2 = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	ResultSet rs2Cpy = null;
	String sql = null;
	String sql2 = null;

	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(
				"jdbc:mysql://54.69.198.243/webProTerm", "root",
				"dog26215"); //임시 변경하자 꼭!
		if (conn == null) {
			throw new Exception("DB연결 실패");
		}
		sql = "select * from commute_list where date=?";
		sql2 = "select * from staff_list";

		psmt = conn.prepareStatement(sql);
		psmt2 = conn.prepareStatement(sql2);
		psmt.setString(1, getToday());
		rs = psmt.executeQuery();
		rs2 = psmt2.executeQuery();

	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<body>
	<!-- 헤더 시작 -->
	<header> <jsp:include page="header.jsp" /> </header>
	<!-- 헤더 끝 -->

	<section>
	<div class="contents">
		<div class="contents_wrapper">
			<div class="side_nav">
				<a href="#" id="menu1">근무자 관리</a><br /> <a href="#" id="menu2">시급
					관리</a><br /> <a href="#" id="menu3">매니저 등록</a><br /> <a href="#"
					id="menu4">가입 승인</a><br />
			</div>

			<div class="menu1">
				<form action="commuteProcess.jsp" method="post">
					<p>출퇴근 시간 입력</p>
					<br /> <input type="text" name="hour"></input>시 <input type="text"
						name="minute"></input>분<br /> <br /> <input type="hidden"
						id="currentSel" name="currentSel" value=""></input> <input
						type="hidden" id="currentName" name="currentName" value=""></input>
					<input type="hidden" name="today" value="<%=getToday()%>" /> 출근자 <select
						id="inTimeSel" name="inTimeSel">
						<option>선택</option>
						<%
							while (rs2.next()) {
								out.print("<option value='" + rs2.getString(1) + "'>"
										+ rs2.getString(3) + "</option>");
							}
						%>
					</select> <input id="inTimeSubmit" type="submit" class="btn" value="확인"
						onclick="javascript:currentSel.value=1" /> <br /> <br /> 퇴근자 <select
						id="outTimeSel" name="outTimeSel">
						<option>선택</option>
						<%
							rs2.beforeFirst();
							while (rs2.next()) {
								out.print("<option value='" + rs2.getString(1) + "'>"
										+ rs2.getString(3) + "</option>");
							}
						%>
					</select> <input id="outTimeSubmit" type="submit" class="btn" value="확인"
						onclick="javascript:currentSel.value=2" /> <br />
				</form>
				<br /> 금일 출퇴근 현황
				<table cellpadding="0" cellspacing="0" class="staff_commute">

					<tr>
						<td>이름</td>
						<td>출근시간</td>
						<td>퇴근시간</td>
					</tr>
					<%
						try {
							while (rs.next()) {
								out.print("<tr>");
								out.print("<td>" + rs.getString(2) + "</td>");
								out.print("<td>" + calculateTime(rs.getString(3)) + "</td>");
								out.print("<td>" + calculateTime(rs.getString(4)) + "</td>");
								out.print("</tr>");
							}
						} catch (Exception e) {
							e.printStackTrace();
						} finally {
						/* 	try {
								psmt.close();
							} catch (SQLException e) {
							}
							try {
								conn.close();
							} catch (SQLException e) {
							} */
						}
					%>
				</table>
			</div>

			<div class="menu2">
				<form action="changePayProcess.jsp" method="post">
					변경 직원 <select name="changePayStaffName">
						<option>선택</option>
						<%
							rs2.beforeFirst();
							while (rs2.next()) {
								out.print("<option value='" + rs2.getString(1) + "'>"
										+ rs2.getString(3) + "</option>");
							}
						%>
					</select> <br /> <br /> 변경 금액 <input type="text"
						name="changePayStaffMoney" /> <br /> <br /> <input
						type="submit" class="btn" value="확인" />
				</form>
			</div>

			<div class="menu3">
				<form action="changePermissionProcess.jsp" method="post">
					<input type="hidden" name="permissionNumber" value="99"></input> 변경
					직원 <select name="changePermissionStaffName">
						<option>선택</option>
						<%
							rs2.beforeFirst();
							while (rs2.next()) {
								out.print("<option value='" + rs2.getString(1) + "'>"
										+ rs2.getString(3) + "</option>");
							}
						%>
					</select> <br /> <br />
					<h1>변경 후 직위 : 매니저</h1>
					<br /> <input type="submit" class="btn" value="확인"></input>
				</form>
			</div>

			<div class="menu4">
				<jsp:include page="printingJoinListProcess.jsp" />
			</div>



		</div>
	</div>
	</section>

	<script>
		$(document).ready(function() {
			$(".menu1").show();
			$(".menu2").hide();
			$(".menu3").hide();
			$(".menu4").hide();

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
			$("#inTimeSubmit").click(function() {
				$("#currentName").val($("#inTimeSel option:selected").text());
			});
			$("#outTimeSubmit").click(function() {
				$("#currentName").val($("#outTimeSel option:selected").text());
			});
		});
	</script>
	<%!private String getToday() {
		GregorianCalendar getToday = new GregorianCalendar();
		int todayYear = getToday.get(Calendar.YEAR);
		int todayMonth = getToday.get(Calendar.MONTH) + 1;
		int todayDate = getToday.get(Calendar.DAY_OF_MONTH);

		return todayYear + "-" + todayMonth + "-" + todayDate;
	}%>
</body>
</html>
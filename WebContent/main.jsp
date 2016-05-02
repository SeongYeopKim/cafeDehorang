<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%!List<String> list = new ArrayList<String>(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="./script/jquery-1.10.1.min.js">
</script>
<script type="text/javascript" src="./script/common.js"></script>
<link href="./css/common.css" media="all" rel="stylesheet"></link>
<style type="text/css">
.inp {
	border: 1 solid #E2EAFF;
	font-family: "굴림체";
	font-size: 10pt;
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

.contents .description {
	border: 1px solid #ccc;
}

.calendar {
	position: relative;
	top: 70px;
}
</style>
</head>
<body>
	<!-- 헤더 시작 -->
	<header>
		<jsp:include page="header.jsp"/>
	</header>
	<!-- 헤더 끝 -->

	<%
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	String returnUrl = request.getParameter("returnUrl");
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	String sql = null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://54.69.198.243/webProTerm", "root", "dog26215"); //임시 변경하자 꼭!
		if(conn == null){
			throw new Exception("DB연결 실패");
		}
		sql = "select * from commute_list where date=?";
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, "2014-12-11");
		rs = psmt.executeQuery();
		if(list.size()==0){
			while(rs.next()){
				
					list.add(rs.getString(2));	
			}
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			psmt.close();
		}catch(SQLException e){
		}
		try{
			conn.close();
		}catch(SQLException e){
			
		}
	}
	
		GregorianCalendar curDate = new GregorianCalendar();
		int year = 0;
		int month = 0; //원하는 달-1 값. 예)2월 = 1
		try {
			year = Integer.parseInt(request.getParameter("year"));
			month = Integer.parseInt(request.getParameter("month"));
			curDate.set(Calendar.YEAR, year); //보여줄 연도 setting
			curDate.set(Calendar.MONTH, month); //보여줄 달 setting
			curDate.set(Calendar.DAY_OF_MONTH, 1); //일자는 1일로 고정
		} catch (NumberFormatException nfe) {
			year = curDate.get(Calendar.YEAR);
			month = curDate.get(Calendar.MONTH);
		}
		int firstDay = new GregorianCalendar(curDate.get(Calendar.YEAR),
				curDate.get(Calendar.MONTH), 1).get(Calendar.DAY_OF_WEEK); //해당 달의 시작하는 날 idx
		int lastDay = curDate.getActualMaximum(Calendar.DAY_OF_MONTH); //해당 달의 마지막 날

		//오늘 일자 구하기
		GregorianCalendar getToday = new GregorianCalendar();
		int todayYear = getToday.get(Calendar.YEAR);
		int todayMonth = getToday.get(Calendar.MONTH);
		int todayDate = getToday.get(Calendar.DAY_OF_MONTH) + 1;

		//달력 구현
		int row = 7; //행
		int col = 5; //열
		int day = 1;
		out.println("<center><table class=calendar border=1>");
		out.println(" <tr>");
		out.println("  <td colspan="
				+ row
				+ " align=center><a href='"
				+ traverseDate("downYear", year, month)
				+ "'><font style='text-decoration: none;'>▼</font></a><font style='font-size: 18'>"
				+ year
				+ "</font>년<a href='"
				+ traverseDate("upYear", year, month)
				+ "'><font style='text-decoration: none;'>▲</font></a>&nbsp;<a href='"
				+ traverseDate("downMonth", year, month)
				+ "'><font style='text-decoration: none;'>▼</font></a><font style='font-size: 18'>"
				+ (month + 1)
				+ "</font>월<a href='"
				+ traverseDate("upMonth", year, month)
				+ "'><font style='text-decoration: none;'>▲</font></a>&nbsp;&nbsp;<a href='./main.jsp'><font style='text-decoration: none;'>reset</font></a></td>");
		out.println(" </tr>");
		out.println(" <tr align=left height=30>");
		out.println("  <td class=inp bgcolor='#E5E7ED' valign=top><font color='red'><b>일</b></font></td>");
		out.println("  <td class=inp bgcolor='#E5E7ED' valign=top><b>월</b></td>");
		out.println("  <td class=inp bgcolor='#E5E7ED' valign=top><b>화</b></td>");
		out.println("  <td class=inp bgcolor='#E5E7ED' valign=top><b>수</b></td>");
		out.println("  <td class=inp bgcolor='#E5E7ED' valign=top><b>목</b></td>");
		out.println("  <td class=inp bgcolor='#E5E7ED' valign=top><b>금</b></td>");
		out.println("  <td class=inp bgcolor='#E5E7ED' valign=top><font color='blue'><b>토</b></font></td>");
		out.println(" </tr>");
		for (int i = 0; i < col; i++) {
			out.println("<tr align=left height=75>");
			for (int j = 0; j < row; j++) {
				out.println("<td class=inp width=100 bgcolor='#FCFDFE' valign=top>");
				if (day <= lastDay) {
					//첫 주 시작하는 날 전까지는 빈칸으로 채우기
					if (i == 0 && (j + 1) < firstDay) {
						out.println("&nbsp;");
						continue;
					}
					if (j == 0)
						out.println("<font color='red' style='text-decoration: none;'><b>"
								+ day++
								+ "</b></font>"
								+ printToday(todayYear, year, todayMonth,
										month, todayDate, day));
					else if (j == 6)
						out.println("<font color='blue' style='text-decoration: none;'><b>"
								+ day++
								+ "</b></font>"
								+ printToday(todayYear, year, todayMonth,
										month, todayDate, day));
					else
						out.println("<font color='black' style='text-decoration: none;'><b>"
								+ day++
								+ "</b></font>"
								+ printToday(todayYear, year, todayMonth,
										month, todayDate, day));
				} else {
					out.println("&nbsp;");
				}
				out.println("</td>");
			}
			out.println("</tr>");

			if (((i + 1) == col) && (lastDay > (day - 1))) {
				col++;
			}
		}
		out.println("</table></center>");
	%>

	<%! 
	private String traverseDate(String type, int year, int month) {
		String href = "";
		if (type.equals("upYear")) {
			href = "./main.jsp?year=" + (year + 1) + "&month=" + month;
		} else if (type.equals("downYear")) {
			href = "./main.jsp?year=" + (year - 1) + "&month=" + month;
		} else if (type.equals("upMonth")) {
			if (month == 11) {
				href = "./main.jsp?year=" + (year + 1) + "&month=0";
			} else {
				href = "./main.jsp?year=" + year + "&month="
						+ (month + 1);
			}
		} else if (type.equals("downMonth")) {
			if (month == 0) {
				href = "./main.jsp?year=" + (year - 1) + "&month=11";
			} else {
				href = "./main.jsp?year=" + year + "&month="
						+ (month - 1);
			}
		}
		return href;
	}
	
	private String printToday(int todayYear, int year, int todayMonth,
			int month, int todayDate, int day) {
		String strList="";
		if (todayYear == year && todayMonth == month && todayDate == day) {
			strList="<br/>";
			for(int i=0;i<list.size();i++){
				strList+=list.get(i)+"<br/>";
			}
			return strList;
		}
		return "";
	}%>

</body>
</html>

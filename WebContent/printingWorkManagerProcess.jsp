<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	String sql = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(
				"jdbc:mysql://54.69.198.243/webProTerm", "root", "dog26215"); //임시 변경하자 꼭!
		if (conn == null) {
			throw new Exception("DB연결 실패");
		}
		sql = "SELECT commute_list.userId, date, inTime, outTime, userPay FROM commute_list, staff_list where commute_list.userId=staff_list.userId and commute_list.userId=?";
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, (String) session.getAttribute("userId"));
		rs = psmt.executeQuery();
		
		out.print("<form action='changePermissionProcess.jsp'>");
		out.print("<input type='hidden' name='permissionNumber' value='2'>");
		out.print("<table cellpadding='0' cellspacing='0' class='staff_commute'>");
		out.print("<tr>");
		out.print("<td>근무일</td>");
		out.print("<td>시급</td>");
		out.print("<td>합계금액</td>");
		out.print("</tr>");
		
		while (rs.next()) {
			out.print("<input type='hidden' name='changePermissionStaffName' value="+rs.getString(1)+">");
			int outTime = Integer.parseInt(rs.getString(4));
			int inTime = Integer.parseInt(rs.getString(3));
			int time = outTime - inTime;
			int userPay = Integer.parseInt(rs.getString(5));
			out.print("<tr>");
			out.print("<td>"+rs.getString(2)+"</td>");
			out.print("<td>"+userPay+"</td>");
			out.print("<td>"+(time/60)*userPay+"</td>");
			out.print("</tr>");
		}
		out.print("</table>");
		out.print("</form>");
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			psmt.close();
		} catch (SQLException e) {
		}
		try {
			conn.close();
		} catch (SQLException e) {

		}
	}
%>

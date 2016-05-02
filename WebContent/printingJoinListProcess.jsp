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
		sql = "select * from staff_list where userPermission=?";
		psmt = conn.prepareStatement(sql);
		psmt.setInt(1, 1);
		rs = psmt.executeQuery();
		
		out.print("<form action='changePermissionProcess.jsp'>");
		out.print("<input type='hidden' name='permissionNumber' value='2'>");
		out.print("<table cellpadding='0' cellspacing='0' class='request_join'>");
		out.print("<tr>");
		out.print("<td>가입 요청자</td>");
		out.print("<td>시급 입력</td>");
		out.print("</tr>");
		
		while (rs.next()) {
			out.print("<input type='hidden' name='changePermissionStaffName' value="+rs.getString(1)+">");
			out.print("<tr>");
			out.print("<td>"+rs.getString(1)+"</td>");
			out.print("<td><input type='text' name='changePayStaffMoney'></td>");
			out.print("<td><input type='submit' value='승인'></td>");
			out.print("<td><input type='submit' value='거절'></td>");
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

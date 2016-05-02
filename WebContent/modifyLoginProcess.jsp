<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/**
	 *	----파라미터 및 참고사항 ----
	 *	가입관련 파라미터 
	 *	아이디 		: joinId
	 *	비밀번호 		: joinPw1
	 *	비밀번호 확인 	: joinPw2
	 *	이름			: joinName
	 *	생일			: joinBirthMonth, joinBirthDay
	 *	전화번호		: joinPhone1, joinPhone2, joinPhone3
	 *
	 *	폼 액션 >> joinProcess.jsp
	 *
	 **/

	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String userId = (String) session.getAttribute("userId");
	String userPw = request.getParameter("userPw");

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
		sql = "select * from staff_list where userId=? and userPw=sha(?)";
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, userId);
		psmt.setString(2, userPw);
		rs = psmt.executeQuery();
		if (rs.next()) { 
			response.sendRedirect("./modify.jsp?userId="
					+ rs.getString(1) + "&userName=" + URLEncoder.encode(rs.getString(3), "UTF-8") 
					+ "&userBirthMonth=" + rs.getString(4) + "&userBirthDay="
					+ rs.getString(5) + "&userPhone1=" + rs.getString(6)
					+ "&userPhone2=" + rs.getString(7) + "&userPhone3="
					+ rs.getString(8));
		} else {
			out.print("<script>alert('비밀번호를 확인해주세요.');window.location='http://localhost:8080/CafeDeHorang/myInfo.jsp'</script>");
		}
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

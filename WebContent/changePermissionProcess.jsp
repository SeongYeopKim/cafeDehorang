<%@page import="com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	String changePermissionStaffName = request.getParameter("changePermissionStaffName");
	String changePayStaffMoney = request.getParameter("changePayStaffMoney");
	int permissionNumber = Integer.parseInt(request.getParameter("permissionNumber"));
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
		if(changePayStaffMoney.equals("")){
			sql = "update staff_list set userPermission=? where userId=?";
		}else{
			sql = "update staff_list set userPermission=?, userPay=? where userId=?";
		}
		psmt = conn.prepareStatement(sql);
		psmt.setInt(1, permissionNumber);
		if(changePayStaffMoney.equals("")){
			psmt.setString(2, changePermissionStaffName);
		}else{
			psmt.setString(2, changePayStaffMoney);
			psmt.setString(3, changePermissionStaffName);
		}
		psmt.executeUpdate(); 
	}finally{
		try{
			psmt.close();
		}catch(SQLException e){
		}
		try{
			conn.close();
		}catch(SQLException e){
		}
		out.print("<script>alert('"+changePermissionStaffName+"의 가입이 승인 되었습니다.');window.location='http://localhost:8080/CafeDeHorang/managerPage.jsp';</script>");
	}
%> 
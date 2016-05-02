<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
		sql = "select * from staff_list where userId=? and userPw=sha(?)";
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, userId);
		psmt.setString(2, userPw);
		rs = psmt.executeQuery();
		if(rs.next()){
			session.setAttribute("userId", rs.getString(1));
			session.setAttribute("userName", rs.getString(3));
			session.setAttribute("userPermission", rs.getInt(9));
			out.print("<script>window.location='http://localhost:8080/CafeDeHorang/main.jsp'</script>");
		}else{
			out.print("<script>alert('아이디 또는 비밀번호를 확인해주세요.');window.location='http://localhost:8080/CafeDeHorang/index.jsp'</script>");
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
%> 
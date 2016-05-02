<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
	String joinId = request.getParameter("joinId");
	String joinPw1 = request.getParameter("joinPw1");
	String joinPw2 = request.getParameter("joinPw2");
	String joinName = request.getParameter("joinName");
	String joinBirthMonth = request.getParameter("joinBirthMonth");
	String joinBirthDay = request.getParameter("joinBirthDay");
	String joinPhone1 = request.getParameter("joinPhone1");
	String joinPhone2 = request.getParameter("joinPhone2");
	String joinPhone3 = request.getParameter("joinPhone3");
	
	
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
		sql = "insert into staff_list values(?,sha(?),?,?,?,?,?,?,?,?)";
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, joinId);
		psmt.setString(2, joinPw1);
		psmt.setString(3, joinName);
		psmt.setString(4, joinBirthMonth);
		psmt.setString(5, joinBirthDay);
		psmt.setString(6, joinPhone1);
		psmt.setString(7, joinPhone2);
		psmt.setString(8, joinPhone3);
		psmt.setInt(9, 1);
		psmt.setString(10,"0");
		
		psmt.executeUpdate(); 
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
		out.print("<script>alert('회원가입이 완료되었습니다. 승인 후 로그인 가능합니다. '); window.location='http://localhost:8080/CafeDeHorang/index.jsp';</script>");
	}
%> 
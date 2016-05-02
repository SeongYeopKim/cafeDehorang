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
	String currentSel = request.getParameter("currentSel");
	String currentName = request.getParameter("currentName");
	String inTimeSel = request.getParameter("inTimeSel");
	String outTimeSel = request.getParameter("outTimeSel");
	String hour = request.getParameter("hour");
	String minute = request.getParameter("minute");
	int iHour = Integer.parseInt(hour);
	int iMinute = Integer.parseInt(minute);
	int time = (iHour * 60) + iMinute;
	
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
		sql = "insert into commute_list values(?,?,?,?,?)";
		psmt = conn.prepareStatement(sql);
		if(currentSel.equals("1")){
			psmt.setString(1, inTimeSel);	
			psmt.setString(3, time+"");
			psmt.setString(4, "");
		}else{
			psmt.setString(1, outTimeSel);
			psmt.setString(3, "");
			psmt.setString(4, time+"");
		}
		psmt.setString(2, currentName);
		psmt.setString(5, "2014-12-11");
		
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
		//out.print("<script>alert('회원가입이 완료되었습니다. 로그인을 해주세요. '); window.location='http://localhost:8080/Term/index.jsp';</script>");
	}
%> 
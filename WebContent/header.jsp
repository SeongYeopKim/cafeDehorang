<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!-- 헤더 시작 -->
			<a href="#" id="nav_index"><img src="img/logo.png"></a> 
			<a href="#" id="nav_main"><img src="img/nav_home.png" class="menu"></a>
			<a href="#" id="nav_bbs"><img src="img/nav_bbs.png" class="menu"></a>
			<a href="#" id="nav_workManager"><img src="img/nav_work-manager.png" class="menu"></a>
			<a href="#" id="nav_myInfo"><img src="img/nav_my-info.png" class="menu"></a>
			<c:if test="${sessionScope.userPermission == 99}">	<%-- 커스탬 액션 / 매니저의 경우 관리메뉴를 추가한다. --%>
				<a href="#" id="nav_managerPage"><img src="img/nav_manager-mode.png" class="menu"></a>
			</c:if> 
			<div class="loginInfoBox">
				<span class="loginIdText">${sessionScope.userName }님 환영합니다.</span>
				 <input type="button" value="로그아웃" onclick="javascript:window.location='logoutProcess.jsp'">
			</div>
	<!-- 헤더 끝 --> 

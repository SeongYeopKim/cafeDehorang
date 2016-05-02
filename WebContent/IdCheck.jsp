<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<meta charset="utf-8">
<script type="text/javascript" src="http://code.jquery.com/jquery.js">
	
</script>
<%
String result = (String)request.getAttribute("result");
session.setAttribute("idCheck",result ); %>
<script>
		$(document).ready(function(e){
			if("${result}"=="0"){
				alert("사용 가능한 ID 입니다.");
				window.close();
			}else{
				alert("이미 사용중인 ID입니다.");
				window.close();
			}
			
		});
	</script>
</head>
<body>
<div class="idCheckWrap">

</div>
</body>
</html>

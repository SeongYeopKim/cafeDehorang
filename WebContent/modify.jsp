<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="./script/jquery-1.10.1.min.js">	
</script>
<script type="text/javascript" src="./script/common.js"></script>
<link href="./css/common.css" media="all" rel="stylesheet"></link>
<style>
.inp {
	border: 1 solid #E2EAFF;
	font-family: "굴림체";
	font-size: 10pt;
}

input[type=text],input[type=button],input[type=password] {
	padding: 8px;
	width: 200px;
	border: 1px solid #cfcfcf;
	-webkit-border-radius: 5px; 
	border-radius:5px;
}

.line {
	width: 100%;
	height: 3px;
	background: #ccc;
}

.line2 {
	width: 100%;
	height: 1px;
	background: #aaa;
	margin: 10px 0px 20px 0px;
}

.btn {
	padding: 10px;
	border: 1px solid #ccc;
	-webkit-border-radius: 5px;
	border-radius: 5px;
	text-decoration: none;
	color: #000;
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

.description {
	font-size: 13px;
	color: #666;
}

#join {
	margin-top: 70px;
}
</style>

</head>
<body>
<%
/**
 *	----파라미터 및 참고사항 ----
 *	정보수정 관련 파라미터 // 가입과 동일
 *	아이디 		: joinId
 *	비밀번호 		: joinPw1
 *	비밀번호 확인 	: joinPw2
 *	이름			: joinName
 *	생일			: joinBirthMonth, joinBirthDay
 *	전화번호		: joinPhone1, joinPhone2, joinPhone3
 *
 *	폼 액션 >> modifyProcess.jsp
 *
 **/

%>
	<!-- 헤더 시작 -->
	<header> <jsp:include page="header.jsp" /> </header>
	<!-- 헤더 끝 -->
	<div class="contents">
		<div id="join2">
			<div class="sub_title">
				<img src="img/join.png"> <br />
					<div class="line2"></div>
			</div> 
			
			<form action="modifyProcess.jsp" method="post">
	            <table>
	                <tr>
	                    <th>아이디</th>
	                    <td>
	                        ${userId } <input type="hidden" name="joinId" value=${userId }></input>
	                    </td>
	                </tr>
	                 <tr>
	                    <th>비밀번호</th>
	                    <td>
	                        <input type="password" name="joinPw1"> <br/> <span class="description">비밀번호는 최소 8자 이상 입력하세요.</span><br/>
	                    </td>
	                </tr>
	                 <tr>
	                    <th>비밀번호 확인</th>
	                    <td>
	                        <input type="password" name="joinPw2"> <br/> <span class="description">비밀번호를 다시한번 입력하여주세요.</span><br/>
	                    </td>
	                </tr>
	                 <tr>
	                    <th>이름</th>
	                    <td>
	                        <input type="text" name="joinName" value=${userName }> <br/><br/>
	                    </td>
	                </tr>
	                 <tr>
	                    <th>생일</th>
	                    <td>
	                        <select name="joinBirthMonth">
	                        <% 
	                        	int myMonth = Integer.parseInt(request.getParameter("userBirthMonth"));
	                        	int myDay = Integer.parseInt(request.getParameter("userBirthDay"));
	                        	
	                        	for(int i=1; i<=12; i++){
	                        		if(i==myMonth){
	                        			out.print("<option selected='selected'>"+i+"</option>");
	                        		}else{
	                        			out.print("<option>"+i+"</option>");
	                        		}
	                        	}
	                        %>
	                        </select> 월
	                          <select name="joinBirthDay">
	                                                    <% 
	                        	for(int i=1; i<=31; i++){
	                        		if(i==myDay){
	                        			out.print("<option selected='selected'>"+i+"</option>");
	                        		}else{
	                        			out.print("<option>"+i+"</option>");
	                        		}
	                        	}
	                        %>
	
	                        </select> 일 <br/><br/>
	                    </td>
	                </tr>
	                 <tr>
	                    <th>전화번호</th>
	                    <td>
	                        <input type="text" maxlength="3" name="joinPhone1" style="width:80px" value=<%out.print(request.getParameter("userPhone1")); %>> - <input type="text" maxlength="4" name="joinPhone2" style="width:80px" value=<%out.print(request.getParameter("userPhone2")); %>> - <input type="text" maxlength="4" name="joinPhone3" style="width:80px" value=<%out.print(request.getParameter("userPhone3")); %>>
	                    </td>
	                </tr>
	            </table>
            
            <br/><br/>
                <div class="btn_wrap">
	                  <input type="submit" id="btn_join2" value="정보수정" style="width:100px;height:50px;font-size:13px">
                </div>
           </form>
		</div>
	</div>
	
</body>
</html>
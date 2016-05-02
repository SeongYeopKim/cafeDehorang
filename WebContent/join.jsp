<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="./script/jquery-1.10.1.min.js"></script>
    <style>
        
        body{
            font-family:"Hiragino Kaku Gothic ProN","Meiryo","Nanum Gothic","Malgun Gothic","맑은 고딕",dotum,"돋움","sans-serif";
            margin: 0px;
        }
        .text_box{
            font-size:14px;
            width:800px;
            height:150px;
            overflow:auto;
            border:1px solid #ccc;
            color:#808080;
        }
        .contents{
            width:800px;
        margin: 0 auto 0 auto;
        }
        .check_box{
            text-align:right;
        }
        h3{
            color:#000;   
        }
        input[type=text], input[type=button], input[type=password]{
            padding: 8px;
            width:200px;
            border:1px solid #cfcfcf;
            -webkit-border-radius: 5px;
            border-radius:5px; 
        }
        table{
            width:100%;
        }
        table th{
            width:150px;  
            text-align: left;
            vertical-align:top;
        }
        table td{ 
             vertical-align:top;
        }
        select {
             width:50px;   
             height: 30px;
             border:1px solid #cfcfcf;
             -webkit-border-radius: 5px;
             border-radius:5px;
        }
        .btn{
            padding:10px;
            border:1px solid #ccc;
            -webkit-border-radius: 5px;
             border-radius:5px;
            text-decoration:none;
            color:#000;
        }
        .btn_wrap{
            text-align:center;   
        }
        .line{
            width:100%;
            height:3px;
            background:#ccc;     
        } 
        .line2{
            width:100%;
            height:1px;
            background:#aaa;     
            margin: 10px 0px 20px 0px;
        } 
        #join1, #join2{
            margin-top: 30px;
        }
        .description{
            font-size: 13px;
            color:#666;
        }
    </style>
    <script>
    $(function(e) {
		$("#check")
				.click(
						function(e) {

							var thisID = $("#joinId").val();
							window
									.open("nickCheck?id=" + thisID,
											'아이디 중복체크',
											'scrollbars=no,toolbar=no,resizable=no,width=300,height=200,left=0,top=0');
						})
	});
    </script>
           
</head>
<body>
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
%>
    <!-- 헤더 시작 -->
	<header> 
	<a href="index.jsp"><img src="img/logo.png"></a>
	<a href="company.jsp"><img src="img/company.png" class="menu"></a>
	<!-- <img src="img/startup.png" class="menu"> 창업문의는 제외--> 
	</header>
	<!-- 헤더 끝 -->
    <div class="line"></div>
    
    <div class="contents"> <!-- 콘텐츠 래퍼 시작 -->
        <div id="join1">  <!-- 약관 페이지 시작 -->
            <p><img src="img/policy.png"></p>
            <div class="text_box">
                 <h3>Cafe de Horang에 오신 것을 환영합니다.</h3><p> 
                Cafe de Horang에 지원해주셔서 감사합니다. 저희 카페는 경기도 시흥시 산기대학로 237, TIP319호에서 운영 합니다. 
                저희 카페에 지원함으로써 귀하는 본 약관에 동의하게 되므로 본 약관을 주의 깊게 읽어보시기 바랍니다.</p>
                <h3>Cafe de Horang과의 계약</h3><p> 
                <p>귀하는 카페 내에서 적용되는 모든 정책을 준수해야 합니다. 
        Cafe de Horang의 직원이 된다고 해서 Cafe de Horang의 권한 또는 재고를(커피, 우유 등) 소유하게 되는 것은 아닙니다. 카페 매니저로부터 허가를 받거나 달리 법률에 따라 허용되는 경우를 제외하고, Cafe de Horang의 소유자산을 임의로 사용할 수 없습니다. 본 약관은 귀하에게 Cafe de Horang 카페에 사용된 브랜드나 로고를 사용할 권리를 부여하지 않습니다. </p>
                <p>계약 기간은 1년이며 계약 만료 3개월 이전에 재계약 협상이 가능합니다. 계약 기간이 3년이 된자는 관리자로부터 카페 매니저의 권한을 받을 수 있으며 Cafe de Horang의 소유자산에 대한 모든 책임 권한을 갖게 됩니다.</p>
            </div>
            <div class="check_box">
                <input id="accept_policy" type="checkbox">
                <label for="accept_policy">서비스 약관 동의</label>
            </div>
            <p><img src="img/privacy.png"></p>
             <div class="text_box">
                 <p>Cafe de Horang은 회원가입, 직원관리, 기타 서비스 등 기본적인 서비스 제공을 위한 필수정보와 맞춤 서비스 제공을 위한 선택정보로 구분하여 아래와 같은 개인정보를 수집하고 있습니다.</p>
                 <p> 1. 수집항목</p>
                 아이디, 비밀번호, 이름, 생일, 전화번호
        <p>2. 개인정보의 수집 및 이용 목적 </p>
                 웹페이지를 통한 직원관리 및 복지서비스를 위하여 상기 개인정보를 수집 및 이용
        <p>3. 보유 및 이용기간</p>
        <p>이용자의 개인정보는 개인정보의 수집 및 이용 목적이 달성되면 관련 법령 또는 회사 내부 방침에 의해 보존할 필요가 있는 경우를 제외하고는 지체 없이 파기됩니다.</p>
            </div>
            <div class="check_box">
                <input id="accept_privacy" type="checkbox">
                <label for="accept_privacy">개인정보 수집 및 이용목적 동의</label>
            </div>
            <br/><br/>
            <div class="btn_wrap">
                <a class="btn" id="btn_join1" href="#">다음</a>
            </div>
        </div> <!-- 약관 페이지 끝 -->
        <div id="join2">
            <div class="sub_title">
                <img src="img/join.png"> <br/>
                <div class="line2"></div>
            </div>
            
            <form id="joinFrm" action="joinProcess.jsp" method="post">
	            <table>
	                <tr>
	                    <th>아이디</th>
	                    <td>
	                        <input type="text" id="joinId" name="joinId"><br/> <span class="description">아이디는 최소 4자 이상 입력하세요.</span><br/>
	                    </td>
	                    <td>
	                        <input type="button" class="btn_check" id="check" value="중복체크" style="width:100px;float:right;background:#FFF"><br/><br/>
	                    </td>
	                </tr>
	                 <tr>
	                    <th>비밀번호</th>
	                    <td>
	                        <input type="password" id="joinPw1" name="joinPw1"> <br/> <span class="description">비밀번호는 최소 8자 이상 입력하세요.</span><br/>
	                    </td>
	                </tr>
	                 <tr>
	                    <th>비밀번호 확인</th>
	                    <td>
	                        <input type="password" id="joinPw2" name="joinPw2"> <br/> <span class="description">비밀번호를 다시한번 입력하여주세요.</span><br/>
	                    </td>
	                </tr>
	                 <tr>
	                    <th>이름</th>
	                    <td>
	                        <input type="text" id="joinName" name="joinName"> <br/><br/>
	                    </td>
	                </tr>
	                 <tr>
	                    <th>생일</th>
	                    <td>
	                        <select id="joinBirthMonth" name="joinBirthMonth">
	                        <% 
	                        	for(int i=1; i<=12; i++){
	                        		out.print("<option>"+i+"</option>");
	                        	}
	                        %>
	                        </select> 월
	                          <select id="joinBirthDay" name="joinBirthDay">
	                                                    <% 
	                        	for(int i=1; i<=31; i++){
	                        		out.print("<option>"+i+"</option>");
	                        	}
	                        %>
	
	                        </select> 일 <br/><br/>
	                    </td>
	                </tr>
	                 <tr>
	                    <th>전화번호</th>
	                    <td>
	                        <input type="text" maxlength="3" id="joinPhone1" name="joinPhone1" style="width:80px"> - <input type="text" maxlength="4" id="joinPhone2" name="joinPhone2" style="width:80px"> - <input type="text" maxlength="4" id="joinPhone3" name="joinPhone3" style="width:80px">
	                    </td>
	                </tr>
	            </table>
            
            <br/><br/>
                <div class="btn_wrap">
                  <input type="button" id="btn_join2" value="회원가입" style="width:100px;height:50px;font-size:13px">
                </div>
           </form>
        </div>
    </div>  <!-- 콘텐츠 래퍼 끝 -->
    <script>
        $(document).ready(function(){
           $("#join2").hide();  //임시  
        });
        $("#accept_policy, #accept_privacy").click(function(){
        	if($(this).attr("checked")=="checked"){
    			$(this).removeAttr("checked");    		
        	}else{
	        	$(this).attr("checked", "checked");
        	}
        });
        $("#btn_join1").click(function(){
        	if($("#accept_policy").attr("checked")!="checked"){
				alert("서비스 약관에 동의해주세요.");
				$("#accept_policy").focus();
        	}else if($("#accept_privacy").attr("checked")!="checked"){
        		alert("개인정보 수집 및 이용목적에 동의해주세요.");
        		$("#accept_privacy").focus();
        	}else{
        		$("#join1").hide();
                $("#join2").show();	
        	}
        });
        $("#btn_join2").click(function(){
        	if($("#joinId").val().length<4){
        		alert("아이디는 최소 4자 이상 입력하세요.");
        		$("#joinId").focus();
        	}else if($("#joinPw1").val().length<8){
        		alert("비밀번호는 최소 8자 이상 입력하세요.");
        		$("#joinPw1").focus();
        	}else if($("#joinPw1").val()!=$("#joinPw2").val()){
        		alert("비밀번호가 동일하지 않습니다.");
        		$("#joinPw1").val(""); 
        		$("#joinPw2").val("");
        		$("#joinPw1").focus();
        	}else if($("#joinName").val().length<1){
        		alert("이름을 입력하세요.");
        		$("#joinName").focus();
        	}else if($("#joinPhone1").val().length<2 || $("#joinPhone2").val().length<3 || $("#joinPhone3").val().length<4){
        		alert("전화번호를 확인하세요.");
        		$("#joinPhone1").focus();
        	}else{
        		$("#joinFrm").submit();
        	}
        });
    </script>
        
</body>
</html>
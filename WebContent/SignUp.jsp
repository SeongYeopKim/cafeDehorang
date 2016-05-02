<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script>
	function phoneScript(){
		var mNum;
		var lNum;
		var fNum
		$("#fNum").keyup(function(e){
			fNum = $(this).val();
			if(fNum.length>2){
				$("#mNum").focus();
			}
			if(mNum.length>3){
				$("#lNum").focus();
			}
		})
		$("#lNum").keyup(function(e){
			lNum = $(this).val();
			if(lNum.length>3){
				var fNum = $("#fNum").val();
				var lNum = $("#lNum").val();
				$("#phone").val(fNum+"-"+mNum+"-"+lNum);	
			}
		})
	}
	function monthAndDayAdd(){
		for(i=1; i<13; i++){
			if(i<10){
				$("#month").append("<option>0"+i+"</option>")
			}else{
				$("#month").append("<option>"+i+"</option>")
			}
		}
		for(i=1; i<32; i++){
			if(i<10){
				$("#day").append("<option>0"+i+"</option>")
			}else{
				$("#day").append("<option>"+i+"</option>")
			}
		}
		$("#month, #day").change(function(){
			var month = $("#month").val();
			var day = $("#day").val();
			$("#birth").val(month+"-"+day)
		})
	}
	function tabControll(tab) {
		if (tab == 1) {
			$(".tabContent1").css("display", "block");
			$(".tabContent2").css("display", "none");
			$(".tabBtn:eq(0)").css("color", "#0e76bc");
		} else {
			$(".tabContent1").css("display", "none");
			$(".tabContent2").css("display", "block");
			$(".tabBtn:eq(1)").css("color", "#0e76bc");
		}

	}

	function urlCheck() {
		var loca = window.location + "";
		var locaSplit = new Array();
		locaSplit = loca.split('/');

		var locaSplitLength = locaSplit.length;
		if (locaSplit[locaSplitLength - 1] == "listJson.tiara"
				|| locaSplit[locaSplitLength - 1] == "list.tiara") {
			tabControll(1);
		} else {
			tabControll(2);
		}
	}

	$(function(e) {
		urlCheck();
		monthAndDayAdd();
		phoneScript();
		var kk = new Array();
		var manLength = $(".user").length;
		for(i=0; i<manLength; i++){ 
			var tval =$(".nameValue:eq("+i+")").val();
			tval = encodeURI(tval);
			$(".nameValue:eq("+i+")").val(tval);
		}
		$(".tabBtn").click(function(e) {
			var tindex = $(this).index() + 1;
			if (tindex == 1) {
				window.location.href = "list.tiara";
			} else {
				window.location.href = "signUp.tiara";
			}
		});
		$(".idText").css("cursor","pointer").click(function(e){
			var tindex = $(this).parent().parent().index()-1;
			$(".formText:eq("+tindex+")").submit();
		})
		

		$("#idcheck")
				.click(
						function(e) {

							var thisID = $("#id").val();
							window
									.open("nickNameCheck.tiara?id=" + thisID,
											'아이디 중복체크',
											'scrollbars=no,toolbar=no,resizable=no,width=300,height=200,left=0,top=0');
						})
	});
</script>


<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="tabContent2">
		<form action="signUp.tiara" method="post">
			<table cellspacing="20">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" id="id"></td>
					<td><input type="button" value="중복확인" id="idcheck"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw"></td>
					<td></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" class="passCheck"></td>
					<td></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name"></td>
					<td></td>
				</tr>
				<tr>
					<td>생일</td>
					<td><select id="month"></select>월 <select id="day"></select>일
						<input type="hidden" name="birth" id="birth"></td>
					<td></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td colspan="2">010- <input type="text" id="fNum"
						style="width: 50px"> - <input type="text" id="lNum"
						style="width: 50px"> <input type="hidden" name="phone"
						id="phone">
					</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="3" style="text-align: center"><input
						type="submit" value="전송" class="joinsubmit"></td>
				</tr>
			</table>
		</form>
	</div>

	</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp" %>

<title>비밀번호 찾기</title>
<link type="text/css" href="<c:url value='/css/find.css'/>"  rel="stylesheet" >

<script>
$(function(){
	$("#findBtn").click(function(){
		var id = $("#memId").val();
		var email = $("#memEmail").val();
		$.ajax({
			url : "findpw.do",
			type : "POST",
			data : {
				"id" : id,
				"email" : email
			},
			dataType:"text",
			success : function(result) {
				if(result == 1){
					alert("등록되지 않은 아이디입니다.");
				}else if(result == 2){
				 	alert("등록되지 않은 이메일입니다.");
				}else{
					alert("이메일을 전송하였습니다. 확인하세요.");
				}
			}
		});
	});
});
</script>

<div class="main_container">
		<div class="main_wrap" style="width: 382px;height: 456.3px;">
			<div id="header">
				<h2>비밀번호 찾기</h2>
			</div>
			<div class="find_input">
				<div class="find_input_id">
					<p class="label">아이디</p>
					<input type="text" id="memId" name="id" placeholder="회원가입한 이름을 입력하세요" required>
				</div>
				<div class="find_input_pw">
					<p class="label">이메일</p>
					<input  type="text" id="memEmail" name="email" placeholder="회원가입한 휴대폰번호를 입력하세요" required>
				</div>
				<div class="find_btn">
					<button type="button" id="findBtn" class="mybtn">찾기</button>
					<button type="button" onclick="history.go(-1);" class="mybtn">로그인</button>
				</div>
			</div>
		</div>
	</div>

<%@include file="../common/footer.jsp" %>
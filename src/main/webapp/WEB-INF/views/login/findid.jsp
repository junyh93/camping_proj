<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp" %>

<title>아이디 찾기</title>
<link type="text/css" href="<c:url value='/css/find.css'/>"  rel="stylesheet" >

<script>
$(function(){
	$("#findBtn").click(function(){
		var name = $("#memName").val();
		var phone = $("#memPhone").val();
		var dlength = "";
		var subdata = "";
		var finish = "";
		var star = "";
		/* alert('버튼작동'); */
		$.ajax({
			url : "findid.do",
			type : "POST",
			data : {
				"name" : name,
				"phone" : phone
			},
			dataType:"text",
			success : function(data){
				alert(data);
				if(data == ""){
					alert('가입된 아이디가 없습니다.');
				}else{
					/* 아이디 뒷 4자리를 *로 바꾸기 */
					dlength = data.length - 4;
					subdata = data.substring(0, 4);

					for (let i = 0; i < dlength; i++){
						star = star + "*";
					}
					
					finish = subdata + star;

					$('.find_input_id').hide();
					$('.find_input_pw').hide();
					$('#id').append("<h2>" + finish + "</h2>");
					
				}

			},
			error: function(xhr, status, error){
				alert(status + ", " + error);
			}
		});
	});
});
</script>

<div class="main_container">
		<div class="main_wrap" style="width: 382px;height: 456.3px;">
			<div id="header">
				<h2>아이디 찾기</h2>
			</div>		
			<div class="find_input" >
				<div id="id"></div>
				<div class="find_input_id">
					<p class="label">이름</p>
					<input type="text" id="memName" name="name" placeholder="회원가입한 이름을 입력하세요" required>
				</div>
				<div class="find_input_pw">
					<p class="label">휴대번호</p>
					<input  type="text" id="memPhone" name="phone" placeholder="회원가입한 휴대번호를 입력하세요" required>
				</div>
				<div class="find_btn">
					<button type="button" id="findBtn" class="mybtn">찾기</button>
					<button type="button" onclick="location.href='login.do' " class="mybtn">로그인</button>
				</div>
			</div>
		</div>
	</div>

<%@include file="../common/footer.jsp" %>
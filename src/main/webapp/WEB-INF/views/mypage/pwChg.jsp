<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp" %>
<%@include file="../common/myheader.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>비밀번호 변경</title>
<link type="text/css" href="<c:url value='/css/memInfo.css'/>"  rel="stylesheet" >

<script type="text/javascript">
//<![CDATA[
	var path = "";
	var qustr = "";

	$(function() {

	});

	function _onSubmit() {

		if ($("#nowPassword").val() == "") {
			alert("기존 비밀번호를 입력해주세요.");
			$("#nowPassword").focus();
			return false;
		}
		if ($("#newPassword").val() == "") {
			alert("변경 비밀번호를 입력해주세요.");
			$("#newPassword").focus();
			return false;
		}
		if($("#newPassword").val().length < 8){
			alert("8자리 이하입니다.");
			$("#newPassword").focus();
			return false;
		}
		if ($("#newPassword_chk").val() == "") {
			alert("변경 비밀번호 확인을 입력해주세요.");
			$("#newPassword_chk").focus();
			return false;
		}
		if ($("#newPassword").val() != $("#newPassword_chk").val()) {
			alert("입력하신 비밀번호와 비밀번호 확인이 서로 다릅니다.");
			$("#newPassword_chk").focus();
			return false;
		}

		if (confirm("비밀번호를 변경하시겠습니까?")) {
			$.ajax({
				url: "<c:url value='/pwChg.do'/>",
				type: "POST",
				data: $("#inputForm").serialize(),
				dataType: "text",
				async: false
			}).done(function(data){
					if(data == "success"){
						alert("비밀번호가 변경되었습니다.")
						location.href = "<c:url value='/mypage.do?memNo=${memNo}'/>";
					}
				}).fail(function(e) {
					alert("FAIL - " + e);
				}).always(function() {
				});
			return false;
		}else{
			return false;
		}
	}
	//]]>
</script>
	<ul class="tab_list tab_5">
		<li class="off"><a href="#" onclick="zzim_cam('${memNo}')"><span>내가 찜한 캠핑장</span></a></li>
		<li class="off"><a href="#" onclick="review_cam('${memNo}')"><span>내가 작성한 후기</span></a></li>
		<li class="off"><a href="#" onclick="qna('${memNo}')"><span>1:1 문의</span></a></li>
		<li class="on"><a href="<c:url value='mypage.do?memNo=${memNo }'/>"><span>회원정보</span></a></li>
	</ul>
<form name="inputForm" id="inputForm" method="post" onsubmit="return _onSubmit();" action="pwChg.do">
	<input type="hidden" id="memId" name="memId" value="${memId }" >
	<section class="find_pwd">
		<h2 class="basic_title">비밀번호 변경</h2>
		<!--아이디찾기-->
		<div class="board_form find_info">
			<table class="table_form">
				<tbody>
					<tr>
						<th scope="row" class="gray w20"><label for="find_name">기존 비밀번호</label></th>
						<td class="w80"><input type="password" id="nowPassword" name="nowPassword" class="txt"></td>
					</tr>
					<tr>
						<th scope="row" class="gray w20"><label for="find_nickname">변경 비밀번호</label></th>
						<td class="w80"><input type="password" id="newPassword" name="memPw" class="txt"></td>
					</tr>
					<tr>
						<th scope="row" class="gray w20"><label for="find_email">변경 비밀번호 확인</label></th>
						<td class="w80"><input type="password" id="newPassword_chk" name="newPassword_chk" class="txt"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<p class="find_idBtn">
			<button type="submit" class="btn_black_L">비밀번호 변경</button>
		</p>
		<!--//아이디찾기-->
	</section>
</form></div>
				<!--//내용종료-->
			</div>
		</div>
		<!--//콘텐츠박스-->
	</section>
 
	</div>

<%@include file="../common/footer.jsp" %>
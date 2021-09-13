<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="../common/header.jsp" %>
<%@include file="../common/myheader.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>비밀번호 확인</title>
<link type="text/css" href="<c:url value='/css/memInfo.css'/>"  rel="stylesheet" >

<script type="text/javascript">
	//<![CDATA[
	var contextPath = "";

	$(function() {

	});

	function fn_submit() {

		if ($("#memPw").val() == "") {
			alert("비밀번호는 필수입니다.");
			$("#memPw").focus();
			return false;
		}
		
		if(confirm("회원탈퇴를 하시겠습니까?")){
			var memPw = $('#memPw').val();
			var memId = $('#memId').val();
			$.ajax({
				url : "<c:url value='/pwChk.do'/>",
				type : "POST",
				data : {"memPw" : memPw, "memId" : memId },
				dataType : "json",
				async : false
			}).done(function(resMap) {
				if (resMap == 1) {
					location.href = "<c:url value='/deleteMember.do?memNo=${memNo}'/>";
					alert("그동안 이용해주셔서 감사합니다.");
				}else{
					alert("비밀번호가 일치하지 않습니다.");
					$('#memPw').val("");
				}
				return false;
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

<form id="searchVO" name="inputForm" action="/myPage/createChkPwd.do?" method="post"><section class="find_pwd">
		<h2 class="basic_title">확인을 위해 비밀번호를 다시 입력해주세요.</h2>
		<!--아이디찾기-->
		<div class="board_form find_info">
			<table class="table_form"> 
				<tbody>
					<tr>
						<th scope="row" class="gray w20"><label for="me_pwd">비밀번호</label></th>
						<td class="w80"><input id="memPw" name="memPw" class="txt" type="password"></td>
						<input type="hidden" id="memId" name="memId" value="${memId }" >
					</tr>	
				</tbody>
			</table>
		</div>
		<p class="find_idBtn">
			<button type="submit" onclick="return fn_submit();" class="btn_black_L">확인</button>
		</p>
		<!--//아이디찾기-->
	</section>
</form>
</div>
				<!--//내용종료-->
			</div>
		</div>
		<!--//콘텐츠박스-->
	</section>
 
	</div>

<%@include file="../common/footer.jsp" %>
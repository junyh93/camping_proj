<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp" %>
<%@include file="../common/myheader.jsp" %>

<title>마이페이지</title>
<link type="text/css" href="<c:url value='/css/mypage.css'/>"  rel="stylesheet" >
<link type="text/css" href="<c:url value='/css/memInfo.css'/>"  rel="stylesheet" >

<script type="text/javascript">
	var path = "";
	var qustr = "";



	function deleteMember() {

		if(confirm("회원탈퇴를 하시겠습니까?")){
			$.ajax({
				url : "<c:url value='/deleteMember.do'/>",
				type : "POST",
				dataType : "json",
				async : false
			}).done(function(resMap) {
				if (resMap.res == "ok") {
					alert(resMap.msg);
					location.href = "./logout.do";
				}else{
					alert(resMap.msg);
				}
			}).fail(function(e) {
				alert("FAIL - " + e);
			}).always(function() {
			});
			return true;
		}else{
			return false;
		}
		
	}
</script>
	<ul class="tab_list tab_5">
		<li class="off"><a href="#" onclick="zzim_cam('${memNo}')"><span>내가 찜한 캠핑장</span></a></li>
		<li class="off"><a href="#" onclick="review_cam('${memNo}')"><span>내가 작성한 후기</span></a></li>
		<li class="off"><a href="#" onclick="qna('${memNo}')"><span>1:1 문의</span></a></li>
		<li class="on"><a href="<c:url value='mypage.do?memNo=${memNo }'/>"><span>회원정보</span></a></li>
	</ul>	
<h3 class="icon_h3">
	정보확인</h3>
<div class="board_list">
	<table class="table_list">
		<tbody>
			<tr>
				<th>이름</th>
				<td class="board_tit">${member.memName }</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td class="board_tit">${member.memId }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td class="board_tit">${member.memEmail }</td>
			</tr>
		</tbody>
	</table>
</div>

<div class="board_btn_w">
	<div class="board_btn">
		<button title="회원탈퇴" class="b_btn_blue" onclick="location.href='<c:url value='pwChk.do'/> '" type="button">
			<span>회원탈퇴</span>
		</button>
		<button title="비밀번호변경" class="b_btn_blue" onclick="location.href='<c:url value='pwChg.do'/> '" type="button">
			<span>비밀번호변경</span>
		</button>
		</div>
</div>

</div>
</div>
				<!--//내용종료-->
			</div>
		</div>
		<!--//콘텐츠박스-->
	</section>
 
	</div>

<%@include file="../common/footer.jsp" %>
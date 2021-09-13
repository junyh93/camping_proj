<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<title>공지사항 수정</title>
<link type="text/css" href="<c:url value='/css/updateqna.css'/>"  rel="stylesheet" >

<script type="text/javascript">

		function _onSubmit() {
		if(confirm("공지사항을 수정하시겠습니까?")){	
			$.ajax({
				url: "<c:url value='/updateNotice.do'/>",
				type: "POST",
				data: $("#inputForm").serialize(),
				dataType: "text",
				async: false
			}).done(function(data){
				console.log(data);
					if(data == "success"){
						list();
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
function list(){
	location.href="<c:url value='/getNotice.do?page="+${page}+"&range="+${range}+"&rangeSize="+${rangeSize}+"'/>";
};
</script>

	<ul class="tab_list tab_5">
		<li class="off"><a href="<c:url value='admin.do'/>" ><span>1:1문의</span></a></li>
		<li class="off"><a href="<c:url value='getMem.do'/>" ><span>회원목록</span></a></li>
		<li class="off"><a href="<c:url value='getCom.do'/>" ><span>댓글목록</span></a></li>
		<li class="on"><a href="<c:url value='getNotice.do'/>"><span>공지사항 목록</span></a></li>
	</ul>
<form name="inputForm" id="inputForm" method="post" onsubmit="return _onSubmit();" action="updateNotice.do">

	<section class="find_pwd">
		<h3 class="basic_title">공지사항 수정</h3>
		<!--1:1문의 시작-->
		<div class="board_form find_info">
			<table class="table_form">
				<tbody>
				<input type="hidden" id="noticeNo" name="noticeNo" value="${notice.noticeNo} ">
					<tr>
						<td scope="col" class="gray w20"><label>제목</label></td>
						<td class="w80"><input type="text" id="noticeTitle" name="noticeTitle" class="txt" value="${notice.noticeTitle }"></td>
					</tr>
					<tr>
						<td scope="col" class="gray w20"><label>문의하실 내용을 작성하세요.</label></td>
						<td class="w80"><textarea type="text" id="noticeContent" name="noticeContent" class="txt" >${notice.noticeContent }</textarea></td>
					</tr>

				</tbody>
			</table>
		</div>
		<p class="find_idBtn">
			<button type="submit" class="btn_black_L">수정하기</button>
		</p>
		<!--//1:1문의 끝-->
	</section>
	<input type="hidden" id="page" name="page" value="${page }">
	<input type="hidden" id="range" name="range" value="${range }">
	<input type="hidden" id="rangeSize" name="rangeSize" value="${rangeSize }">
</form>


</div>

				<!--//내용종료-->
			</div>
		</div>
		<!--//콘텐츠박스-->
	</section>
 
	</div>
<%@include file="../common/footer.jsp" %>
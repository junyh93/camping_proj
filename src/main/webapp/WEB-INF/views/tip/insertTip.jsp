<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<title>캠핑 팁 작성</title>
<link type="text/css" href="<c:url value='/css/insertnotice.css'/>"  rel="stylesheet" >

<script type="text/javascript">

		function _onSubmit() {
			if(confirm("캠핑 팁을 작성하시겠습니까?")){
				$.ajax({
					url:"<c:url value='/insertTip.do'/>",
					type:"POST",
					data: $("#inputForm").serialize(),
					dataType: "text",
					async: false,
					success:function(data){
						if(data == "success"){
							list();
						}
					}
				});
				return false;
			}else{
				return false;
			}
};
function list(){
	location.href="<c:url value='/tip.do?page="+${page}+"&range="+${range}+"&rangeSize="+${rangeSize}+"'/>";
};

</script>
	<h2 class="skip">본문영역입니다.</h2>
		<!--콘텐츠박스-->
		<div id="cont_inner">
			<div class="sub_layout layout">

<form name="inputForm" id="inputForm" method="post" onsubmit="return _onSubmit();" action="insertTip.do">
	 <input type="hidden" id="sessionNo" name="memNo" value="${memNo}">
	 <input type="hidden" id="sessionId" name="memId" value="${memId}">
	<section class="find_pwd">
		<h3 class="basic_title">캠핑 팁 작성</h3>
		<!--캠핑 팁 시작-->
		<div class="board_form find_info">
			<table class="table_form">
				<tbody>
					<tr>
						<td scope="col" class="gray w20"><label>제목</label></td>
						<td class="w80"><input type="text" id="tipTitle" name="tipTitle" class="txt"></td>
					</tr>
					<tr>
						<td scope="col" class="gray w20"><label>문의하실 내용을 작성하세요.</label></td>
						<td class="w80"><textarea type="text" id="tipContent" name="tipContent" class="txt"></textarea></td>
					</tr>
					<tr>
						<td scope="col" class="gray w20"><label>첨부할 링크 주소를 입력하세요.</label></td>
						<td class="w80"><input type="text" id="tipLink" name="tipLink" class="txt"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<p class="find_idBtn">
			<button type="submit" class="btn_black_L">작성하기</button>
		</p>
		<!--//1:1문의 끝-->
	</section>
</form>
	<input type="hidden" name="page" value="${page }">
	<input type="hidden" name="range" value="${range }">
	<input type="hidden" name="rangeSize" value="${rangeSize }">
</div>

				<!--//내용종료-->
			</div>
		</div>
		<!--//콘텐츠박스-->
	</section>
 
	</div>
<%@include file="../common/footer.jsp" %>
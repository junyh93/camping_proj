<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<title>1:1문의 작성</title>
<link type="text/css" href="<c:url value='/css/qna.css'/>"  rel="stylesheet" >

<script type="text/javascript">

		function _onSubmit() {
		if(confirm("1:1문의를 작성하시겠습니까?")){	
			$.ajax({
				url: "<c:url value='/qna.do'/>",
				type: "POST",
				data: $("#inputForm").serialize(),
				dataType: "text",
				async: false
			}).done(function(data){
				console.log(data);
					if(data == "success"){
						$.ajax({
							url:"<c:url value='/myQna.do?memNo=${memNo}'/>",
							type:"GET",
							success:function(data){
								$('#contents').html(data);
							} 
						});
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

</script>

	<ul class="tab_list tab_5">
		<li class="off"><a href="#" onclick="zzim_cam('${memNo}')"><span>내가 찜한 캠핑장</span></a></li>
		<li class="off"><a href="#" onclick="review_cam('${memNo}')"><span>내가 작성한 후기</span></a></li>
		<li class="on"><a href="#" onclick="qna('${memNo}')"><span>1:1 문의</span></a></li>
		<li class="off"><a href="<c:url value='mypage.do?memNo=${memNo }'/>"><span>회원정보</span></a></li>
	</ul>
<form name="inputForm" id="inputForm" method="post" onsubmit="return _onSubmit();" action="qna.do">
	<input type="hidden" id="memId" name="memId" value="${memId }" >
	<input type="hidden" id="memNo" name="memNo" value="${memNo }">
	<section class="find_pwd">
		<h3 class="basic_title">1:1문의</h3>
		<!--1:1문의 시작-->
		<div class="board_form find_info">
			<table class="table_form">
				<tbody>
					<tr>
						<td scope="col" class="gray w20"><label>문의사항</label></td>
						<td class="w80">
	  						<select  class="search sch"  style="margin: 5px; " name="condition" var="option" >
	                             <c:forEach items="${conditionMap }" var="option">
		                            <option value="${option.value }">${option.key }
		                        </c:forEach>
	                       </select>
	                    </td> 
					</tr>
					<tr>
						<td scope="col" class="gray w20"><label>제목</label></td>
						<td class="w80"><input type="text" id="qnaTitle" name="qnaTitle" class="txt"></td>
					</tr>
					<tr>
						<td scope="col" class="gray w20"><label>문의하실 내용을 작성하세요.</label></td>
						<td class="w80"><textarea type="text" id="qnaContent" name="qnaContent" class="txt"></textarea></td>
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

</div>

				<!--//내용종료-->
			</div>
		</div>
		<!--//콘텐츠박스-->
	</section>
 
	</div>
<%@include file="../common/footer.jsp" %>
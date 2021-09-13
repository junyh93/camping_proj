<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<title>1:1문의 작성</title>
<link type="text/css" href="<c:url value='/css/getqna.css'/>"  rel="stylesheet" >

<script type="text/javascript">


function myQna(){
	var memNo = $('#memNo').val();
	$.ajax({
		url:"<c:url value='/myQna.do'/>",
		type:"GET",
		data:{"memNo" : memNo},
		dataType:"text",
		success:function(data){
			$('#contents').html(data);
		}
	});
};

function updateqna(qnaNo){
	$.ajax({
		url:"<c:url value='/updateQna.do'/>",
		type:"GET",
		data:{"qnaNo": qnaNo},
		dataType:"text",
		success:function(data){
			$('#contents').html(data);
		}
	});
}

function deleteqna(qnaNo){
	if(confirm("1:1문의를 삭제하시겠습니까?")){
		$.ajax({
			url:"<c:url value='/deleteQna.do'/>",
			type:"POST",
			data:{"qnaNo" : qnaNo},
			dataType:"text",
			success:function(){
				myQna();
			}
		});
	}
};


function ok(){
	$.ajax({
		url:"<c:url value='/myQna.do?memNo=${memNo}'/>",
		type:"GET",
		success:function(data){
			$('#contents').html(data);
		} 
	});
};

</script>
<script type="text/javascript">
$(function(){
	var admin = $('#admin').val();
	
	if(admin == ""){
		$('.admin').hide();

	}else if(admin != ""){
	
		$('.admin').show();
	}
});	


</script>



	<ul class="tab_list tab_5">
		<li class="off"><a href="#" onclick="zzim_cam('${memNo}')"><span>내가 찜한 캠핑장</span></a></li>
		<li class="off"><a href="#" onclick="review_cam('${memNo}')"><span>내가 작성한 후기</span></a></li>
		<li class="on"><a href="#" onclick="qna('${memNo}')"><span>1:1 문의</span></a></li>
		<li class="off"><a href="<c:url value='mypage.do?memNo=${memNo }'/>"><span>회원정보</span></a></li>
	</ul>

	<input type="hidden" id="memId" name="memId" value="${memId }" >
	<input type="hidden" id="memNo" name="memNo" value="${memNo }">
	<input type="hidden" id="admin" name="admin" value="${admin}">
	<section class="find_pwd">
		<h3 class="basic_title">1:1문의</h3>
		<!--1:1문의 시작-->
		<div class="board_form find_info ">
			<table class="table_form">
				<tbody>
					<tr>
						<td scope="col" class="gray w20"><label>문의사항</label></td>
						<td class="w80">
						<span  id="condition" name="condition" class="txt">
							  <c:forEach items="${conditionMap }" var="option">
							  	<c:if test="${option.value eq qna.condition }">
		                            <c:out value="${option.key }" />
		                        </c:if>
		                        </c:forEach>
						</span>
						</td> 
					</tr>
					<tr>
						<td scope="col" class="gray w20"><label>제목</label></td>
						<td class="w80"><input type="text" id="qnaTitle" name="qnaTitle" class="txt"  disabled="disabled" value="${qna.qnaTitle }"></td>
					</tr>
					<tr>
						<td scope="col" class="gray w20"><label>문의하실 내용을 작성하세요.</label></td>
						<td class="w80"><textarea type="text" id="qnaContent" name="qnaContent" class="txt"  disabled="disabled">${qna.qnaContent }</textarea></td>
					</tr>

				</tbody>
			</table>
		</div>
		<div class="board_form find_info admin">
			<table class="table_form">
				<tbody>
					<tr>
						<td scope="col" class="gray w20"><label>답변하기</label></td>
					</tr>
					<tr>
						<td scope="col" class="gray w20"><label>문의에대한 답변을 작성하세요.</label></td>
						<td class="w80"><textarea type="text" id="qnaContent" name="qnaContent" class="txt" >${admin.rpContent }</textarea></td>
					</tr>

				</tbody>
			</table>
		</div>
		<p class="find_idBtn">
			<button type="button" class="btn_black_L" onclick="updateqna('${qna.qnaNo}')">수정</button>
			<button type="button" class="btn_black_L" onclick="deleteqna('${qna.qnaNo}')">삭제</button>
			<button type="button" class="btn_black_L" onclick="ok();">확인</button>
		</p>
		<!--//1:1문의 끝-->
	</section>


</div>

				<!--//내용종료-->
			</div>
		</div>
		<!--//콘텐츠박스-->
	</section>
 
	</div>
<%@include file="../common/footer.jsp" %>
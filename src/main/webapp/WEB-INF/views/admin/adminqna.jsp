<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<title>1:1문의</title>
<link type="text/css" href="<c:url value='/css/getqna.css'/>"  rel="stylesheet" >

<script type="text/javascript">
$(function(){
	var admin = $('#admin').val();
	if(admin != ""){
		$('#rpContent').attr("disabled", "disabled");
	}
	
});

function myReplay(){
	location.href="<c:url value='/admin.do'/>";
};

function replayqna(qnaNo){
	var rpContent = $('#rpContent').val();
	var adNo = $('#adNo').val();
	$.ajax({
		url:"<c:url value='/replayQna.do'/>",
		type:"POST",
		data:{
			"adNo" : adNo,
			"qnaNo": qnaNo,
			"rpContent" : rpContent,	
		},
		dataType:"text",
		success:function(data){
			if(data == "success"){
				list();
			}
		}
	});
};

function deletereplay(qnaNo){
	var rpNo = $('#rpNo').val();
	
	if(confirm("1:1답변을 삭제하시겠습니까?")){
		$.ajax({
			url:"<c:url value='/deleteReplay.do'/>",
			type:"POST",
			data:{
				"rpNo" : rpNo,
				"qnaNo" : qnaNo
				},
			dataType:"text",
			success:function(data){
				if(data == "success"){
					list();
				}
			}
		});
	}
};
function list(){
	location.href="<c:url value='/admin.do?page="+${page}+"&range="+${range}+"&rangeSize="+${rangeSize}+"'/>";
};

/* function ok(){
	$.ajax({
		url:"<c:url value='/admin.do'/>",
		type:"GET",
		success:function(data){
			$('#contents').html(data);
		} 
	});
}; */

</script>

	<ul class="tab_list tab_5">
		<li class="on"><a href="<c:url value='admin.do'/>" ><span>1:1문의</span></a></li>
		<li class="off"><a href="<c:url value='getMem.do'/>" ><span>회원목록</span></a></li>
		<li class="off"><a href="<c:url value='getCom.do'/>" ><span>댓글목록</span></a></li>
		<li class="off"><a href="<c:url value='getBoard.do'/>"><span>게시글관리</span></a></li>
	</ul>
	<input type="hidden" id="admin" name="admin" value=${admin }>
	<input type="hidden" id="rpNo" name="rpNo" value=${admin.rpNo }>
	<section class="find_pwd">
		<h3 class="basic_title">1:1문의</h3>
		<!--1:1문의 시작-->
		<div class="board_form find_info">
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
		<div class="board_form find_info">
			<table class="table_form">
				<tbody>
					<tr>
						<td scope="col" class="gray w20"><label>답변하기</label></td>
					</tr>
					<tr>
						<td scope="col" class="gray w20"><label>문의에대한 답변을 작성하세요.</label></td>
						
						<td class="w80"><textarea type="text" id="rpContent" name="rpContent" class="txt" >
						<c:if test="${admin != null}">
							<c:out value="${admin.rpContent }"/>
						</c:if>
						</textarea></td>
					</tr>

				</tbody>
			</table>
		</div>
		<p class="find_idBtn">
			<button type="button" class="btn_black_L" onclick="replayqna('${qna.qnaNo}')">답변하기</button>
			<button type="button" class="btn_black_L" onclick="deletereplay('${qna.qnaNo}')">삭제하기</button>
			<button type="button" class="btn_black_L" onclick="list();">확 인</button>
		</p>
		<!--//1:1문의 끝-->
	</section>
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
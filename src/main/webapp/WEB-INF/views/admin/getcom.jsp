<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<title>댓글 상세보기</title>
<link type="text/css" href="<c:url value='/css/getqna.css'/>"  rel="stylesheet" >

<script type="text/javascript">

function deletecom(comNo){
	if(confirm("댓글을 삭제하시겠습니까?")){
		$.ajax({
			url:"<c:url value='/deleteCom.do'/>",
			type:"POST",
			data:{"comNo" : comNo},
			dataType:"text",
			success:function(data){
				if(data=="success"){
					alert("삭제되었습니다.");
					list();
				}
			}
		});
	}
};


function list(){
	location.href="<c:url value='/getCom.do?page="+${page}+"&range="+${range}+"&rangeSize="+${rangeSize}+"'/>";
};

</script>

	<ul class="tab_list tab_5">
		<li class="off"><a href="<c:url value='admin.do'/>" ><span>1:1문의</span></a></li>
		<li class="off"><a href="<c:url value='getMem.do'/>" ><span>회원목록</span></a></li>
		<li class="on"><a href="<c:url value='getCom.do'/>" ><span>댓글목록</span></a></li>
		<li class="off"><a href="<c:url value='getBoard.do'/>"><span>게시글관리</span></a></li>
	</ul>
	
	<section class="find_pwd">
<h3 class="basic_title ">댓글 상세보기</h3>
		<!--1:1문의 시작-->
		<div class="board_form find_info ">
			<table class="table_form">
				<tbody>
					<tr>
						<td scope="col" class="gray w20"><label>댓글</label></td>
					</tr>
					<tr>
						<td scope="col" class="gray w20"><label>아이디</label></td>
						<td class="w80"><input type="text" id="memId" name="memId" class="txt"  disabled="disabled" value="${comment.memId }"></td>
					</tr>
					<tr>
						<td scope="col" class="gray w20"><label>댓글 내용</label></td>
						<td class="w80"><textarea type="text" id="comContent" name="comContent" class="txt"  disabled="disabled">${comment.comContent }</textarea></td>
					</tr>

				</tbody>
			</table>
		</div>
		<p class="find_idBtn">
			<button type="button" class="btn_black_L" onclick="deletecom('${comment.comNo}')">삭제</button>
			<button type="button" class="btn_black_L" onclick="list();">확인</button>
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
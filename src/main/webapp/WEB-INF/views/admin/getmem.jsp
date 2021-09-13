<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<title>회원 상세보기</title>
<link type="text/css" href="<c:url value='/css/mypage.css'/>"  rel="stylesheet" >
<link type="text/css" href="<c:url value='/css/memInfo.css'/>"  rel="stylesheet" >

<script type="text/javascript">
function deleteMem(memNo){
	if(confirm("회원을 탈퇴시키겠습니까?")){
		$.ajax({
			url:"<c:url value='/deleteMem.do'/>",
			type:"POST",
			data:{"memNo" : memNo},
			dataType:"text",
			success:function(data){
				if(data == "success"){
					alert("탈되되었습니다.");
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
	location.href="<c:url value='/getMem.do?page="+${page}+"&range="+${range}+"&rangeSize="+${rangeSize}+"'/>";
};
</script>
	<ul class="tab_list tab_5">
		<li class="off"><a href="<c:url value='admin.do'/>" ><span>1:1문의</span></a></li>
		<li class="on"><a href="<c:url value='getMem.do'/>" ><span>회원목록</span></a></li>
		<li class="off"><a href="<c:url value='getCom.do'/>" ><span>댓글목록</span></a></li>
		<li class="off"><a href="<c:url value='getBoard.do'/>"><span>게시글관리</span></a></li>
	</ul>
<h3 class="icon_h3">회원 상세보기</h3>
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
		<button title="회원탈퇴" class="b_btn_blue" onclick="deleteMem('${member.memNo}')" type="button">
			<span>회원탈퇴</span>
		</button>
 		<button title="확인" class="b_btn_blue" onclick="list();" type="button">
			<span>확인</span>
		</button> 
		</div>
</div>
	<input type="hidden" name="page" value="${page }">
	<input type="hidden" name="range" value="${range }">
	<input type="hidden" name="rangeSize" value="${rangeSize }">
</div>
</div>
				<!--//내용종료-->
			</div>
		</div>
		<!--//콘텐츠박스-->
	</section>
 
	</div>

<%@include file="../common/footer.jsp" %>
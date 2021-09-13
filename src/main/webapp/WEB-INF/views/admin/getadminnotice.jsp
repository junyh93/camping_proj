<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<title>공지사항</title>
<link type="text/css" href="<c:url value='/css/getqna.css'/>"  rel="stylesheet" >

<script type="text/javascript">

function updatenotice(noticeNo){
	var page = $('#page').val();
	var range = $('#range').val();
	var rangeSize = $('#rangeSize').val();
	
	$.ajax({
		url:"<c:url value='/updateNotice.do'/>",
		type:"GET",
		data:{"noticeNo": noticeNo,
			"page" : page,
			"range" : range,
			"rangeSize" : rangeSize		
		},
		dataType:"text",
		success:function(data){
			$('#contents').html(data);
		}
	});
}

function deletenotice(noticeNo){
	var page = $('#page').val();
	var range = $('#range').val();
	var rangeSize = $('#rangeSize').val();
	
	if(confirm("공지사항을 삭제하시겠습니까?")){
		$.ajax({
			url:"<c:url value='/deleteNotice.do'/>",
			type:"POST",
			data:{"noticeNo" : noticeNo,
				"page" : page,
				"range" : range,
				"rangeSize" : rangeSize		
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
	location.href="<c:url value='/getNotice.do?page="+${page}+"&range="+${range}+"&rangeSize="+${rangeSize}+"'/>";
};

</script>

	<ul class="tab_list tab_5">
		<li class="off"><a href="<c:url value='admin.do'/>" ><span>1:1문의</span></a></li>
		<li class="off"><a href="<c:url value='getMem.do'/>" ><span>회원목록</span></a></li>
		<li class="off"><a href="<c:url value='getCom.do'/>" ><span>댓글목록</span></a></li>
		<li class="on"><a href="<c:url value='getNotice.do'/>"><span>공지사항 목록</span></a></li>
	</ul>
	<section class="find_pwd">
		<h3 class="basic_title">공지사항</h3>
		<!--1:1문의 시작-->
		<div class="board_form find_info ">
			<table class="table_form">
				<tbody>
					<tr>
						<td scope="col" class="gray w20"><label>제목</label></td>
						<td class="w80"><input type="text" id="noticeTitle" name="noticeTitle" class="txt"  disabled="disabled" value="${notice.noticeTitle }"></td>
					</tr>
					<tr>
						<td scope="col" class="gray w20"><label>문의하실 내용을 작성하세요.</label></td>
						<td class="w80"><textarea type="text" id="noticeContent" name="noticeContent" class="txt"  disabled="disabled">${notice.noticeContent}</textarea></td>
					</tr>

				</tbody>
			</table>
		</div>
		<p class="find_idBtn">
			<button type="button" class="btn_black_L" onclick="updatenotice('${notice.noticeNo}')">수정</button>
			<button type="button" class="btn_black_L" onclick="deletenotice('${notice.noticeNo}')">삭제</button>
			<button type="button" class="btn_black_L" onclick="list();">확인</button>
		</p>
		<!--//1:1문의 끝-->
	</section>
	<input type="hidden" id="page" name="page" value="${page }">
	<input type="hidden" id="range" name="range" value="${range }">
	<input type="hidden" id="rangeSize" name="rangeSize" value="${rangeSize }">

</div>

				<!--//내용종료-->
			</div>
		</div>
		<!--//콘텐츠박스-->
	</section>
 
	</div>
<%@include file="../common/footer.jsp" %>
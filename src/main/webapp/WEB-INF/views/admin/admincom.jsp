<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="../common/header.jsp" %>
<%@include file="../common/adminheader.jsp" %>

<title>댓글 목록</title>
<link type="text/css" href="<c:url value='/css/admin.css'/>"  rel="stylesheet" >

<script type="text/javascript">
$(function(){
	

	
	$('.list').hover(function(){
		$(this).children().eq(0).css('color','gray'); 
		$(this).children().eq(1).css('color','gray'); 
		$(this).children().eq(2).css('color','gray');
		$(this).children().eq(3).css('color','gray');
    		}, function() {
		$(this).children().eq(0).css('color','#777');
		$(this).children().eq(1).css('color','#777');
		$(this).children().eq(2).css('color','#777');
		$(this).children().eq(3).css('color','#777');
	
	
		
	});
	
});
</script>
<script type="text/javascript">
function getcom(comNo){
	var page = $('#page').val();
	var range = $('#range').val();
	var rangeSize = $('#rangeSize').val();
	
	$.ajax({
		url:"<c:url value='/getCom.do'/>",
		type:"POST",
		data:{"comNo" : comNo,
			"page" : page,
			"range" : range,
			"rangeSize" : rangeSize
		},
		dataType: "text",
		success:function(data){
			$('#contents').html(data);
		}
	});

};
</script>

<script type="text/javascript">
//이전 버튼 이벤트
function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "<c:url value='/getCom.do'/>";

		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;

	}

  //페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "<c:url value='/getCom.do'/>";
		
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;	

	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "<c:url value='/getCom.do'/>";

		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;

	}
</script>

	<ul class="tab_list tab_5">
		<li class="off"><a href="<c:url value='admin.do'/>" ><span>1:1문의</span></a></li>
		<li class="off"><a href="<c:url value='getMem.do'/>" ><span>회원목록</span></a></li>
		<li class="on"><a href="<c:url value='getCom.do'/>" ><span>댓글목록</span></a></li>
		<li class="off"><a href="<c:url value='getNotice.do'/>"><span>공지사항 목록</span></a></li>
	</ul>
<h3 class="icon_h3">댓글 목록</h3>
<section class="mypage_g1">
<form name="listForm" action="searchCom.do" method="post">
	<div class="total_search_w2">
		<div class="myp02">
			<label for="searchCnd" class="skip">검색조건선택</label>
			<select name="searchCnd" class="selectR" title="검색조건선택" id="searchCnd">
				<option value="all">
					<c:if test="${comMap== 'ALL' }">selected</c:if>
					회원 아이디
				</option>
			</select>
			<div class="sc_camp">
				<label for="searchWrd" class="skip">검색어</label>
					<input id="searchWrd" name="searchWrd" class="camp_search" title="검색어 입력" placeholder="검색어를 입력하세요." type="text" >
				<button type="submit">
					<span class="skip">검색</span>
				</button>
			</div>
		</div>
	</div>
		<p class="bbs_total">
			<span>전체게시물 <strong class="totalcnt"><fmt:formatNumber />${fn:length(comment)}</strong></span>
			<span><strong class="replay"></strong></span>
		</p>
		<div class="board_list">
			<table class="table_list">
				<thead>
					<tr>
						<th scope="col">댓글번호</th>
						<th scope="col">게시글번호</th>
						<th scope="col">아이디</th>
						<th scope="col">내용</th>
						<th scope="col">날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty comment }">
							<tr>
								<td class="t_c" colspan="5">등록된 게시글이 없습니다.</td>
							</tr>
						</c:when>
						<c:when test="${!empty comment }">
							<c:forEach var="comment" items="${comment }">
								<tr class="list">
									<td class="t_c" ><a href="#" onclick="getcom('${comment.comNo}')">${comment.comNo}</a></td>
									<td class="t_c" ><a href="#" onclick="getcom('${comment.comNo}')">${comment.rvNo }</a></td>
									<td class="t_c" ><a href="#" onclick="getcom('${comment.comNo}')">${comment.memId }</a></td>
									<td class="t_c" ><a href="#" onclick="getcom('${comment.comNo}')">${comment.comContent}</a></td>
									<td class="t_c" ><a href="#" onclick="getcom('${comment.comNo}')">${comment.comDate}</a></td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
		</div>
		</form>
</section>
    <div class="pageInfo_wrap" >
        <div class="pageInfo_area">
 			<ul id="pageInfo" class="pageInfo">
 			
				<c:if test="${pagination.prev}">

				<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')"><img src="<c:url value='img/btn_pre01.png'/>" alt="이전으로">Previous</a></li>

			</c:if>

				

			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">

				<li class="page-item ${pagination.page == idx ? 'active' : ''} "><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a></li>

			</c:forEach>

				

			<c:if test="${pagination.next}">

				<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.page}', 

'${pagination.range}', '${pagination.rangeSize}')" ><img src="<c:url value='img/btn_next01.png'/>" alt="다음으로">Next</a></li>

			</c:if>

              
 			</ul>
        </div>
    </div>
<input type="hidden" id="page" name="page" value="${pagination.page }">
<input type="hidden" id="range" name="range" value="${pagination.range }">
<input type="hidden" id="rangeSize" name="rangeSize" value="${pagination.rangeSize }">
</div>

				<!--//내용종료-->
			</div>
		</div>
		<!--//콘텐츠박스-->
	</section>
 
	</div>

<%@include file="../common/footer.jsp" %>
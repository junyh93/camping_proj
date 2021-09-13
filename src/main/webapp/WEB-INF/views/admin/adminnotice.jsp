<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="../common/header.jsp" %>
<%@include file="../common/adminheader.jsp" %>

<title>공지사항 목록</title>
<link type="text/css" href="<c:url value='/css/admin.css'/>"  rel="stylesheet" >
<link rel="stylesheet" type="text/css" href="<c:url value='/css/fontawesome.min.css'/> ">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">

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
function addnotice(adName){
	var page = $('#page').val();
	var range = $('#range').val();
	var rangeSize = $('#rangeSize').val();
	
	$.ajax({
		url:"<c:url value='/insertNotice.do'/>",
		type:"GET",
		data:{
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
function getnotice(noticeNo){
	var page = $('#page').val();
	var range = $('#range').val();
	var rangeSize = $('#rangeSize').val();
	
	$.ajax({
		url:"<c:url value='/getNotice.do'/>",
		type:"POST",
		data:{"noticeNo" : noticeNo,
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

function search(){
	var keyword = document.getElementById("searchKeyword").value;
	$.ajax({
		url: "<c:url value='/searchMem.do'/>",
		type:"POST",
		data:{"searchKeyword" : keyword},
		dataType:"text",
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
		var url = "<c:url value='/getNotice.do'/>";

		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;

	}

  //페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "<c:url value='/getNotice.do'/>";
		
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;	

	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "<c:url value='/getNotice.do'/>";

		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;

	}
</script>

	<ul class="tab_list tab_5">
		<li class="off"><a href="<c:url value='admin.do'/>" ><span>1:1문의</span></a></li>
		<li class="off"><a href="<c:url value='getMem.do'/>" ><span>회원목록</span></a></li>
		<li class="off"><a href="<c:url value='getCom.do'/>" ><span>댓글목록</span></a></li>
		<li class="on"><a href="<c:url value='getNotice.do'/>"><span>공지사항 목록</span></a></li>
	</ul>
<h3 class="icon_h3">공지사항 목록</h3>
<section class="mypage_g1">
<form name="listForm" action="searchnotice.do" method="get">
<input type="hidden" id="adId" name="adId" value="${adId }">
	<div class="total_search_w2">
		<div class="myp02">
			<label for="searchCnd" class="skip">검색조건선택</label>
			<select name="searchCnd" class="selectR" title="검색조건선택" id="searchCnd">
				<option value="all">
					<c:if test="${noticeMap== 'ALL' }">selected</c:if>
					제목+내용
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
			<span>전체게시물 <strong class="totalcnt"><fmt:formatNumber />${fn:length(notice)}</strong></span>
			<span>공지사항 작성하기<a href="#" onclick="addnotice('${adName}')"><strong><i class="fas fa-plus-circle" ></i></strong></a></span>
		</p>
		<div class="board_list">
			<table class="table_list">
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">등록일</th>
						<th scope="col">조회</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty notice }">
							<tr>
								<td class="t_c" colspan="5">등록된 게시글이 없습니다.</td>
							</tr>
						</c:when>
						<c:when test="${!empty notice }">
							<c:forEach var="notice" items="${notice }">
								<tr class="list">
									<td class="t_c" ><a href="#" onclick="getnotice('${notice.noticeNo}')">${notice.noticeNo}</a></td>
									<td class="t_c" ><a href="#" onclick="getnotice('${notice.noticeNo}')">${notice.noticeTitle }</a></td>
									<td class="t_c" ><a href="#" onclick="getnotice('${notice.noticeNo}')">${notice.adName }</a></td>
									<td class="t_c" ><a href="#" onclick="getnotice('${notice.noticeNo}')">${notice.noticeDate}</a></td>
									<td class="t_c" ><a href="#" onclick="getnotice('${notice.noticeNo}')">${notice.noticeHit}</a></td>
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
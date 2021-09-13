<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="../common/header.jsp" %>

<title>공지사항</title>
<link type="text/css" href="<c:url value='/css/notice.css'/>"  rel="stylesheet" >

<script type="text/javascript">

function getnotice(noticeNo){
	var page = $('#page').val();
	var range = $('#range').val();
	var rangeSize = $('#rangeSize').val();
	
	$.ajax({
		url:"<c:url value='/getnotice.do'/>",
		type:"GET",
		data:{"noticeNo" : noticeNo,
			"page" : page,
			"range" : range,
			"rangeSize" : rangeSize
		},
		dataType: "text",
		success:function(data){
			$('#section1').html(data);
		}
	});
};
</script>
<script type="text/javascript">
//이전 버튼 이벤트
function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "<c:url value='/notice.do'/>";

		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;

	}

  //페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "<c:url value='/notice.do'/>";
		
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;	

	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "<c:url value='/notice.do'/>";

		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;

	}
</script>
<div id="s_contanier">
		<!--상단타이틀영역-->
			<div id="sub_title_wrap">
				<div class="layout">
					<h2>
						<span class="skip">서브타이틀 영역</span>
					</h2>
					<!--타이틀-->
					<div class="s_title">
						<p class="tt1dept">공지사항</p>
								<p class="s_tt">궁금한 사항이나 더 알아보고싶은 사항이 있으신가요?</p>
							</div>
					<!--//타이틀-->
				</div>
				<div class="s_bg_w">
					<!-- s_bg_02~05 캠핑Go, 캠핑Talk, 캠핑플러스, 고객센터, 마이페이지 -->
					<div class="s_bg_03"></div>
						</div>
			</div>
			<!--//상단타이틀영역-->
<section id="section1" style="right: 0px">
	<h2 class="skip">본문영역입니다.</h2>
		<!--콘텐츠박스-->
		<div id="cont_inner">
			<div class="sub_layout layout">
				<article>
						<header class="title_w">
							<h2 class="title"><span class="skip">타이틀영역입니다.</span>
								공지사항</h2>
						</header>
					</article>
					 
				<!--내용시작-->
<div id="contents">
	<form id="searchVO" name="listForm" action="searchnotice.do" method="get">
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

	<h3 class="icon_h3">
		공지사항</h3>
	<p class="bbs_total">
		<span>전체게시물<strong class="totalcnt"><fmt:formatNumber />${fn:length(notice)}</strong></span> 
		<span>현재페이지 <strong>${pagination.page}/${pagination.endPage}</strong></span>
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

	<div class="board_btn_w">
		<div class="board_btn">
			</div>
	</div>
</form></div>
    <div class="pageInfo_wrap" >
        <div class="pageInfo_area">
 			<ul id="pageInfo" class="pageInfo">
 			
			<c:if test="${pagination.prev}">

				<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')"><img src="<c:url value='/img/btn_pre01.png'/>">Previous</a></li>

			</c:if>

				

			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">

				<li class="page-item ${pagination.page == idx ? 'active' : ''} "><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a></li>

			</c:forEach>

				

			<c:if test="${pagination.next}">

				<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.page}', 

'${pagination.range}', '${pagination.rangeSize}')" ><img src="<c:url value='img/btn_next01.png'/>">Next</a></li>

			</c:if>

              
 			</ul>
        </div>
    </div>
				<!--//내용종료-->
			</div>
			
		</div>
		
		<!--//콘텐츠박스-->
	</section>

<input type="hidden" id="page" name="page" value="${pagination.page }">
<input type="hidden" id="range" name="range" value="${pagination.range }">
<input type="hidden" id="rangeSize" name="rangeSize" value="${pagination.rangeSize }"> 
	</div>

<%@include file="../common/footer.jsp" %>
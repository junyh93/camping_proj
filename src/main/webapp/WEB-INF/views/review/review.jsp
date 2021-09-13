<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="../common/header.jsp" %>

<title>캠핑후기</title>
<link type="text/css" href="<c:url value='/css/review.css'/>"  rel="stylesheet" >

<script type="text/javascript">
	$(function(){
		$('.add').click(function(){
			if($('#sessionId').val() == ""){
				alert('로그인 이후 이용 가능합니다.');
				location.href = 'login.do';
			}else{
				location.href = 'addreview.do';
			}
		});
	});

</script>
<script type="text/javascript">
function getreview(rvNo){
	var page = $('#page').val();
	var range = $('#range').val();
	var rangeSize = $('#rangeSize').val();
	
	location.href="<c:url value='/getreview.do?rvNo="+rvNo+"&page="+page+"&range="+range+"&rangeSize="+rangeSize+"'/>";

};
//이전 버튼 이벤트
function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "<c:url value='/review.do'/>";

		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;

	}

  //페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "<c:url value='/review.do'/>";
		
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;	

	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "<c:url value='/review.do'/>";

		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;

	}
</script>
<section >
	<!--상단타이틀영역-->
			<div id="sub_title_wrap">
				<div class="layout">
					<h2>
						<span class="skip">서브타이틀 영역</span>
					</h2>
					<!--타이틀-->
					<div class="s_title">
						<p class="tt1dept">캠핑 후기</p>
								<p class="s_tt">캠핑을 시작한다면 이들처럼! 캠핑의 다양한 정보가 가득</p>
							</div>
					<!--//타이틀-->
				</div>
				<div class="s_bg_w">
					<!-- s_bg_02~05 캠핑Go, 캠핑Talk, 캠핑플러스, 고객센터, 마이페이지 -->
					<div class="s_bg_03"></div>
						</div>
			</div>
			<!--//상단타이틀영역-->
<div class="mc_inner">

		<div class="btm_cont clfix">
		
			<!-- 컴퍼넌트 -->
			<div class="wrap_sevice3col type1">
				<h2 class="tit_atc">
					함께 떠나는 힐링 테마여행
				</h2>
			 			
				<!-- 좌측 컴포넌트 -->
				<c:choose>
					<c:when test="${empty review }" >
						<div >데이터가 없습니다.</div>
					</c:when>
					<c:when test="${!empty review}">				
						<c:forEach var="review" items="${review}" varStatus="st">		
				<div class="area_left" id="otherleft">

							<div class="article mWide type1">
							<div class="mdu_img1type">
							<div class="img">
							<h3 class="tit_atc">${review.rvTitle }</h3><!-- 제목 -->
							<c:choose>
								<c:when test="${!empty sessionScope.memId}">
									<a href="#" onClick="getreview('${review.rvNo}')" >
										<div class="tit_img">	
											<img src="<c:url value='./reviewUpload/${review.rvImg.split(",")[0] }'/>">
										</div>
								
										</a>
									
								</c:when>
								<c:otherwise>
									
									<a href="#" onClick="getreview('${review.rvNo}')">
										<div class="tit_img">
											<img src="<c:url value='./reviewUpload/${review.rvImg.split(",")[0] }'/>">
										</div></a>
									
									</c:otherwise>
							</c:choose>
						
							</div></div></div>

				</div>
					</c:forEach>
				</c:when>
					</c:choose>
			</div>
			<!-- //컴퍼넌트 -->  
		</div>	
			 
	</div>
</section>
<br>
<br>		
	<div class="add"><img src="<c:url value='/img/add.png'/>" ></div>
	
    <div class="pageInfo_wrap" >
        <div class="pageInfo_area">
 			<ul id="pageInfo" class="pageInfo">
 			
			<c:if test="${pagination.prev}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
			</c:if>

			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
				<li class="page-item ${pagination.page == idx ? 'active' : ''} "><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a></li>
			</c:forEach>

			<c:if test="${pagination.next}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.page}','${pagination.range}', '${pagination.rangeSize}')" >Next</a></li>
			</c:if>

              
 			</ul>
        </div>
    </div>
<input type="hidden" id="page" name="page" value="${pagination.page }">
<input type="hidden" id="range" name="range" value="${pagination.range }">
<input type="hidden" id="rangeSize" name="rangeSize" value="${pagination.rangeSize }">

    </div>  


<%@include file="../common/footer.jsp" %>
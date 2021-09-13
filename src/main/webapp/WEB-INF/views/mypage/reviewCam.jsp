<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<title>내가 작성한 후기</title>
<link type="text/css" href="<c:url value='/css/reviewCam.css'/>"  rel="stylesheet" >
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
	<ul class="tab_list tab_5">
		<li class="off"><a href="#" onclick="zzim_cam('${memNo}')"><span>내가 찜한 캠핑장</span></a></li>
		<li class="on"><a href="#" onclick="review_cam('${memNo}')"><span>내가 작성한 후기</span></a></li>
		<li class="off"><a href="#" onclick="qna('${memNo}')"><span>1:1 문의</span></a></li>
		<li class="off"><a href="<c:url value='mypage.do?memNo=${memNo }'/>"><span>회원정보</span></a></li>
	</ul>
<h3 class="icon_h3">나의 캠핑장 후기</h3>
<section class="mypage_g1">
		<p class="bbs_total">
			<span>전체게시물 <strong class="totalcnt"><fmt:formatNumber />${fn:length(review)}</strong></span>
			<span><strong></strong></span>
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
						<c:when test="${empty review }">
							<tr>
								<td class="t_c" colspan="5">등록된 게시글이 없습니다.</td>
							</tr>
						</c:when>
						<c:when test="${!empty review }">
							<c:forEach var="review" items="${review }">
								
								<tr class="list">
									
									<td class="t_c" ><a href="<c:url value='getreview.do?rvNo=${review.rvNo }'/>" >${review.rvNo }</a></td>
									<td class="t_c" ><a href="<c:url value='getreview.do?rvNo=${review.rvNo }'/>" >${review.rvTitle }</a></td>
									<td class="t_c" ><a href="<c:url value='getreview.do?rvNo=${review.rvNo }'/>" >${review.memId }</a></td>
									<td class="t_c" ><a href="<c:url value='getreview.do?rvNo=${review.rvNo }'/>" >${review.rvDate }</a></td>
									<td class="t_c" ><a href="<c:url value='getreview.do?rvNo=${review.rvNo }'/>" >${review.rvHit }</a></td>
									
								</tr>
								
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
		</div>
</section>
</div>

				<!--//내용종료-->
			</div>
		</div>
		<!--//콘텐츠박스-->
	</section>
 
	</div>
<%@include file="../common/footer.jsp" %>	
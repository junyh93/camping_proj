<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<title>캠핑장 후기</title>
<link type="text/css" href="<c:url value='/css/camReview.css'/>"  rel="stylesheet" >


<div class="camp_cont_w">
	<h2 class="skip">캠핑장 이용안내</h2>
	<div class="line_100">
		<span class="skip">탭영역 다단 라인</span>
	</div>
	<div class="layout">
		<ul class="camp_tab05" >
			<li class="off"><a href="<c:url value='getCam.do?contentId=${contentId }'/>" class="campp_intro">캠핑장 소개</a></li>
			<li class="off"><a href="#" class="campp_map" onclick="camMap('${contentId}')">위치/주변정보</a></li>
			<li class="on"><a href="#" class="campp_review" onclick="camReview('${contentId}')">캠핑&amp;여행후기</a></li>
		</ul>
		
<!-- 캠핑장 후기 -->
<section class="mypage_g1">
		<p class="bbs_total">
			<span>전체게시물 <strong class="totalcnt"><fmt:formatNumber />${fn:length(review)}</strong></span>
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
								<tr>
									<td class="t_c" >${review.rvNo }</td>
									<td class="t_c" >${review.rvTitle }</td>
									<td class="t_c" >${review.memId }</td>
									<td class="t_c" >${review.rvDate }</td>
									<td class="t_c" >${review.rvHit }</td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
		</div>
</section>
<!-- 캠핑장 후기 끝 -->	
	
	</div>
	<!-- layout끝 -->
</div>

</div>	
</section>
<%@include file="../common/footer.jsp" %>
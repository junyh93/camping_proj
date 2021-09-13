<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<dt class="sbj">
	<img src="./img/bbsico_2.svg" alt="" height="50"><br>
	캠핑 리뷰				
	<a href="<c:url value='review.do'/>" class="fr more" title="캠핑 리뷰 더 보기">
	<svg x="0px" y="0px" viewBox="0 0 42 42" style="enable-background:new 0 0 42 42;" xml:space="preserve" width="16px" height="16px">
	<polygon points="42,20 22,20 22,0 20,0 20,20 0,20 0,22 20,22 20,42 22,42 22,22 42,22 " fill="#888"></polygon></svg></a>

</dt>
	<c:choose>
		<c:when test="${empty review }" >
			<dd >데이터가 없습니다.</dd>
		</c:when>
		<c:when test="${!empty review }">
			<c:forEach var="review" items="${review }" begin="0" end="6" step="1"> 
				<dd>
					<i class="fa fa-angle-right" aria-hidden="true"></i> &nbsp;
					<a href="<c:url value='getreview.do?rvNo=${review.rvNo}'/>">${review.rvTitle }</a>
				</dd> 
			</c:forEach>
		</c:when>												
	</c:choose>	 

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="../common/header.jsp" %>

<title>캠핑후기</title>
<link type="text/css" href="<c:url value='/css/review.css'/>"  rel="stylesheet" >
     <!-- 부트스트랩 코드 추가  -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">   
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>  
 
<script type="text/javascript">
	$(function(){
		$('.add').click(function(){
			if($('#sessionId').val() == ""){
				alert('로그인 이후 이용가능합니다.');
				location.href = 'login.do';
			}else{
				location.href = 'addreview.do';
			}
		});
	});
</script>    
    <section class="u-align-center u-clearfix u-section-1" id="carousel_f432" style="height: 1000px;"> <!-- 사이즈 조정 -->
      <div class="u-clearfix u-sheet u-sheet-1" >
        <h1>캠핑 후기</h1>
        <div style="display: flex; flex-wrap: wrap; justify-content: space-between; width: 994px; margin:116px auto 0px;"> 
			<c:choose>
				<c:when test="${empty review }" >
					<div >데이터가 없습니다.</div>
				</c:when> 				
				<c:when test="${!empty review}">				
					<c:forEach var="review" items="${review}" >																																							
						<div style="width: 310px; height:462px; border:1px solid rgb(235, 235, 235); margin:4px; box-shadow: rgba(0, 0, 0, 0.07) 1px 1px 12px; display: flex; flex-direction: column; align-items:  center; padding-top: 5px; border-radius: 3px;">
						<div style="width: 265px; height: 180px; overflow: hidden; position: relative; border-radius: 3px; padding: 3px; border: 1px solid rgb(235, 235, 235); "><img class="card-img-top" src="<c:url value='./reviewUpload/${review.rvImg.split(",")[0] }'/>"/><div style= "background-position: center center; background-size: cover; background-repeat: no-repeat; position: absolute; inset: 0px; border-radius: 3px;"></div></div>
						<div style="display: flex; justify-content: space-between; width: 219px; margin-top: 30px;"><p style="font-family: 'Jua', sans-serif;  font-size: 22px; color: rgb(57, 60, 71); letter-spacing: -0.2px;">${review.memId }</p><div style="display: flex; flex-direction: row; justify-content: space-between; align-items: center; width: 53px;"><img width="9" height="9" src="/static/images/common/star_1.png"><img width="9" height="9" src="/static/images/common/star_1.png"><img width="9" height="9" src="/static/images/common/star_1.png"><img width="9" height="9" src="/static/images/common/star_1.png"><img width="9" height="9" src="/static/images/common/star_1.png"></div></div>
						<p style="font-family: 'Jua', sans-serif; text-align:left; margin-top: 17px; width: 219px; height: 88px; font-size: 13px; line-height: 23px; color: rgb(77, 80, 85); overflow: hidden; word-wrap: break-word; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 5; -webkit-box-orient: vertical;">${review.rvContent} </p>
						<p style="font-family: 'Jua', sans-serif; text-align:left; margin-top: 17px; width: 219px; height: 88px; font-size: 13px; line-height: 23px; color: rgb(77, 80, 85); overflow: hidden; word-wrap: break-word; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 5; -webkit-box-orient: vertical;">${review.rvDate} </p>
						<c:choose>
						<c:when test="${!empty sessionScope.memId}">
						<div style="margin-top: 8px; width: 219px;"><a href="<c:url value='getreview.do?rvNo=${review.rvNo}'/>" data-toggle="modal" data-target="#detailReview" style="color: rgb(188, 188, 188); font-size: 12px; font-family: 'Jua', sans-serif; font-weight: 600; width: 80px; height: 30px; display: flex; align-items: center;">전체보기 &gt;</a></div>
						</c:when>
						<c:otherwise>
						<div style="margin-top: 8px; width: 219px;"><a href="<c:url value='getreview.do?rvNo=${review.rvNo}&memNo=0'/>"  style="color: rgb(188, 188, 188); font-size: 12px; font-weight: 600; width: 80px; height: 30px; display: flex; align-items: center;">전체보기 &gt;</a></div>
						</c:otherwise>
						</c:choose>
						</div>			
					</c:forEach>
				</c:when>
			</c:choose>
    	 </div>
<br>
<br>		
	<div class="add"><img src="<c:url value='/img/add.png'/>" ></div>

<a href="<c:url value='getreview.do'/>"  >상세보기</a>
    </div>  
</section> 

<!-- <a href="<c:url value='addreview.do'/>"  ></a> -->
<%@include file="../common/footer.jsp" %>
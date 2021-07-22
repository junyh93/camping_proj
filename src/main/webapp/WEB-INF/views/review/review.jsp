<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp" %>

<title>캠핑후기</title>
<link type="text/css" href="<c:url value='/css/review.css'/>"  rel="stylesheet" >

    <section class="u-align-center u-clearfix u-section-1" id="carousel_f432" style="height: 1000px;"> <!-- 사이즈 조정 -->
      <div class="u-clearfix u-sheet u-sheet-1" >
        <h1  style="font-family: 'Jua', sans-serif; font-size: 50px;" >펫시터 후기</h1>
        <div style="display: flex; flex-wrap: wrap; justify-content: space-between; width: 994px; margin:116px auto 0px;"> 
			<c:choose>
				<c:when test="${empty reviewList }" >
					<tr><td colspan="6" align="right">데이터가 없습니다.</td></tr>
				</c:when> 				
				<c:when test="${!empty reviewList}">				
					<c:forEach var="review" items="${reviewList}" begin="0" end="2" step="1">		
						<div style="width: 310px; height:462px; border:1px solid rgb(235, 235, 235); margin:4px; box-shadow: rgba(0, 0, 0, 0.07) 1px 1px 12px; display: flex; flex-direction: column; align-items:  center; padding-top: 5px; border-radius: 3px;">
						<div style="width: 265px; height: 180px; overflow: hidden; position: relative; border-radius: 3px; padding: 3px; border: 1px solid rgb(235, 235, 235); "><img class="card-img-top" src="./reviewUpload/${review.review_img }"/><div style= "background-position: center center; background-size: cover; background-repeat: no-repeat; position: absolute; inset: 0px; border-radius: 3px;"></div></div>
						<div style="display: flex; justify-content: space-between; width: 219px; margin-top: 30px;"><p style="font-family: 'Jua', sans-serif;  font-size: 22px; color: rgb(57, 60, 71); letter-spacing: -0.2px;">${review.review_pet_name } 보호자님</p><div style="display: flex; flex-direction: row; justify-content: space-between; align-items: center; width: 53px;"><img width="9" height="9" src="/static/images/common/star_1.png"><img width="9" height="9" src="/static/images/common/star_1.png"><img width="9" height="9" src="/static/images/common/star_1.png"><img width="9" height="9" src="/static/images/common/star_1.png"><img width="9" height="9" src="/static/images/common/star_1.png"></div></div>
						<p style="font-family: 'Jua', sans-serif; text-align:left; margin-top: 17px; width: 219px; height: 88px; font-size: 13px; line-height: 23px; color: rgb(77, 80, 85); overflow: hidden; word-wrap: break-word; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 5; -webkit-box-orient: vertical;">${review.review_content} </p>
						<c:choose>
						<c:when test="${!empty sessionScope.userID}">
						<div style="margin-top: 8px; width: 219px;"><a href="getReview.do?review_num=${review.review_num}&user_num=${sessionScope.user_num}" data-toggle="modal" data-target="#detailReview" style="color: rgb(188, 188, 188); font-size: 12px; font-family: 'Jua', sans-serif; font-weight: 600; width: 80px; height: 30px; display: flex; align-items: center;">전체보기 &gt;</a></div>
						</c:when>
						<c:otherwise>
						<div style="margin-top: 8px; width: 219px;"><a href="getReview.do?review_num=${review.review_num}&user_num=0" style="color: rgb(188, 188, 188); font-size: 12px; font-weight: 600; width: 80px; height: 30px; display: flex; align-items: center;">전체보기 &gt;</a></div>
						</c:otherwise>
						</c:choose>
						</div>			
					</c:forEach>
				</c:when>
			</c:choose>
    	 </div>
<br>
<br>
<a href="insertreview.jsp" class="btn btn-success mr-md-4 py-3 px-4" style="border-radius:50px; margin: 20px; font-family: 'Jua', sans-serif;">후기 작성 <span class="ion-ios-arrow-forward"></span></a>
<a href="getReviewList.do" class="btn btn-warning mr-md-4 py-3 px-4" style="border-radius:50px; margin: 20px; font-family: 'Jua', sans-serif;">모든 후기 <span class="ion-ios-arrow-forward"></span></a>
    </div>  
</section> 


<%@include file="../common/footer.jsp" %>
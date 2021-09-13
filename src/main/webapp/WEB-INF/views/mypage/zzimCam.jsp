<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>내가 찜한 캠핑장</title>
<link type="text/css" href="<c:url value='/css/zzimCam.css'/>"  rel="stylesheet" >

<script type="text/javascript">

var contentId = $('#contentId').val();
var memNo = $('#sessionNo').val();

function delZzim(){
	$.ajax({
		url:"<c:url value='/keep.do'/>",
		type:"GET",
		data:{
			"contentId" : contentId,
			"memNo" : memNo
		},
		dataType:"text",
		success:function(data){
			console.log(data);
			if(data == "N"){
				alert("해당 캠핑장을 찜 목록에서 삭제하였습니다.");
				zzim_cam();
			}
		}
	});
};

function zzim_cam(){
	$.ajax({
		url:"<c:url value='/getKeep.do'/>",
		type:"POST",
		data:{"memNo" : memNo},
		dataType:"text",
		success:function(data){
			$('#contents').html(data);
		}
	});
};

</script>
	<ul class="tab_list tab_5">
		<li class="on"><a href="#" onclick="zzim_cam('${memNo}')"><span>내가 찜한 캠핑장</span></a></li>
		<li class="off"><a href="#" onclick="review_cam('${memNo}')"><span>내가 작성한 후기</span></a></li>
		<li class="off"><a href="#" onclick="qna('${memNo}')"><span>1:1 문의</span></a></li>
		<li class="off"><a href="<c:url value='mypage.do?memNo=${memNo }'/>"><span>회원정보</span></a></li>
	</ul>
<h3 class="icon_h3">내가 찜한 캠핑장</h3>	
<section class="mypage_g1">

	<div class="camp_search_list mypage_g1">
		<ul>
			<c:choose>
				<c:when test="${empty keep }">
					<li class="t_c">
						<div class="c_list">찜한 캠핑장이 없습니다.</div>
					</li>
				</c:when>
				<c:when test="${!empty keep }">
					<c:forEach var="keep" items="${keep }">
						<input type="hidden" id="contentId" name="contentId" value="${keep.contentId }">
						<li>
							<div class="c_list update">
								<div class="zzim_box">
									<button type="button" class="btn_black" onclick="delZzim()">찜삭제</button>
								</div>
								<a href="<c:url value="${keep.homepage }"/>" class="dc_none" >
									<div class="img_box">
									<img src="${keep.imgUrl } ">
									</div>	</a>
								<div class="camp_cont">
									<h2 class="camp_tt">
										<a href="<c:url value="${keep.homepage }"/>">${keep.facltNm } </a></h2>
									<ul class="camp_info01">
										<li class="addr">${keep.addr }</li>
										<li class="book"><a href="<c:url value='${keep.book }'/>" class="dc_none">예약하러가기</a></li>
									</ul>
									<ul class="camp_info01">
										<li class="tel">${keep.tel }</li>
									</ul>
								</div>
							</div>
						</li>
					</c:forEach>
				</c:when>
			</c:choose>
		</ul>
	</div>

</section>
</div>

				<!--//내용종료-->
			</div>
		</div>
		<!--//콘텐츠박스-->
	</section>
 
	</div>
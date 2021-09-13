<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp" %>

<title>후기 상세보기</title>
<link type="text/css" href="<c:url value='/css/getReview.css'/>"  rel="stylesheet" >



<script type="text/javascript">
$(function(){
	if($('#stcnt').val() == 1){
		  $('#stohf').parent().children('span').removeClass('on');
		  $('#stohf').addClass('on').prevAll('span').addClass('on');
		  return false;
	}else if($('#stcnt').val() == 2){
		  $('#stone').parent().children('span').removeClass('on');
		  $('#stone').addClass('on').prevAll('span').addClass('on');
		  return false;
	}else if($('#stcnt').val() == 3){
		  $('#stonehf').parent().children('span').removeClass('on');
		  $('#stonehf').addClass('on').prevAll('span').addClass('on');
		  return false;
	}else if($('#stcnt').val() == 4){
		  $('#sttwo').parent().children('span').removeClass('on');
		  $('#sttwo').addClass('on').prevAll('span').addClass('on');
		  return false;
	}else if($('#stcnt').val() == 5){
		  $('#sttwohf').parent().children('span').removeClass('on');
		  $('#sttwohf').addClass('on').prevAll('span').addClass('on');
		  return false;
	}else if($('#stcnt').val() == 6){
		  $('#stth').parent().children('span').removeClass('on');
		  $('#stth').addClass('on').prevAll('span').addClass('on');
		  return false;
	}else if($('#stcnt').val() == 7){
		  $('#stthhf').parent().children('span').removeClass('on');
		  $('#stthhf').addClass('on').prevAll('span').addClass('on');
		  return false;
	}else if($('#stcnt').val() == 8){
		  $('#stfour').parent().children('span').removeClass('on');
		  $('#stfour').addClass('on').prevAll('span').addClass('on');
		  return false;
	}else if($('#stcnt').val() == 9){
		  $('#stfourhf').parent().children('span').removeClass('on');
		  $('#stfourhf').addClass('on').prevAll('span').addClass('on');
		  return false;
	}else if($('#stcnt').val() == 10){
		  $('#stfive').parent().children('span').removeClass('on');
		  $('#stfive').addClass('on').prevAll('span').addClass('on');
		  return false;
	}
});

</script>

<script type="text/javascript">
$(function(){
	

		var rvImg = $("#rvImg").val();
		
		var name0 = rvImg.split(",")[0];
		var name1 = rvImg.split(",")[1];
		var name2 = rvImg.split(",")[2];
		var name3 = rvImg.split(",")[3];
		var name4 = rvImg.split(",")[4];
		
		$(".imgDiv").html("<img src='<c:url value='./reviewUpload/"+name0+"'/>'/>");
		
		if(name0 != null){
			$('.thumbsone').append("<img src='<c:url value='./reviewUpload/"+name0+"'/>'/>");
		}else{
			$('.thumbsone').hide();
		} 
		if(name1 != null){
			$(".thumbstwo").append("<img src='<c:url value='./reviewUpload/"+name1+"'/>'/>");
		}else{
			$('.thumbstwo').hide();
		} 
		if(name2 != null){
			$(".thumbsthird").append("<img src='<c:url value='./reviewUpload/"+name2+"'/>'/>");
		}else{
			$('.thumbsthird').hide();
		} 
		if(name3 != null){
			$(".thumbsfour").append("<img src='<c:url value='./reviewUpload/"+name3+"'/>'/>");
		}else{
			$('.thumbsfour').hide();
		} 
		if(name4 != null){
			$(".thumbsfive").append("<img src='<c:url value='./reviewUpload/"+name4+"'/>'/>");
		}else{
			$('.thumbsfive').hide();
		} 
		
		$('.thumbsone').click(function(){
			$(".imgDiv").html("<img src='<c:url value='./reviewUpload/"+name0+"'/>'/>");
		});
		$('.thumbstwo').click(function(){
			$(".imgDiv").html("<img src='<c:url value='./reviewUpload/"+name1+"'/>'/>");
		});
		$('.thumbsthird').click(function(){
			$(".imgDiv").html("<img src='<c:url value='./reviewUpload/"+name2+"'/>'/>");
		});
		$('.thumbsfour').click(function(){
			$(".imgDiv").html("<img src='<c:url value='./reviewUpload/"+name3+"'/>'/>");
		});
		$('.thumbsfive').click(function(){
			$(".imgDiv").html("<img src='<c:url value='./reviewUpload/"+name4+"'/>'/>");
		});
});
</script>

<script type="text/javascript">
function list(){
	location.href="<c:url value='/review.do?page="+${page}+"&range="+${range}+"&rangeSize="+${rangeSize}+"'/>";
}
</script>

<!-- 사진사진사진 -->
<style>
	.imgReg{
		margin-bottom:20px;
	}
	.thumbDiv{
		width:400px;
		height:400px;
		float: right;
				border-radius: 3px;
		border-color: whitesmoke;
		border-style: solid;
	}
	
	.thumbSubDiv{
		float: left;
		width: 140px;
		height: 150px;
		margin-right: 20px;	
		margin-left: 30px;
		margin-bottom: 5px;
	}
	
	.thumbSubDiv img{
		width: 140px;
		height: 150px;
	}
	
	.imgDiv{
		width:500px;
		height:400px;
/* 		overflow-y: scroll; */
		float: left; 
		border-radius: 3px;
		border-color: whitesmoke;
		border-style: solid;
	}
	
	.imgDiv img{
		width:300px;
		height:100%;
		 
	}
</style>



	<input type="hidden" id="mapX" value="${review.mapX }">
	<input type="hidden" id="mapY" value="${review.mapY }">
	<input type="hidden" id="imgUrl" value="${review.imgUrl }">
	<input type="hidden" id="facltNm" value="${review.facltNm }">
	<input type="hidden" id="addr" value="${review.addr }">
	<input type="hidden" id="homepage" value=${review.homePage }>
	<input type="hidden" id="rvImg" value="${review.rvImg }">
	
	<input type="hidden" name="page" value="${page }">
	<input type="hidden" name="range" value="${range }">
	<input type="hidden" name="rangeSize" value="${rangeSize }">
<section>
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
<div id="contents" class="forecastWrap"><!-- 클래스 forecastWrap 추가 -->
		<div class="tit_cont">
		<!-- 제목 -->
			<h2 id="contNm">${review.rvTitle}</h2>
			<p class="tag"><span id="hstg1">조회수 ${review.rvHit }</span></p>
			<div class="area_address">
			<!-- 캠핑장 이름 -->
				<span class="address" id="sggNm1"><img src="<c:url value='/img/ico_home.png'/>">${review.facltNm }</span><br><br>
				<span class="address" id="sggNm2"><img src="<c:url value='/img/ico_map01.png'/>">${review.addr }</span>
				<!-- 날짜 -->
				<p class="tag"><span id="hstg1">${review.memId }</span>
					<br>
					<br>
					<span id="hstg1">${review.rvDate }</span>
				</p>

				<!-- STAR -->
				<div class="rvStar">
					<div class="starRev">
						<span id="stohf" class="starR1 on" >별1_왼쪽</span>
						<span id="stone" class="starR2"  >별1_오른쪽</span>
						<span id="stonehf" class="starR1" >별2_왼쪽</span>
						<span id="sttwo" class="starR2" >별2_오른쪽</span>
					    <span id="sttwohf" class="starR1" >별3_왼쪽</span>
						<span id="stth" class="starR2" >별3_오른쪽</span>
						<span id="stthhf" class="starR1" >별4_왼쪽</span>
						<span id="stfour" class="starR2" >별4_오른쪽</span>
						<span id="stfourhf" class="starR1" >별5_왼쪽</span>
						<span id="stfive" class="starR2" >별5_오른쪽</span>
						<input type="hidden" id="stcnt" value="${review.rvStar}">
					</div>
			    </div>
			</div>
		</div>
		
		<!-- 내용 시작 -->
		<div class="dbDetail default">
			<div class="slide_info_wrap">
				<div class="imgReg">
					<div class="imgregWrap">
						<!-- 사진 -->
						<div class="imgDiv"></div>
						
						<!-- 썸네일 -->
						<div class="thumbDiv">
							
							<!-- 1 -->
							<div class="thumbSubDiv thumbsone"></div>
							<!-- 2 -->
							<div class="thumbSubDiv thumbstwo"></div>
							<!-- 3 -->
							<div class="thumbSubDiv thumbsthird"></div>
							<!-- 4 -->
							<div class="thumbSubDiv thumbsfour"></div>
							<!-- 5 -->
							<div class="thumbSubDiv thumbsfive"></div>

						</div>
					</div>
				</div>
				<br>
				<br>
				<div class="info_list">
					<div class="w100p busy">
						<p class="desc">${review.rvContent}</p>
					</div>
				</div>
			</div>
			
			<div class="wrap_contView">
				

 			<!-- 주변정보 지도 -->
				<div class="surroundingsMap">
					<div id="map" class="wrap_map" style="overflow: hidden;"></div>		
				    <br>
					※인근 관광지 및 맛집의 영업여부를 방문 전에 별도로 확인해주시기 바랍니다.

					<div class="map_accessibility area_txtView bottom">
						<div class="inr_wrap" style="overflow: visible; height: auto;">
							<div class="inr">
								<strong class="stit">캠핑장 정보</strong>
								<ul id="curInfoTxt">
								<li><strong class="label">캠핑장명</strong><span class="value">${review.facltNm }</span></li>
								<li><strong class="label">주소</strong><span class="value">${review.addr }</span></li>
								<li><strong class="label">소개</strong><span class="value">${review.lineIntro }</span></li>
								<li><strong class="label">전화번호</strong><span class="value">${review.tel }</span></li>
								<li><strong class="label">홈페이지</strong><span class="value"><a href="${review.homePage }">${review.homePage }</a></span></li></ul>
							</div>
						</div>
					</div>

					<div class="map_accessibility area_txtView bottom">
						<div class="inr_wrap" style="overflow: visible; height: auto;">
							<div class="inr" id="mapSubTxt">

							</div>
						</div>
					</div>

				</div> 

<!-- 정보 --><br>
<br>
				<div class="area_txtView top">
					<div class="inr_wrap">
						<div class="inr">
							<p id="outl"><b>※ 코로나바이러스감염증-19 공지사항
							<br>※ 내용 : 제한적 시범개방 (2020.06.18 ~ 미정)</b>
							<br>
							<u><a href="https://korean.visitkorea.or.kr/notice/newsdetail.do?nwsid=8cdd65e1-59f1-4904-8bc9-884001e40911" title="여행정보 변동사항 페이지로 이동">→ 코로나바이러스감염증-19 여행정보 변동사항 확인하기</a></u>
							<br>


							</p>
							
						</div>
					</div>
				</div>
			</div>
			
		</div>
				<div>
		
				  	<div class="button" align="center">
				  	<c:if test="${memNo eq review.memNo}">
				    			<a href="<c:url value='updatereview.do?rvNo=${review.rvNo }&memNo=${review.memNo }'/> " class="btn btn-success"  style="border-radius:20px; margin:5px; ">수정</a>
				    			<a href="<c:url value='deletereview.do?rvNo=${review.rvNo }&memNo=${review.memNo }'/> " class="btn btn-danger" style="border-radius:20px; margin:5px;">삭제</a>
				   </c:if>	
				  
			</div>
    					<a href="#"  onclick="list();" class="btn btn-warning" style="border-radius:20px; margin:5px;">글목록</a><br>
  					 
  		</div>
</div>



<!--
<!-- 내가 한거 
<section class="main">
	
	<!-- 후기 제목 
	<div class="title">${review.rvTitle}</div>
	<div>${review.rvDate }</div>
	<!-- 캠핑장명 contentId를 활용하여 facltNm,addr1 값 가져와서 각 자리에 뿌리기
	<div class="facltNm" >${review.facltNm }</div> 
	<div class="addr" >${review.addr }</div>
	

	
	<!-- 후기 사진 최대 5장 
	<input type="hidden" id="rvImg" value="${review.rvImg }">
	<div class="img_container" style="width: 310px; height:400px; border:1px solid rgb(235, 235, 235); margin:4px; box-shadow: rgba(0, 0, 0, 0.07) 1px 1px 12px; display: flex; flex-direction: column; align-items:  center; padding-top: 5px; border-radius: 3px;">
<%-- 		<div class="img_main"><img src="<c:url value='./reviewUpload/${review.rvImg.split(",")[0] }'/>"/></div>
	
		<div class="img_sub">
			<div class="img_1"><img src="<c:url value='./reviewUpload/${review.rvImg.split(",")[1] }'/>"/></div>
		</div>
		 --%>
		
	</div>
	
	<!-- 후기 내용 
	<div class="content">${review.rvContent}</div>
	<!-- 캠핑장 contentId를 활용하여 mapX,mapY,factlNm,addr1, lineintro, tel,, homepage 값 가져와서 각 자리에 뿌리기 
	<div class="caminfo">
		<div>캠핑장 정보</div>
		<ul> 
			<li class="facltNm" >캠핑장명 : ${review.facltNm }</li>
			<li class="addr">주소 : ${review.addr }</li>
			<li class="lineintro">한줄 소개 : ${review.lineIntro }</li>
			<li class="tel">전화번호 : ${review.tel }</li>
			<li class="homepage" id="homepage">홈페이지 : <a href="${review.homePage }">${review.homePage }</a></li>
		</ul>
	</div>
	<br>
  -->
	<!-- 캠핑장 지도 
	<div id="map" style="width:500px;height:400px;"></div>-->
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e12329a55940adf92079d7a2dfa76447"></script>	
<script>


		var mapX = $('#mapX').val();
		var mapY = $('#mapY').val();
		var imgUrl = $('#imgUrl').val();
		
		var facltNm = document.getElementById('facltNm').value;
		var addr = document.getElementById('addr').value;
		var homepage = document.getElementById('homepage').value;
		
		var mapContainer = document.getElementById('map'), // 지도의 중심좌표
		mapOption = { 
		    center: new kakao.maps.LatLng(mapY, mapX), // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
		}; 
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		//지도에 마커를 표시합니다 
		var marker = new kakao.maps.Marker({
		map: map, 
		position: new kakao.maps.LatLng(mapY, mapX)
		});
		
		//커스텀 오버레이에 표시할 컨텐츠 입니다
		//커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
		//별도의 이벤트 메소드를 제공하지 않습니다 
		var content = '<div class="wrap">' + 
		        '    <div class="info">' + 
		        '        <div class="title">' + 
		        					facltNm + 
		        '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
		        '        </div>' + 
		        '        <div class="body">' + 
		        '            <div class="img">' +
		        "<img src='" + imgUrl +"' width='73' height='70' />"+
		        '           </div>' + 
		        '            <div class="desc">' + 
		        '                <div class="ellipsis">'+ addr +'</div>' + 
		        '                <div><a href="'+ homepage +'" target="_blank" class="link">'+homepage +'</a></div>' + 
		        '            </div>' + 
		        '        </div>' + 
		        '    </div>' +    
		        '</div>';
		
		//마커 위에 커스텀오버레이를 표시합니다
		//마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
		var overlay = new kakao.maps.CustomOverlay({
		content: content,
		map: map,
		position: marker.getPosition()       
		});
		
		//마커를 클릭했을 때 커스텀 오버레이를 표시합니다`
		kakao.maps.event.addListener(marker, 'click', function() {
		overlay.setMap(map);
		});
		
		//커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
		function closeOverlay() {
		overlay.setMap(null);     
		}
		</script>

  		</section>
  	
<!--     </section> -->
<%@include file="../common/comment.jsp" %>
<%@include file="../common/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>위치/주변정보</title>
<link type="text/css" href="<c:url value='/css/camMap.css'/>"  rel="stylesheet" >

<script src="./js/jquery-3.5.1.min.js"></script>

<input type="hidden" id="mapx" value="${mapX }">
<input type="hidden" id="mapy" value="${mapY }">
<input type="hidden" id="facltNm" value="${facltNm }">
<input type="hidden" id="addr" value="${addr }">
<input type="hidden" id="imgUrl" value="${imgUrl }" >

<div class="camp_cont_w">
	<h2 class="skip">캠핑장 이용안내</h2>
	<div class="line_100">
		<span class="skip">탭영역 다단 라인</span>
	</div>
	<div class="layout">
		<ul class="camp_tab05" >
			<li class="off"><a href="<c:url value='getCam.do?contentId=${contentId }'/>" class="campp_intro">캠핑장 소개</a></li>
			<li class="on"><a href="#" class="campp_map" onclick="camMap()">위치/주변정보</a></li>
			<li class="off"><a href="#" class="campp_review" onclick="camReview('${contentId}')">캠핑&amp;여행후기</a></li>
		</ul>
		
<!-- 캠핑장 위치 주변정보 -->	
	<div class="camp_map">
		<!-- 캠핑장 지도 -->
	 	<h3 class="icon_h3_">찾아오시는 길</h3>
		<div id="map" style="width:500px;height:400px;"></div>
	</div>
<script >

var mapX = $('#mapx').val();
var mapY = $('#mapy').val();
var facltnm = $('#facltNm').val();
var addr = $('#addr').val();
var imgUrl = $('#imgUrl').val();


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
    '        <div class="title">' + facltnm + 
    '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
    '        </div>' + 
    '        <div class="body">' +
    '            <div class="img">' +
    "<img src='" + imgUrl +"' width='73' height='70' />"+
    '           </div>' + 
    '            <div class="desc">' + 
    '                <div class="ellipsis">'+ addr +'</div>' + 
    '                <div class="jibun ellipsis"> (우) </div>' + 
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
<!-- 캠핑장 위치 주변정보 끝 -->		
	
	</div>
	<!-- layout끝 -->
</div>

</div>	
</section>
<%@include file="../common/footer.jsp" %>
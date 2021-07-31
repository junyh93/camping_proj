<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/headerMain.jsp" %>

<script src="<c:url value='/js/main.js'/>"></script>

<script type="text/javascript">
$(function(){
	 $("form[name=camSearchForm]").submit(function(){
		var searchKrwd_f = $("#searchKrwd_f").val();
	    var select_01 = $(".select_01").val();
	    var select_02 = $(".select_02").val();
		
	    if(select_01 == ""){
	    	alert("지역별 검색 시도를 선택해 주세요.");
	    	$(".select_01").focus();
	    	event.preventDefault();
	    	return false;
	    }
	    if(select_02 == ""){
	    	alert("지역별 검색 시군구를 선택해 주세요.");
	    	$(".select_02").focus();
	    	event.preventDefault();
	    	return false;
	    }		
	});
});

</script>
<section>
	<div class="main_img"></div>
	<section>
		<div class="main_search">
			<span class="main_search_title">전국  캠핑장을 한 곳에서 찾으세요!</span>
		</div>
		<div class="search_box">
						<form id="campSearchForm01" name="camSearchForm" action="<c:url value='/search.do'/> " method="get">
							
							<!--검색박스-->
							<div class="search_box_form">
								<div class="form1_1">
									<p class="tt">키워드검색</p>
									<input type="text" class="keyword2" id="searchKrwd_f" name="searchKrwd" placeholder="검색어를 입력하세요.">
								</div>
								<div class="form1_2">
									<p class="tt">지역별 검색</p>
									<select name="c_do" id="c_do" class="select_01" title="검색할 지역을 선택하세요.">
										<option value="">전체/도</option>
										<option value="서울시">서울시</option>
										<option value="부산시">부산시</option>
										<option value="대구시">대구시</option>
										<option value="인천시">인천시</option>
										<option value="광주시">광주시</option>
										<option value="대전시">대전시</option>
										<option value="울산시">울산시</option>
										<option value="세종시">세종시</option>
										<option value="경기도">경기도</option>
										<option value="강원도">강원도</option>
										<option value="충청북도">충청북도</option>
										<option value="충청남도">충청남도</option>
										<option value="전라북도">전라북도</option>
										<option value="전라남도">전라남도</option>
										<option value="경상북도">경상북도</option>
										<option value="경상남도">경상남도</option>
										<option value="제주도">제주도</option>
										</select>
										<select name="c_signgu" id="c_signgu" class="select_02" title="검색할 지역을 선택하세요.">
										<option value="">전체/시/군</option>
									</select>
									<div class="form1_3">
									<button type="submit" id="search_btn">검색</button>
								</div>
								</div>
		
							</div>
							<!--//검색박스-->
						</form>
					</div>
	</section>
<!-- 	
	<div id="map" style="width:500px;height:400px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e12329a55940adf92079d7a2dfa76447"></script>

<script>    
// 이미지 지도에 표시할 마커입니다
// 이미지 지도에 표시할 마커를 아래와 같이 배열로 넣어주면 여러개의 마커를 표시할 수 있습니다 
var markers = [
    {
        position: new kakao.maps.LatLng(mapY, mapX),
        text: camname // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
    }
];



var staticMapContainer  = document.getElementById('map'), // 이미지 지도를 표시할 div  
    staticMapOption = { 
        center: new kakao.maps.LatLng(mapY, mapX), // 이미지 지도의 중심좌표
        level: 3, // 이미지 지도의 확대 레벨
        marker: markers // 이미지 지도에 표시할 마커 
    };    

// 이미지 지도를 생성합니다
var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
</script> 
-->
</section>

<!-- <section>
<div class="seaction2">
<h2>나를 위한, 휴식을 위한 감성 캠핑</h2>
</div>
</section> -->

<%@include file="common/footer.jsp" %>

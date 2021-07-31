<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/headerMain.jsp" %>

<script>
	$(document).ready(function() {
		$("#c_do").change(function() {
			$.ajax({
				type : "get",
				url : "/bsite/area/ctprvn/lwprt/list.do",
				data : {
					"ctprvn_idx" : $("#c_do").val()
				},
				success : function(data) {
					var str = "<option value=\"\">전체/시/군</option>";
					var jsonData = $.parseJSON(data);
					$.each(jsonData.list, function(key, value) {
						str += "<option value=\"" + value.signgu_idx + "\">" + value.signgu_nm + "</option>";
					});

					$("#c_signgu").empty();
					$("#c_signgu").html(str);
				},
				error : function(xhr, status, error) {
					alert("오류가 발생하였습니다.\n관리자에게 문의해주세요.");
				}
			});
		});

		$("#searchForm2ResetBtn").click(function() {
			$("#campSearchForm2").find("input:checkbox").attr("checked", false);
			$("#slider-range").slider("values", 0, 0);
			$("#slider-range").slider("values", 1, 100000);
			$("#searchMummPc").val(0);
			$("#searchMxmmPc").val(100000);
		});
		
		
		
		//출발지 검색화면 이동
		function funArrvFocSrch(){

			var searchKrwd_f = $("#searchKrwd_f").val();
		    var select_01 = $("#select_01").val();

		    if(arrvSidoCd == ""){
		    	alert("지역별 검색 시도를 선택해 주세요.");
		    	$("#arrvSidoSggNm").focus();
		    	return;
		    }
		    if(arrvSggCd == ""){
		    	alert("지역별 검색 시군구를 선택해 주세요.");
		    	$("#arrvSidoSggNm").focus();
		    	return;
		    }
			location.href = '/forecast/getTourFocArrvSrchForm.do?arrvSidoCd='+arrvSidoCd+'&arrvSggCd='+arrvSggCd;

		}
			error: function(xhr, status, error){
				alert(status + ", " + error);
			}
		
	});
</script>

<section>
	<div class="main_img"></div>
	<section>
		<div class="main_search">
			<span class="main_search_title">전국  캠핑장을 한 곳에서 찾으세요!</span>
		</div>
		<div class="search_box">
						<form id="campSearchForm01" action="/bsite/camp/info/list.do" method="get">
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
										<option value="1">서울시</option>
										<option value="2">부산시</option>
										<option value="3">대구시</option>
										<option value="4">인천시</option>
										<option value="5">광주시</option>
										<option value="6">대전시</option>
										<option value="7">울산시</option>
										<option value="8">세종시</option>
										<option value="9">경기도</option>
										<option value="10">강원도</option>
										<option value="11">충청북도</option>
										<option value="12">충청남도</option>
										<option value="13">전라북도</option>
										<option value="14">전라남도</option>
										<option value="15">경상북도</option>
										<option value="16">경상남도</option>
										<option value="17">제주도</option>
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

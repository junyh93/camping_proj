<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp" %>

<title>후기 상세보기</title>
<link type="text/css" href="<c:url value='/css/getReview.css'/>"  rel="stylesheet" >
<!-- 
<script type="text/javascript">


	var url = 'http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/searchList'; 
	var queryParams = '?' + encodeURIComponent('ServiceKey') + '='+'Po8b3s%2BelMewEpuJuSSNclaKWDReZThq%2FrOSAU0x%2BqHff1gACrKi1G3eez3LwxPQLMoN9ntPatUmspBAZTJd5w%3D%3D'; 
	queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); 
	queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); 
	queryParams += '&' + encodeURIComponent('MobileOS') + '=' + encodeURIComponent('ETC'); 
	queryParams += '&' + encodeURIComponent('MobileApp') + '=' + encodeURIComponent('AppTest'); 
	queryParams += '&' + encodeURIComponent('keyword') + '=' + encodeURIComponent('남양주');
 	/*
 	queryParams += '&' + encodeURIComponent('mapX') + '=' + encodeURIComponent('128.6142847'); //경도
	queryParams += '&' + encodeURIComponent('mapY') + '=' + encodeURIComponent('36.0345423');  // 위도
	queryParams += '&' + encodeURIComponent('radius') + '=' + encodeURIComponent('2000'); // 거리 반경*/
	queryParams += '&_type=json';
	
	var mapX = "";
	var mapY = "";
	
	var facltNm = "";
	
	$.ajax({
			method: "GET",
			url: url + queryParams,
	success : function(msg) {
			
			console.log(msg);
			
			/*console.log(msg.response.body.items.item[0].addr1);*/
 		 	addr = msg.response.body.items.item.addr1 
 		 	mapX = msg.response.body.items.item.mapX
 		 	mapY = msg.response.body.items.item.mapY
 		 	contentId = msg.response.body.items.item.contentId

 		 	img = msg.response.body.items.item.firstImageUrl
 		 	facltNm = msg.response.body.items.item.facltNm
 		 	intro = msg.response.body.items.item.intro
 		 	lineintro = msg.response.body.items.item.lineIntro
 		 	tel = msg.response.body.items.item.tel
 		 	homepage = msg.response.body.items.item.homepage
 		 	zipcode = msg.response.body.items.item.zipcode
 		 	addr2 = msg.response.body.items.item.addr2
 			
 			$(".img").append("<img src='" + img +"' width='73' height='70' />"); 
			$(".facltNm").append(facltNm);
			$(".addr").append(addr);
			$(".lineintro").append(lineintro);
			$(".tel").append(tel);
			$(".homepage").append("<a href='" + homepage + "'>"+ homepage +"</a>");
	 		$(".contentid").append("<input type='hidden' id='contentId'" + contentId + ">");
	
	},
	error : function(xhr, status, error) {
		        alert(status + ", " + error);
		}  
    });

</script>
 -->
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
		
		alert(name0 + name1);
		if(name0 != ""){
			$('.img_container').append("<div><img src='<c:url value='./reviewUpload/"+name0+"'/>'/></div>");
		} 
		if(name1 != ""){
				$(".img_container").append("<div><img src='<c:url value='./reviewUpload/"+name1+"'/>'/></div>");
		}
		if(name2 != ""){
			$(".img_container").append("<div><img src='<c:url value='./reviewUpload/"+name2+"'/>'/></div>");
		}
		if(name3 != ""){
			$(".img_container").append("<div><img src='<c:url value='./reviewUpload/"+name3+"'/>'/></div>");
		}
		if(name4 != ""){
			$(".img_container").append("<div><img src='<c:url value='./reviewUpload/"+name4+"'/>'/></div>");
		}
		
});
</script>

<section class="main">
	<input type="hidden" id="mapX" value="${review.mapX }">
	<input type="hidden" id="mapY" value="${review.mapY }">
	<input type="hidden" id="imgUrl" value="${review.imgUrl }">
	<input type="hidden" id="facltNm" value="${review.facltNm }">
	<input type="hidden" id="addr" value="${review.addr }">
	<input type="hidden" id="homepage" value=${review.homePage }>
	<!-- 후기 제목 -->
	<div class="title">${review.rvTitle}</div>
	<div>${review.rvDate }</div>
	<!-- 캠핑장명 contentId를 활용하여 facltNm,addr1 값 가져와서 각 자리에 뿌리기-->
	<div class="facltNm" >${review.facltNm }</div> 
	<div class="addr" >${review.addr }</div>
	
	<!-- STAR -->
    <div class="rvStar">
       <label>별점</label>
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
	
	<!-- 후기 사진 최대 5장 -->
	<input type="hidden" id="rvImg" value="${review.rvImg }">
	<div class="img_container">
<%-- 		<div class="img_main"><img src="<c:url value='./reviewUpload/${review.rvImg.split(",")[0] }'/>"/></div>
	
		<div class="img_sub">
			<div class="img_1"><img src="<c:url value='./reviewUpload/${review.rvImg.split(",")[1] }'/>"/></div>
		</div>
		 --%>
		
	</div>
	
	<!-- 후기 내용 -->
	<div class="content">${review.rvContent}</div>
	<!-- 캠핑장 contentId를 활용하여 mapX,mapY,factlNm,addr1, lineintro, tel,, homepage 값 가져와서 각 자리에 뿌리기 -->
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

	<!-- 캠핑장 지도 -->
	<div id="map" style="width:500px;height:400px;"></div>
	
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
		        '                <div class="jibun ellipsis"> (우)'+ "" +'</div>' + 
		        '                <div><a href="'+ homepage +'" target="_blank" class="link">'+ homepage+'</a></div>' + 
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
		<div>
		<c:if test="${memNo eq review.memNo}">
				  	<div class="button" align="center">
				    			<a href="<c:url value='updatereview.do?rvNo=${review.rvNo }&memNo=${review.memNo }'/> " class="btn btn-success"  style="border-radius:20px; margin:5px; ">수정</a>
				    			<a href="<c:url value='deletereview.do?rvNo=${review.rvNo }&memNo=${review.memNo }'/> " class="btn btn-danger" style="border-radius:20px; margin:5px;">삭제</a>
				   </div>
				   </c:if>		
    					<a href="<c:url value='review.do'/> " class="btn btn-warning" style="border-radius:20px; margin:5px;">글 목록</a><br>
  		</div>
    </section>

<%@include file="../common/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp" %>
<%@include file="../common/camheader.jsp" %>

<title>캠핑장 상세보기</title>
<link type="text/css" href="<c:url value='/css/getCam.css'/>"  rel="stylesheet" >

<script src="<c:url value='/js/getCam.js'/>"></script>

	<div class="camp_cont_w">
		<h2 class="skip">캠핑장 이용안내</h2>
		<div class="line_100">
			<span class="skip">탭영역 다단 라인</span>
		</div>
		<div class="layout">
			<ul class="camp_tab05" >
				<li class="on"><a href="<c:url value='getCam.do?contentId=${contentId }'/>" class="campp_intro">캠핑장 소개</a></li>
				<li class="off"><a href="#" class="campp_map" onclick="camMap('${contentId}')">위치/주변정보</a></li>
				<li class="off"><a href="#" class="campp_review" onclick="camReview('${contentId}')">캠핑&amp;여행후기</a></li>
			</ul>
<!-- <script type="text/javascript">
	$(document).ready(function() {
		$("html, body").animate({
			scrollTop : $(".camp_intro").offset().top
		});
	});
</script> -->
	<div class="camp_intro">
	
	<!-- 캠핑장 사진 -->
		<ul class="camp_intro_image"></ul>
		
	<!-- 캠핑장 한줄 소개 -->
	<p class="camp_intro_txt intro"></p>
	
	<!-- 캠핑장 시설 정보 -->
	<h3 class="icon_h3 sbrsCl">캠핑장 시설정보</h3>
		<div class="camp_item_g"></div>
		
	<!-- 캠핑장 기타 주요 시설  -->
	<h3 class="icon_h3">기타 주요시설</h3>
	
	<section id="table_type03">
		<h2 class="skip">기타 주요시설 안내 테이블입니다.</h2>
		<div class="table_w">
			<table class="table_t4 camp_etc_tb">
				<caption>
					<strong>기타 주요시설 안내 테이블</strong>
					<p>주요시설, 사이트간격, 바닥형태, 편의시설, 캠핑장비대여, 반려동물출입, 화로대로 나뉘어 설명합니다.</p>
				</caption>

				<tbody class="t_c">
				
					<tr class="tr_site">
						<th scope="col">주요시설</th>
						<td>
							<ul class="table_ul05 site"></ul>
						</td>
					</tr>
					
					<tr class="tr_posblFcltyCl">
						<th scope="col">주변이용가능시설</th>
						<td>
							<ul class="table_ul05 posblFcltyCl"></ul>
						</td>
					</tr>
					
	<!-- 조건에 따라 출력여부 발생 -->
					<tr class="tr_glamp">
						<th scope="col">글램핑 내부시설</th>
						<td>
							<ul class="table_ul05 glamp"></ul>
						</td>
					</tr>
					
					<tr class="tr_carav">
						<th scope="col">카라반 내부시설</th>
						<td>
							<ul class="table_ul05 carav"></ul>
						</td>
					</tr>
					
					<tr class="tr_bottom">
						<th scope="col">바닥형태 (단위:면)</th>
						<td>
							<ul class="table_ul05 bottom"></ul>
						</td>
					</tr>
					
					<tr>
						<th scope="col">반려동물 출입</th>
						<td class="etc_type animal"></td>
					</tr>
					
					<tr class="tr_eqp">
						<th scope="col">캠핑장비 대여</th>
						<td class="etc_type eqp"></td>
					</tr>
					
					<tr class="tr_brazierCl">
						<th scope="col">화로대</th>
						<td class="etc_type brazierCl"></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<p class="camp_intro_txt">
			<span class="info_notice">
				&nbsp;* 고캠핑에 등록된 정보는 현장상황과 다소 다를 수 있으니 <span class="info_f_red">반려동물 동반 여부, 부가 시설물, 추가차량</span> 등 원활한 캠핑을 위해 꼭 필요한 사항은 해당 캠핑장에 미리 확인하시기 바랍니다.
			</span> 
		</p>
	</section>
	
	
	<!-- 캠핑장 주요 사진 -->
	<h3 class="icon_h3 mt_50"></h3>
		<div class="box_photo">
			<div id="gallery" style="max-width: 100%; min-width: 150px; overflow: visible; height: auto;" class="ug-gallery-wrapper ug-theme-tiles">
					
					<div class="ug-overlay-disabled" style="display:none"></div>
					<ul class="ug-tiles-wrapper ug-tiletype-columns ug-tiles-transit ug-tiles-rest-mode" style="position: relative; height: 793px;">
					</ul>
					<div class="ug-tiles-preloader ug-preloader-trans" style="opacity: 1; position: absolute; margin: 0px; left: 558px; top: 100px; display: none;"></div>
					
			</div>
		</div>
		
		
		<div style="margin-top: -30px; margin-bottom: 30px;">
			※ 모든 컨텐츠의 저작권은 고캠핑에 있습니다. 무단 사용 및 불법 재배포는 법적 조치를 받을 수 있습니다.
		</div>
		<!-- <script>
			$(document).ready(function() {
				$("#gallery").unitegallery();
			});
		</script> -->
		
	</div>
<!-- 캠핑장 소개 끝 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e12329a55940adf92079d7a2dfa76447"></script>	
	</div>
	
	
	</div>
	
	</div>	

</section>
<%@include file="../common/footer.jsp" %>
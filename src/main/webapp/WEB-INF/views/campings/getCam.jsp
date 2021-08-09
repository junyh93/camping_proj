<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp" %>

<title>캠핑장 상세보기</title>
<link type="text/css" href="<c:url value='/css/getCam.css'/>"  rel="stylesheet" >

<script type="text/javascript">
$(function(){
	

var url = 'http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList'; 
var queryParams = '?' + encodeURIComponent('ServiceKey') + '='+'Po8b3s%2BelMewEpuJuSSNclaKWDReZThq%2FrOSAU0x%2BqHff1gACrKi1G3eez3LwxPQLMoN9ntPatUmspBAZTJd5w%3D%3D'; 
var contentID = Number($('#contentId').val());

queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); 
queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10000'); 
queryParams += '&' + encodeURIComponent('MobileOS') + '=' + encodeURIComponent('ETC'); 
queryParams += '&' + encodeURIComponent('MobileApp') + '=' + encodeURIComponent('AppTest'); 
queryParams += '&_type=json';


$.ajax({
		method: "GET",
		url: url + queryParams,
}).done(function(msg) {
		
		var item = msg.response.body.items.item;
		var temp = "";
		
		console.log(item);
			
		$.each(item,function(i){
			
			var contentId = item[i].contentId;	
			
			if(contentId == contentID){
				temp = item[i];
			}
		});
			item = temp;
			
			console.log(item);
			var firstImageUrl = item.firstImageUrl == null ? "/camping/img/캠핑야경.jpg" : item.firstImageUrl;
			var facltNm = item.facltNm == null ? "-" : item.facltNm;
			var addr1 = item.addr1 == null ? "-" : item.addr1;
			var tel = item.tel == null ? "-" : item.tel;
			var homepage = item.homepage == null ? "-" : item.homepage;
			var lctCl = item.lctCl == null ? "-" : item.lctCl;
			var induty = item.induty == null ? "-" : item.induty;
			var operPdCl = item.operPdCl == null ? "-" : item.operPdCl;
			var operDeCl = item.operDeCl == null ? "-" : item.operDeCl;
			var resveCl = item.resveCl == null ? "-" : item.resveCl;
			var posblFcltyCl = item.posblFcltyCl == null ? "-" : item.posblFcltyCl;
			var sbrsCl = item.sbrsCl == null ? "-" : item.sbrsCl;
		
			
		
		$('.imageUrl').html("<img src='<c:url value='"+firstImageUrl+"'/>' width='100%'/>");
		$('#facltNm').html(facltNm);
		$('#addr1').html(addr1);
		$('#tel').html(tel);
		$('#homepage').html("<a href='<c:url value='"+homepage+"'/>' target='_BLANK' title='새창열림'>홈페이지 바로가기</a>");
		$('#lctCl').html(lctCl);//캠핑장 환경 - 산 바다
		$('#induty').html(induty);// 캠핑장 유형 - 일반야영장 글램핑 자동차야영장 등
		$('#operPdCl').html(operPdCl);//운영기간 - 봄,가을
		$('#operDeCl').html(operDeCl);// 운영일 - 평일+주말
		$('#resveCl').html(resveCl);// 예약구분 - 온라인실시간예약 전화예약 등
		$('#posblFcltyCl').html(posblFcltyCl);// 주변이용가능시설 - 산책로 등
		$('#sbrsCl').html(sbrsCl);//부대시설 - 전기 와이파이 놀이터 등
	});	
});	
</script>

<input type="hidden" id="contentId" name="contentId" value="${contentId }">

<section class="content">
	<div class="imageUrl">
		
	</div>
<!-- 	<div class="cam">
		<div id="facltNm"></div>
		<div id="addr1"></div>
		<div id="tel"></div>
		<div id="homepage"></div>
		<div id="lctCl"></div>
		<div id="induty"></div>
		<div id="operPdCl"></div>
		<div id="operDeCl"></div>
		<div id="resveCl"></div>
		<div id="posblFcltyCl"></div>
	</div> -->
<div class="cont_tb">
	<table class="table">
		<colgroup>
			<col style="width: 30%;">
			<col style="width: 70%;">
		</colgroup>
		<tbody>
			<tr>
				<th scope="col">주소</th>
				<td id="addr1"></td>
			</tr>
			<tr class="camp_call_pcVer">
				<th scope="col">문의처</th>
				<td id="tel"></td>
			</tr>
			<tr>
				<th scope="col">캠핑장 환경</th>
				<td id="lctCl"></td>
			</tr>
			<tr>
				<th scope="col">캠핑장 유형</th>
				<td id="induty"></td>
			</tr>
			<tr>
				<th scope="col">운영기간</th>
				<td id="operPdCl"></td>
			</tr>
			<tr>
				<th scope="col">운영일</th>
				<td id="operDeCl"></td>
			</tr>
			<tr>
				<th scope="col">홈페이지</th>
				<td id="homepage">
				<i class="ico_link"><span class="skip">새창으로</span></i>
				</td>
			</tr>
			<tr>
				<th scope="col">예약방법</th>
				<td id="resveCl"></td>
			</tr>
		</tbody>
	</table>
		<div class="btn_w">
			<button type="button" class="btn_bB1 best" onclick="fnCampLike(); return false">추천하기</button>
			<button type="button" class="btn_rB1 zzim" onclick="fnCampBkmk(); return false">찜하기</button>
			<button type="button" class="btn_gB1 btn_modify" onclick="location.href='/zboard/createForm.do?lmCode=campRequest&amp;c_no=7638'; return false;">정보수정요청</button>
		</div>
<div>
<div id="sbrsCl"></div>
</div>									
</div>	
</section>
<%@include file="../common/footer.jsp" %>
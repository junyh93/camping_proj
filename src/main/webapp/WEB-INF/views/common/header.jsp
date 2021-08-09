<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
response.setHeader("Pragma", "no-cache"); 
response.setHeader("Cache-Control", "no-cache"); 
response.setHeader("Cache-Control", "no-store"); 
response.setDateHeader("Expires", 0L); 
%>
<%String memId = (String)session.getAttribute("memId"); %>
<%int memNo = (Integer) session.getAttribute("memNo"); %>
<!DOCTYPE html>
<html>
<head>

<link type="text/css" href="<c:url value='/css/main.css'/>" rel="stylesheet">

<script src="./js/jquery-3.5.1.min.js"></script>

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
	

	$.ajax({
			method: "GET",
			url: url + queryParams,
	}).done(function(msg) {
			
			console.log(msg);
			
			/*console.log(msg.response.body.items.item[0].addr1);*/
 		 	addr = msg.response.body.items.item.addr1 
 		 	mapX = msg.response.body.items.item.mapX
 		 	mapY = msg.response.body.items.item.mapY
 		 	contentId = msg.response.body.items.item.contentId
 		 /* 	resveUrl = msg.response.body.items.item.resveUrl */	/* 예약페이지 */
 		  	resveCl = msg.response.body.items.item.resveCl	/* 예약구분 */
 		 	img = msg.response.body.items.item.firstImageUrl
 		 	facltNm = msg.response.body.items.item.facltNm
 		 	intro = msg.response.body.items.item.intro
 		 	lineintro = msg.response.body.items.item.lineIntro
 		 	tel = msg.response.body.items.item.tel
 		 	homepage = msg.response.body.items.item.homepage
 		 	zipcode = msg.response.body.items.item.zipcode
 		 	addr2 = msg.response.body.items.item.addr2
 		 	/* eqpmnLendCl = msg.response.body.items.item.eqpmnLendCl *//* 캠핑장비 대여 */
 		/* animalCmgCl = msg.response.body.items.items.animalCmgCl */			/* 애완동물출입 */
 		 	
 		 	$( "#message1" ).append( addr );
			$("#message1").append(msg.response.body.items.item.contentId);
	 		$( "#message1" ).append( msg.response.body.items.item.animalCmgCl );
	 		$( "#message1" ).append( msg.response.body.items.item.brazierCl );
			$( "#message1" ).append( '<img src="' +msg.response.body.items.item.firstImageUrl+ '" />' )
			
			
			$( "#message2" ).append( msg.response.body.items.item.addr1 );
			$( "#message2" ).append( '<img src="' +msg.response.body.items.item.firstImageUrl+ '" />' )
			
			$( "#message3" ).append( msg.response.body.items.item.addr1 );
			$( "#message3" ).append( msg.response.body.items.item.addr1 ); 
			
			$(".img").append("<img src='" + img +"' width='73' height='70' />");
			$(".facltNm").append(facltNm);
			$(".addr").append(addr);
			$(".lineintro").append(lineintro);
			$(".tel").append(tel);
			$(".homepage").append("<a href='" + homepage + "'>"+ homepage +"</a>");
			$(".contentid").append("<input type='hidden' id='contentId'" + contentId + ">"); 
	});
	
</script>
 -->
<script type="text/javascript">
/* id값 유무에 따라서 (회원가입, 로그인, 마이페이지, 로그아웃 ) 버튼 숨기기 */
	$(function(){
		if($('#sessionId').val()== ""){
			$('#mypage').hide();
			$('#logout').hide();
		}else {
			$('#join').hide();
			$('#login').hide();
			
		}	
	});

</script>
<script type="text/javascript">
/* 마우스커서 이동에 따른 서브메뉴 노출여부 */
	$(function(){
		/* 커뮤니티 */
		$('.subslide1').hide();

		$('.slide1').mouseover(function(){
			$('.subslide1').slideDown();

		});
		$('.slide1').mouseleave(function(){
			$('.subslide1').hide();
		});
		
		/* 고객센터 */
		$('.subslide2').hide();

		$('.slide2').mouseover(function(){
			$('.subslide2').slideDown();

		});
		$('.slide2').mouseleave(function(){
			$('.subslide2').hide();
		});
		
		/* 로그인 */
		$('.subslide3').hide();

		$('.slide3').mouseover(function(){
			$('.subslide3').slideDown();

		});
		$('.slide3').mouseleave(function(){
			$('.subslide3').hide();
		});
		
		/* 마이페이지 */
		$('.subslide4').hide();

		$('.slide4').mouseover(function(){
			$('.subslide4').slideDown();

		});
		$('.slide4').mouseleave(function(){
			$('.subslide4').hide();
		});
	});

</script>
<meta charset="UTF-8">
<title>For rest Camping</title>
</head>
<body>
	 <input type="hidden" id="sessionId" value="${memId}">
	 <input type="hidden" id="sessionNo" value="${memNo}">
<header>
<div class="main_logo">
	<a href="<c:url value='main.do'/>" ><img src="<c:url value='/img/logoForest1.png'/>"  height="170" style="padding:20px 0 0 70px;"></a>
</div>
<div class="main_menu">
	<ul >
		<li class="limenu"><a href="#" class="amenu almenu"><img src="<c:url value='/img/search.png'/> "></a></li>
		<li class="limenu slide1"><a href="<c:url value='review.do'/>" class="amenu almenu"><img src="<c:url value='/img/comm.png'/> "></a>
			<ul class="subslide1">
				<li class="listyle list"><a href="<c:url value='review.do'/>" class="astyle ast">-캠핑 후기</a></li>
				<li class="listyle list"><a href="#" class="astyle ast">-캠핑 음식</a></li>
				<li class="listyle list"><a href="#" class="astyle ast">-캠핑 팁</a></li>
	    	</ul>
		</li>
		<li class="limenu slide2"><a href="#" class="amenu almenu"><img src="<c:url value='/img/notice.png'/> "></a>
			<ul class="subslide2">
				<li class="listyle list"><a href="#" class="astyle ast">-문의하기</a></li>
	    	</ul>
		</li>
<%--  		<li class="limenu" id="join"><a href="<c:url value='join.do'/>" class="amenu almenu">회원가입</a></li> --%> 
		<li class="limenu slide3" id="login"><a href="<c:url value='login.do'/>" class="amenu almenu"><img src="<c:url value='/img/login.png'/> "></a>
	<%-- 		<ul class="subslide3">
				<li class="listyle"><a href="<c:url value='join.do'/>" class="astyle">회원가입</a></li>
	    	</ul> --%>
		</li>
		<li class="limenu slide4" id="mypage"><a href="<c:url value='mypage.do'/>" class="amenu almenu"><img src="<c:url value='/img/mypage.png'/> "></a>
		<%-- 	<ul class="subslide4">
				<li class="listyle"><a href="<c:url value='logout.do'/>" class="astyle">로그아웃</a></li>
	    	</ul> --%>
		</li>
 		<li class="limenu" id="logout"><a href="<c:url value='logout.do'/>" class="amenu almenu"><img src="<c:url value='/img/logout.png'/> "></a></li>
	</ul>
</div>
</header>


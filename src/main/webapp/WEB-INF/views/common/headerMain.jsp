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
<%String adId = (String)session.getAttribute("adId"); %>
<%int adNo = (Integer)session.getAttribute("adNo"); %>
<!DOCTYPE html>
<html>
<head>

<link type="text/css" href="<c:url value='/css/main.css'/>" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/fontawesome.min.css'/> ">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<script src="./js/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
/* id값 유무에 따라서 (회원가입, 로그인, 마이페이지, 로그아웃 ) 버튼 숨기기 */
	$(function(){
		if($('#sessionId').val()== "" && $('#adId').val()==""){
			$('#mypage').hide();
			$('#logout').hide();
		}else{
			$('#join').hide();
			$('#login').hide();
		}
		
		if($('#sessionId').val()== "" && $('#adId').val()!=""){
			$('.ad').attr('href', '<c:url value="admin.do"/>');
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
	 <input type="hidden" id="adId" value="${adId}">
	<div class="main_img">
	<div class="main_header">
	<div class="main_logo">
		<a href="<c:url value='main.do'/>" ><img src="<c:url value='/img/logoForest1.png'/>"  height="150" style="padding:20px 0 0 70px;"></a>
	</div>
	<div class="main_menu">
		<ul >
			<li class="limenu"><a href="<c:url value='/searchPage.do'/>" class="amenu"><img src="<c:url value='/img/search1.png'/> "></a></li>
			<li class="limenu slide1"><a href="<c:url value='review.do'/>" class="amenu"><img src="<c:url value='/img/comm1.png'/> "></a>
				<ul class="subslide1">
					<li class="listyle"><a href="<c:url value='review.do'/>"  class="astyle"><i class="fas fa-angle-right"></i> 캠핑 후기</a></li>
					<li class="listyle"><a href="<c:url value='food.do'/>" class="astyle"><i class="fas fa-angle-right"></i> 캠핑 음식</a></li>
					<li class="listyle"><a href="<c:url value='tip.do'/>" class="astyle"><i class="fas fa-angle-right"></i> 캠핑 팁</a></li>
		    	</ul>
			</li>
			<li class="limenu slide2"><a href="#" class="amenu"><img src="<c:url value='/img/notice1.png'/> "></a>
				<ul class="subslide2">
					<li class="listyle"><a href="<c:url value='notice.do'/>" class="astyle"><i class="fas fa-angle-right"></i> 공지사항</a></li>
		    	</ul>
			</li>
	<%--  		<li class="limenu" id="join"><a href="<c:url value='join.do'/>" class="amenu">회원가입</a></li>  --%>
			<li class="limenu slide3" id="login"><a href="<c:url value='login.do'/>" class="amenu"><img src="<c:url value='/img/login1.png'/> "></a>
		<%-- 		<ul class="subslide3">
					<li class="listyle"><a href="<c:url value='join.do'/>" class="astyle">회원가입</a></li>
		    	</ul> --%>
			</li>
			<li class="limenu slide4" id="mypage"><a href="<c:url value='mypage.do?memNo=${memNo }'/>" class="amenu ad"><img src="<c:url value='/img/mypage1.png'/> "></a>
			<%-- 	<ul class="subslide4">
					<li class="listyle"><a href="<c:url value='logout.do'/>" class="astyle">로그아웃</a></li>
		    	</ul> --%>
			</li>
	 		<li class="limenu" id="logout"><a href="<c:url value='logout.do'/>" class="amenu"><img src="<c:url value='/img/logout1.png'/> "></a></li>
		</ul>
	</div>
	</div>
	

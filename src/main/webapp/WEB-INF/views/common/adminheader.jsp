<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>관리자 헤더영역</title>
<link type="text/css" href="<c:url value='/css/adminheader.css'/>"  rel="stylesheet" >
<script type="text/javascript">

	function member(adNo){
		$.ajax({
			url:"<c:url value='/getMem.do'/>",
			type:"POST",
			success:function(data){
				$('#contents').html(data);
			}
		});
	}
	
	function comment(adNo){
		$.ajax({
			url:"<c:url value='/getCom.do'/>",
			type:"POST",
			success:function(data){
				$('#contents').html(data);
			}
		});
	}
	
	function board(adNo){
		$.ajax({
			url:"<c:url value='/getBoard.do'/>",
			type:"POST",
			success:function(data){
				$('#contents').html(data);
			}
		});
	}

</script>
<input type="hidden" id="adName" name="adName" value="${adName}">
<div id="s_contanier">
		<!--상단타이틀영역-->
			<div id="sub_title_wrap">
				<div class="layout">
					<h2>
						<span class="skip">서브타이틀 영역</span>
					</h2>
					<!--타이틀-->
					<div class="s_title">
						</div>
					<!--//타이틀-->
				</div>
				<div class="s_bg_w">
					<!-- s_bg_02~05 캠핑Go, 캠핑Talk, 캠핑플러스, 고객센터, 마이페이지 -->
					<div class="s_bg_02"></div>
						</div>
			</div>
			<!--//상단타이틀영역-->
			<!--Location-->
			<!--//Location-->
		<section id="section1" style="right: 0px">
	<h2 class="skip">본문영역입니다.</h2>
		<!--콘텐츠박스-->
		<div id="cont_inner">
			<div class="sub_layout layout">
				<article>
						<header class="title_w">
							<h2 class="title"><span class="skip">타이틀영역입니다.</span>
								</h2>
						</header>
					</article>
	<!--내용시작-->
<div id="contents">
		 
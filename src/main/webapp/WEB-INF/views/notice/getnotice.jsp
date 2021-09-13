<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>공지사항 상세보기</title>
<link type="text/css" href="<c:url value='/css/getnotice.css'/>"  rel="stylesheet" >

<script type="text/javascript">
function list(){
	location.href="<c:url value='/notice.do?page="+${page}+"&range="+${range}+"&rangeSize="+${rangeSize}+"'/>";
};
</script>
<div id="cont_inner">
			<div class="sub_layout layout">
				<article>
						<header class="title_w">
							<h2 class="title"><span class="skip">타이틀영역입니다.</span>
								공지사항</h2>
						</header>
					</article>
					 
				<!--내용시작-->
<div id="contents">
<h3 class="icon_h3">공지사항</h3>
<div class="board_view">
	<div class="board_view_head">
		<h3 class="title">
			${notice.noticeTitle } </h3>
		<ul class="meta-info">
			<li class="date">${notice.adName }</li>
			<li class="date">${notice.noticeDate }</li>
			<li>조회수 405</li>
		</ul>
	</div>
	<div class="file_down">
		<span>첨부파일</span>
		</div>
	<div class="board_cont">
		<div class="board_cont_inner">
			<p><img src="<c:url value='/img/코로나2.gif'/>" ></p>
			<p><span style="font-size: 12pt;"><b>${notice.noticeContent }&nbsp;</b></span></p><p>&nbsp;</p><p>출처 및 원문 보기 &gt;&gt;</p><p></p>
		</div>
	</div>

	</div>

<div class="board_btn_w">
	<div class="board_btn">
		<button title="목록" class="b_btn_gray" onclick="list();" type="button">
				<span>목록</span>
			</button>
		</div>
</div></div>
				<!--//내용종료-->
			</div>
		</div>
		<!--//콘텐츠박스-->
	</section>
	</div>
<%@include file="../common/footer.jsp" %>
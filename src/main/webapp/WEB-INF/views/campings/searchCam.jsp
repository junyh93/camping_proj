<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="../common/header.jsp" %>

<title>캠핑장 검색</title>
<link type="text/css" href="<c:url value='/css/searchCam.css'/>"  rel="stylesheet" >

<script src="<c:url value='/js/main.js'/>"></script>
<script src="<c:url value='/js/searchCam.js'/>"></script>

<div>
<input type="hidden" id="searchKrwd" name="searchKrwd" value="${searchKrwd }">
<input type="hidden" id="cdo" name="c_do" value="${c_do}">
<input type="hidden" id="csigngu" name="c_signgu" value="${c_signgu }">

</div>
		<!--상단타이틀영역-->
			<div id="sub_title_wrap">
				<div class="layout">
					<h2>
						<span class="skip">서브타이틀 영역</span>
					</h2>
					<!--타이틀-->
					<div class="s_title">
						<p class="tt1dept">캠핑장</p>
								<p class="s_tt">전국의 캠핑장을 한곳에서 모아두다</p>
							</div>
					<!--//타이틀-->
				</div>
				<div class="s_bg_w">
					<!-- s_bg_02~05 캠핑Go, 캠핑Talk, 캠핑플러스, 고객센터, 마이페이지 -->
					<div class="s_bg_03"></div>
						</div>
			</div>
			<!--//상단타이틀영역-->
<div class="cnt">
	<div class="subcnt">
		<div class="layout" id="layout_1">
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
			</div>
			<div class="gray_bar">
			<span class="skip">공백영역입니다.</span>
		</div>
		
<!--내용시작-->		
		<div id="cont_inner">
			<div class="sub_layout layout">
				<section id="section1" style="right: 0px">
					<h2 class="skip">본문내용이 시작됩니다.</h2>
					<header class="title_w mb_0">
						<h2 class="title2">
							총 <span class="em_org"></span>개 캠핑장이 검색되었습니다.
						</h2>
					</header>
				</section>
<div class="camp_search_list">
</div>				

</div>
	<!--//내용종료-->
</div>
	</div>
</div>


<%@include file="../common/footer.jsp" %>
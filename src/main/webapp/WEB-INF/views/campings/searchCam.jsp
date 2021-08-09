<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="../common/header.jsp" %>

<title>캠핑장 검색</title>
<link type="text/css" href="<c:url value='/css/searchCam.css'/>"  rel="stylesheet" >

<script type="text/javascript">
$(function(){
	var url = ''; 
	var searchKrwd = $('#searchKrwd').val();
	var c_do = $('#c_do').val();
	var c_signgu = $('#c_signgu').val();
	var queryParams = '?' + encodeURIComponent('ServiceKey') + '='+'Po8b3s%2BelMewEpuJuSSNclaKWDReZThq%2FrOSAU0x%2BqHff1gACrKi1G3eez3LwxPQLMoN9ntPatUmspBAZTJd5w%3D%3D'; 
	
	queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); 
	queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10000'); 
	queryParams += '&' + encodeURIComponent('MobileOS') + '=' + encodeURIComponent('ETC'); 
	queryParams += '&' + encodeURIComponent('MobileApp') + '=' + encodeURIComponent('AppTest');

	if(searchKrwd != "" ){
		url = 'http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/searchList'; 
		queryParams += '&' + encodeURIComponent('keyword') + '=' + encodeURIComponent(searchKrwd);
	
	}else{
		url = 'http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList';
	}
	
	queryParams += '&_type=json';

$.ajax({
		method: "GET",
		url: url + queryParams,
}).done(function(msg) {
	var item = msg.response.body.items.item;
	var temp = [];
	var addrArray = "";
	var st = "";
	

	console.log(item);

	
	if(Array.isArray(item)){
		
		$.each(item, function(i){
	 					
			var doNm = item[i].doNm;
			var sigunguNm = item[i].sigunguNm;


			if(c_do != "" && c_signgu != ""){
				if(doNm == c_do && sigunguNm == c_signgu){
					temp.push(item[i]);
				}
			}else if(c_do != "" && c_signgu == ""){
				if(doNm == c_do){
					temp.push(item[i]);
				}
			}else if(c_do == "" && c_signgu != ""){
				alert("시/도를 선택해주세요");
				
			}else if(c_do == "" && c_signgu == ""){
					temp.push(item[i]);
			}
		});
		
		item = temp;
		var ccnt = item.length;
		
	}else{ //배열형이 아닌 하나의 값일 경우
		var doNm = item[i].doNm;
		var sigunguNm = item[i].sigunguNm;

		if(c_do != "" && c_signgu != ""){
			if(doNm == c_do && sigunguNm == c_signgu){
				item;
			}
		}else if(c_do != "" && c_signgu == ""){
			if(doNm == c_do){
				item;
			}
		}else if(c_do == "" && c_signgu != ""){
			alert("시/도를 선택해주세요");
		}else if(c_do == "" && c_signgu == ""){
			item;
		}
	}
	

	
	var seoul_sigungu = "";
	var busan_sigungu = "";
	var kangwon_sigungu = "";
	var gyeonggi_sigungu = "";
	

	if(Array.isArray(item)){
		
		var seoul = "서울시";
		var busan = "부산시";
		var kangwon = "강원도";
		var gyeonggi = "경기도";
		
		var id = [];

		
		$.each(item, function(i){

			if(item[i].doNm == seoul){
				id.push( item[i].contentId);
				alert(id.length);
				
				var selected = id[Math.floor(Math.random() * id.length)];
				alert(selected);
			}
			
			item[i].firstImageUrl = item[i].firstImageUrl == null ? "/camping/img/캠핑야경.jpg" : item[i].firstImageUrl; 
			item[i].lineIntro = item[i].lineIntro == null ? "-" : item[i].lineIntro;
			var sttr = "";

			
			var sbrsCl = item[i].sbrsCl;
			
			if(sbrsCl == null){
				sbrsCl = " ";
				sttr += "<li><span>"+sbrsCl+"</span></li>";
			}
			
			if(sbrsCl.includes('전기') == true){
				sttr += "<li><img src='<c:url value='/img/ico_volt.png'/>'><br><span>전기</span></li>";
			}
			if(sbrsCl.includes('무선인터넷') == true){
				sttr += "<li><img src='<c:url value='/img/ico_wifi.png'/>'><br><span>와이파이</span></li>";
			}

			
			var len = "";
			
			if( item[i].intro != null){
				len = item[i].intro.length;
			}else{
				item[i].intro = "-";
			}
			
			
			if(len < 50){
				item[i].intro;
			}else {
				var intro1 = item[i].intro.substring(0,51); //50글자
				var intro2 = item[i].intro.substring(51,len);
				
				intro2 = "...";
				
				item[i].intro = intro1 + intro2;
			}
			
			
			st += '<ul>';
			st += '<li>';
			st += '<div class="c_list update">';
			st += '<a href="<c:url value="/getCam.do?contentId='+item[i].contentId+'"/>" class="dc_none" ><div class="img_box">';
			st += '<img src="'+ item[i].firstImageUrl+'"></div></a>';
			st += '<div class="camp_cont">';
			st += '<h2 class="camp_tt">';
			st += '<a href="<c:url value="/getCam.do?contentId='+item[i].contentId+'"/>">['+item[i].doNm+' '+item[i].sigunguNm+'] '+item[i].facltNm +'</a></h2>';
			st += '<span class="camp_stt">'+item[i].lineIntro+'</span> ';
			st += '<span class="camp_txt"> ';
			st += '<a href="<c:url value="/getCam.do?contentId='+item[i].contentId+'"/>">'+item[i].intro+'</a></span>';
			st += '	<ul class="camp_info01">';
			st += '<li class="addr">'+item[i].addr1+'</li>';
			st += '<li class="call_num">'+item[i].tel+'</li></ul>';
			st += '<div class="camp_item_box">';
			st += '<ul>';
			st +=  sttr;
			st += '</ul></div>';
			/* 
			st += '<li><i class="ico_wifi"><span>'+ico_wifi+'</span></i></li></ul></div>'; */
/* 			st += '<li><i class="ico_hotwater"><span>'+ico_hotwater+'</span></i></li>';
			st += '<li><i class="ico_playzone"><span>'+ico_playzone+'</span></i></li>';
			st += '<li><i class="ico_walk"><span>'+ico_walk+'</span></i></li>';
			st += '<li><i class="ico_ico_sports"><span>'+ico_ico_sports+'</span></i></li>';
			st += '<li><i class="ico_mart"><span>'+ico_mart+'</span></i></li></ul></div>'; */
			st += '</div></div></li></ul>';
		});
		
	//item이 하나의 값만 가질 경우	
	}else{
		i = 1;
		st += '<div class="inf">';
		st += '<div style="width: 30px; float:left;">' + i + '</div>'; //순서
		st += '<input type="text" readonly="readonly" id="facltNm" style="cursor:pointer; width:230px; border:none; outline:none;" value="' + item.facltNm + '">'; //시설명
		st += '<input type="text" readonly="readonly" style="cursor:pointer; width:340px; border:none; outline:none;" value="' + item.addr1 + '">'; //시설주소
		st += '<input type="hidden" value="' + item.contentId + '">'; //컨텐트아이디
		st += '<input type="hidden" value="' + item.lineIntro + '">'; //한줄소개
		st += '<input type="hidden" value="' + item.tel + '">'; //전화번호
		st += '<input type="hidden" value="' + item.homepage + '">'; //홈페이지
		st += '<input type="hidden" value="' + item.firstImageUrl + '">'; //첫이미지경로
		st += '<input type="hidden" value="' + item.mapX + '">'; //위치정보
		st += '<input type="hidden" value="' + item.mapY + '">'; //위치정보
		st += '</div>'

	}
	
	
	
	$('.camp_search_list').html(st);
	$('.cnt').append(ccnt);
});
});
</script>

<div>
<input type="hidden" id="searchKrwd" name="searchKrwd" value="${searchKrwd }">
<input type="hidden" id="c_do" name="c_do" value="${c_do}">
<input type="hidden" id="c_signgu" name="c_signgu" value="${c_signgu }">
</div>

<div class="cnt">
	<div class="subcnt">
		<div class="layout" id="layout_1">
				<h2>
					<span class="skip">달력 및 검색영역</span>
				</h2>
				<!--달력-->
				<div class="calen">
					<p class="month_area">
						<button type="button" class="m_prev">
							<span class="skip">이전달</span>
						</button>
						<span id="cal_span">2021. 8</span>
						<button type="button" class="m_next">
							<span class="skip">다음달</span>
						</button>
					</p>
					<div class="table_w_">
						<table class="month_tb">
							<caption>월간 달력입니다. 월, 화, 수, 목, 금, 토, 일로 나뉘며 한달간 요일을 보여줍니다.</caption>
							<colgroup>
								<col style="width: 15%">
								<col style="width: 14%">
								<col style="width: 14%">
								<col style="width: 14%">
								<col style="width: 14%">
								<col style="width: 14%">
								<col style="width: 15%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" class="sun">SUN</th>
									<th scope="col">MON</th>
									<th scope="col">TUE</th>
									<th scope="col">WED</th>
									<th scope="col">THU</th>
									<th scope="col">FRI</th>
									<th scope="col" class="sat">SAT</th>
								</tr>
							</thead>
							<tbody id="cal_tbody">
								<tr>
									<td>1</td>
											<td>2</td>
											<td>3</td>
											<td>4</td>
											<td>5</td>
											<td>6</td>
											<td>7</td>
											</tr><tr><td>8</td>
											<td>9</td>
											<td>10</td>
											<td>11</td>
											<td>12</td>
											<td>13</td>
											<td>14</td>
											</tr><tr><td>15</td>
											<td>16</td>
											<td>17</td>
											<td>18</td>
											<td>19</td>
											<td>20</td>
											<td>21</td>
											</tr><tr><td>22</td>
											<td>23</td>
											<td>24</td>
											<td>25</td>
											<td>26</td>
											<td>27</td>
											<td>28</td>
											</tr><tr><td>29</td>
											<td>30</td>
											<td>31</td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!--//달력-->
				<!--검색박스-->
				<div class="top_search_box">
					<form id="campSearchForm2" action="/bsite/camp/info/list.do" method="get"><input type="hidden" name="listTy" value="LIST">
						<input id="listOrdrTrget" name="listOrdrTrget" type="hidden" value="last_updusr_pnttm"><button type="button" class="tag_link_btn">
							<span>태그로 검색</span>
						</button>
						<div>
							<div class="form_tt">
								<h2 class="tt">상세검색</h2>
								<a class="form_openTT" title="상세검색 펼쳐보기"><img src="/img/2018/common/ico_more03.gif" alt="상세검색 펼쳐보기"></a>
							</div>
							<div class="form_w">
								<ul>
									<li class="tt"><strong class="title">지역</strong>
										<div class="select_box">
											<label for="c_do">도/특별시</label><select id="c_do" name="c_do" class="detail_select" title="도/특별시"><option value="">전체</option><option value="1">서울시</option><option value="2">부산시</option><option value="3">대구시</option><option value="4">인천시</option><option value="5">광주시</option><option value="6">대전시</option><option value="7">울산시</option><option value="8">세종시</option><option value="9">경기도</option><option value="10">강원도</option><option value="11">충청북도</option><option value="12">충청남도</option><option value="13">전라북도</option><option value="14">전라남도</option><option value="15">경상북도</option><option value="16">경상남도</option><option value="17">제주도</option></select></div></li>
									<li>
										<div class="select_box">
											<label for="c_signgu">시/군/지역</label><select id="c_signgu" name="c_signgu" class="detail_select" title="시/군/지역"><option value="">전체</option></select></div>
									</li>
									<li class="tt"><strong class="title">테마</strong>
										<div class="select_box them">
											<label for="searchLctCl">전체</label> <select class="detail_select" name="searchLctCl" id="searchLctCl" title="테마선택">
												<option value="">전체테마</option>
												<option value="47">해변</option>
												<option value="48">섬</option>
												<option value="49">산</option>
												<option value="50">숲</option>
												<option value="51">계곡</option>
												<option value="52">강</option>
												<option value="53">호수</option>
												<option value="54">도심</option>
												</select>
										</div></li>
								</ul>
								<ul>
									<li class="tt top_kwdSearch"><strong class="title">키워드검색</strong>
										<div class="input_search">
											<fieldset class="totalSearch">
												<legend>키워드 검색</legend>
												<label for="searchKrwd2" class="skip">키워드 검색어를 입력하세요.</label>
												<input id="searchKrwd2" name="searchKrwd" class="m_search_in" style="vertical-align: middle;" title="검색어를 입력하세요." placeholder="검색어를 입력하세요." type="text" value=""></fieldset>
										</div></li>

									<li class="fw_2li">
										<ul>
											<li class="button_w"><button type="button" class="de_btn01">상세조건</button></li>
											<li class="button_w"><button type="submit" class="de_btn02">캠핑장 검색</button></li>
											<li class="button_w"><button type="button" onclick="geoFindMe('30', ''); return false;" class="de_btn03">내주변보기</button></li>
										</ul>
									</li>
								</ul>
							</div>
						</div>
					</form></div>
				<!--//검색박스-->
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
							총 <span class="em_org">21개</span> 캠핑장이 검색되었습니다.
						</h2>
					</header>
				</section>
				

<!--리스트시작-->



<!-- 
	<ul>				
		<li>
				<div class="c_list update">
					<a href="/bsite/camp/info/read.do?c_no=3042&amp;viewType=read01&amp;listOrdrTrget=last_updusr_pnttm&amp;searchDo=,17,&amp;c_signgu=234" class="dc_none"><span class="skip">캠핑장정보 더보기</span>
						<div class="img_box">
							<img src="/upload/camp/3042/thumb/thumb_720_4186d51wn0EevJTyGUCBMuSO.jpg" alt="캠파제주 ">
								<div class="clist_icon">
								<ul>
									<li><i class="con_tip c03"><span class="skip">산</span></i></li>
									</ul>
							</div> 
						</div> 
					</a>
					
					<div class="camp_cont">
						<p class="item_group">
							<span class="item_t01">관광사업자 등록업체</span>
							<span class="item_t02">리뷰수 0</span> <span class="item_t03">조회수 8122</span> <span class="item_t04">추천수 2</span>
						</p>
						<h2 class="camp_tt">
							<a href="/bsite/camp/info/read.do?c_no=3042&amp;viewType=read01&amp;listOrdrTrget=last_updusr_pnttm&amp;searchDo=,17,&amp;c_signgu=234">[제주도 서귀포시] 캠파제주 </a>
						</h2>
						<span class="camp_stt">창이 넓은 카라반에서 일출과 노을을 감상할 수 있는 캠파제주</span> <span class="camp_txt"> <a href="/bsite/camp/info/read.do?c_no=3042&amp;viewType=read01&amp;listOrdrTrget=last_updusr_pnttm&amp;searchDo=,17,&amp;c_signgu=234"><span class="skip">캠핑장정보 더보기</span> 캠파제주는 제주의 368개의 오름 중 하나인 영천오름에 위치하고 있으며, 산책로와 오름을 트레킹하면서 제주도 최고의 ...</a>
						</span>
						<ul class="camp_info01">
							<li class="addr">제주특별자치도 서귀포시 상효동  1116-1 </li>
							<li class="call_num">064-767-1253</li>
						</ul>
							
					
						<div class="camp_item_box">
								<ul>
									<li><i class="ico_volt"><span>전기</span></i></li>
									<li><i class="ico_wifi"><span>와이파이</span></i></li>
									<li><i class="ico_hotwater"><span>온수</span></i></li>
									<li><i class="ico_playzone"><span>놀이터</span></i></li>
									<li><i class="ico_walk"><span>산책로</span></i></li>
									<li><i class="ico_ico_sports"><span>운동시설</span></i></li>
									<li><i class="ico_mart"><span>마트.편의점</span></i></li>
								</ul>
						</div>
						
						
					</div>
				</div>
				
				
			</li>			
		</ul>
--> 

<!--//리스트시작-->

<!--페이징-->
<div class="paging">
	<ul>
		<li><a href="/bsite/camp/info/list.do?pageUnit=10&amp;searchKrwd=&amp;listOrdrTrget=last_updusr_pnttm&amp;searchDo=,17,&amp;c_signgu=234&amp;pageIndex=1"><img src="/img/2018/sub/btn_pre00.png" alt="처음으로"></a></li>
<li><a href="/bsite/camp/info/list.do?pageUnit=10&amp;searchKrwd=&amp;listOrdrTrget=last_updusr_pnttm&amp;searchDo=,17,&amp;c_signgu=234&amp;pageIndex=1"><img src="/img/2018/sub/btn_pre01.png" alt="이전으로"></a></li>
<li class="num on"><a href="#none">1</a></li>
<li class="num"><a href="/bsite/camp/info/list.do?pageUnit=10&amp;searchKrwd=&amp;listOrdrTrget=last_updusr_pnttm&amp;searchDo=,17,&amp;c_signgu=234&amp;pageIndex=2">2</a></li>
<li class="num"><a href="/bsite/camp/info/list.do?pageUnit=10&amp;searchKrwd=&amp;listOrdrTrget=last_updusr_pnttm&amp;searchDo=,17,&amp;c_signgu=234&amp;pageIndex=3">3</a></li>
<li><a href="/bsite/camp/info/list.do?pageUnit=10&amp;searchKrwd=&amp;listOrdrTrget=last_updusr_pnttm&amp;searchDo=,17,&amp;c_signgu=234&amp;pageIndex=3"><img src="/img/2018/sub/btn_next01.png" alt="다음으로"></a></li>
<li><a href="/bsite/camp/info/list.do?pageUnit=10&amp;searchKrwd=&amp;listOrdrTrget=last_updusr_pnttm&amp;searchDo=,17,&amp;c_signgu=234&amp;pageIndex=3"><img src="/img/2018/sub/btn_next00.png" alt="맨끝으로"></a></li>

</ul>
</div>
<!--//페이징-->
<!--페이징_TM-->
<div class="paging_tm">
	<ul>
		<li class="prev"><a href="/bsite/camp/info/list.do?pageUnit=10&amp;searchKrwd=&amp;listOrdrTrget=last_updusr_pnttm&amp;searchDo=,17,&amp;c_signgu=234&amp;pageIndex=1">PREV</a></li>
<li><strong title="현재페이지">1
</strong>/3</li><li class="next"><a href="/bsite/camp/info/list.do?pageUnit=10&amp;searchKrwd=&amp;listOrdrTrget=last_updusr_pnttm&amp;searchDo=,17,&amp;c_signgu=234&amp;pageIndex=2">NEXT</a></li>

</ul>
</div>
<!--//페이징_TM--></div>
	<!--//내용종료-->
</div>
		
		
		
	</div>
</div>
<div class="camp_search_list">
</div>
<!-- 
<div class="search">

</div>

 -->
<%@include file="../common/footer.jsp" %>
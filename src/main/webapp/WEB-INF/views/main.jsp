<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/headerMain.jsp" %>


<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


<script src="<c:url value='/js/main.js'/>"></script>
<%-- <script src="<c:url value='/js/slick.js'/>"></script> --%>
<%-- <script src="<c:url value='/js/slick.min.js'/>"></script>


<link type="text/css" href="<c:url value='/css/slick.css'/>"  rel="stylesheet" >
<link type="text/css" href="<c:url value='/css/slick-theme.css'/>"  rel="stylesheet" > --%>
<script type="text/javascript">
	$(function(){
		var url = 'http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList'; 
		var queryParams = '?' + encodeURIComponent('ServiceKey') + '='+'Po8b3s%2BelMewEpuJuSSNclaKWDReZThq%2FrOSAU0x%2BqHff1gACrKi1G3eez3LwxPQLMoN9ntPatUmspBAZTJd5w%3D%3D'; 

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
				var temp = [];
				
			//경기도 인천시 강원도 충청남도 전라남도 경상북도
				var gid = [];//경기도
				var iid = [];//인천시
				var kid = [];//강원도
				var cid = [];//충청남도
				var jid = [];//전라남도
				var ggid = [];//경상북도
				
				//3개의 contentid 담기
				var gyid = [];
				var inid = [];
				var kaid = [];
				var cnid = [];
				var jnid = [];
				var gbid = [];
				
				var gtemp = [];
				var itemp = [];
				var ktemp = [];
				var ctemp = [];
				var jtemp = [];
				var ggtemp = [];
				
				
				console.log(item);
					
				if(Array.isArray(item)){
					
					
					//경기도
					$.each(item,function(i){
						
						if(item[i].doNm == "경기도" && item[i].firstImageUrl != null){
							gid.push( item[i].contentId);
							/* alert(id.length); */
							
						 }
					});
					
					for(i=0; i<3; i++){
						temp = gid[Math.floor(Math.random() * gid.length)];
						
						/* id.push(selected); */
						if(gyid.indexOf(temp) == -1){
							gyid.push(temp);
						}else{
							i--;
						}
							
					}	

					temp=[]; 
					
					
					//인천시
					$.each(item,function(i){
					
						if(item[i].doNm == "인천시" && item[i].firstImageUrl != null){
							iid.push(item[i].contentId);
							/* alert(id.length); */
							
						 }
					});
					
					for(i=0; i<3; i++){
						temp = iid[Math.floor(Math.random() * iid.length)];
						
						/* id.push(selected); */
						if(inid.indexOf(temp) == -1){
							inid.push(temp);
						}else{
							i--;
						}
							
					}	

					temp=[]; 
					
					
					//강원도
					$.each(item,function(i){
						
						if(item[i].doNm == "강원도" && item[i].firstImageUrl != null){
							kid.push( item[i].contentId);
							/* alert(id.length); */
							
						 }
					});
					
					for(i=0; i<3; i++){
						temp = kid[Math.floor(Math.random() * kid.length)];
						
						/* id.push(selected); */
						if(kaid.indexOf(temp) == -1){
							kaid.push(temp);
						}else{
							i--;
						}
							
					}	

					temp=[]; 
					
					
					//충청남도
					$.each(item,function(i){
					
						if(item[i].doNm == "충청남도" && item[i].firstImageUrl != null){
							cid.push( item[i].contentId);
							/* alert(id.length); */
							
						 }
					});
					
					for(i=0; i<3; i++){
						temp = cid[Math.floor(Math.random() * cid.length)];
						
						/* id.push(selected); */
						if(cnid.indexOf(temp) == -1){
							cnid.push(temp);
						}else{
							i--;
						}
							
					}	

					temp=[]; 
					
					//전라남도
					$.each(item,function(i){
						
						if(item[i].doNm == "전라남도" && item[i].firstImageUrl != null){
							jid.push( item[i].contentId);
							/* alert(id.length); */
							
						 }
					});
					
					for(i=0; i<3; i++){
						temp = jid[Math.floor(Math.random() * jid.length)];
						
						/* id.push(selected); */
						if(jnid.indexOf(temp) == -1){
							jnid.push(temp);
						}else{
							i--;
						}
							
					}	

					temp=[]; 
					
					//경상북도
					$.each(item,function(i){
						
						if(item[i].doNm == "경상북도" && item[i].firstImageUrl != null){
							ggid.push( item[i].contentId);
							/* alert(id.length); */
							
						 }
					});
					
					for(i=0; i<3; i++){
						temp = ggid[Math.floor(Math.random() * ggid.length)];
						
						/* id.push(selected); */
						if(gbid.indexOf(temp) == -1){
							gbid.push(temp);
						}else{
							i--;
						}
							
					}	

					temp=[]; 
					
				}
			
				$.each(item,function(i){
					
					var contentId = item[i].contentId;
			
					//경기도
					$.each(gyid,function(g){
						
						if(contentId == gyid[g]){
							gtemp.push(item[i]);
						}
						
					});
					
					//인천시
					$.each(inid,function(s){
						
						if(contentId == inid[s]){
							itemp.push(item[i]);
						}
						
					});
					
	
					//강원도
					$.each(kaid,function(k){
						
						if(contentId == kaid[k]){
							ktemp.push(item[i]);
						}
							
					});
					
					//충청남도
					$.each(cnid,function(c){
						
						if(contentId == cnid[c]){
							ctemp.push(item[i]);
						}
						
					});
					
					//전라남도
					$.each(jnid,function(j){
						
						if(contentId == jnid[j]){
							jtemp.push(item[i]);
						}
						
					});
					
					//경상북도
					$.each(gbid,function(b){
						
						if(contentId == gbid[b]){
							ggtemp.push(item[i]);
						}
						
					});
					
					
				});
				
				
				//경기도
				var gt = "";
				
				if(gtemp != null){
					i=4;
					$.each(gtemp,function(g){
						
						i--;
						gt += '<a href="<c:url value="/getCam.do?contentId='+gtemp[g].contentId+'"/>" tabindex="-1">';
						gt += '<div class="them_item">';
						gt += '<img src="'+gtemp[g].firstImageUrl+'" class="imgFit">';
						gt += '<p class="them_tt">['+gtemp[g].doNm+gtemp[g].sigunguNm+'] <br><sapn class="them_f">'+gtemp[g].facltNm+'</p></div></a>';
						
						
						$('.gtemp'+g).html(gt);
						gt="";
					});
				}
				
				//인천
				var it = "";
				if(itemp != null){

					$.each(itemp,function(i){
						

						it += '<a href="<c:url value="/getCam.do?contentId='+itemp[i].contentId+'"/>" tabindex="-1">';
						it += '<div class="them_item">';
						it += '<img src="'+itemp[i].firstImageUrl+'" class="imgFit">';
						it += '<p class="them_tt">['+itemp[i].doNm+itemp[i].sigunguNm+'] <span style="float:right;"><br>'+itemp[i].facltNm+'</span></p></div></a>';
	
						
						$('.itemp'+i).html(it);
						it="";
					});
				}
				
				//강원도
				var kt = "";
				if(ktemp != null){

					$.each(ktemp,function(k){
	
						kt += '<a href="<c:url value="/getCam.do?contentId='+ktemp[k].contentId+'"/>" tabindex="-1">';
						kt += '<div class="them_item">';
						kt += '<img src="'+ktemp[k].firstImageUrl+'" class="imgFit">';
						kt += '<p class="them_tt">['+ktemp[k].doNm+ktemp[k].sigunguNm+'] <span style="float:right;"><br>'+ktemp[k].facltNm+'</span></p></div></a>';
						
						
						$('.ktemp'+k).html(kt);
						kt="";
					});
				}
				
				
				//충남
				var ct = "";
				if(ctemp != null){

					$.each(ctemp,function(c){
	
						ct += '<a href="<c:url value="/getCam.do?contentId='+ctemp[c].contentId+'"/>" tabindex="-1">';
						ct += '<div class="them_item">';
						ct += '<img src="'+ctemp[c].firstImageUrl+'" class="imgFit">';
						ct += '<p class="them_tt">['+ctemp[c].doNm+ctemp[c].sigunguNm+'] <span style="float:right;"><br>'+ctemp[c].facltNm+'</span></p></div></a>';
			;	
						
						$('.ctemp'+c).html(ct);
						ct="";
					});
				}
				
				//전남
				var jt = "";
				if(jtemp != null){

					$.each(jtemp,function(j){
	
						jt += '<a href="<c:url value="/getCam.do?contentId='+jtemp[j].contentId+'"/>" tabindex="-1">';
						jt += '<div class="them_item">';
						jt += '<img src="'+jtemp[j].firstImageUrl+'" class="imgFit">';
						jt += '<p class="them_tt">['+jtemp[j].doNm+jtemp[j].sigunguNm+'] <span style="float:right;"><br>'+jtemp[j].facltNm+'</span></p></div></a>';
							
						
						$('.jtemp'+j).html(jt);
						jt="";
					});
				}
				
				//경북
				var ggt = "";
				if(ggtemp != null){

					$.each(ggtemp,function(b){
	
						ggt += '<a href="<c:url value="/getCam.do?contentId='+ggtemp[b].contentId+'"/>" tabindex="-1">';
						ggt += '<div class="them_item">';
						ggt += '<img src="'+ggtemp[b].firstImageUrl+'" class="imgFit">';
						ggt += '<p class="them_tt">['+ggtemp[b].doNm+ggtemp[b].sigunguNm+'] <span style="float:right;"><br>'+ggtemp[b].facltNm+'</span></p></div></a>';	
						
						
						$('.ggtemp'+b).html(ggt);
						ggt="";
					});
				}
				
/* 				$('#Seoul1').html('<div class="simg"><img src="<c:url value="'+gtemp[0].firstImageUrl+'"/>"/>'+gtemp[0].facltNm+'</div><div>'+gtemp[0].sbrsCl+'</div>');
				$('#Seoul2').html('<div class="simg"><img src="<c:url value="'+gtemp[1].firstImageUrl+'"/>" />'+gtemp[1].facltNm+'</div><div>'+gtemp[1].sbrsCl+'</div>');
				$('#Seoul3').html('<div class="simg"><img src="<c:url value="'+gtemp[2].firstImageUrl+'"/>"/>'+gtemp[2].facltNm+'</div><div>'+gtemp[2].sbrsCl+'</div>'); */
		});	
				
	});
	
</script>
<script type="text/javascript">
/*
searchlist이용 
1.키워드 o, 주소1, 주소2 
2.키워드 O, 주소1
3.키워드 O, 주소2
4.키워드 O

5.키워드 X, 주소1, 주소2
6.키워드 X, 주소1
7.키워드 X, 주소2
8.키워드 X


*/
$(function(){
	 $("form[name=camSearchForm]").submit(function(){
		 
		var searchKrwd_f = $("#searchKrwd_f").val();
	    var select_01 = $(".select_01").val();
	    var select_02 = $(".select_02").val();
		
	    //키워드 O
	    if(searchKrwd_f != ""){
	    	if(select_01 == "" && select_02 != ""){
	    		alert("시/도를 선택해주세요");
	    		event.preventDefault();
		    	return false;
	    	}	
	    }
	    
	  	//키워드 X
	    else{ 
	    	if(select_01 == "" && select_02 != ""){
	    		alert("시/도를 선택해주세요");
	    		event.preventDefault();
		    	return false;
	    	}else if(select_01 == "" && select_02 == ""){
	    		alert("키워드나 지역을 선택해주세요");
	    		event.preventDefault();
		    	return false;
	    	}
	    }
	});
});

</script>
<script type="text/javascript">
$(function(){
		//캠핑장 슬라이드
		$('.item_w').slick({
		  slidesToShow: 3,
		  slidesToScroll: 1,
		  autoplay: true,
		  autoplaySpeed: 2000
		});

});
</script>
<script type="text/javascript">
$(function(){
/////메인페이지에서 캠핑 팁 리스트 호출하는 ajax//////////
	$.ajax({
		url: '<c:url value="/tipMain.do"/>',
		type:'get',
		dataType:'text',
		success: function(data){
				$('#tip').append(data);
		}
	});
	
/////메인페이지에서 후기 리스트 호출하는 ajax//////////
	$.ajax({
		url: '<c:url value="/reviewMain.do"/>',
		type:'get',
		dataType:'text',
		success: function(data){
				$('#review').append(data);
		}
	});
	
/////메인페이지에서 공지사항 리스트 호출하는 ajax//////////
	$.ajax({
		url: '<c:url value="/noticeMain.do"/>',
		type:'get',
		dataType:'text',
		success: function(data){
				$('#noticeMain').append(data);
		}
	});
	

});
</script>
<script type="text/javascript">
$(function(){
	var optionParams={
		q:"캠핑요리",
		part:"snippet",
		key:"AIzaSyAXsQVujPkAKbIEz3VCU9RQDNtVtBnuTic",
		maxResults:50,
		regionCode:"KR"
	 };

	//한글을 검색어로 전달하기 위해선 url encoding 필요!
	optionParams.q=encodeURI(optionParams.q);

	var url="https://www.googleapis.com/youtube/v3/search?";
	for(var option in optionParams){
		url+=option+"="+optionParams[option]+"&";
	}

	//url의마지막에 붙어있는 & 정리
	 url=url.substr(0, url.length-1);
			$.ajax({
				method: "GET",
				url: url,
			}).done(function(msg) {

				var item = msg.items;
				console.log(item);

				var st = "";
				
				$.each(item, function(i){
					var videoId = "";
					var title1 = "";
					var title2 = "";
					var len = "";
					
					if(item[i].snippet.title != null){
						len = item[i].snippet.title.length;
					}
					
					if(len < 100){
						title1 = item[i].snippet.title.substring(0,21);
						title2 = item[i].snippet.title.substring(21,len);
						
						title2 = "...";
						item[i].snippet.title = title1 + title2;
					}
					
					if(item[i].id.videoId != null){
						videoId = item[i].id.videoId;
					}else if(item[i].id.playlistId != null){
						videoId = item[i].id.playlistId;
					}
					st += '<i class="fa fa-angle-right" aria-hidden="true"></i> &nbsp;';
					st += '<a href="<c:url value="getFood.do?videoId='+videoId+'"/>">'+item[i].snippet.title+'</a>';
					
					$('.food'+i).html(st);
					st="";
				}); 
			});
	});
</script>
<input type="hidden" id="pw" value=${ memPw}>
		<div class="main_search">
			<span class="main_search_title">전국  캠핑장을 한 곳에서 찾으세요!</span>
		</div>
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
	
<section id="section5">
	<h2>
		<span class="skip">파도소리 들리는 감성 캠핑</span>
	</h2>
	<div class="section_05">
		<div class="layout">
			<!--타이틀-->
			<div class="title_w">
				<h2 class="tt01">
					파도소리 들리는 감성 캠핑
				</h2>
				<span class="s_tt">한번쯤은 꼭 가볼만한 캠핑장! 추천해요~ </span>
			</div>
			<!--//타이틀-->

			<!--테마슬라이드-->
			<div class="them_cont02">
				<div class="section_05_01">
					<p class="img_box">
						<img src="./img/banner1.jpg"  class="imgFit">
								</p>
					<div class="them_cont">
						<p>
							<span>추천해요</span>
						</p>
						<span>바다와 파도소리, 밤이면 별이 쏟아지는 해변에서 즐기는 감성캠핑. 그곳으로 떠나요~~</span>
					</div>
				</div>
				<div class="item_w">

					<!-- 경기도 -->
					<div class="slick-slide gtemp0" >
					</div>
						
					<div class="slick-slide gtemp1" >
					</div>
						
					<div class="slick-slide gtemp2" >
					</div>
					
					<!-- 인천 -->	
					<div class="slick-slide itemp0" >
					</div>
						
					<div class="slick-slide itemp1">
					</div>
						
					<div class="slick-slide itemp2" >
					</div>
					
			
					<!-- 강원도 -->	
					<div class="slick-slide ktemp0" >
					</div>
						
					<div class="slick-slide ktemp1" >
					</div>
						
					<div class="slick-slide ktemp2" >
					</div>
					
				
					<!-- 충남 -->	
					<div class="slick-slide ctemp0" >
					</div>
						
					<div class="slick-slide ctemp1" >
					</div>
						
					<div class="slick-slide ctemp2" >
					</div>	
					
						
					<!-- 전남 -->	
					<div class="slick-slide jtemp0" >
					</div>
						
					<div class="slick-slide jtemp1" >
					</div>
						
					<div class="slick-slide jtemp2" >
					</div>	
					
					<!-- 경북 -->	
					<div class="slick-slide ggtemp0" >
					</div>
						
					<div class="slick-slide ggtemp1" >
					</div>
						
					<div class="slick-slide ggtemp2" >
					</div>	
					</div>
			</div>
			<!--//테마슬라이드-->
			<div class="thema_bg"></div>
		</div>
		
		<!--S:비쥬얼영역-->
		<div class="thema_bg_w2">
			<div class="thema_bg_01">
				<img src="./img/main.jpg" >
			</div>
		</div>
		<!--E:비쥬얼영역-->
	</div>
</section>
<section id="notice">
<div id="comm" class="maininfo">
	<div class="m-wrap">
		<!--community-->					
			<dl id="tip"></dl> 
							
			<dl id="review"></dl>								

							
			<dl id="food"> 
				<dt class="sbj">
					<img src="./img/bbsico_1.svg" alt="" height="50"><br>
					캠핑 음식					<a href="<c:url value='/food.do'/>" class="fr more" title="캠핑 음식 더 보기"><svg x="0px" y="0px" viewBox="0 0 42 42" style="enable-background:new 0 0 42 42;" xml:space="preserve" width="16px" height="16px"><polygon points="42,20 22,20 22,0 20,0 20,20 0,20 0,22 20,22 20,42 22,42 22,22 42,22 " fill="#888"></polygon></svg></a>
				</dt>
																
				<dd class="food0"></dd> 
				
				<dd class="food1"></dd> 
				
				<dd class="food2"></dd> 
				
				<dd class="food3"></dd> 
				
				<dd class="food4"></dd>
				 
				<dd class="food5"></dd> 
				
				<dd class="food6"></dd> 
			</dl> 

							
			<dl id="noticeMain"></dl> 

		<div class="clear"></div>

	</div>	
</div>

</section>
</div>


<%@include file="common/footer.jsp" %>

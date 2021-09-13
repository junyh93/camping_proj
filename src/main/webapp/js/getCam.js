$(function(){
	var url = 'http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/imageList';
	var queryParams = '?' + encodeURIComponent('ServiceKey') + '='+'Po8b3s%2BelMewEpuJuSSNclaKWDReZThq%2FrOSAU0x%2BqHff1gACrKi1G3eez3LwxPQLMoN9ntPatUmspBAZTJd5w%3D%3D'; 
	var contentID = Number($('#contentId').val());

	queryParams += '&' + encodeURIComponent('MobileOS') + '=' + encodeURIComponent('ETC'); 
	queryParams += '&' + encodeURIComponent('MobileApp') + '=' + encodeURIComponent('AppTest');
	queryParams += '&' + encodeURIComponent('contentId') + '=' + encodeURIComponent(contentID); /**/
	queryParams += '&_type=json';

	$.ajax({
			method: "GET",
			url: url + queryParams,
	}).done(function(msg) {

		var item = msg.response.body.items.item;
		var img = "";
		var iimg = "";
		var temp = [];
		var ml = 5;
		var mt = 0;
		console.log(item);
		
	
	
		
		
		//주요사진
		if(item != null){
			if(Array.isArray(item)){
				//캠핑장 대표 사진 3장 랜덤
				$.each(item,function(i){
					if(item[i].imageUrl != null ){
						temp.push(item[i].imageUrl);
						}
					});
				
				for(i=0; i < 3; i++){
					temp = item[Math.floor(Math.random() * item.length)];
					
					iimg += '<li class="col_03 img_box">';
					iimg += '<img src="'+temp.imageUrl+'" class="imgFit">';

					}
			
					
				$.each(item,function(i){
					img += '<li class="ug-thumb-wrapper ug-tile ug-tile-clickable ug-thumb-ratio-set" style="float:left; z-index: 1; background-color: rgb(240, 240, 240); display: block; width: 225px; height: 149px; position: absolute; margin: 0px; left: '+ml+'px; top: '+mt+'px; opacity: 1;">';
					/* img += '<div class="ug-thumb-overlay" style="background-color: rgba(0, 0, 0, 0.4); width: 225px; height: 149px; left: 0px; top: 0px; position: absolute; margin: 0px; opacity: 0;"></div>'; */
					img += '<img src="'+ item[i].imageUrl+'" class="ug-thumb-image ug-trans-enabled" style="width: 225px; height: 150px; left: 0px; top: 0px;"></li>';
					
					ml += 228;					

					if(ml == 1145){
						ml =5;
						mt += 152;
					}
					
					if(mt == 608){
						mt =0;
					}

				});
			}else{
				$('.camp_intro_image').hide();
				i=1
				img += '<div class="ug-thumb-wrapper ug-tile ug-tile-clickable ug-thumb-ratio-set" style="z-index: 1; background-color: rgb(240, 240, 240); display: block; width: 225px; height: 149px; position: absolute; margin: 0px; left: 5px; top: 0px; opacity: 1;">';
				img += '<div class="ug-thumb-overlay" style="background-color: rgba(0, 0, 0, 0.4); width: 225px; height: 149px; left: 0px; top: 0px; position: absolute; margin: 0px; opacity: 0;">';
			 	img += '<div class="ug-tile-icon ug-button-play ug-icon-zoom" style="position: absolute; margin: 0px; left: 94px; top: 56px;"></div></div>';
				img += '<img src="'+ item.imageUrl+'" class="ug-thumb-image ug-trans-enabled" style="width: 225px; height: 150px; left: 0px; top: 0px;"></div>';
			}
	
		}
		
		$('.camp_intro_image').html(iimg);
		$('.ug-tiles-rest-mode').html(img);
		
	});	
});

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
		var st = "";

		
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
			var homepage = item.homepage == null ? "#" : item.homepage;
			var lineIntro = item.lineIntro == null ? "-" : item.lineIntro;
			var intro = item.intro == null ? " " : item.intro;
			var modifiedtime = item.modifiedtime == null ? " " : item.modifiedtime;
			var lctCl = item.lctCl == null ? "-" : item.lctCl;
			var induty = item.induty == null ? "-" : item.induty;
			var operPdCl = item.operPdCl == null ? "-" : item.operPdCl;
			var operDeCl = item.operDeCl == null ? "-" : item.operDeCl;
			var resveCl = item.resveCl == null ? "-" : item.resveCl;
			var posblFcltyCl = item.posblFcltyCl == null ? "-" : item.posblFcltyCl;
			var gnrlSiteCo = item.gnrlSiteCo == 0 ? " " : "일반야영장("+item.gnrlSiteCo+")면";
			var autoSiteCo = item.autoSiteCo == 0 ? " " : "자동차야영장("+item.autoSiteCo+")면";
			var glampSiteCo = item.glampSiteCo == 0 ? " " : "글램핑("+item.glampSiteCo+")면"; 
			var caravSiteCo = item.caravSiteCo == 0 ? " " : "카라반("+item.caravSiteCo+")면";
			var siteBottomCl1 = item.siteBottomCl1 == 0 ? " " : "잔디("+item.siteBottomCl1+")";
			var siteBottomCl2 = item.siteBottomCl2 == 0 ? " " : "파쇄석("+item.siteBottomCl2+")";
			var siteBottomCl3 = item.siteBottomCl3 == 0 ? " " : "테크("+item.siteBottomCl3+")";
			var siteBottomCl4 = item.siteBottomCl4 == 0 ? " " : "자갈("+item.siteBottomCl4+")";
			var siteBottomCl5 = item.siteBottomCl5 == 0 ? " " : "맨흙("+item.siteBottomCl5+")";
			var glampInnerFclty = item.glampInnerFclty == null ? " " : item.glampInnerFclty;
			var caravInnerFclty = item.caravInnerFclty == null ? " " : item.caravInnerFclty;
			var animalCmgCl = item.animalCmgCl == null ? " " : item.animalCmgCl;
			var eqpmnLendCl = item.eqpmnLendCl == null ? " " : item.eqpmnLendCl;
			var brazierCl = item.brazierCl == null ? " " : item.brazierCl;
			var posblFcltyCl = item.posblFcltyCl == null ? " " : item.posblFcltyCl;
			var glampInnerFclty = item.glampInnerFclty == null ? " " : item.glampInnerFclty;
			var caravInnerFclty = item.caravInnerFclty == null ? " " : item.caravInnerFclty;
			var themaEnvrnCl = item.themaEnvrnCl == null ? "" : item.themaEnvrnCl;
			var resveUrl = item.resveUrl == null ? "#" : item.resveUrl;
			
			$('#book').val(resveUrl);
			$('#homepage').val(homepage);
			$('#imgUrl').val(firstImageUrl);
			$('#tel').val(tel);
			
			//태그란 입지구분 및 테마환경
				var lc = "";

				if(lctCl != "-"){
					lct = lctCl.split(',');
					$.each(lct,function(i){
						lc += "<li>#"+lct[i]+"</li>";
						
						$('.tag_list').html(lc);
					});
				}
				if(themaEnvrnCl != ""){
					thema = themaEnvrnCl.split(',');
					$.each(thema,function(i){
						lc += "<li>#"+thema[i]+"</li>";
						
						$('.tag_list').html(lc);
					});
				}
				
				//상당 배너 사진 - 입지구분에 따라 사진 변경
				if(lct[0] == '섬'){
					$('.camp_bg_01').css({'background': 'url(/camping/img/island.jfif)','background-repeat':'no-repeat', 'background-position':'center center','background-color' : 'linear-gradient( rgba(0, 0, 0, 0.5)'});
				}else if(lct[0] == '산'){
					$('.camp_bg_01').css({'background': 'url(/camping/img/mountain.jfif)','background-repeat':'no-repeat', 'background-position':'center bottom','background-color' : 'linear-gradient( rgba(0, 0, 0, 0.5)'});
				}else if(lct[0] == '숲'){
					$('.camp_bg_01').css({'background': 'url(/camping/img/forest.jfif)','background-repeat':'no-repeat', 'background-position':'center center','background-color' : 'linear-gradient( rgba(0, 0, 0, 0.5)'});
				}else if(lct[0] == '해변'){
					$('.camp_bg_01').css({'background': 'url(/camping/img/beach.jfif)','background-repeat':'no-repeat', 'background-position':'center center','background-color' : 'linear-gradient( rgba(0, 0, 0, 0.5)'});
				}else if(lct[0] == '호수'){
					$('.camp_bg_01').css({'background': 'url(/camping/img/river.jfif)','background-repeat':'no-repeat', 'background-position':'center center','background-color' : 'linear-gradient( rgba(0, 0, 0, 0.5)'});
				}else if(lct[0] == '강'){
					$('.camp_bg_01').css({'background': 'url(/camping/img/river.jfif)','background-repeat':'no-repeat', 'background-position':'center center','background-color' : 'linear-gradient( rgba(0, 0, 0, 0.5)'});
				}else if(lct[0] == '도심'){
					$('.camp_bg_01').css({'background': 'url(/camping/img/city.jfif)','background-repeat':'no-repeat', 'background-position':'center center','background-color' : 'linear-gradient( rgba(0, 0, 0, 0.5)'});
				}else if(lct[0] == '계곡'){
					$('.camp_bg_01').css({'background': 'url(/camping/img/waterfall.jfif)','background-repeat':'no-repeat', 'background-position':'center bottom','background-color' : 'linear-gradient( rgba(0, 0, 0, 0.5)'});
				}
				
			else if(lctCl == "-" && themaEnvrnCl == " " || themaEnvrnCl == "일몰명소"){
				$('.camp_tag').hide();
				$('.camp_bg_01').css({'background': 'url(/camping/img/them.jfif)','background-repeat':'no-repeat', 'background-position':'center bottom'});
			}
			
			
			//캠핑장 소개
			if(intro != " "){
				st += "<span>"+intro+"</span>";
				st += "<span class='date_info'>최종 정보 수정일 : "+modifiedtime+"</span>"
				$('.intro').html(st);
			}else{
				$('.intro').hide();
			}	
			
			st = "";
			
			//부대시설
			var sbrsCl = item.sbrsCl;
			
			if(sbrsCl !=null){
				st += "<ul>";
				
					if(sbrsCl.includes('전기') == true){
						st += "<li><img src='/camping/img/ico_volt.png'><br><span>전기</span></li>";
					}
					if(sbrsCl.includes('무선인터넷') == true){
						st += "<li><img src='/camping/img/ico_wifi.png'><br><span>와이파이</span></li>";
					}
					if(sbrsCl.includes('놀이터') == true){
						st += "<li><img src='/camping/img/ico_play.png'><br><span>놀이터</span></li>";
					}
					if(sbrsCl.includes('운동장') == true){
						st += "<li><img src='/camping/img/ico_playground.png'><br><span>운동장</span></li>";
					}
					if(sbrsCl.includes('운동시설') == true){
						st += "<li><img src='/camping/img/ico_health.png'><br><span>운동시설</span></li>";
					}
					if(sbrsCl.includes('마트.편의점') == true){
						st += "<li><img src='/camping/img/ico_mart.png'><br><span>마트.편의점</span></li>";
					}
					if(sbrsCl.includes('장작판매') == true){
						st += "<li><img src='/camping/img/ico_fire.png'><br><span>장작판매</span></li>";
					}
					if(sbrsCl.includes('온수') == true){
						st += "<li><img src='/camping/img/ico_hotwater.png'><br><span>온수</span></li>";
					}
					if(sbrsCl.includes('산책로') == true){
						st += "<li><img src='/camping/img/ico_walk.png'><br><span>산책로</span></li>";
					}
					if(sbrsCl.includes('트렘폴린') == true){
						st += "<li><img src='/camping/img/ico_trampoline.png'><br><span>트렘폴린</span></li>";
					}
					if(sbrsCl.includes('물놀이장') == true){
						st += "<li><img src='/camping/img/ico_waterfool.png'><br><span>물놀이장</span></li>";
					}
					
				st += "</ul>";
				$('.camp_item_g').html(st);
			}else{
				$('.sbrsCl').hide();
				$('.camp_item_g').hide();
			}
			
			st = "";
			
			//기타 주요시설
			if(gnrlSiteCo != " "){
				st += "<li>"+gnrlSiteCo+"</li>"
				$('.site').html(st);
			}
			if(autoSiteCo != " "){
				st += "<li>"+autoSiteCo+"</li>"
				$('.site').html(st);
			}
			if(glampSiteCo != " "){
				st += "<li>"+glampSiteCo+"</li>"
				$('.site').html(st);
			}
			if(caravSiteCo != " "){
				st += "<li>"+caravSiteCo+"</li>"
				$('.site').html(st);		
			}
			
			st = "";
			
			//주요이용가능시설
			if(posblFcltyCl != " "){
				posblF = posblFcltyCl.split(',');
				$.each(posblF,function(i){
					st += "<li>"+posblF[i]+"</li>";
				})
				$('.posblFcltyCl').html(st);
			}else{
				$('.tr_posblFcltyCl').hide();
			}
			
			st = "";
			
			//글램핑 내부시설
			if(glampInnerFclty != " "){
				var gl = "";
				glamp = glampInnerFclty.split(',');
				$.each(glamp,function(i){
					gl += "<li>"+glamp[i]+"</li>";
				})
				$('.glamp').html(gl);
			}else if(glampInnerFclty == " "){
				$('.tr_glamp').hide();
			}
			
			//카라반 내부시설
			if(caravInnerFclty != " "){
				var ca = "";
				carav = caravInnerFclty.split(',');
				$.each(carav,function(i){
					ca += "<li>"+carav[i]+"</li>";
				})
				$('.carav').html(ca);
			}else{
				$('.tr_carav').hide();
			}
			
			//바닥 형태
			if(siteBottomCl1 != " "){
				st += "<li>"+siteBottomCl1+"</li>"
				$('.bottom').html(st);
			}
			if(siteBottomCl2 != " "){
				st += "<li>"+siteBottomCl2+"</li>"
				$('.bottom').html(st);
			}
			if(siteBottomCl3 != " "){
				st += "<li>"+siteBottomCl3+"</li>"
				$('.bottom').html(st);
			}
			if(siteBottomCl4 != " "){
				st += "<li>"+siteBottomCl4+"</li>"
				$('.bottom').html(st);
			}
			if(siteBottomCl5 != " "){
				st += "<li>"+siteBottomCl5+"</li>"
				$('.bottom').html(st);
			}
			if(siteBottomCl1 == " " && siteBottomCl2 == " " && siteBottomCl3 == " " && siteBottomCl4 == " " && siteBottomCl5 == " "){
				$('.tr_bottom').hide();
			}
			
			st = "";
			
			//캠핑장비 대여
			if(eqpmnLendCl != " "){
				$('.eqp').html(eqpmnLendCl);
				$('.brazierCl').html(brazierCl);
			}else{
				$('.tr_eqp').hide();
				$('.tr_brazierCl').hide();
			}
			
			

		$('.imageUrl').html("<img src='"+firstImageUrl+"' width='100%'/>");
		$('#facltNm').html(facltNm);
		$('#addr1').html(addr1);
		$('#tel').html(tel);
		$('#homepage').html("<a href='"+homepage+"' target='_BLANK' title='새창열림'>홈페이지 바로가기</a>");
		$('#lctCl').html(lctCl);//캠핑장 환경 - 산 바다
		$('#induty').html(induty);// 캠핑장 유형 - 일반야영장 글램핑 자동차야영장 등
		$('#operPdCl').html(operPdCl);//운영기간 - 봄,가을
		$('#operDeCl').html(operDeCl);// 운영일 - 평일+주말
		$('#resveCl').html(resveCl);// 예약구분 - 온라인실시간예약 전화예약 등
		$('#posblFcltyCl').html(posblFcltyCl);// 주변이용가능시설 - 산책로 등
		
		
		//contents
		$('#facltNm').val(facltNm);
		$('#addr').val(addr1);
		$('.camp_name').html(facltNm);
		$('.mt_50').html(facltNm);
		$('.camp_s_tt').html(lineIntro);
		$('.animal').html(animalCmgCl);//애완동물 출입여부
		
		$('#mapX').val(item.mapX);
		$('#mapY').val(item.mapY);
		

});	
});	

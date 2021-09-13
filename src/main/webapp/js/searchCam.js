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
$(function(){
	var url = ''; 
	var searchKrwd = $('#searchKrwd').val();
	var c_do = $('#cdo').val();
	var c_signgu = $('#csigngu').val();
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
		
		
		

		
		$.each(item, function(i){
			
			
	
			item[i].firstImageUrl = item[i].firstImageUrl == null ? "/camping/img/캠핑야경.jpg" : item[i].firstImageUrl; 
			item[i].lineIntro = item[i].lineIntro == null ? " " : "<span class='camp_stt'>"+item[i].lineIntro +"</span>";
			item[i].tel = item[i].tel == null ? " " : "<li class='call_num'>"+item[i].tel+"</li></ul>";
			
			var sttr = "";

			var sbrsCl = item[i].sbrsCl;
			
			
			if(sbrsCl == null){
				sbrsCl = "-";
				/* sttr += "<li><span>"+sbrsCl+"</span></li>"; */
			}else{
			
				sttr += "<div class='camp_item_box'><ul>";
				
				if(sbrsCl.includes('전기') == true){
					sttr += "<li><img src='/camping/img/ico_volt.png'><br><span>전기</span></li>";
				}
				if(sbrsCl.includes('무선인터넷') == true){
					sttr += "<li><img src='/camping/img/ico_wifi.png'><br><span>와이파이</span></li>";
				}
				if(sbrsCl.includes('놀이터') == true){
					sttr += "<li><img src='/camping/img/ico_play.png'><br><span>놀이터</span></li>";
				}
				if(sbrsCl.includes('운동장') == true){
					sttr += "<li><img src='/camping/img/ico_playground.png'><br><span>운동장</span></li>";
				}
				if(sbrsCl.includes('운동시설') == true){
					sttr += "<li><img src='/camping/img/ico_health.png'><br><span>운동시설</span></li>";
				}
				if(sbrsCl.includes('마트.편의점') == true){
					sttr += "<li><img src='/camping/img/ico_mart.png'><br><span>마트.편의점</span></li>";
				}
				if(sbrsCl.includes('장작판매') == true){
					sttr += "<li><img src='/camping/img/ico_fire.png'><br><span>장작판매</span></li>";
				}
				if(sbrsCl.includes('온수') == true){
					sttr += "<li><img src='/camping/img/ico_hotwater.png'><br><span>온수</span></li>";
				}
				if(sbrsCl.includes('산책로') == true){
					sttr += "<li><img src='/camping/img/ico_walk.png'><br><span>산책로</span></li>";
				}
				if(sbrsCl.includes('트렘폴린') == true){
					sttr += "<li><img src='/camping/img/ico_trampoline.png'><br><span>트렘폴린</span></li>";
				}
				if(sbrsCl.includes('물놀이장') == true){
					sttr += "<li><img src='/camping/img/ico_waterfool.png'><br><span>물놀이장</span></li>";
				}
				 sttr += "</ul></div>";
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
			st += '<a href="/camping/getCam.do?contentId='+item[i].contentId+'" class="dc_none" ><div class="img_box">';
			st += '<img src="'+ item[i].firstImageUrl+'"></div></a>';
			st += '<div class="camp_cont">';
			st += '<h2 class="camp_tt">';
			st += '<a href="/camping/getCam.do?contentId='+item[i].contentId+'">['+item[i].doNm+' '+item[i].sigunguNm+'] '+item[i].facltNm +'</a></h2>';
			st += item[i].lineIntro;
			st += '<span class="camp_txt"> ';
			st += '<a href="/camping/getCam.do?contentId='+item[i].contentId+'">'+item[i].intro+'</a></span>';
			st += '	<ul class="camp_info01">';
			st += '<li class="addr">'+item[i].addr1+'</li>';
			st += item[i].tel;
/* 			st += '<div class="camp_item_box">';
			st += '<ul>'; */
			st +=  sttr;
			/* st += '</ul></div>'; */
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
	$('.em_org').append(ccnt);
});
});
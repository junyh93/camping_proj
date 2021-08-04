<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="./js/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<title>예약한 캠팡장 검색</title>
</head>

<script type="text/javascript">

$(function(){
	$('#search').click(function(){

	var url = 'http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/searchList'; 
	var queryParams = '?' + encodeURIComponent('ServiceKey') + '='+'Po8b3s%2BelMewEpuJuSSNclaKWDReZThq%2FrOSAU0x%2BqHff1gACrKi1G3eez3LwxPQLMoN9ntPatUmspBAZTJd5w%3D%3D'; 
	var keyword = $('#searchKrwd_f').val();
	
	queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); 
	queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10000'); 
	queryParams += '&' + encodeURIComponent('MobileOS') + '=' + encodeURIComponent('ETC'); 
	queryParams += '&' + encodeURIComponent('MobileApp') + '=' + encodeURIComponent('AppTest'); 
	queryParams += '&' + encodeURIComponent('keyword') + '=' + encodeURIComponent(keyword);
	queryParams += '&_type=json';
	
	var mapX = "";
	var mapY = "";
	var facltNm = "";
	
	$.ajax({
			method: "GET",
			url: url + queryParams,
	}).done(function(msg) {

			console.log(msg.response.body.items.item)
			
			var item = msg.response.body.items.item;
			var str ='';
			var i = '';
			var result = "";
			
			//item이 배열형일 경우
			if(Array.isArray(item)){
				$.each(item, function(i){
					
					str += '<div class="inf">';
					str += '<div style="width: 30px; float:left; cursor:pointer;">' + (i+1) + '</div>'; //순서
					str += '<input type="text" readonly="readonly" id="facltNm" style="cursor:pointer; width:230px; border:none; outline:none;" value="' + item[i].facltNm + '">'; //시설명
					str += '<input type="text" readonly="readonly" style="cursor:pointer; width:340px; border:none; outline:none;" value="' + item[i].addr1 + '">'; //시설주소
					str += '<input type="hidden" value="' + item[i].contentId + '">'; //컨텐트아이디
					str += '<input type="hidden" value="' + item[i].lineIntro + '">'; //한줄소개
					str += '<input type="hidden" value="' + item[i].tel + '">'; //전화번호
					str += '<input type="hidden" value="' + item[i].homepage + '">'; //홈페이지
					str += '<input type="hidden" value="' + item[i].firstImageUrl + '">'; //첫이미지경로
					str += '<input type="hidden" value="' + item[i].mapX + '">'; //위치정보
					str += '<input type="hidden" value="' + item[i].mapY + '">'; //위치정보
					str += '</div>'
				});
				
			//item이 하나의 값만 가질 경우	
			}else{
				i = 1;
				str += '<div class="inf">';
				str += '<div style="width: 30px; float:left;">' + i + '</div>'; //순서
				str += '<input type="text" readonly="readonly" id="facltNm" style="cursor:pointer; width:230px; border:none; outline:none;" value="' + item.facltNm + '">'; //시설명
				str += '<input type="text" readonly="readonly" style="cursor:pointer; width:340px; border:none; outline:none;" value="' + item.addr1 + '">'; //시설주소
				str += '<input type="hidden" value="' + item.contentId + '">'; //컨텐트아이디
				str += '<input type="hidden" value="' + item.lineIntro + '">'; //한줄소개
				str += '<input type="hidden" value="' + item.tel + '">'; //전화번호
				str += '<input type="hidden" value="' + item.homepage + '">'; //홈페이지
				str += '<input type="hidden" value="' + item.firstImageUrl + '">'; //첫이미지경로
				str += '<input type="hidden" value="' + item.mapX + '">'; //위치정보
				str += '<input type="hidden" value="' + item.mapY + '">'; //위치정보
				str += '</div>'

			}
			
			$('.item').html(str);
			
			$('.inf').hover(function(){
				$(this).children().eq(0).css('color','gray'); //숫자
				$(this).children().eq(1).css('color','gray'); //시설명
				$(this).children().eq(2).css('color','gray'); //시설주소		
		    		}, function() {
    			$(this).children().eq(0).css('color','black');
				$(this).children().eq(1).css('color','black');
				$(this).children().eq(2).css('color','black');
			});
			
			/* 캠핑장명 저장 */
		
			$('.inf').click(function(){
				
					facltNm = $(this).children().eq(1).val();
					addr = $(this).children().eq(2).val();
					contentId = $(this).children().eq(3).val();
					lineIntro = $(this).children().eq(4).val();
					tel = $(this).children().eq(5).val();
					homePage = $(this).children().eq(6).val();
					imgUrl = $(this).children().eq(7).val();
					mapX = $(this).children().eq(8).val();
					mapY = $(this).children().eq(9).val();
		
		
				result = confirm(facltNm + "으로 하시겠습니까?");
				
				if(result == true){
					
					opener.document.getElementById("facltNm").value = facltNm;
					opener.document.getElementById("addr").value = addr;
					opener.document.getElementById("contentId").value = contentId;
					opener.document.getElementById("lineIntro").value = lineIntro;
					opener.document.getElementById("tel").value = tel;
					opener.document.getElementById("homePage").value = homePage;
					opener.document.getElementById("imgUrl").value = imgUrl;
					opener.document.getElementById("mapX").value = mapX;
					opener.document.getElementById("mapY").value = mapY;

					window.close();
				}
		    });
		});
		
	});
});
</script>



<body>
	<h2>캠핑장 검색</h2>
	  	<label>예약한 캠핑장명을 검색하세요.</label>
	  	<div>
	  	<input type="text" class="keyword2" id="searchKrwd_f" name="searchKrwd" placeholder="검색어를 입력하세요.">
            <button type="button" id="search">검색하기</button>
		</div>
		<div class=item></div>
		
		
</body>
		

</html>
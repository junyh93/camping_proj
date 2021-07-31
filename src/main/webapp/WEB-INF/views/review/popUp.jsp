<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="./js/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<title>popUppage</title>
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
			var ar = "";
			var result = "";
			
			//item이 배열형일 경우
			if(Array.isArray(item)){
				$.each(item, function(i){
					str += '<tr class="k"'+ i +'><td>'+ (i+1) +'</td><td>'+ item[i].facltNm + '</td><td>' + item[i].addr1 +'</td><td style="visibility:hidden;">'+ item[i].contentId +'</td><td style="visibility:hidden;">' + item[i].lineIntro + '</td><td style="visibility:hidden;">' + item[i].tel + '</td><td style="visibility:hidden;">' + item[i].homepage + '</td><td style="visibility:hidden;">'+item[i].firstImageUrl+'</td><td style="visibility:hidden;">' + item[i].mapX + '</td><td style="visibility:hidden;">' + item[i].mapY + '</td>';
					str += '</tr>';		
				});
			}else{//item이 하나의 값만 가질 경우
				str += '<tr class="k"><td>'+ 1 +'</td><td>'+ item.facltNm + '</td><td>' + item.addr1 +'</td><td style="visibility:hidden;">'+ item.contentId +'</td><td style="visibility:hidden;">' + item.lineIntro + '</td><td style="visibility:hidden;">' + item.tel + '</td><td style="visibility:hidden;">' + item.homepage + '</td><td style="visibility:hidden;">'+item.firstImageUrl+'</td><td style="visibility:hidden;">' + item.mapX + '</td><td style="visibility:hidden;">' + item.mapY + '</td>';
				str += '</tr>';		
			}
			
			$('.item').html(str);
			
			/* 캠핑장명 저장 */
			$('.k' + i).click(function(){
				facltNm = $(this).children().eq(1).text();
				addr = $(this).children().eq(2).text();
				contentId = $(this).children().eq(3).text();
				lineIntro = $(this).children().eq(4).text();
				tel = $(this).children().eq(5).text();
				homePage = $(this).children().eq(6).text();
				imgUrl = $(this).children().eq(7).text();
				mapX = $(this).children().eq(8).text();
				mapY = $(this).children().eq(9).text();
				
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
	<h2>팝업창</h2>
	  	<label>예약한 캠핑장명을 검색하세요.</label>
	  	<div>
	  	<input type="text" class="keyword2" id="searchKrwd_f" name="searchKrwd" placeholder="검색어를 입력하세요.">
            <button type="button" id="search">검색하기</button>
		</div>
		<div><table class="item"></table></div>
</body>
		

</html>
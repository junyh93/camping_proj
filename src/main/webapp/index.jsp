<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- jquery -->
<!-- <script class="u-script" type="text/javascript" src="js/jquery.js" defer=""></script> -->
<script src="./js/jquery-3.5.1.min.js"></script>

<script type="text/javascript">

	var url = 'http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/searchList'; 
	var queryParams = '?' + encodeURIComponent('ServiceKey') + '='+'Po8b3s%2BelMewEpuJuSSNclaKWDReZThq%2FrOSAU0x%2BqHff1gACrKi1G3eez3LwxPQLMoN9ntPatUmspBAZTJd5w%3D%3D'; 
	queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); 
	queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); 
	queryParams += '&' + encodeURIComponent('MobileOS') + '=' + encodeURIComponent('ETC'); 
	queryParams += '&' + encodeURIComponent('MobileApp') + '=' + encodeURIComponent('AppTest'); 
	queryParams += '&' + encodeURIComponent('keyword') + '=' + encodeURIComponent('노원');
/* 	queryParams += '&' + encodeURIComponent('mapX') + '=' + encodeURIComponent('128.6142847'); //경도
	queryParams += '&' + encodeURIComponent('mapY') + '=' + encodeURIComponent('36.0345423');  // 위도
	queryParams += '&' + encodeURIComponent('radius') + '=' + encodeURIComponent('2000'); // 거리 반경  */
	queryParams += '&_type=json';
	
	$.ajax({
			method: "GET",
			url: url + queryParams,
	}).done(function(msg) {
			console.log(msg);
			//console.log(msg.response.body.items.item[0].addr1);
 		 	addr = msg.response.body.items.item.addr1 
	  		$( "#message1" ).append( addr );
	 		$( "#message1" ).append( msg.response.body.items.item.animalCmgCl );
	 		$( "#message1" ).append( msg.response.body.items.item.brazierCl );
			$( "#message1" ).append( '<img src="' +msg.response.body.items.item.firstImageUrl+ '" />' )
			
			
			$( "#message2" ).append( msg.response.body.items.item.addr1 );
			$( "#message2" ).append( '<img src="' +msg.response.body.items.item.firstImageUrl+ '" />' )
			
			$( "#message3" ).append( msg.response.body.items.item.addr1 );
			$( "#message3" ).append( msg.response.body.items.item.addr1 ); 
			  
	});

</script>

<meta charset="UTF-8">
<title>Camping</title>
</head>
<body>
	<h1>고캠핑</h1>
	
	<p id="message1"><a href="./login/join.jsp">가입하기</a></p>
	<p id="message2"></p>
	<p id="message3"></p>
	
</body>
</html>
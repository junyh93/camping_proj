<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp" %>

<title>캠핑장 검색</title>
<link type="text/css" href="<c:url value='/css/#.css'/>"  rel="stylesheet" >

<script type="text/javascript">
var url = 'http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList'; 
var queryParams = '?' + encodeURIComponent('ServiceKey') + '='+'Po8b3s%2BelMewEpuJuSSNclaKWDReZThq%2FrOSAU0x%2BqHff1gACrKi1G3eez3LwxPQLMoN9ntPatUmspBAZTJd5w%3D%3D'; 
var searchKrwd = $('#searchKrwd').val();
var c_do = $('#c_do').val();
var c_signgu = $('#c_signgu').val();
var addrr = c_do + " " + c_signgu;

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
	var addr1 = "";
	var addrArray = "";
	$.each(item,function(i){
		addr1 = item[i].addr1.split(" ")[0];
		
	});
	
	
});
</script>


<input type="hidden" id="searchKrwd" value="${searchKrwd.searchKrwd }">
<input type="hidden" id="c_do" value="${c_do.c_do }">
<input type="hidden" id="c_signgu" value="${c_signgu.c_signgu }">


<%@include file="../common/footer.jsp" %>
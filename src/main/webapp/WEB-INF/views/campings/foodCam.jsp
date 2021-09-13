<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp" %>

<title>캠핑 음식</title>
<link type="text/css" href="<c:url value='/css/foodCam.css'/>"  rel="stylesheet" >
<link rel="stylesheet" type="text/css" href="<c:url value='/css/fontawesome.min.css'/> ">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">

<script type="text/javascript">
$(function(){
/* var request=require('request'); */
var optionParams={
	q:"캠핑요리",
	part:"snippet",
	key:"AIzaSyAXsQVujPkAKbIEz3VCU9RQDNtVtBnuTic",
	maxResults:1000,
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
			console.log(msg);
			
			console.log(msg.pageInfo.totalResults);
			var item = msg.items;
			var next = msg.nextPageToken;
			var total = msg.pageInfo.totalResults;
			console.log(item);
			
			var date = "";
			var st = "";
			
			$.each(item, function(i){
				var videoId = "";

				if(item[i].id.videoId != null){
					videoId = item[i].id.videoId;
				}else if(item[i].id.playlistId != null){
					videoId = item[i].id.playlistId;
				}
				
		 		if(item[i].snippet.publishTime != null){
					date = item[i].snippet.publishTime.substring("-",10);
					
				} 
				
				st += '<div class="cols uid_1287"  style="position:relative; opacity: 1; top: 0px; left: 0px; width: 271px; height: 410px;" id="1-2">';
				st +='<div class="photo"><a href="<c:url value="getFood.do?videoId='+videoId+'"/>">'
				st += '<img src="'+item[i].snippet.thumbnails.medium.url+'" width="100%" class="tm"></a></div>';
				st += '<div class="contbottom"><div class="subject">';
				st += '<a href="<c:url value="getFood.do?channelId='+item[i].snippet.channelId+'&&etag='+item[i].etag+'"/>"></a>'+item[i].snippet.title+'</div>';
			 	st += '<div class="cont">'+item[i].snippet.description+'</div>'; 
				st += '<div class="namedate"><span class="date"><i class="far fa-clock"></i> '+date+'</span></div></div></div>';
				
			}); 
			
			$('.listwrap').html(st);
			$('#next').val(next);
			
			var getPaging = pagingMan(1,total);
			$('.pageInfo_wrap').html(getPaging);
			
			function pagingMan(startIndex,totalCount){
				var pagingHTML = "";
				var page = parseInt(startIndex);
				var totalCount = parseInt(totalCount);
				var pageBlock = parseInt(10);
				var navigatorNum = 10;
				var firstPageNum = 1;
				var lastPageNum = Math.floor((totalCount-1)/pageBlock) + 1;
				var previewPageNum = page == 1 ? 1 : page - 1;
				var nextPageNum = page == lastPageNum ? lastPageNum : page + 1;
				var indexNum = startIndex <= navigatorNum ? 0 : parseInt((startIndex - 1) / navigatorNum) * navigatorNum;
				
			       if (totalCount > 1) {
			            if (startIndex >= 1) {
			                pagingHTML += "<a class='btn_first disabled' href='#' id='"+firstPageNum+"'><em><<</em></a> ";
			                pagingHTML += "<a class='btn_prev disabled' href='#' id='"+previewPageNum+"'><em><</em></a> ";
	            }
				
			            for (var i=1; i<=navigatorNum; i++) {
			                var pageNum = i + indexNum;

			                // 현재 선택값
			                if (pageNum == startIndex)
			                    pagingHTML += "<b><a class='selected' href='#' id='"+pageNum+"'>"+pageNum+"</a></b> ";

			                else
			                    pagingHTML += "<a href='#' onclick='next('"+next+"');' id='"+pageNum+"'>"+pageNum+"</a>  ";

			                if (pageNum==lastPageNum)
			                    break;
			            }

			            if (startIndex < lastPageNum) {
			                pagingHTML += "<a class='btn_next' href='#' id='"+nextPageNum+"'><em>></em></a> ";
			                pagingHTML += "<a class='btn_end' href='#' id='"+lastPageNum+"'><em>>></em></a>";
			            }
			        }

			        return pagingHTML;
			            
			            
			}
			
			
		});
});
</script>
<script type="text/javascript">
function next(next){
	/* var nextpage = $('#next').val(); */
	var optionParams={
			q:"캠핑요리",
			part:"snippet",
			key:"AIzaSyAXsQVujPkAKbIEz3VCU9RQDNtVtBnuTic",
			maxResults:1000,
			pageToken:next,
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
					console.log(msg);
					var item = msg.items;
					var next = msg.nextPageToken;
					var total = msg.pageInfo.totalResults;
					console.log(item);
					
					var date = "";
					var st = "";
					
					$.each(item, function(i){
						var videoId = "";

						if(item[i].id.videoId != null){
							videoId = item[i].id.videoId;
						}else if(item[i].id.playlistId != null){
							videoId = item[i].id.playlistId;
						}
						
				 		if(item[i].snippet.publishTime != null){
							date = item[i].snippet.publishTime.substring("-",10);
							
						} 
						
						st += '<div class="cols uid_1287"  style="position:relative; opacity: 1; top: 0px; left: 0px; width: 271px; height: 410px;" id="1-2">';
						st +='<div class="photo"><a href="<c:url value="getFood.do?videoId='+videoId+'"/>">'
						st += '<img src="'+item[i].snippet.thumbnails.medium.url+'" width="100%" class="tm"></a></div>';
						st += '<div class="contbottom"><div class="subject">';
						st += '<a href="<c:url value="getFood.do?channelId='+item[i].snippet.channelId+'&&etag='+item[i].etag+'"/>"></a>'+item[i].snippet.title+'</div>';
					 	st += '<div class="cont">'+item[i].snippet.description+'</div>'; 
						st += '<div class="namedate"><span class="date"><i class="far fa-clock"></i> '+date+'</span></div></div></div>';
						
					}); 
					
					$('.listwrap').html(st);
					$('#next').val(nextpage);
					$("html, body").animate({
						scrollTop : $(".gallery_style").offset().top
					});
					var getPaging = pagingMan(1,total);
					$('.pageInfo_wrap').html(getPaging);
					
					function pagingMan(startIndex,totalCount){
						var pagingHTML = "";
						var page = parseInt(startIndex);
						var totalCount = parseInt(totalCount);
						var pageBlock = parseInt(10);
						var navigatorNum = 10;
						var firstPageNum = 1;
						var lastPageNum = Math.floor((totalCount-1)/pageBlock) + 1;
						var previewPageNum = page == 1 ? 1 : page - 1;
						var nextPageNum = page == lastPageNum ? lastPageNum : page + 1;
						var indexNum = startIndex <= navigatorNum ? 0 : parseInt((startIndex - 1) / navigatorNum) * navigatorNum;
						
					       if (totalCount > 1) {
					            if (startIndex >= 1) {
					                pagingHTML += "<a class='btn_first disabled' href='#' id='"+firstPageNum+"'><em><<</em></a> ";
					                pagingHTML += "<a class='btn_prev disabled' href='#' id='"+previewPageNum+"'><em><</em></a> ";
			            }
						
					            for (var i=1; i<=navigatorNum; i++) {
					                var pageNum = i + indexNum;

					                // 현재 선택값
					                if (pageNum == startIndex)
					                    pagingHTML += "<b><a class='selected' href='#' id='"+pageNum+"'>"+pageNum+"</a></b> ";

					                else
					                    pagingHTML += "<a href='#' onclick='next('"+next+"');' id='"+pageNum+"'>"+pageNum+"</a>  ";

					                if (pageNum==lastPageNum)
					                    break;
					            }

					            if (startIndex < lastPageNum) {
					                pagingHTML += "<a class='btn_next' href='#' id='"+nextPageNum+"'><em>></em></a> ";
					                pagingHTML += "<a class='btn_end' href='#' id='"+lastPageNum+"'><em>>></em></a>";
					            }
					        }

					        return pagingHTML;
					            
					            
					}
				});
}
</script>
<script type="text/javascript">
function prev(){
	var prevpage = $('#prev').val();
	var optionParams={
			q:"캠핑요리",
			part:"snippet",
			key:"AIzaSyAXsQVujPkAKbIEz3VCU9RQDNtVtBnuTic",
			maxResults:1000,
			pageToken:prevpage,
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
					console.log(msg);
					var item = msg.items;
					var next = msg.nextPageToken;
					console.log(item);
					
					var date = "";
					var st = "";
					
					$.each(item, function(i){
						var videoId = "";

						if(item[i].id.videoId != null){
							videoId = item[i].id.videoId;
						}else if(item[i].id.playlistId != null){
							videoId = item[i].id.playlistId;
						}
						
				 		if(item[i].snippet.publishTime != null){
							date = item[i].snippet.publishTime.substring("-",10);
							
						} 
						
						st += '<div class="cols uid_1287"  style="position:relative; opacity: 1; top: 0px; left: 0px; width: 271px; height: 410px;" id="1-2">';
						st +='<div class="photo"><a href="<c:url value="getFood.do?videoId='+videoId+'"/>">'
						st += '<img src="'+item[i].snippet.thumbnails.medium.url+'" width="100%" class="tm"></a></div>';
						st += '<div class="contbottom"><div class="subject">';
						st += '<a href="<c:url value="getFood.do?channelId='+item[i].snippet.channelId+'&&etag='+item[i].etag+'"/>"></a>'+item[i].snippet.title+'</div>';
					 	st += '<div class="cont">'+item[i].snippet.description+'</div>'; 
						st += '<div class="namedate"><span class="date"><i class="far fa-clock"></i> '+date+'</span></div></div></div>';
						
					}); 
					
					$('.listwrap').html(st);
					$('#prev').val(prevpage);
					$("html, body").animate({
						scrollTop : $(".gallery_style").offset().top
					});
				});
}
</script>

<input type="hidden" id="total" name="total">
	<!--상단타이틀영역-->
			<div id="sub_title_wrap">
				<div class="layout">
					<h2>
						<span class="skip">서브타이틀 영역</span>
					</h2>
					<!--타이틀-->
					<div class="s_title">
						<p class="tt1dept">캠핑 음식</p>
								<p class="s_tt">캠핑추천요리 다양한 캠핑음식 여기다 있다</p>
							</div>
					<!--//타이틀-->
				</div>
				<div class="s_bg_w">
					<!-- s_bg_02~05 캠핑Go, 캠핑Talk, 캠핑플러스, 고객센터, 마이페이지 -->
					<div class="s_bg_03"></div>
						</div>
			</div>
			<!--//상단타이틀영역-->
<div id="bbslist" class="gallery_style" >

<div class="tit">
	<h2>다양한 캠핑 음식을 즐겨보세요</h2>
	<!-- <button class="prev" id="prev" onclick="prev();" style="position: fixed; margin-riright: 1300px;">이전</button>
	<button class="next" id="next" onclick="next();" style="position: fixed; margin-left: 1300px;">다음</button> -->
</div>
<div class="tse-content">
<!--list-->
<div class="listwrap" data-min-width="1360" style="position: relative; display: block; " >
</div>

</div>

    <div class="pageInfo_wrap" >
<%--         <div class="pageInfo_area">
 			<ul id="pageInfo" class="pageInfo">
 				<input type="hidden" id="pagination" name="pagination">
				<c:if test="${pagination.prev}">

				<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')"><img src="<c:url value='img/btn_pre01.png'/>" alt="이전으로">Previous</a></li>

			</c:if>

				

			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">

				<li class="page-item ${pagination.page == idx ? 'active' : ''} "><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a></li>

			</c:forEach>

				

			<c:if test="${pagination.next}">

				<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.page}', 

'${pagination.range}', '${pagination.rangeSize}')" ><img src="<c:url value='img/btn_next01.png'/>" alt="다음으로">Next</a></li>

			</c:if>

              
 			</ul>
        </div> --%>
    </div>
<input type="hidden" id="page" name="page" value="${pagination.page }">
<input type="hidden" id="range" name="range" value="${pagination.range }">
<input type="hidden" id="rangeSize" name="rangeSize" value="${pagination.rangeSize }">
</div>


<%@include file="../common/footer.jsp" %>
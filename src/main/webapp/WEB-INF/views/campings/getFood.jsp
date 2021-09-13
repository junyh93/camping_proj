<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp" %>

<title>캠핑 음식 상세보기</title>
<link type="text/css" href="<c:url value='/css/getFood.css'/>"  rel="stylesheet" >
<link rel="stylesheet" type="text/css" href="<c:url value='/css/fontawesome.min.css'/> ">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">


<script type="text/javascript">
$(function(){
	var videoId = $('#videoId').val();
	
	var optionParams={
			part:"snippet",
			key:"AIzaSyAXsQVujPkAKbIEz3VCU9RQDNtVtBnuTic",
			maxResults:50,
			id:videoId
		 };

		//한글을 검색어로 전달하기 위해선 url encoding 필요!

		var url="https://www.googleapis.com/youtube/v3/videos?";
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
					var temp =[];
					var date = "";
					var tag = [];
					var tg = "";
					$.each(item, function(i){
						
						tag = item[i].snippet.tags;
						$.each(tag,function(t){
							tg += "#"+tag[t]+" ";
							$('.tag').html(tg);
						});
						
				 		if(item[i].snippet.publishedAt != null){
							date = item[i].snippet.publishedAt.substring("-",10);
							console.log(date);
						} 
					

							$('#ivar').attr('src', 'https://www.youtube.com/embed/'+videoId);
							$('.bbs_subject').html(item[i].snippet.title);
							$('.ctbox').html(item[i].snippet.description);
							$('.date').html(date);

					});
					console.log(item);
					
				});	
				
		//좋아요
 		if($('#sessionNo').val() != null){
			var memNo = $('#sessionNo').val();
		}else if($('#sessionNo').val() == ""){
			alert('로그인 이후 이용가능합니다.');
			return false;
		} 
		
		
		$('.like').click(function(){
			var memNo = $('#sessionNo').val();
 			if(memNo == ""){
				alert('로그인 이후 이용가능합니다.');
				return false;
			}
			 
			$.ajax({
				url:"<c:url value='/like.do'/>",
				type:"GET",
				data:{
					"id" : videoId,
					"memNo" : memNo
				},
				dataType:"text",
				success:function(data){
					if(data == "success"){
						likCount();
					}
				}
			});
		});
		
		function likCount(){
			$.ajax({
				url:"<c:url value='/likcount.do'/>",
				type:"GET",
				data:{ "id" : videoId },
				dataType:"text",
				success:function(count){
					console.log(count);
					$('.likcount').html(count);
				}
			});
		};
		
		likCount();
		
		//싫어요
		$('.hate').click(function(){
			var memNo = $('#sessionNo').val();
			if(memNo == ""){
				alert("로그인 이후 이용가능합니다.");
				return false;
			}
			$.ajax({
				url: "<c:url value='/hate.do'/>",
				type:"GET",
				data:{
					"id" : videoId,
					"memNo" : memNo
				},
				dataType:"text",
				success:function(data){
					if(data == "success"){
						hatCount();
					}
				}
			});
		});
		
		function hatCount(){
			$.ajax({
				url:"<c:url value='/hatcount.do'/>",
				type:"GET",
				data:{"id" : videoId},
				dataType:"text",
				success:function(count){
					console.log(count);
					$('.hatcount').html(count);
				}
			});
		};
		
		hatCount();
});
</script>
<script type="text/javascript">
var tags = document.getElementById('tag');
var title = document.getElementById('title');

var keyword ="";

if(tags != null){
	keyword = tags;
}else if(title != null){
	keyword = title;
}
$(function(){
	var id = $('#videoId').val();
	
	console.log(id);
	
	var optionParams={
			part:"snippet",
			key:"AIzaSyAXsQVujPkAKbIEz3VCU9RQDNtVtBnuTic",
			maxResults:10,
			regionCode:"KR",
			relatedToVideoId:id,
			type:"video"
		 };

		//한글을 검색어로 전달하기 위해선 url encoding 필요!

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
					
					var tg = "";
					var temp = [];
					var tt = "";
					var st = "";
					
					$.each(item,function(i){
						var videoId = "";
						
						if(item[i].id.videoId != null){
							videoId = item[i].id.videoId;
						}else if(item[i].id.playlistId != null){
							videoId = item[i].id.playlistId;
						}
						
						if(item[i].snippet != null){
						st += '<div class="cols" style="position:relative; opacity: 1; top: 0px; left: 8px; width: 230px; height: 180px;" id="1-2">';
						st += '<div class="photo"><a href="<c:url value="getFood.do?videoId='+videoId+'"/>" >';
						st += '<img src="'+item[i].snippet.thumbnails.medium.url+'" width="100%" class="tm"></a></div>';
						st += '<div class="contbottom"><div class="subject">';
						st += '<a href="<c:url value="getFood.do?videoId='+videoId+'"/>"></a>'+item[i].snippet.title+'</div></div></div>';
						

						$('.listcontent').html(st);
						}
					});
					
					
				});
});
</script>
<input type="hidden" id="videoId" name="videoId" value="${videoId }">
<input type="hidden" id="memNo" name="memNo" value=${memNo }>
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
<section class="container">


<div class="content">
<div id="bbsview" class="right_panel" style="width: 750px; ">


<div class="tse-scroll-content scrollviewbox" style="width: 743px;">
<div class="tse-content viewcontent">

<div class="moviebox">
<div class="oembedall-container">
<span class="oembedall-closehide"></span>
<iframe id="ivar" width="950" height="534" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div></div>

	<div id="bbsreview">
		<h2 class="bbs_subject" id="title"></h2>

		<div class="btn_box">
			<ul class="btn_ctr_box">
				<li>
					<span class="user">관리자</span>
					<span class="date"></span>
					<button type="button" class="like"><i class="far fa-thumbs-up"></i><span class="likcount"></span></button>
					<button type="button" class="hate"><i class="far fa-thumbs-down"></i><span class="hatcount"></span></button>
				</li>
			</ul>
		</div>

		<div id="vContent" class="content">
			<div class="ctbox"></div>
			<div class="tag" id="tag"></div>
		</div>

</div>
</div>
</div>

</div>
</div>

<div class="recommendList">
<h2>추천 영상 목록</h2>
	<div class="listcontent"></div>
</div>

</section>
<%@include file="../common/footer.jsp" %>
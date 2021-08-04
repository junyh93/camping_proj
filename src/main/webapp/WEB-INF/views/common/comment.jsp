<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<title>댓글</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script type="text/javascript">
$(function(){
/*
 * 댓글 등록하기(Ajax)
 */
function fn_comment(code){
    
    $.ajax({
        type:'POST',
        url : "<c:url value='/comment.do'/>",
        data:$("#commentForm").serialize(),
        success : function(data){
        	console.log(data);
            if(data=="success")
            {
                getCommentList();
                $("#comment").val("");
            }
        },
        error:function(request,status,error){
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
        
    });
}
 
/**
 * 초기 페이지 로딩시 댓글 불러오기
 */

    
    getCommentList();
    

 

/**
 * 댓글 불러오기(Ajax)
 */
function getCommentList(){
    var rvNo = $("#rvNo").val();
	
    $.ajax({
        type:'GET',
        url : "<c:url value='/commentList.do'/>",
        dataType : "json",
        data:{"rvNo":rvNo},
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        success : function(data){
            console.log(data);
            var html = "";
            var cCnt = data.length;
            
           
            
            if(data.length > 0){
                
                for(i=0; i<data.length; i++){
                    html += "<div>";
                    html += "<div><table class='table'><h6><strong>"+data[i].memId+"</strong></h6>";
                    html += data[i].comContent +"<a href='#' class='combtn' name='delete'>삭제</a><p>"+data[i].comDate+"</p><tr><td></td></tr>";
                    html += "</table></div>";
                    html += "</div>";
                }
                
                $('.combtn').click(function(){
                	var comNo = data[i].comNo;   	
                	
                	
                	$.ajax({
                		url:"/deleteComment.do",
                		data:comNo,
                		type:'GET',
                		dataType:'text',
                		success:function(data){
                			getCommentList();
                		}
                		,error:function(request,status,error){
                            
                	       }
                	});

                });
            } else {
                
                html += "<div>";
                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";
                
            }
            

            $("#cCnt").html(cCnt);
            $("#commentList").html(html);


            
        },
        error:function(request,status,error){
            
       }
        
    });
       	
}



});
	
 
</script>

<!-- <c:url value='/deleteComment.do?comNo="+data[i].comNo+"&memNo="+data[i].memNo+"'/> -->

<div class="container">
    <form id="commentForm" name="commentForm" method="post">
    			
		 		 <input type="hidden" id="sessionId" name="memId" value="${memId}">
    			 <input type="hidden" id="rvNo" name="rvNo" value="${review.rvNo }">
    <br><br>
        <div>
            <div>
                <span><strong>Comments</strong></span> <span id="cCnt"></span>
            </div>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea style="width: 1100px" rows="3" cols="30" id="comment" name="comContent" placeholder="댓글을 입력하세요"></textarea>
                            <br> 
                            <div>
                                <a href='#' onClick="fn_comment('${review.rvNo }')" class="btn pull-right btn-success">등록</a>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <input type="hidden" id="b_code" name="b_code" value="${review.rvNo }" />        
    </form>
</div>
<div class="container">
    <form id="commentListForm" name="commentListForm" method="post">
        <div id="commentList">
        </div>
    </form>
</div>


</html>
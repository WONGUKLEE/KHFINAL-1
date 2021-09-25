<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html charset = UTF-8"); %>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기 페이지</title>
<script src = "https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type = "text/javascript">

	$(function(){
		
		let num;
		
		$('.reply_update').click(function(){
			if (num === undefined || num == $(this).parent().parent().attr('class')){
				$(this).parent().parent().children('.reply_infotd').show();
				$(this).parent().parent().children('.one_reply_info').hide();
				
				$(this).css('display', 'none');
				$(this).next().css('display', 'none');
				$(this).next().next('.reply_update_done').show();
				$(this).next().next().next('.reply_update_cancel').show();
				
			} else if(num != $(this).parent().parent().attr("class")) {
				$('.' + num).children('.reply_infotd').hide();
				$('.' + num).children('.one_reply_info').show();
				$('.' + num).children('.btns').children('.reply_update').show();
				$('.' + num).children('.btns').children('.reply_update').next().show();
				$('.' + num).children('.btns').children('.reply_update').next().next('.reply_update_done').hide();
				$('.' + num).children('.btns').children('.reply_update').next().next().next('.reply_update_cancel').hide();
				
				$(this).parent().parent().children('.reply_infotd').show();
				$(this).parent().parent().children('.one_reply_info').hide();
				
				$(this).css('display', 'none');
				$(this).next().css('display', 'none');
				$(this).next().next('.reply_update_done').show();
				$(this).next().next().next('.reply_update_cancel').show();
				
			}
			
			num = $(this).parent().parent().attr('class');
			
		});
		
		
		//댓글 수정 취소 버튼 클릭시 작동된다.
		$('.reply_update_cancel').click(function(){
			$(this).parent().parent().children(".reply_infotd").hide();
			$(this).parent().parent().children(".one_reply_info").show();
			
			$(this).css("display", "none");
			$(this).prev().css("display", "none");
			$(this).prev().prev().show();
			$(this).prev().prev().prev().show();
			
		});
		
		//댓글 수정 완료 버튼 클릭시 작동된다.
		$('.reply_update_done').click(function(){
			var br_content = $(this).parent().parent().children('.reply_infotd').children(".reply_info").val();
			var br_index = Number($(this).parent().parent().attr('class'));
			
			var params = "?&br_index=" + br_index + "&br_content=" + br_content;
			
			if(confirm("수정하시겠습니까?")){
				$.ajax({
					type : 'post',
					url : 'replyupdate.do' + params,
					success : function(){
						alert("댓글 수정");
						location.reload();
						
					},
					error : function(){
						alert("수정 실패");
					}
				
				});
				
			}
			
			
			
		});
		
		
	});
	
	
	
</script>
</head>
<body>
	<h2>글 상세보기</h2>
	
	<div class = ${dto.b_teamcode }>
		<div>
			<div>${dto.b_title}</div>
			<div>${dto.b_userid}</div>
			<div>${dto.b_date}</div>
			<div><img src = "resources/images/viewer.png" style = "width : 15px; height : 15px;">${dto.b_readcnt}</div>
			<div>글 유형 : ${dto.c_no}</div>
		</div>
		
		<div>
			 ${dto.b_content}
		</div>
		
		<div class = ${dto.b_no }>
			<c:if test="${ b_userid == dto.b_userid}">
				<input type = "button" value = "수정" onclick = "location.href='updateform.do?b_no=${dto.b_no}'">
				<input type = "button" value = "삭제" class = "board_delete">
			</c:if>
			<input type = "button" value = "목록" onclick = "location.href='boardlist.do?b_teamcode=${dto.b_teamcode}'">
		</div>
	</div>
	

	<script>
	
		$('.board_delete').click(function(){
			
			var b_no = $(this).parent().attr('class');
			var b_teamcode = $(this).parent().parent().attr('class');
			
			if(confirm("해당한 글과 댓글이 삭제되는데 정말로 삭제하시겠습니까?")){
				location.href = "boarddelete.do?b_no=" + b_no + "&b_teamcode=" + b_teamcode;
				
			} else {
				alert("삭제 취소를 하셨습니다.");
				return false;
			}
			
		});
		
	
	</script>
	
	
	<!-- 댓글 작성 -->
	<div>
		<form action = "replywrite.do" method = "post">
		<input type = "hidden" name = "br_no" value = "${dto.b_no }">
		<input type = "hidden" name = "br_teamcode" value = "${dto.b_teamcode }">
			<input type = "text" name = "br_userid" value ="${dto.b_userid }">
			<br>
			<div>
				<textarea rows = "5" cols = "50" id = "br_content" name = "br_content"></textarea>
				<span id = "main_content_cnt"></span>
			</div>
			
			  <input type = "submit" value = "등록"> 
			
		</form>
		
		<script>

		    $(document).ready(function() {
		        $('#br_content').on('keyup', function() {
		            $('#main_content_cnt').html("("+$(this).val().length+" / 150)");
		 
		            if($(this).val().length > 150) {
		                $(this).val($(this).val().substring(0, 150));
		                $('#main_content_cnt').html("(150 / 150)");
		            }
		        });
		    });
		        
	    </script>
	    
	</div>
	
	<!-- 댓글 출력 -->
	 <c:choose>
	 	<c:when test = "${empty reply}">
               <div>작성 된 글이 없습니다.</div>
         </c:when>
         <c:otherwise>
		 	<c:forEach items = "${reply}" var = "reply">
				<div class = "${reply.br_index}">
					<div>
						<p><img></p>
						<p>${reply.br_userid}</p>
					</div>
					
					<div class = "one_reply_info">${reply.br_content }</div>
					<div class = "reply_infotd" style = "display:none">
						<textarea style = "resize:none" rows = "2" cols = "50" name = "br_content" class = "reply_info">${reply.br_content}</textarea>
						<span class = "add_content_cnt"></span>
					</div>
					
					<div class = "reply_date">
						<p><fmt:formatDate value = "${reply.br_date}" pattern = "yyyy-MM-dd" /></p>	
					</div>
					
					<script>
		 
					    $(document).ready(function() {
					        $('.reply_info').on('keyup', function() {
					        	var cnt = $(this).val().length;
					            $(this).next().html("("+cnt+" / 150)");
					 
					            if($(this).val().length > 150) {
					                $(this).val($(this).val().substring(0, 150));
					                $(this).next().html("(150 / 150)");
					            }
					        });
					    });
				        
				    </script>
					
					<div class = "btns">
						<button class = "replybtn reply_update">수정</button>
						<input type ="button" value = "삭제" class = "replybtn reply_delete" onclick = "location.href='replydelete.do?br_index=${reply.br_index}&b_no=${dto.b_no}'">
						<button class = "replybtn reply_update_done" style = "display:none">완료</button>
						<button class = "replybtn reply_update_cancel" style = "display:none">취소</button>
					</div>
					
				</div>
			</c:forEach>
		</c:otherwise>
	 </c:choose>
	
	
	
</body>
</html>
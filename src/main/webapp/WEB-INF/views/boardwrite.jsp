<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html charset = UTF-8"); %>

<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글작성 페이지</title>

<!-- 서머 노트 가져오기 -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<script>
	$(document).ready(function() {
	    $('#summernote').summernote({
	    	
	    	height : 350,
	    	minHeight : null,
	    	maxHeight : null,
	    	foucus : true,
	    	lang : "ko_KR"
	    	
	    	
	    });
	    	
	    
	});

	function goWrite(frm){
		var opentype = $("select[name=b_category]").val();
		var writetype = $("select[name=c_no]").val();
		var title = $("input[name=b_title]").val();
		var content = $("textarea[name=b_content]").val();
		
		if(!opentype){
			alert("글 공개 범위를 필수로 선택하세요");
			return false;
			
		}
		
		if(!writetype){
			alert("글 유형 카테고리를 필수로 선택하세요");
			return false;
			
		}
		
		if(!title){
			alert("제목을 필수로 입력하세요");
			return false;
			
		}
		
		if(!content){
			alert("내용을 필수로 입력하세요");
			return false;
		}
		
		frm.submit();
	}

</script>

</head>
<body>
	<h2>글 작성</h2>
	<form:form method = "post" action = "boardwrite.do" >
		<input type = "hidden" name = "b_teamcode" value = "${b_teamcode}">
		<div>
			<select name = "b_category">
				<option value = "">공개 범위 선택</option>
				<option value = "개인">개인</option>
				<option value = "팀" selected>팀</option>		
			</select>
		</div>
		<div>
			<select name = "c_no">
				<option value = "">글 유형 선택</option>
				<option value = "1">회의록</option>
				<option value = "2">코드리뷰</option>
				<option value = "3" selected>잡글</option>		
			</select>
		</div>
		<div>
			<input type = "text" name = "b_title">
		</div>
		<div>
			<input type = "text" name = "b_userid" value = "${b_userid}">
		</div>
		<div>
			<textarea id = "summernote" name = "b_content"></textarea>
		</div>

		<input type = "button" value = "작성 완료" onclick = "goWrite(this.form)">
		<input type = "button" value = "취소" onclick = "location.href='boardlist.do?b_teamcode=${b_teamcode}'">
	
	</form:form>
	
	
</body>
</html>
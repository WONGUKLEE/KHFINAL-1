<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>계단 - 개발자 협업을 위한 첫 걸음</title>
    <link rel="stylesheet" href="resources/css/build-workspace.css">
    <link rel="icon" type="image/png" sizes="32x32" href="resources/images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon-16x16.png">
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
    <style type="text/css">
    .nameChk{
    	color : red;
    }
    .nameConfirm{
    	color : green;
    }
    
    </style>
</head>
<body>
	<nav>
        <div class="nav-content">
            <a href="start.do"><img class="logo" src="resources/images/logo3.svg" alt="logo"></a>
        </div>
    </nav>

    <div class="container">
        <div class="build-workspace-1">
            <div class="">
            </div>
            <h1>Build a workspace your team will love.</h1>
            <p></p>
            <form action="makeWorkspace.do" method="get">

                <label class="form-label"><i class="fas fa-paper-plane"></i><strong> &nbspWhat do you want to call your teamworkspace?</strong></label>
                <input id="workspaceName" type="text" placeholder="Workspace name" name="teamname">
                <br>
                <div id="teamnamechk"></div>
                <label class="invite-email"><i class="fas fa-envelope"></i><strong> &nbspInvite people via email</strong></label>
                <input id="workspaceName" type="text" placeholder="E-mail">
                
                <div class="form-buttons">
                    <button type="button" class="button-cancel" onclick="location.href='start.do'">취소</button>
                    <button type="submit" class="button-confirm" id="submitbtn">확인</button>
                </div>
            </form>

        </div>
    </div>

	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    	$(function(){
    		$("#workspaceName").blur(function(){
    			var teamname = $("#workspaceName").val();
    			console.log(teamname);
    			if(teamname==null||teamname==""){
    				$("#teamnamechk").html("<b class='nameChk'>팀이름을 입력해주세요.</b>");
    				$("#submitbtn").attr("disabled",true);
    			}else{
    				$.ajax({
	    				url :"teamnamecheck.do",
	    				data : "teamname=" + teamname,
	    				dataType : "json",
	    				success : function(msg){
	    					console.log(msg);
	    					if(msg.check==false){
	    						$("#teamnamechk").html("<b class='nameConfirm'>사용가능한 이름입니다.</b>");
	    						$("#submitbtn").attr('disabled',false);
	    					}else if(msg.check==true){
	    						$("#teamnamechk").html("<b class='nameChk'>이미 사용중인 이름입니다.</b>");
	    						$("#submitbtn").attr("disabled",true);
	    					}
	    				},
	    				error : function(msg){
	    					console.log(msg);
	    				}
	    			});
    			}
    		});
    	});
    </script>
	
</body>
</html>
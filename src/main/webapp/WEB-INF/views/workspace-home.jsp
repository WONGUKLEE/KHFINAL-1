<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.khfinal.devstairs.user.dto.UserDto" %>
<% response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>계단 - 개발자 협업을 위한 첫 걸음</title>
    <link rel="stylesheet" href="resources/css/workspace.css">
    <link rel="icon" type="image/png" sizes="32x32" href="resources/images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon-16x16.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
</head>
	<div class="wrapper">
        <nav class="navbar-fixed-top">
            <div class="workspace-title">
                <span class="icon-home">
                    <a href="start.do" class="alogo"><img id="homelogo" src="resources/images/logoicon.svg" alt="logo"></a>
                </span>
                <a href="" class="workspace-title__logo">
                    <span class="workspace-image"><a href="#"><img id="teamimage" src="resources/images/testteamimage.png"
                                alt="logo"></a></span>
                </a>
                <div class="workspace-name">
                    <!-- <span id="selected-team-title" onclick="team_toggle()"> -->
                    <span id="selected-team-title">
                        <h3>${teaminfo.teamname } 
                        <c:if test="${teaminfo.admin eq login.username }">
	                        <i class="fas fa-chevron-down" style="font-size: 0.6rem; margin-left: 10px;"></i>
                        </c:if>
                        </h3>
                    </span>
                </div>
            </div>
            <div class="workspace-header">
                <div class="app-bar">
                    <span class="app-bar-item">
                        <button class="btn-app-bar-notice" onclick="right_sidebar_open();">
                            <i class="fas fa-bell" style="font-size: 1.1rem; color:rgb(138, 138, 138);"></i>
                        </button>
                    </span>
                    <span class="app-bar-item">
                        <button class="btn-app-bar-notice" onclick="right_sidebar_open();">
                            <i class="fas fa-user-friends" style="font-size: 1.1rem; color:rgb(138, 138, 138);"></i>
                        </button>
                    </span>
                    <span class="app-bar-item">
                        <button class="btn-app-bar-notice" onclick="right_sidebar_open();">
                            <i class="fas fa-star" style="font-size: 1.1rem; color:rgb(138, 138, 138);"></i>
                        </button>
                    </span>
                    <span class="app-bar-item">
                        <button class="btn-app-bar-notice" onclick="right_sidebar_open();">
                            <i class="fas fa-file" style="font-size: 1.1rem; color:rgb(138, 138, 138);"></i>
                        </button>
                    </span>
                    <span class="app-bar-item">
                        <button class="btn-app-bar-notice" onclick="javascript:toggleFullScreen()">
                            <i class="fas fa-expand-arrows-alt"
                                style="font-size: 1.1rem; color:rgb(138, 138, 138);"></i>
                        </button>
                    </span>
                    <div class="search-btn">
                        <span class="search-btn__inner">
                            <i class="fas fa-search" style="font-size: 1.1rem; color:rgb(138, 138, 138);"></i>
                        </span>
                        <em class="search-btn__placeholder">Search</em>
                    </div>
                    <!-- <span class="profile-image"></span> -->
                    <button type="button" id="profile_btn"><img class="profile_image" src="resources/images/profile.svg"
                            style="border-radius: 50%;" width="44px"></button>
                </div>
            </div>
        </nav>

        <c:if test="${teaminfo.admin eq login.username }">
	        <div id="dropdown-team">
	            <ul>
	                <li><span id="workspace_setting" onclick='team_modal_open();'><i class="fas fa-cog"
	                            style="font-size: 0.9rem; color:rgb(138, 138, 138);"></i>&nbsp&nbsp Workspace
	                        Settings</span>
	                </li>
	                <!-- <li><span onclick="team_modal_open();"><i class="fas fa-cog"
	                            style="font-size: 0.9rem; color:rgb(138, 138, 138);"></i>&nbsp&nbsp Workspace Settings</span>
	                </li> -->
	                <li><span><i class="fas fa-user-plus"
	                            style="font-size: 0.9rem; color:rgb(138, 138, 138);"></i>&nbsp&nbsp Invite new
	                        members</span>
	                </li>
	            </ul>
	        </div>
         </c:if>

        <div id="dropdown-user">
            <ul>
                <li><span onclick="user_setting();"><i class="fas fa-cog"
                            style="font-size: 0.9rem; color:rgb(138, 138, 138);"></i>&nbsp&nbsp User Settings</span>
                </li>
                <li><span><a href="#" onclick="logout();"><i class="fas fa-sign-out-alt"
                                style="font-size: 0.9rem; color:rgb(138, 138, 138);"></i>&nbsp&nbsp Logout</a></span>
                </li>
            </ul>
        </div>

        <div id="profile_modal" class="modal">
            <div class="modal-content">
                <span id="profile_close">&times;</span>
                <div class="profile-setting-menu">
                    <button type="button" class="account-info-button">Account Information</button>
                    <c:if test="${login.authkey !='SOCIAL' }">
	                    <button type="button" class="change-password-button" onclick="update_password_modal_open();">Change
                        Password</button>
                    </c:if>
                    <!-- <button type="button" class="change-password-button">Change Password</button> -->
                </div>
                <div class="profile-header">
                    <img src="resources/images/profile.svg" style="border-radius: 50%;" width="150px">
                    <button class="profile_image_setting" type="button">프로필 이미지 변경</button>
                    <div class="profile-info">
                        <h1>${login.username }</h1>
                        <p style="color:rgb(118, 200, 255)">${login.userid }</p>
                        <p>${login.stmessage } 🎈</p>
                        <p><input type="button" value="회원탈퇴" style="font-size:10px; color:gray; border:none;" onclick="secession();"></p>
                    </div> 
                </div>

                <div class="profile-update-form">
                    <form>
                        <label class="form-label">
                            <strong>Account name</strong>
                        </label>
                        <input class="account-name" type="text" id="username" value="${login.username }">
                        <br>
                        <label class="form-label">
                            <strong>Status Message</strong>
                        </label>
                        <input class="status-message" type="text" id="stmessage" value="${login.stmessage }">
                        <br>
                        <label class="form-label">
                            <strong>E-mail</strong>
                        </label>
                        <input class="email" type="text" id="userid" value="${login.userid }" readonly="readonly">
                        <br>


                        <div class="form-buttons">
                            <button type="button" id="button-cancel">취소</button>
                            <button type="button" class="button-confirm" onclick="infoUpdate();">확인</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
		<c:if test="${login.authkey !='SOCIAL' }">
        <div id="update_password_modal" class="modal2">
            <div class="modal-content">
                <span id="update_password_close">&times;</span>
                <div class="profile-setting-menu">
                    <button type="button" class="account-info-button2" onclick="profile_modal_open();">Account
                        Information</button>
                    <button type="button" class="change-password-button2">Change Password</button>
                </div>
                <div class="password-update-form">
                    <form action="passwordUpdate.do" method="post" id="passwordUpdateForm">
                        <h1>Update password 🔑</h1>
                        <label class="form-label">
                            <strong>Current password</strong>
                        </label>
                        <input class="password-form" type="password" placeholder="Current password" id="pastpw">
                        <div id="pastpwcheck"></div>
                        <br>
                        <label class="form-label">
                            <strong>New password</strong>
                        </label>
                        <input class="password-form" type="password" placeholder="New password" id="newpw1">
                        <div id="newpw1check"></div>
                        <br>
                        <label class="form-label">
                            <strong>Confirm password</strong>
                        </label>
                        <input class="password-form" type="password" placeholder="Confirm password" id="newpw2" name="userpw">
                        <div id="newpw2check"></div>
                        <br>


                        <div class="form-buttons2">
                            <button type="button" id="button-cancel2">취소</button>
                            <button type="button" id="pwchangebtn" class="button-confirm">확인</button>
                        </div>
		
                    </form>

                </div>
            </div>
        </div>
		</c:if>
        <div id="team_modal" class="modal3">
            <div class="modal-content">
                <span id="team_modal_close" onclick="modal_close();">&times;</span>
                <div class="team-setting-menu">

                </div>
                <div class="team-header">
                    <img src="resources/images/testteamimage.svg" style="width: 150px;">
                    <button class="team_image_setting" type="button">팀 이미지 변경</button>
                    <div class="team-info">
                        <h1>${teaminfo.teamname }</h1>
                    </div>
                </div>

                <div class="team-update-form">
                    <!--  <form>-->
                        <label class="form-label">
                            <strong>Workspace name</strong>
                        </label>
                        <input class="Workspace-name" type="text" value="${teaminfo.teamname }">
                        <label class="form-label">
                            <strong>Team Management</strong>
                        </label>
                        <div class="team-manage">
                           <c:forEach items="${memberlist }" var="dto">
                           	<div class="teamlist">
                                <span class="teamperson">${dto.username } I &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    ${dto.userid }&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; </span>
                                    <c:if test="${teaminfo.admin != login.username }">
		                                <button class="delete-user" onclick="delUser('${dto.userid}');"><i class="fas fa-minus" style="color:red;"></i></button>
                                    </c:if>
                            </div>
                           </c:forEach>
                           <!-- 
                            <div class="teamlist">
                                <span class="teamperson">팀원 I &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    teampersonI@naver.com &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; </span>
                                <button class="delete-user"><i class="fas fa-minus" style="color:red;"></i></button>
                            </div>
                            -->

                        </div>
                    <!--  </form>-->
                    <div class="form-buttons">
                        <button type="button" class="delete-workspace" onclick="workDel();">워크스페이스 삭제</button>
                    </div>
                </div>
            </div>
        </div>

        <div id="right-sidebar">
            <div class="side-header">
                <span class="right-sidebar-close">&times;</span>
            </div>
        </div>


        <nav class="navbar-fixed-left">
            <a href="workspace.do?teamcode=${teaminfo.teamcode }" class="shelf-button--home" style="background-color: #478bff;"><i class="fas fa-home"
                    style="font-size: 1rem; color:rgb(255, 248, 248);"></i></a>
            <a href="views/workspace-chat.jsp" class="shelf-button--channel"><i class="fas fa-comment"
                    style="font-size: 1rem; color:rgb(255, 248, 248);"></i></a>
            <a href="boardlist.do?b_teamcode=${teaminfo.teamcode }" class="shelf-button--board"><i class="fas fa-pen"
                    style="font-size: 1rem; color:rgb(255, 248, 248);"></i></a>
            <a href="workspace-calendar.jsp" class="shelf-button--calendar"><i class="fas fa-calendar-alt"
                    style="font-size: 1rem; color:rgb(255, 248, 248);"></i></a>
            <a href="workspace-todo.jsp" class="shelf-button--todo"><i class="fas fa-check"
                    style="font-size: 1rem; color:rgb(255, 248, 248);"></i></a>
            <a href="workspace-map.html" class="shelf-button--map"><i class="fas fa-map-marked-alt"
                    style="font-size: 1rem; color:rgb(255, 248, 248);"></i></a>
            <a href="workspace-github.html" class="shelf-button--github"><i class="fab fa-github"
                    style="font-size: 1.3rem; color:rgb(255, 248, 248);"></i></a>
            <a href="workspace-bookmark.html" class="shelf-button--bookmark"><i class="fas fa-bookmark"
                    style="font-size: 1rem; color:rgb(255, 248, 248);"></i></a>
        </nav>


        <div class="left-sidebar">
            <div id="left-sidebar-toggle">
                <div class="shlef-button-title"><i class="fas fa-home"></i>&nbsp Team Home</div>
                <div class="shelf-button-contents">
                    <div class="shelf-button-contents-label">Label</div>
                    <div class="shelf-button-contents-select" style="background-color: #478bff; color:white;">Test menu 1</div>
                    <div class="shelf-button-contents-select">Test menu 2</div>
                    <div class="shelf-button-contents-select">Test menu 3</div>
                    <div class="shelf-button-contents-label">Label</div>
                    <div class="shelf-button-contents-select">Test menu 4</div>
                    <div class="shelf-button-contents-select">Test menu 5</div>
                    <div class="shelf-button-contents-select">Test menu 6</div>
                </div>
            </div>
            <div class="left-sidebar-toggle-close">
                <button class="left-sidebar-toggle-close-btn" type="button"
                    onclick="left_sidebar_close_toggle_click();">
                    <i class="fas fa-chevron-left" style="font-size: 0.6rem;"></i></button>
            </div>
            <div id="left-sidebar-toggle-open">
                <button class="left-sidebar-toggle-open-btn" type="button" onclick="left_sidebar_open_toggle_click();">
                    <i class="fas fa-chevron-right" style="font-size: 0.6rem;"></i></i></button>
            </div>
        </div>

        <div id="content">
            <div class="content_title">
                <h3>Test Menu Name</h3>
            </div>
            <div class="content-view">
                <c:forEach items="${memberlist }" var="dto">
	                <div class="card-home">
	                    <h3>${dto.username }</h3>
	                </div>
                </c:forEach>

                <div class="card-home-teamplus"><span><a href="#"><i class="fas fa-user-plus"
                                style="font-size: 0.9rem; color:rgb(138, 138, 138);"></i>&nbsp&nbsp 팀원 초대</a></span>
                </div>
            </div>
        </div>

    </div>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        var left_sidebar = document.getElementById('left-sidebar-toggle');
        var left_sitebar_open = document.getElementById('left-sidebar-toggle-open');
        var dropdown_user = document.getElementById('dropdown-user');
        var dropdown_team = document.getElementById('dropdown-team');
        var content = document.getElementById('content');
        var selected_team_title = document.getElementById('selected-team-title');
        var profile_btn = document.getElementById('profile_btn');
        var right_sidebar = document.getElementById('right-sidebar');
        var right_sidebar_close = document.getElementsByClassName("right-sidebar-close")[0];
        var profile_modal = document.getElementById('profile_modal');
        var profile_close = document.getElementById("profile_close");
        var button_cancel = document.getElementById("button-cancel");
        var update_password_modal = document.getElementById("update_password_modal");
        var update_password_close = document.getElementById("update_password_close");
        var button_cancel2 = document.getElementById("button-cancel2");
        var workspace_setting = document.getElementById("workspace_setting");
        var team_modal = document.getElementById("team_modal");
        var team_modal_close = document.getElementById("team_modal_close");




        selected_team_title.addEventListener('click', function() {
            if (dropdown_team.style.display === "none") {
                dropdown_team.style.display = "block";

            } else {
                dropdown_team.style.display = "none";
            }
        });

        selected_team_title.addEventListener('blur', function(){
            dropdown_team.style.display = 'none';
            dropdown_user.style.display = 'none';
        });


        profile_btn.addEventListener('click',function(){
            if (dropdown_user.style.display === "none") {
                dropdown_user.style.display = "block";

            } else {
                dropdown_user.style.display = "none";
            }
        });

        // profile_btn.addEventListener('blur', () => {
        //     dropdown_user.style.display = 'none';
        //     dropdown_team.style.display = 'none';
        // });

        function right_sidebar_open() {
            right_sidebar.style.display = "block";
        }

        right_sidebar_close.onclick = function () {
            right_sidebar.style.display = "none";
        }


        function user_setting() {
            profile_modal.style.display = "block";
            dropdown_user.style.display = "none";
        }

        profile_close.onclick = function () {
            profile_modal.style.display = "none";
            $("#username").val('${login.username }');
            $("#stmessage").val('${login.stmessage }');
        }

        button_cancel.onclick = function () {
            profile_modal.style.display = "none";
            $("#username").val('${login.username }');
            $("#stmessage").val('${login.stmessage }');
        }

        function update_password_modal_open() {
            profile_modal.style.display = "none";
            update_password_modal.style.display = "block";
        }

        update_password_close.onclick = function () {
            update_password_modal.style.display = "none";
            $("#pastpw").val('');
            $("#newpw1").val('');
            $("#newpw2").val('');
            $("#pastpwcheck").html('');
            $("#newpw1check").html('');
            $("#newpw2check").html('');
        }

        button_cancel2.onclick = function () {
            update_password_modal.style.display = "none";
            $("#pastpw").val('');
            $("#newpw1").val('');
            $("#newpw2").val('');
            $("#pastpwcheck").html('');
            $("#newpw1check").html('');
            $("#newpw2check").html('');
        }

        /*team_modal_close.onclick = function () {
            team_modal.style.display = "none";
        }
        */
        function modal_close(){
        	team_modal.style.display = "none";
        }

        function profile_modal_open() {
            update_password_modal.style.display = "none";
            profile_modal.style.display = "block";
        }

        function team_modal_open() {
            team_modal.style.display = "block";
            dropdown_team.style.display = "none";
        }

/*        workspace_setting.addEventListener('click',function() {
            dropdown_team.style.display = "none";
            team_modal.style.display = "block";
        }); */

        function left_sidebar_close_toggle_click() {
            left_sidebar.style.display = "none";
            left_sitebar_open.style.display = "block";
            content.style.left = "65px";
            content.style.width = "calc(100% - 65px)";
        }

        function left_sidebar_open_toggle_click() {
            left_sidebar.style.display = "block";
            left_sitebar_open.style.display = "none";
            content.style.left = "304px";
            content.style.width = "calc(100% - 304px)";
        }

        function toggleFullScreen() {
            if (!document.fullscreenElement) {
                document.documentElement.requestFullscreen()
            } else {
                if (document.exitFullscreen) {
                    document.exitFullscreen()
                }
            }
        }
        
        function logout(){
        	if(confirm("로그아웃하시겠습니까?")){
        		$.ajax({
        			url:'logout.do',
        			type:'get',
        			dataType : 'json',
        			success : function(msg){
        				if(msg.check==true){
	        				alert('로그아웃되었습니다');
	        				location.href='index.jsp';
        				}
        			}
        		});
        	}
        }
        
        function infoUpdate(){
        	var userid=$("#userid").val();
        	var username=$("#username").val();
        	var stmessage=$("#stmessage").val();
        	var userinfo = {
        			'userid':userid,
        			'username':username,
        			'stmessage':stmessage
        	};
        	if(confirm('정보수정하시겠습니까?')){
        		$.ajax({
        			url:'userUpdate.do',
        			type:'post',
        			data:JSON.stringify(userinfo),
        			contentType:'application/json',
        			success:function(msg){
        				if(msg.check==1){
        					alert('수정완료');
        					window.location.reload();
        				}else{
        					alert("수정실패");
        				}
        			},
        			error:function(){
        				alert("통신실패요");
        			}
        		});
        	}
        }
        
        function secession(){
        	if(confirm('정말로 탈퇴하시겠습니까?')){
        		if(confirm('진짜 탈퇴하실건가요?')){
	        		$.ajax({
	        			url:'secession.do',
	        			type:'post',
	        			dataType:"json",
	        			success:function(msg){
	        				if(msg.check==true){
	        					alert('Devstairs를 이용해주셔서 감사합니다. 안녕히가세용');
	        					location.href='index.jsp';
	        				}
	        			},
	        			error:function(){
	        				
	        			}
	        		});
        		}
        	}
        }
        
        function delUser(data){
        	var userid = data;
        	var teamcode = ${teaminfo.teamcode};
        	
        	var info = {
        			'userid':userid,
        			'teamcode':teamcode
        	}
        	if(confirm('이 유저를 추방시키겠습니까?')){
        		$.ajax({
        			url:'teamUserDel.do',
        			type:'post',
        			dataType:'json',
        			data:JSON.stringify(info),
        			contentType:'application/json',
        			success:function(msg){
        				if(msg.check==true){
        					alert('추방되었습니다');
        					window.location.reload();
        				}
        			},
        			error:function(){
        				
        			}
        		});
        	}
        }
     	function workDel(){
     		var teamcode = ${teaminfo.teamcode};
     		
     		if(confirm('이 워크스페이스를 삭제하시겠습니까?')){
     			$.ajax({
     				url:'workspaceDelete.do',
     				type:'post',
     				data:'teamcode='+teamcode,
     				dataType:'json',
     				success:function(msg){
     					if(msg.check==true){
     						alert('워크스페이스가 삭제되었습니다.');
     						location.href='start.do';
     					}
     				},
     				error:function(){
     					
     				}
     			});
     		}
     	}
        $(function(){
        	$("#pwchangebtn").click(function(){
        		var pastpw = $("#pastpw").val();
        		console.log(pastpw);
        		var newpw1 = $("#newpw1").val();
        		var newpw2 = $("#newpw2").val();
        		if(pastpw!=null&&pastpw!=""){
        			$.ajax({
        				url:'pastpwcheck.do',
        				type:'post',
        				data :'userpw='+pastpw,
        				dataType:'json',
        				success:function(msg){
        					 $("#pastpwcheck").html('');
       			             $("#newpw1check").html('');
       			             $("#newpw2check").html('');
        					if(msg.check==false){
        						$("#pastpwcheck").html("<b style='font-size:12px;color:red'>기존 비밀번호가 일치하지 않습니다.</b>");
        						$('#pastpw').focus();
        					}else{
        						$("#pastpwcheck").html('');
        		        		if(newpw1==null||newpw1==""){
        		        			$("#newpw1check").html("<b style='font-size:12px;color:red'>새로운 비밀번호를 입력해주세요</b>");
        		        			$("#newpw1").focus();
        		        		}else{
        		        			$("#newpw1check").html('');
        		        			if(newpw2==null||newpw2==""){
            		        			$("#newpw2check").html("<b style='font-size:12px;color:red'>비밀번호를 다시 입력해주세요</b>");
            		        			$("#newpw2").focus();
            		        		}else{
            		        			$("#newpw2check").html('');
            		        			if(newpw1!=newpw2){
            		        				$("#newpw2check").html("<b style='font-size:12px;color:red'>비밀번호가 일치하지 않습니다.</b>");
            		        			}else{
            		        				if(newpw1==pastpw){
            		        					$("#newpw1check").html("<b style='font-size:12px;color:red'>기존의 비밀번호와 같은 비밀번호입니다.</b>");
            		        				}else{
            		        					$("#passwordUpdateForm").submit();
            		        				}
            		        			}
            		        			
            		        		}
        		        		}
        		        		
        					}
        				},
        				error:function(){
        					alert('에러');
        				}
        			});
        		
        		}else{
        			$("#pastpwcheck").html("<b style='font-size:12px;color:red'>기존 비밀번호를 입력해주세요</b>");
        		}
        		
        	});
        	
			$("#newpw1").keyup(function(){
				
			});
        	
        	
        });
    </script>
</body>
</html>
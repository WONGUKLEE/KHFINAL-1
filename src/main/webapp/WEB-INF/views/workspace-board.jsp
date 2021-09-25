<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset = UTF-8"); %>

<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

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
<body>
	<div class="wrapper">
        <nav class="navbar-fixed-top">
            <div class="workspace-title">
                <span class="icon-home">
                    <a href="index.jsp" class="alogo"><img id="homelogo" src="resources/images/logoicon.svg" alt="logo"></a>
                </span>
                <a href="" class="workspace-title__logo">
                    <span class="workspace-image"><a href="#"><img id="teamimage" src="resources/images/testteamimage.png"
                                alt="logo"></a></span>
                </a>
                <div class="workspace-name">
                    <!-- <span id="selected-team-title" onclick="team_toggle()"> -->
                    <span id="selected-team-title">
                        <h3>TeamName <i class="fas fa-chevron-down" style="font-size: 0.6rem; margin-left: 10px;"></i>
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

        <div id="dropdown-team">
            <ul>
                <li><span id="workspace_setting"><i class="fas fa-cog"
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

        <div id="dropdown-user">
            <ul>
                <li><span onclick="user_setting();"><i class="fas fa-cog"
                            style="font-size: 0.9rem; color:rgb(138, 138, 138);"></i>&nbsp&nbsp User Settings</span>
                </li>
                <li><span><a href="index.html"><i class="fas fa-sign-out-alt"
                                style="font-size: 0.9rem; color:rgb(138, 138, 138);"></i>&nbsp&nbsp Logout</a></span>
                </li>
            </ul>
        </div>

        <div id="profile_modal" class="modal">
            <div class="modal-content">
                <span id="profile_close">&times;</span>
                <div class="profile-setting-menu">
                    <button type="button" class="account-info-button">Account Information</button>
                    <button type="button" class="change-password-button" onclick="update_password_modal_open();">Change
                        Password</button>
                    <!-- <button type="button" class="change-password-button">Change Password</button> -->
                </div>
                <div class="profile-header">
                    <img src="resources/images/profile.svg" style="border-radius: 50%;" width="150px">
                    <button class="profile_image_setting" type="button">프로필 이미지 변경</button>
                    <div class="profile-info">
                        <h1>JJANG GU</h1>
                        <p style="color:rgb(118, 200, 255)">shinzzang@naver.com</p>
                        <p>화이팅입니다 🎈</p>
                    </div>
                </div>

                <div class="profile-update-form">
                    <form>
                        <label class="form-label">
                            <strong>Account name</strong>
                        </label>
                        <input class="account-name" type="text" placeholder="JJANG GU">
                        <br>
                        <label class="form-label">
                            <strong>Status Message</strong>
                        </label>
                        <input class="status-message" type="text" placeholder="화이팅입니다 🎈">
                        <br>
                        <label class="form-label">
                            <strong>E-mail</strong>
                        </label>
                        <input class="email" type="text" placeholder="shinzzang@naver.com" disabled>
                        <br>


                        <div class="form-buttons">
                            <button type="button" id="button-cancel">취소</button>
                            <button type="submit" class="button-confirm">확인</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>

        <div id="update_password_modal" class="modal2">
            <div class="modal-content">
                <span id="update_password_close">&times;</span>
                <div class="profile-setting-menu">
                    <button type="button" class="account-info-button2" onclick="profile_modal_open();">Account
                        Information</button>
                    <button type="button" class="change-password-button2">Change Password</button>
                </div>
                <div class="password-update-form">
                    <form>
                        <h1>Update password 🔑</h1>
                        <label class="form-label">
                            <strong>Current password</strong>
                        </label>
                        <input class="password-form" type="password" placeholder="Current password">
                        <br>
                        <label class="form-label">
                            <strong>New password</strong>
                        </label>
                        <input class="password-form" type="password" placeholder="New password">
                        <br>
                        <label class="form-label">
                            <strong>Confirm password</strong>
                        </label>
                        <input class="password-form" type="password" placeholder="Confirm password">
                        <br>


                        <div class="form-buttons2">
                            <button type="button" id="button-cancel2">취소</button>
                            <button type="submit" class="button-confirm">확인</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>

        <div id="team_modal" class="modal3">
            <div class="modal-content">
                <span id="team_modal_close">&times;</span>
                <div class="team-setting-menu">

                </div>
                <div class="team-header">
                    <img src="resources/images/testteamimage.svg" style="width: 150px;">
                    <button class="team_image_setting" type="button">팀 이미지 변경</button>
                    <div class="team-info">
                        <h1>TeamName</h1>
                    </div>
                </div>

                <div class="team-update-form">
                    <form>
                        <label class="form-label">
                            <strong>Workspace name</strong>
                        </label>
                        <input class="Workspace-name" type="text" placeholder="Workspace name">
                        <label class="form-label">
                            <strong>Team Management</strong>
                        </label>
                        <div class="team-manage">
                            <div class="teamlist">
                                <span class="teamperson">팀원 A &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    teampersonA@naver.com &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; </span>
                                <button class="delete-user"><i class="fas fa-minus" style="color:red;"></i></button>
                            </div>
                            <div class="teamlist">
                                <span class="teamperson">팀원 B &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    teampersonB@naver.com &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; </span>
                                <button class="delete-user"><i class="fas fa-minus" style="color:red;"></i></button>
                            </div>
                            <div class="teamlist">
                                <span class="teamperson">팀원 C &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    teampersonC@naver.com &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; </span>
                                <button class="delete-user"><i class="fas fa-minus" style="color:red;"></i></button>
                            </div>
                            <div class="teamlist">
                                <span class="teamperson">팀원 D &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    teampersonD@naver.com &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; </span>
                                <button class="delete-user"><i class="fas fa-minus" style="color:red;"></i></button>
                            </div>
                            <div class="teamlist">
                                <span class="teamperson">팀원 E &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    teampersonE@naver.com &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; </span>
                                <button class="delete-user"><i class="fas fa-minus" style="color:red;"></i></button>
                            </div>
                            <div class="teamlist">
                                <span class="teamperson">팀원 F &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    teampersonF@naver.com &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; </span>
                                <button class="delete-user"><i class="fas fa-minus" style="color:red;"></i></button>
                            </div>
                            <div class="teamlist">
                                <span class="teamperson">팀원 G &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    teampersonG@naver.com &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; </span>
                                <button class="delete-user"><i class="fas fa-minus" style="color:red;"></i></button>
                            </div>
                            <div class="teamlist">
                                <span class="teamperson">팀원 H &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    teampersonH@naver.com &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; </span>
                                <button class="delete-user"><i class="fas fa-minus" style="color:red;"></i></button>
                            </div>
                            <div class="teamlist">
                                <span class="teamperson">팀원 I &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    teampersonI@naver.com &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; </span>
                                <button class="delete-user"><i class="fas fa-minus" style="color:red;"></i></button>
                            </div>

                        </div>
                    </form>
                    <div class="form-buttons">
                        <button type="button" id="button-cancel">취소</button>
                        <button type="submit" class="button-confirm">확인</button>
                        <button type="button" class="delete-workspace">워크스페이스 삭제</button>
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
            <a href="workspace-home.html" class="shelf-button--home"><i class="fas fa-home"
                    style="font-size: 1rem; color:rgb(255, 248, 248);"></i></a>
            <a href="workspace-chat.html" class="shelf-button--channel"><i class="fas fa-comment"
                    style="font-size: 1rem; color:rgb(255, 248, 248);"></i></a>
            <a href="workspace-board.html" class="shelf-button--board" style="background-color:rgb(255, 171, 92)"><i class="fas fa-pen"
                    style="font-size: 1rem; color:rgb(255, 248, 248);"></i></a>
            <a href="workspace-calendar.html" class="shelf-button--calendar"><i class="fas fa-calendar-alt"
                    style="font-size: 1rem; color:rgb(255, 248, 248);"></i></a>
            <a href="workspace-todo.html" class="shelf-button--todo"><i class="fas fa-check"
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
                <div class="shlef-button-title" style="color:rgb(255, 171, 92)"><i class="fas fa-pen"></i>&nbsp Team Board</div>
                <div class="shelf-button-contents">
                    <div class="shelf-button-contents-label">General</div>
                    <div class="shelf-button-contents-select" style="background-color:rgb(255, 171, 92); color:white;" onclick = "List();">All</div>
                    <div class="shelf-button-contents-select" onclick = "myList();">Me</div>

                    <div class="shelf-button-contents-label">Category</div>
                    <div class="shelf-button-contents-select" onclick = "type_meeting();">Meeting</div>
                    <div class="shelf-button-contents-select" onclick = "type_code();">Code</div>
                    <div class="shelf-button-contents-select" onclick = "type_etc();">Etc</div>
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
                <div class="board-write">
                    <!-- <button class="btn-hover color-2"><i class="fas fa-pen" style="font-size: 1.5rem;"></i></button> -->

               
                    <button class="btn-hover color-4" onclick = "location.href='writeform.do?b_teamcode=${b_teamcode}'"><i class="fas fa-pen"style="font-size: 1.5rem;"></i></button>

                </div>
                <div class="boardlist">
                	<c:choose>
                		<c:when test="${empty list and empty mylist and empty categorylist}">
                			<div>
                				<div>게시글이 없습니다.</div>
                			</div>
                		</c:when>
                		<c:otherwise>
                			<c:forEach items = "${list}" var = "dto">
                				<div class="list card card-2" onclick = "location.href='boarddetail.do?b_no=${dto.b_no}'">
			                        <img class="thumbnail" src="images/boardtest1.jpeg">
			                        <div class="board-title">${dto.b_title }</div>
			                        <div class="board-content">${dto.b_content}</div>
			                        <div class="board-info">
			                            <span>
			                                <img src="images/profile.svg"
			                            	style="border-radius: 50%;" height="30px">
			                            </span>
			                            <span class="board-writer">${b_userid}</span>
			                            <span class="board-star"><i class="fas fa-star" style="font-size: 17px; color:rgb(138, 138, 138);"></i></span>
			                        </div>
		                    	</div>                			
                			</c:forEach>
                			<c:forEach items = "${mylist}" var = "dto">
                				<div class = "mylist card card-2" onclick = "location.href='boarddetail.do?b_no=${dto.b_no}'">
                					<img class="thumbnail" src="images/boardtest1.jpeg">
			                        <div class="board-title">${dto.b_title }</div>
			                        <div class="board-content">${dto.b_content}</div>
			                        <div class="board-info">
			                            <span>
			                                <img src="images/profile.svg"
			                            	style="border-radius: 50%;" height="30px">
			                            </span>
			                            <span class="board-writer">${b_userid}</span>
			                            <span class="board-star"><i class="fas fa-star" style="font-size: 17px; color:rgb(138, 138, 138);"></i></span>
			                        </div>
                				</div>
                			</c:forEach>
                			<c:forEach items = "${categorylist}" var = "dto">
                				<div class = "categorylist card card-2" onclick = "location.href='boarddetail.do?b_no=${dto.b_no}'">
                					<img class="thumbnail" src="images/boardtest1.jpeg">
			                        <div class="board-title">${dto.b_title }</div>
			                        <div class="board-content">${dto.b_content}</div>
			                        <div class="board-info">
			                            <span>
			                                <img src="images/profile.svg"
			                            	style="border-radius: 50%;" height="30px">
			                            </span>
			                            <span class="board-writer">${b_userid}</span>
			                            <span class="board-star"><i class="fas fa-star" style="font-size: 17px; color:rgb(138, 138, 138);"></i></span>
			                        </div>
                				</div>
                			</c:forEach>
                		</c:otherwise>
                	</c:choose>
                </div>
            </div>
        </div>

    </div>
    
    <script src = "https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    	/* $(function(){
   			$(".mylist").hide();
   			$(".categorylist ").hide();
    	});
    	
   		function myList(){
   			$(".list").hide();
   			$(".mylist").show();
   			$(".categorylist").hide();
   		}
   		
   		function List(){
   			$(".mylist").hide();
   			$(".list").show();
   			$(".categorylist").hide();
   		}
   		
		function type_meeting(){
			location.href='categorylist.do?c_no='+1+'&b_teamcode='+${b_teamcode};
			
			$(".categorylist").show();
			$(".mylist").hide();
   			$(".list").hide();
   		}
   		function type_code(){
   			location.href='categorylist.do?c_no='+2+'&b_teamcode='+${b_teamcode};
   			$(".categorylist").show();
			$(".mylist").hide();
   			$(".list").hide();
   			
   		}
    	
   		function type_etc(){
   			location.href='categorylist.do?c_no='+3+'&b_teamcode='+${b_teamcode};

   			$(".categorylist").show();
			$(".mylist").hide();
   			$(".list").hide();
    	} */
    	
    	/*  $(function(){
			$(".mylist").hide();
			$(".categorylist ").hide();
		});
	 */
		function type_meeting(){
			$.ajax({
				url:"boardlist.do",
				type:'get',
				dataType: 'json',
				
				success : function(msg){
					if(msg.check==true){
						alert('회의록');
						location.href='boardlist.do';
					}
					
				}
			});	
		}
		
		function type_code(){
			$.ajax({
				url:"boardlist.do",
				type:'get',
				dataType: 'json',
				success:function(msg1){
					if(msg1.check==true){
						alert('코드리뷰');
						location.href='boardlist.do';
					}
				}
				
			});
			
		}
		function type_etc(){
			$.ajax({
				url:"boardlist.do",
				type:'get',
				dataType: 'json',
				success:function(msg1){
					if(msg1.check==true){
						alert('코드리뷰');
						location.href='boardlist.do';
					}
				}
				
			});
			
			
		}
		
		function List(){
			$(".mylist").hide();
			$(".list").show();
			$(".categorylist").hide();
		}
		
	function type_meeting(){
		location.href='categorylist.do?c_no='+1+'&b_teamcode='+${b_teamcode};
		
		$(".categorylist").show();
		$(".mylist").hide();
			$(".list").hide();
		}
		function type_code(){
			location.href='categorylist.do?c_no='+2+'&b_teamcode='+${b_teamcode};
			$(".categorylist").show();
		$(".mylist").hide();
			$(".list").hide();
			
		}
	
		function type_etc(){
			location.href='categorylist.do?c_no='+3+'&b_teamcode='+${b_teamcode};

			$(".categorylist").show();
		$(".mylist").hide();
			$(".list").hide();
	} 
   		
    	
    </script>
    
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




        selected_team_title.addEventListener('click', () => {
            if (dropdown_team.style.display === "none") {
                dropdown_team.style.display = "block";

            } else {
                dropdown_team.style.display = "none";
            }
        });

        selected_team_title.addEventListener('blur', () => {
            dropdown_team.style.display = 'none';
            dropdown_user.style.display = 'none';
        });


        profile_btn.addEventListener('click', () => {
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
        }

        button_cancel.onclick = function () {
            profile_modal.style.display = "none";
        }

        function update_password_modal_open() {
            profile_modal.style.display = "none";
            update_password_modal.style.display = "block";
        }

        update_password_close.onclick = function () {
            update_password_modal.style.display = "none";
        }

        button_cancel2.onclick = function () {
            update_password_modal.style.display = "none";
        }

        team_modal_close.onclick = function () {
            team_modal.style.display = "none";
        }

        function profile_modal_open() {
            update_password_modal.style.display = "none";
            profile_modal.style.display = "block";
        }

        // function team_modal_open() {
        //     team_modal.style.display = "block";
        //     dropdown_team.display = "none";
        // }

        workspace_setting.addEventListener('click', () => {
            dropdown_team.style.display = "none";
            team_modal.style.display = "block";
        });

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
    
    </script>
	
</body>
</html>
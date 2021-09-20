<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>계단 - 개발자 협업을 위한 첫 걸음</title>
<link rel="stylesheet" href="resources/css/styles.css">
<link rel="icon" type="image/png" sizes="32x32" href="resources/images/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon-16x16.png">
<link
    rel="stylesheet"
    href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
<style>
    .btn-social-login {
        transition: all 0.2s;
        outline: 0;
        border: 1px solid transparent;
        padding: 0.7rem !important;
        margin: 5px;
        border-radius: 30%;
        color: #fff;
    }
    .btn-social-login:focus {
        box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
    }
    .text-dark {
        color: #343a40!important;
    }
    #loginChk{
    	position: relative;
    	left: 20px;
    	font-size: 13px;
    }
</style>
</head>
<body>
	<nav>
            <div class="nav-content">
                <a href="index.jsp"><img class="logo" src="resources/images/logo3.svg" alt="logo"></a>

                <div class="nav-right">
                    <ul class="nav-links">
                        <li>
                            <a href="#">기능</a>
                        </li>
                        <li>
                            <a href="#">팀 소개</a>
                        </li>
                        <li>
                            <a href="#">문의하기</a>
                        </li>
                    </ul>
                    <div class="buttons">
                        <!-- Trigger/Open The Modal -->
                        <button id="myBtn" class="btn-hover color-9" type="button">로그인</button>
                    </div>
                </div>
            </div>
        </nav>


        <!-- The Modal -->
        <div id="myModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close">&times;</span>
                <br>
                <div class="loginlogo"><img src="resources/images/logoicon2.png" alt="로고아이콘">
                </div>

                <form class="sign-in-user-area">
                    <fieldset>
                        <legend>sign-in</legend>

                        <div class="form-textbox">
                            <input
                            	id="loginid"
                                placeholder="이메일"
                                class="form-textbox-input "
                                autocomplete="off"
                                value="">
                        </div>
                        <div class="form-textbox">
                            <input
                                id="loginpw"
                                type="password"
                                placeholder="비밀번호"
                                class="form-textbox-input "
                                autocomplete="off"
                                value="">
                            <span class="show-pwd">
                                <i class="fas fa-eye"></i>
                            </span>
                        </div>
                        <div id="loginChk"></div>
                        <div class="form-submit">
                            <button type="button" class="signin-submit-button color-9" id="loginbtn">로그인</button>
                        </div>
                    </fieldset>
                </form>

                <div>
                    <p class="sign-in-modal__more-action">
                        <button class="find-password more-action__text" type="button" onclick="find_password_click();">비밀번호 찾기</button>
                        <span class="between">|</span>
                        <button
                            class="modal-sign-up more-action__text"
                            type="button"
                            onclick="modal_sign_up_click();">가입하기</button>
                    </p>
                </div>

                <div class="divider">
                    <span class="left-line"></span>
                    <span class="line-text">또는</span>
                    <span class="right-line"></span>
                </div>

                <div class="social__sign-in-buttons">
                    <button class='btn-social-login' style='background:#FFEB00' onclick="loginWithKakao();">
                        <i class="xi-2x xi-kakaotalk text-dark"></i>
                    </button>

                    <button class='btn-social-login' style='background:#1FC700' onclick="loginWithNaver();">
                        <i class="xi-2x xi-naver"></i>
                    </button>

                    <button class='btn-social-login' style='background:#24292E'>
                        <i class="xi-2x xi-github"></i>
                    </button>

                    <button class='btn-social-login' style='background:#f1f1f1' onclick="loginWithGoogle();">
                        <svg width="26.6667" height="26.6667" fill="none" viewbox="0 0 20 20">
                            <path
                                fill="#4285F4"
                                d="M19.99 10.187c0-.82-.069-1.417-.216-2.037H10.2v3.698h5.62c-.113.92-.725 2.303-2.084 3.233l-.02.124 3.028 2.292.21.02c1.926-1.738 3.037-4.296 3.037-7.33z"></path>
                            <path
                                fill="#34A853"
                                d="M10.2 19.931c2.753 0 5.064-.886 6.753-2.414l-3.218-2.436c-.862.587-2.017.997-3.536.997a6.126 6.126 0 0 1-5.801-4.141l-.12.01-3.148 2.38-.041.112c1.677 3.256 5.122 5.492 9.11 5.492z"></path>
                            <path
                                fill="#FBBC05"
                                d="M4.398 11.937a6.008 6.008 0 0 1-.34-1.971c0-.687.125-1.351.329-1.971l-.006-.132-3.188-2.42-.104.05A9.79 9.79 0 0 0 .001 9.965a9.79 9.79 0 0 0 1.088 4.473l3.309-2.502z"></path>
                            <path
                                fill="#EB4335"
                                d="M10.2 3.853c1.914 0 3.206.809 3.943 1.484l2.878-2.746C15.253.985 12.953 0 10.199 0 6.211 0 2.766 2.237 1.09 5.492l3.297 2.503A6.152 6.152 0 0 1 10.2 3.853z"></path>
                        </svg>
                    </button>
                </div>
            </div>
        </div>

        <!-- The Modal -->
        <div id="myModal2" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close">&times;</span>
                <br>
                <div class="loginlogo"><img src="resources/images/logoicon2.png" alt="로고아이콘">
                </div>

                <form class="sign-in-user-area" action="sendEmail.do" method="post" id="signform">
                    <fieldset>
                        <legend>sign-up</legend>

                        <p class="email-sign-up">해당 이메일로 회원가입 링크를 전송해 드립니다</p>
                        <div class="form-textbox">
                            <input
                            	type="email"
                            	id="emailWrite"
                            	name="email"
                                placeholder="이메일"
                                class="form-textbox-input "
                                autocomplete="off"
                                value="">
                        </div>
                        <div class="form-submit">
                            <!--  <button type="button" class="signin-submit-button color-9" onclick="location.href='signup.html'">전송하기</button>-->
                            <input type="button" id="smbtn" value="전송하기" class="signin-submit-button color-9">
                        </div>

                    </fieldset>
                </form>
                <div class="divider2">
                    <span class="left-line2"></span>
                    <span class="line-text">간편 회원가입</span>
                    <span class="right-line2"></span>
                </div>

                <div class="social__sign-in-buttons">
                    <button class='btn-social-login' style='background:#FFEB00'>
                        <i class="xi-2x xi-kakaotalk text-dark"></i>
                    </button>

                    <button class='btn-social-login' style='background:#1FC700'>
                        <i class="xi-2x xi-naver"></i>
                    </button>

                    <button class='btn-social-login' style='background:#24292E'>
                        <i class="xi-2x xi-github"></i>
                    </button>

                    <button class='btn-social-login' style='background:#f1f1f1'>
                        <svg width="26.6667" height="26.6667" fill="none" viewbox="0 0 20 20">
                            <path
                                fill="#4285F4"
                                d="M19.99 10.187c0-.82-.069-1.417-.216-2.037H10.2v3.698h5.62c-.113.92-.725 2.303-2.084 3.233l-.02.124 3.028 2.292.21.02c1.926-1.738 3.037-4.296 3.037-7.33z"></path>
                            <path
                                fill="#34A853"
                                d="M10.2 19.931c2.753 0 5.064-.886 6.753-2.414l-3.218-2.436c-.862.587-2.017.997-3.536.997a6.126 6.126 0 0 1-5.801-4.141l-.12.01-3.148 2.38-.041.112c1.677 3.256 5.122 5.492 9.11 5.492z"></path>
                            <path
                                fill="#FBBC05"
                                d="M4.398 11.937a6.008 6.008 0 0 1-.34-1.971c0-.687.125-1.351.329-1.971l-.006-.132-3.188-2.42-.104.05A9.79 9.79 0 0 0 .001 9.965a9.79 9.79 0 0 0 1.088 4.473l3.309-2.502z"></path>
                            <path
                                fill="#EB4335"
                                d="M10.2 3.853c1.914 0 3.206.809 3.943 1.484l2.878-2.746C15.253.985 12.953 0 10.199 0 6.211 0 2.766 2.237 1.09 5.492l3.297 2.503A6.152 6.152 0 0 1 10.2 3.853z"></path>
                        </svg>
                    </button>
                </div>
            </div>
        </div>

        <!-- The Modal -->
        <div id="myModal3" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close">&times;</span>
                <br>
                <div class="loginlogo"><img src="resources/images/logoicon2.png" alt="로고아이콘">
                </div>

                <form class="sign-in-user-area" >
                    <fieldset>
                        <legend>sign-up</legend>

                        <p class="email-sign-up">가입된 이메일로 비밀번호 변경 링크를 전송합니다</p>
                        <div class="form-textbox">
                            <input
                            	id="findemail"
                            	name="email"
                                placeholder="이메일"
                                class="form-textbox-input "
                                autocomplete="off"
                                value="">
                        </div>
                        <div class="form-submit">
                            <!--  <button type="button" class="signin-submit-button color-9" onclick="transfer2();">전송하기</button>-->
                            <!-- <input type="submit" value="전송하기" class="signin-submit-button color-9" onclick="transfer2();">-->
                             <input type="button" value="전송하기" class="signin-submit-button color-9" id="findpwbtn">
                        </div>
                        <p id="transfer2" class="transfer-complete">전송 완료</p>
                    </fieldset>
                </form>
            </div>
        </div>

        <section class="home"></section>
        <section class="home2"></section>
        <section class="b"></section>
        <section class="c"></section>
        <section class="d"></section>

        <div class="footer">
            <div>
                <h2>KH Final project</h2>
                <p>
                    <small>&copy; 김재훈 | 김희주 | 이원국 | 정지연 | 채현규</small>
                </p>
            </div>
            <div>
                <button class='btn-social-login' style='background:#24292E'>
                    <i class="xi-3x xi-github"></i>
                </button>
                <h3>
                    v.0.1.0
                </h3>
            </div>
        </div>
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            let nav = document.querySelector("nav");
            window.onscroll = function () {
                if (document.documentElement.scrollTop > 20) {
                    nav
                        .classList
                        .add("sticky");
                } else {
                    nav
                        .classList
                        .remove("sticky");
                }
            }

            var trans = document.getElementById("transfer");
            var trans2 = document.getElementById("transfer2");

            // Get the modal
            var modal = document.getElementById('myModal');
            var modal2 = document.getElementById('myModal2');
            var modal3 = document.getElementById('myModal3');

            // Get the button that opens the modal
            var btn = document.getElementById("myBtn");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];
            var span2 = document.getElementsByClassName("close")[1];
            var span3 = document.getElementsByClassName("close")[2];

            // var span = document.getElementsByClassName("close"); When the user clicks on
            // the button, open the modal
            btn.onclick = function () {
                modal.style.display = "block";
            }

            // When the user clicks on <span> (x), close the modal
            span.onclick = function () {
                modal.style.display = "none";
            }

            span2.onclick = function () {
                modal2.style.display = "none";
            }

            span3.onclick = function () {
                modal3.style.display = "none";
            }

            // When the user clicks anywhere outside of the modal, close it window.onclick =
            // function (event) {     if (event.target == modal) {
            // modal.style.display = "none";     } }

            const passField = document.getElementById("pwd");
            const showBtn = document.querySelector("span i");
            showBtn.onclick = (() => {
                if (passField.type === "password") {
                    passField.type = "text";
                    showBtn
                        .classList
                        .add("hide-btn");
                } else {
                    passField.type = "password";
                    showBtn
                        .classList
                        .remove("hide-btn");
                }
            });

            function modal_sign_up_click() {
                modal.style.display = "none";
                modal2.style.display = "block";
            }

            function find_password_click() {
                modal.style.display = "none";
                modal3.style.display = "block";
            }

            function transfer() {
                trans.style.display = "block";
            }
            
            function transfer2() {
                trans2.style.display = "block";
            }
            
            function loginWithNaver(){
        		$.ajax({
        			url : 'getnaverUrl.do',
        			type : 'get',
        		}).done(function(res){
        			location.href=res;
        		});
        	}
        	function loginWithGithub(){
        		$.ajax({
        			url : 'getgithubUrl.do',
        			type : 'get',
        		}).done(function(res){
        			location.href=res;
        		});
        	}
        	function loginWithGoogle(){
        		$.ajax({
        			url : 'getgoogleUrl.do',
        			type : 'get',
        		}).done(function(res){
        			location.href=res;
        		});
        	}
        	function loginWithKakao(){
        		$.ajax({
        			url : 'getkakaoUrl.do',
        			type : 'get',
        		}).done(function(res){
        			location.href=res;
        		});
        	}
            
            
            
            $(function(){
            	$("#smbtn").click(function(){
            	var email = $("#emailWrite").val();
            	var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
            	console.log(email);
            	if(!email_rule.test(email)){
            		alert("이메일을 형식에 맞게 입력해주세요.");
            	    return false;
            	}else{
	            	$.ajax({
	            		url : 'emailCheck.do?email='+email,
	            		type : 'get',
	            		dataType : "json",
	            		success : function(msg){
	            			if(msg.check==false){
	            				alert('이미 사용중인 이메일입니다.');
			            		return false;
	            			}else{
	            				$.ajax({
	            					url : 'sendEmail.do?email='+email,
	            					type : 'post',
	            					success : function(){
	            						console.log("통신완료");
	            						alert("이메일로 링크가 전송되었습니다");
	            					},
	            					error : function(){
	            						
	            					}
	            				});
	            			}
	            		}
	            	});
            		}
            	});
	            $("#findpwbtn").click(function(){
	            	var email = $("#findemail").val();
	            	var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	            	console.log(email);
	            	if(!email_rule.test(email)){
	            		alert("이메일을 형식에 맞게 입력해주세요.");
	            	    return false
	            	}else{
	            		$.ajax({
		            		url : 'emailCheck.do?email='+email,
		            		type : 'get',
		            		dataType : "json",
		            		success : function(msg){
		            			if(msg.check==true){
		            				alert('가입되지 않은 이메일입니다.');
				            		return false;
		            			}else{
		            				transfer2();
		            				$.ajax({
		            					url : 'findpw.do?email='+email,
		            					type : 'post',
		            					success : function(){
		            						console.log("통신완료");
		            						alert("이메일로 링크가 전송되었습니다");
		            					},
		            					error : function(){
		            						
		            					}
		            				});
		            			}
		            		}
		            	});
	            	}
	            });	
            	
            	
            	
            	$("#loginbtn").click(function(){
            		var userid = $("#loginid").val();
            		var userpw = $("#loginpw").val();
            		var loginVal = {"userid":userid,"userpw":userpw};
            		if(userid==null||userid==""||userpw==null||userpw==""){
            			alert("아이디와 패스워드를 입력해주세요");
            		}else{
	            		$.ajax({
	            			url: 'ajaxlogin.do',
	            			type : 'post',
	            			data:JSON.stringify(loginVal),
	            			contentType:"application/json",
	            			dataType:"json",
	            			success:function(msg){
	            				if(msg.check == true){
	    							location.href="start.do";
	    						}else{
	    							$("#loginChk").show();
	    							$("#loginChk").html("<b>ID 혹은 PW가 잘못되었습니다</b>");
	    						}
	            			},
	            			error:function(){
	            				alert(통신실패);
	            			}
	            		});
            			
            		}
            	});
            	
            });

        </script>
</body>
</html>
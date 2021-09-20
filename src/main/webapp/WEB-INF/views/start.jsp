<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.khfinal.devstairs.user.dto.UserDto" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<% response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>계단 - 개발자 협업을 위한 첫 걸음</title>
        <link rel="stylesheet" href="resources/css/start.css">
        <link rel="icon" type="image/png" sizes="32x32" href="resources/images/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon-16x16.png">
</head>
<body>
	<nav>
            <div class="nav-content">
                <a href="start.do"><img class="logo" src="resources/images/logo3.svg" alt="logo"></a>
            </div>
        </nav>

        <div class="container">
            <div class="teamhome">
                <div class="myprofile">
                    <div>
                        <a href=><img class="profile-pic" src="resources/images/profile.svg" alt="프로필이미지"></a>
                    </div>
                    <div class="myprofile-detail">
                        <dic class="myprofile-detail-name"><h1>${login.username }</h1></dic>
                        <dic class="myprofile-detail-email"><p>${login.userid }</p></dic>
                        <dic class="myprofile-detail-setting"><a>User setting</a>&nbsp&nbsp&nbsp<a onclick="logout();">LogOut</a></dic>
                    </div>

                </div>
                
                <div class="myteam">
                    <a href="teammakeform.do" class="teammake">+ Build a workspace</a>
                    <c:choose>
                    	<c:when test="${empty list }">
                    		
                    	</c:when>
                    	<c:otherwise>
                    		<c:forEach items="${list }" var="dto">
			            		<div class="team1" onclick="location.href='workspace.do?teamcode=${dto.teamcode}'">
			                        <dic class="workspace-card-icon">
			                            <img class="team-pic" src="resources/images/kh.jpg" alt="팀이미지">
			                        </dic>
			                        <dic class="workspace-card-info">
			                            <span class="workspace-card-info__title">${dto.teamname }</span>
			                            <span class="workspace-card-info__role">${dto.admin }</span>
			                        </dic>
			                        <dic class="workspace-card-menu">
			                            <a class="workspace-card-btn">Workspace Setting</a>
			                            <a class="workspace-card-btn-leave">Leave</a>
			                        </dic>
			                    </div>
                    		</c:forEach>
                    	</c:otherwise>
                    </c:choose>
                  <!-- 
                    <div class="team1">
                        <dic class="workspace-card-icon">
                            <img class="team-pic" src="resources/images/kh.jpg" alt="팀이미지">
                        </dic>
                        <dic class="workspace-card-info">
                            <span class="workspace-card-info__title">TeamName</span>
                            <span class="workspace-card-info__role">Admin</span>
                        </dic>
                        <dic class="workspace-card-menu">
                            <a class="workspace-card-btn">Workspace Setting</a>
                            <a class="workspace-card-btn-leave">Leave</a>
                        </dic>
                    </div> -->
                </div>
            </div>
        </div>

 <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
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
        </script>
</body>
</html>
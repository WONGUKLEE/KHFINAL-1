<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>계단 - 개발자 협업을 위한 첫 걸음</title>
<link rel="stylesheet" href="resources/css/styles2.css">
<link rel="icon" type="image/png" sizes="32x32" href="resources/images/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon-16x16.png">
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
<title>Insert title here</title>
<style type="text/css">
	.passcheck{
		font-size: 10px;
		color : red;
	}
	#passwordOk{
		color : green;
	}
</style>
</head>
<body>
    <nav>
        <div class="nav-content">
            <a href="index.html"><img class="logo" src="resources/images/logo3.svg" alt="logo"></a>
        </div>
    </nav>

    <div class="wrap wd668">
        <div class="container">
          <div class="form_txtInput">
            <h2 class="sub_tit_txt">회원가입</h2>
            <p class="exTxt">환영합니다! 기본 정보를 입력해주세요</p>
            <div class="join_form">
            <form action="regist.do" method="post">
              <table>
                <colgroup>
                  <col width="30%"/>
                  <col width="auto"/>
                </colgroup>
                <tbody>
                  <tr>
                    <th><span>아이디</span></th>
                    <td><input type="text" value="${email }" readonly="readonly" name="userid"></td>
                  </tr>
                  <tr>
                    <th><span>이름</span></th>
                    <td><input type="text" placeholder="이름을 입력해주세요." id="username" name="username" required="required"></td>
                  </tr>
                  <tr>
                    <th><span>비밀번호</span></th>
                    <td><input type="password" placeholder="비밀번호를 입력해주세요." id="userpw1" name="userpw" required="required"></td>
                  </tr>
                  <tr>
                    <th><span>비밀번호 확인</span></th>
                    <td><input type="password" placeholder="비밀번호를 확인하세요" id="userpw2" required="required"></td>
                  </tr>
                  <tr>
                  	  <td></td>
	                  <td id="passwordFalse" class="passcheck" align="left"><b>비밀번호가 일치하지 않습니다.</b></td>
    	              <td id="passwordOk" class="passcheck" align="left"><b>비밀번호가 일치합니다.</b></td>
                  </tr>
                </tbody>
              </table>
              <div class="exform_txt"><span>표시는 필수적으로 입력해주셔야 가입이 가능합니다.</span></div>
            </div><!-- join_form E  -->
        <!-- 
            <div class="agree_wrap">
              <div class="checkbox_wrap">
                <input type="checkbox" id="news_letter" name="news_letter" class="agree_chk">
                <label for="news_letter">[선택] 혹시나 선택적으로 수집할 정보가 있을까요 ? </label>
              </div>
              <div class="checkbox_wrap mar27">
                <input type="checkbox" id="marketing" name="marketing" class="agree_chk">
                <label for="marketing">[선택] 생각나는건 없지만.. </label>
                <ul class="explan_txt">
                  <li><span class="red_txt">항목 : 성별, 생년월일</span></li>
                  <li>고객님께서는 위의 개인정보 및 회원정보 수정 등을 통해 추가로 수집하는 개인정보에<br/>
                    대해 동의하지 않거나 개인정보를 기재하지 않음으로써 거부하실 수 있습니다.<br/>
                    다만 이때 회원 대상 서비스가 제한될 수 있습니다.
                  </li>
                </ul>
              </div>
            </div>
         --> 
            <div class="btn_wrap">
             <input type="submit" value="회원가입" class="btn_wrap" id="signsubmit">
            </div>
            </form>
          </div> <!-- form_txtInput E -->
        </div><!-- content E-->
      </div> <!-- container E -->


<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    	$(function(){
    		$(".passcheck").hide();
    		$("input").keyup(function(){
    			var pass1 = $("#userpw1").val();
    			var pass2 = $("#userpw2").val();
    			if(pass1!=""||pass2!=""){
	    			if(pass1!=pass2){
	    				$("#passwordOk").hide();
	    				$("#passwordFalse").show();
	    				$("#signsubmit").attr("disabled",true);
	    			}else{
	    				$("#passwordFalse").hide();
	    				$("#passwordOk").show();
	    				$("#signsubmit").attr("disabled",false);
	    			}
    			}
    		});
    		
    		
    		
    	});
		
    </script>

</body>
</html>
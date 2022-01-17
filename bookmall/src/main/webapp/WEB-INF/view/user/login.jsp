<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">    
    <title>로그인</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>    
    <link rel="stylesheet" href="/bookmall/css/reset.css"/>
    <link rel="stylesheet" href="/bookmall/css/common.css"/>
    <link rel="stylesheet" href="/bookmall/css/contents.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script src="/bookmall/js/common.js"></script>
    <script>
    
  		//로그인 버튼 클릭시
    	function loginCheck() {
    		if ($("#email").val() == '') {
    			alert('이메일을 입력해 주세요');
    			$("#email").focus();
    			return false;
    		}
    		if ($("#pwd").val() == '') {
    			alert('비밀번호를 입력해 주세요');
    			$("#pwd").focus();
    			return false;
    		}
    		if($("#saveEmail").is(":checked")){
		        var userId = $("#email").val();
		        setCookie("Cookie_userid", userId, 30);
		    }else{
		        deleteCookie("Cookie_userid");
		    }
    	}
  		
    	function loginWithKakao() {
    		// SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
    		Kakao.init('2098e03da186e9b37098442fd1828311');
    		// SDK 초기화 여부를 판단합니다.
    	    console.log(Kakao.isInitialized());
    	    Kakao.Auth.login({
    	    	scope:''
    	    });
		}


  		
        
        
        
        
        
        
        
        
  		// 쿠키 저장
    	function setCookie(cookieName, value, exdays){
    	    var exdate = new Date();
    	    exdate.setDate(exdate.getDate() + exdays);
    	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    	    document.cookie = cookieName + "=" + cookieValue;
    	}
    	
  		// 쿠키 불러오기
    	function getCookie(cookieName) {
    	    cookieName = cookieName + '=';
    	    var cookieData = document.cookie;
    	    var start = cookieData.indexOf(cookieName);
    	    var cookieValue = '';
    	    if(start != -1){
    	        start += cookieName.length;
    	        var end = cookieData.indexOf(';', start);
    	        if(end == -1)end = cookieData.length;
    	        cookieValue = cookieData.substring(start, end);
    	    }
    	    return unescape(cookieValue);
    	}
  		
  		// 쿠키 삭제
    	function deleteCookie(cookieName){
    	    var expireDate = new Date();
    	    expireDate.setDate(expireDate.getDate() - 1);
    	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
    	}
  		
    	$(function(){
    	    var userId = getCookie("Cookie_userid");
    	    $("#email").val(userId);
    	    
    	    if($("#email").val() != "")
    	        $("#saveEmail").attr("checked", true);
    	});
    	 
    </script>   
</head>
<body>
    <div class="wrap">
    	<%@include file="/WEB-INF/view/include/header.jsp" %>
    	<form action="login.do" method="post" id="board1" name="board1" onsubmit="return loginCheck();"><!-- header에서 id="board"이미 사용중이라서 board2로 함 -->
            <div class="sub">
                <div class="size">
                    <h3 class="sub_title">로그인</h3>
                    <div class="member">
                        <div class="box">
                            <fieldset class="login_form">
                                <ul>
                                    <li><input type="text" id="email" name="email" placeholder="이메일" autocomplete="off"></li>
                                    <li><input type="password" id="pwd" name="pwd" placeholder="비밀번호" autocomplete="off"></li>
                                    <li><label><input type="checkbox" name="saveEmail" id="saveEmail"/> 아이디저장</label></li>
                                </ul>
                                <div class="login_btn"><input type="submit" value="로그인" alt="로그인" /></div>
                            </fieldset>
                            
                            <div class="btnSet clear">
                                <div>
                                    <a href="join.do" class="btn">회원가입</a> 
                                    <a href="searchId.do" class="btn">이메일/비밀번호 찾기</a>
                                </div>
                            </div>
                            <div class="btnSet clear">
                            	<div>
                                	<a href="" class="btn" >네이버 로그인</a> 
                                </div>
                            </div>
                            <div class="btnSet clear">
                            	<div>
                                	<a id="custom-login-btn" href="javascript:loginWithKakao()">
									  <img
									    src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
									    width="222"
									    alt="카카오 로그인 버튼"
									  />
									</a>
                                </div>
                            </div>
                                                        
                        </div>
                    </div>        
                </div>
            </div>
        </form>
        <%@include file="/WEB-INF/view/include/footer.jsp" %>       
    </div>
</body>
</html>
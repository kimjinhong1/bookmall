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
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"></script>
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
  		
  		// 카카오 로그인
    	function loginWithKakao() {
    		try {
    	        if (Kakao) {
    	        	// SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
    	        	Kakao.init('2098e03da186e9b37098442fd1828311');
    	        };
    	    } catch(e) {};
    		// SDK 초기화 여부를 판단합니다.
    	    console.log(Kakao.isInitialized());
    	 	// 로그인 시도
		    Kakao.Auth.login({
		    	 success: function(authObj) {
		    		 // 성공 시 , API 호출
		             Kakao.API.request({
		                 url: '/v2/user/me',
		                 success: function(res) {
		                	 console.log(res);
		                	 res.id += "@kakao"; // 식별자 값
		                	 
		                	 // 이메일 선택 동의를 안했을 시 true
		                	 if (res.kakao_account.email == undefined) {
		                		 alert("이메일이 동의되지 않았습니다.");
		                		 // 연결 끊기
		                		 Kakao.API.request({
		                			  url: '/v1/user/unlink',
		                			  success: function(response) {
		                			    console.log(response);
		                			    console.log("연결끊기 성공");
		                			  },
		                			  fail: function(error) {
		                			    console.log(error);
		                			    console.log("연결끊기 실패");
		                			  },
		                			});
		                		 $("#social").attr("method","GET").attr("action","/bookmall/user/login.do").attr("target","_parent");
		                		 return false;
		                	 }
		                	 
		                	 var email = res.kakao_account.email;
		                	 var identifier = res.id;
		                	 var user_type = 2;
		                	 var state = 1;
		                	 
		                	 $.ajax({
		                		 type : "GET",
		                         url : "/bookmall/user/socialCheck.do",  //중복체크
		                         data : {
		                        	 identifier : identifier
		                        	 },
		                         dataType : "JSON",
		                           success : function(idChk){
		                               if(idChk==0){ //DB에 아이디가 없을 경우 => 회원가입
		                                   console.log("회원가입");
		                                   $.ajax({
		                                       url : "/bookmall/user/insert.do",
		                                       method : "POST",
		                                       data : {
			                                       email : email,
			                                       pwd : "kakao123",
			                                       name : res.properties.nickname,
			                                       nickname : res.properties.nickname,
			                                       user_type : user_type,
			                                       state : state,
			                                       identifier : identifier
		                                       },
		                                       success : function(JSONData){
		                                          alert("회원가입이 정상적으로 되었습니다.");
		                                          $("#social").attr("method","POST").attr("action","/bookmall/user/snsLogin/"+identifier).attr("target","_parent").submit();
		                                       }
		                                   })
		                               }
		                               if(idChk==1){ //DB에 아이디가 존재할 경우 => 로그인
		                                   console.log("로그인");
		                                   $("#social").attr("method","POST").attr("action","/bookmall/user/snsLogin/"+identifier).attr("target","_parent").submit();
		                               }
		                           }
		                     })
									                     
		                 },
		                 fail: function(error) {
		                     alert(JSON.stringify(error))
		                 }
		             });
		    		 
		           },
		           fail: function(error) {
		             alert(JSON.stringify(error));
		           }
		    });
    	    
		}

    	// 로그아웃
		function kakaoLogout() {
		    if (Kakao.Auth.getAccessToken()) {
		      Kakao.API.request({
		        url: '/v1/user/unlink',
		        success: function (response) {
		        	console.log(response)
		        },
		        fail: function (error) {
		          console.log(error)
		        },
		      })
		      Kakao.Auth.setAccessToken(undefined)
		    }
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
    	    
    	    
    	    // 네이버 소셜 로그인
    	    var naverLogin = new naver.LoginWithNaverId({
    	        clientId: "KTq9CxuHYQBTJfayX1oz",
    	        callbackUrl: "http://localhost:8080/bookmall/user/naverCallback.do",
    	        isPopup: false,
    	        loginButton: {color: "green", type: 3, height: 45}
    	    });
    	    naverLogin.init();


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
                                    <li><label><input type="checkbox" name="saveEmail" id="saveEmail"/> E-mail 저장</label></li>
                                </ul>
                                <div class="login_btn"><input type="submit" value="로그인" alt="로그인" /></div>
                            </fieldset>
                            
                            <div class="btnSet clear" >
                                <div>
                                    <a href="join.do" class="btn" style="background-color: aqua;">회원가입</a> 
                                    <a href="searchId.do" class="btn" style="background-color: aqua;">이메일/비밀번호 찾기</a>
                                </div>
                            </div>
                                                        
                        </div>
                    </div>        
                </div>
            </div>
        </form>
        <form name="social" id="social">

        <div class="btnSet clear">
        	<div id="naverIdLogin" align="center">
	    		<a id="naver-login-btn" href="#" role="button">
	        		<img src="https://static.nid.naver.com/oauth/big_g.PNG"
	        		width="200"
	        		alt="네이버 로그인 버튼"
	        		 /> 
	    		</a>
			</div>
			<br>
            <div>
		    	<a id="custom-login-btn" href="javascript:loginWithKakao()">
				  <img
				    src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
				    width="200"
				    alt="카카오 로그인 버튼"
				  />
				</a>
            </div>
        </div>
        </form>
        <%@include file="/WEB-INF/view/include/footer.jsp" %>       
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kakaologin</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
		function loginWithKakao() {
		    Kakao.Auth.login({
		      success: function(authObj) {
		        alert(JSON.stringify(authObj))
		      },
		      fail: function(err) {
		        alert(JSON.stringify(err))
		      },
		    })
		}


        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('2098e03da186e9b37098442fd1828311');

        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
        
        // Kakao.Auth.authorize API로 간편 로그인을 요청
       // Kakao.Auth.authorize({
        //	redirectUri: '{REDIRECT_URI}'   // 인가 코드를 받을 URI
       // });
        
        // 토큰 할당하기
        //Kakao.Auth.setAccessToken(ACCESS_TOKEN);
    </script>
</head>
<body>
	<a id="custom-login-btn" href="javascript:loginWithKakao()">
	  <img
	    src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
	    width="222"
	    alt="카카오 로그인 버튼"
	  />
	</a>
</body>
</html>
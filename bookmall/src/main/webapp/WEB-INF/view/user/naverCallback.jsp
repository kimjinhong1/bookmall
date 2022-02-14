<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>naverCallback</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

</head>
<c:if test="${param.error == 'access_denied' }">
<script>
	alert('필수정보에 동의하셔야 가입가능합니다.');
	location.href="login.do";
</script>
</c:if>
<c:if test="${param.error != 'access_denied' }">

<body>
<script type="text/javascript">

	var naver_id_login = new naver_id_login("KTq9CxuHYQBTJfayX1oz", "http://localhost:8080/bookmall/main.do");
	
	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");

// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
function naverSignInCallback() {
	var email = naver_id_login.getProfileData('email');
	var name = naver_id_login.getProfileData('name');
	var nickname = naver_id_login.getProfileData('nickname');
	var gender = naver_id_login.getProfileData('gender');
	if (gender == 'F') {
		gender = 2;
	} else {
		gender = 1;
	}
	var identifier = naver_id_login.getProfileData('id');
	var user_type = 3;
	var state = 1;
	console.log(email);
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
                          name : name,
                          gender : gender,
                          identifier : identifier,
                          pwd : "naver123",
                          nickname : nickname,
                          user_type : user_type,
                          state : state
                          },
	                  success : function(JSONData){
	                     alert("회원가입이 정상적으로 되었습니다., 입력되지않은 정보를 입력해주세요");
	                     //$("#social").attr("method","POST").attr("action","/bookmall/user/snsLogin/"+identifier).submit();
	                     location.href="/bookmall/user/snsLogin/"+identifier;
	                  },
	                  error : function() {
	                	  alert("꺼져야함");
	                  }
	              })
	          }
	          if(idChk==1){ //DB에 아이디가 존재할 경우 => 로그인
	              console.log("로그인");
	              //$("#social").attr("method","POST").attr("action","/bookmall/user/snsLogin/"+identifier).submit();
	              location.href="/bookmall/user/snsLogin/"+identifier;
	          }
	      }
	      
        	 
	})

}

</script>
<form name="defaultForm">
</form>
</c:if>

</body>
</html>
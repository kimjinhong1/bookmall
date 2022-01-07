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
    <script src="/bookmall/js/common.js"></script>
    <script>
    
  		//로그인 버튼 클릭시
    	function loginCheck() {
    		if ($("#email1").val() == '') {
    			alert('이메일을 입력해 주세요');
    			$("#email1").focus();
    			return false;
    		}
    		if ($("#pwd").val() == '') {
    			alert('비밀번호를 입력해 주세요');
    			$("#pwd").focus();
    			return false;
    		}
    		
    		
    		if($("#saveEmail").is(":checked")) { //저장 체크시
    			savelogin
    		}
    		
    		
    	}
    	
    	$(function() {
    		
    		var cookie_saveEmail = ????
    		// 쿠키값이 존재하면 쿠키에서 가져온 emailid를 할당, 체크박스를 체크상태로 변경
    		if(cookie_saveEmail != "") {
	    		$("#email1").val(cookie_saveEmail);
	    		$("#saveEmail").attr("checked", true);
    		}
    		
    		$("#saveEmail").on("click", function() {
    			var _this = this;
    			var isRemember;
    			if($(_this).is(":checked")) {
    				isRemember = confirm("이 PC에 로그인 정보를 저장하시겠습니까? 공공장소에서는 개인정보가 유출될 수 있으니 주의해주십시오.")
    				if(!isRemember)
    					$(_this).attr("checked", false);
    			}
    		});
    		
    	})
    	
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
                                    <li>
                                    	<input type="text" id="email" name="email" placeholder="이메일" autocomplete="off">
                                    </li>
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
                                <a href="" class="btn2" >네이버 로그인</a> 
                                </div>
                            </div>
                            
                            <div class="btnSet clear">
                            	<div>
                                <a href="" class="btn3">카카오 로그인</a> 
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
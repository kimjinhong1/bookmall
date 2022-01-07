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
    <script src="/bookmall/js/common.js"></script>
    <script>
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
    	}
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
                                    <li><input type="text" id="email" name="email" placeholder="이메일"></li>
                                    <li><input type="password" id="pwd" name="pwd" placeholder="비밀번호"></li>
                                    <li><label><input type="checkbox" name="reg1" id="reg1"/> 아이디저장</label></li>
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
                                <a href="" class="btn">네이버 로그인</a> 
                                </div>
                            </div>
                            <div class="btnSet clear">
                            	<div>
                                <a href="" class="btn">카카오 로그인</a> 
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
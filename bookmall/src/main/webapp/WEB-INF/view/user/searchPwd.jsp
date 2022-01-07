<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">    
    <title>Document</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>    
    <link rel="stylesheet" href="/bookmall/css/reset.css"/>
    <link rel="stylesheet" href="/bookmall/css/common.css"/>
    <link rel="stylesheet" href="/bookmall/css/contents.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <script src="/bookmall/js/common.js"></script>
    <script>
    	function searchPwd() {                  
    		if ($("#email").val() == '') {             
    			alert("이메일을 입력하세요");            
    			$("#email").focus();                     
    			return false;
    		}  
    		if ($("#name").val() == '') {           
    			alert("이름을 입력하세요");              
    			$("#name").focus();                 
    			return false;         
    		}
    		$.ajax({                       
    			url : "searchPwd.do",       
    			method: "post",            
    			data:{                     
    				name:$("#name").val(),  
    				email:$("#email").val()     
    			}, 
    			success:function(res) {      
    				if (res.trim() == 'ok') {
    					alert("임시비밀번호를 이메일로 발송하였습니다. 이메일을 확인하세요.")
    				} else {
    					alert("이메일/이름이 올바르지 않습니다.")
    				}
    			}
    		});
    		
    		return false; // form에 전송을할것이 아니기때문에, 밑에있는 form의 action도 의미가없음
    	}
    </script>   
</head>
<body>
    <div class="wrap">
    	<%@include file="/WEB-INF/view/include/header.jsp" %>
    	<form action="login.do" method="post" id="board1" name="board1" onsubmit="return searchPwd();">
        	<div class="sub">
                <div class="size">
                    <h3 class="sub_title">비밀번호 찾기</h3>                    
                    <div class="member">
                        <div class="box">
                            <fieldset class="login_form">
                                <ul>
                                    <li><input type="text" id="email" name="email" placeholder="이메일"></li>
                                    <li><input type="text" id="name" name="name" placeholder="이름"></li>
                                </ul>
                                <div class="login_btn"><input type="submit" value="비밀번호찾기" alt="비밀번호찾기" /></div>
                            </fieldset>
                            <div class="btnSet clear">
                                <div>
                                    <a href="searchId.do" class="btn">이메일찾기</a> 
                                    <a href="searchPwd.do" class="btn">비밀번호 찾기</a>
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
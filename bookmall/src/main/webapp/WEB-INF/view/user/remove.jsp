<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">    
    <title>삭제 페이지</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>    
    <link rel="stylesheet" href="/bookmall/css/reset.css"/>
    <link rel="stylesheet" href="/bookmall/css/common.css"/>
    <link rel="stylesheet" href="/bookmall/css/contents.css"/>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <script src="/bookmall/js/common.js"></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
	<script>
	    function goSave() {
	    	var con = confirm("정말 탈퇴하시겠습니까?");
	    	if(con == false) {
	    		return;
	    	}
	    	// 일반 회원
	    	if(${userInfo.user_type == 1}) {
	    		if ($("#pwd").val().trim() == "") {
		    		alert('현재 비밀번호를 입력해 주세요');
		    		$("#pwd").focus();
		    		return;
		    	}
		    	
		    	var abc;
		    	
		    	if ($("#pwd").val().trim() != "") {
		    		$.ajax({
	    		    	url : "pwdCheck.do",
	    		    	data : {
	    		    		userno : $("#userno").val(),
	    		    		pwd : $("#pwd").val()
	    		    	},
	    		    	async : false,
	    		    	success:function(res) {
	    		    		if (res.trim() != '1') {
	    		    			alert('현재 비밀번호가 일치하지 않습니다.');
	    			    		$("#pwd").focus();
	    			    		abc = 1;
	    		    		} 
	    		    	}
	    		    })
		    	}
		    	// ajax 리턴용
		    	if (abc == 1) {
		    		return;
		    	}
		    	$.ajax({
		    		type : 'post',
		    		url : 'delete.do',
		    		data : {
		    			userno : $("#userno").val(),
		    			pwd : $("#pwd").val(),
		    			user_type : $("#user_type").val()
		    		},
		    		async:false,
		    		success:function(res) {
		    			if (res.trim() == '1') {
		    				alert('탈퇴 되었습니다.');
		    				location.href = '/bookmall/main.do'
		    			} else {
		    				alert('탈퇴 오류');
		    			}
		    		}
		    	})
    		}
	    	// 카카오 회원
	    	if(${userInfo.user_type == 2}) {
	    		try {
	    	        if (Kakao) {
	    	        	// SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
	    	        	Kakao.init('2098e03da186e9b37098442fd1828311');
	    	        };
	    	    } catch(e) {};
	       		$.ajax({
		    		type : 'post',
		    		url : 'delete.do',
		    		data : {
		    			userno : $("#userno").val(),
		    			user_type : $("#user_type").val()
		    		},
		    		async:false,
		    		success:function(res) {
		    			if (res.trim() == '1') {
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
		    				alert('탈퇴 되었습니다.');
		    				location.href = '/bookmall/main.do'
		    			} else {
		    				alert('탈퇴 오류');
		    			}
		    		}
		    	})
	    	}
	    	// 네이버 회원
	    	if(${userInfo.user_type == 3}) {
	    		$.ajax({
		    		type : 'post',
		    		url : 'delete.do',
		    		data : {
		    			userno : $("#userno").val(),
		    			user_type : $("#user_type").val()
		    		},
		    		async:false,
		    		success:function(res) {
		    			if (res.trim() == '1') {
		    				alert('탈퇴 되었습니다.');
		    				location.href = '/bookmall/main.do'
		    			} else {
		    				alert('탈퇴 오류');
		    			}
		    		}
		    	})
	    	}
	    	return false;
	    }
	</script>   
</head>
<body>
    <div class="wrap">
    <%@include file="/WEB-INF/view/include/header.jsp" %>
    	<div class="sub">
            <div class="size">
                <h3 class="sub_title">회원 탈퇴</h3>
                <form name="frm" id="frm" action="delete.do" method="post">
                <table class="board_write">
                    <caption>회원 탈퇴</caption>
                    <colgroup>
                        <col width="20%" />
                        <col width="*" />
                    </colgroup>
                    <tbody>
                    	<c:if test="${userInfo.user_type == 1}">
                        <tr>
                            <th><small class="star">*</small> 현재 비밀번호 </th>
                            <td><input type="password" name="pwd" id="pwd" style="float:left;" maxlength="50" ><span class="ptxt"><small id="check_pwd" style="font-size: 15px;"></small></span></td>
                        </tr>
                        </c:if>
                    </tbody>
                </table>
                		<input type="hidden" name="userno" id="userno" value="${userInfo.userno }">
                		<input type="hidden" name="user_type" id="user_type" value="${userInfo.user_type }">
                </form>
                <div class="btnSet clear">
                    <div>
                    	<c:if test="${userInfo.user_type == 1}">
                    	<a href="javascript:;" class="btn" onclick="goSave();">탈퇴하기</a>
                    	</c:if>
                    	<c:if test="${userInfo.user_type != 1}">
                    	<a href="javascript:;" class="btn" onclick="goSave();">연결끊기</a>
                    	</c:if>
                    	<a href="javascript:;" class="btn" onclick="history.back();">취소</a></div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/view/include/footer.jsp" %>
    </div>
</body>
</html>
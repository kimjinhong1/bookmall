<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">    
    <title>비밀번호수정</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>    
    <link rel="stylesheet" href="/bookmall/css/reset.css"/>
    <link rel="stylesheet" href="/bookmall/css/common.css"/>
    <link rel="stylesheet" href="/bookmall/css/contents.css"/>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <script src="/bookmall/js/common.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
    <script>
    	$(function() {    		
    		var validateCheck = {
    				"old_pwd" :false,
    			    "pwd" : false,
    			    "pw_check" : false,
    		}
    		
    		$("#old_pwd").on("click",function() {
    			if ($("#old_pwd").val() == '') {
    				$("#checkOld_pwd").text("기존 비밀번호를 입력해주세요.")
    				.css("color", "black");
    			}
    		})
    		
    		$("#old_pwd").on("input", function(){
    			$.ajax({
    		    	url : "pwdCheck.do",
    		    	data : {
    		    		userno : $("#userno").val(),
    		    		pwd : $("#old_pwd").val()
    		    	},
    		    	async : false,
    		    	success:function(res) {
    		    		if (res.trim() == '1') {
    		    			$("#checkOld_pwd").text("일치합니다.")
    	    				.css("color", "green");
    		    		} else{
    		    			$("#checkOld_pwd").text("일치하지않습니다.")
    	    				.css("color", "red");
    		    		}
    		    	}
    		    })    
    		})
    		
    		
    		$("#pwd").on("click", function(){
    			if ($("#pwd").val() == '') {
	    			$("#checkPwd1").text("비밀번호를 입력해주세요.")
	    			.css("color", "black");
    			}
    		});
    		
    		$("#pwd, #pw_check").on("input", function(){
    		    // 비밀번호 유효성 검사
    		    var regExp = /^(?=.*[a-zA-Z])(?=.*[\~\․\!\@\#\$\%\^\&\*\(\)\_\-\+\=\[\]\|\\\;\:\\'\"\<\>\,\.\?\/])(?=.*[0-9]).{8,16}$/;
				
    		    var v1 = $("#pwd").val();
    		    var v2 = $("#pw_check").val();
    		    
    		    if(!regExp.test(v1)){
    		        $("#checkPwd1").text("문자+숫자+특수문자로 최소 8자이상 16자이하 입력해 주세요.")
    		        .css("color", "red");
    		        validateCheck.pwd = false;
    		    } else{
    		        $("#checkPwd1").text("사용가능한 비밀번호입니다.")
    		        .css("color", "green");
    		        validateCheck.pwd = true;
    		    }
    		    
    		    
    		    if(!validateCheck.pwd && v2.length > 0){
    		        swal("유효한 비밀번호를 먼저 작성해주세요.");
    		        $("#pw_check").val(""); // 비밀번호 확인에 입력한 값 삭제
    		        $("#pwd").focus();
    		    }else {
    		    	// 비밀번호 확인 입력창 클릭
    		    	$("#pw_check").on("click", function(){
    	    			$("#checkPwd2").text("다시 한번 입력해주세요.")
    	    		});
    		        // 비밀번호, 비밀번호 확인의 일치 여부
    		       	if(v1.length == 0 || v2.length == 0){
    					$("#checkPwd2").text("");
    				}else if(v1 == v2){
    		            $("#checkPwd2").text("비밀번호가 일치합니다.")
    		            .css("color", "green");
    		            validateCheck.pw_check = true;
    		        }else{
    		            $("#checkPwd2").text("비밀번호가 일치하지않습니다.")
    		            .css("color", "red");
    		            validateCheck.pw_check = false;
    		        }
    		    }
    		    
    		});
    	})
    </script>
	<script>
	    function goSave() {
			
	    	if ($("#old_pwd").val().trim() == "") {
	    		alert('현재 비밀번호를 입력해 주세요');
	    		$("#old_pwd").focus();
	    		return;
	    	}
	    	
	    	var abc;
	    	
	    	if ($("#old_pwd").val().trim() != "") {
	    		$.ajax({
    		    	url : "pwdCheck.do",
    		    	data : {
    		    		userno : $("#userno").val(),
    		    		pwd : $("#old_pwd").val()
    		    	},
    		    	async : false,
    		    	success:function(res) {
    		    		if (res.trim() != '1') {
    		    			alert('현재 비밀번호가 일치하지 않습니다.');
    			    		$("#old_pwd").focus();
    			    		abc = 1;
    		    		} 
    		    	}
    		    })
	    	}
	    	
	    	// ajax 리턴용
	    	if (abc == 1) {
	    		return;
	    	}
	    	
	    	if ($("#pwd").val().trim() == "") {
	    		alert('새 비밀번호를 입력해 주세요');
	    		$("#pwd").focus();
	    		return;
	    	}
	    	var reg = /^(?=.*[a-zA-Z])(?=.*[\~\․\!\@\#\$\%\^\&\*\(\)\_\-\+\=\[\]\|\\\;\:\\'\"\<\>\,\.\?\/])(?=.*[0-9]).{8,16}$/;
	    	if( !reg.test($("#pwd").val()) ) {
	    	    alert("비밀번호는 문자+숫자+특수문자 조합으로 8자이상 16자이하 입력해 주세요.");
	    	    $("#pwd").focus();
	    	    return;
	    	}
	    	if ($("#pwd").val() != $("#pw_check").val()) {
	    		alert("비밀번호가 일치하지 않습니다.");
	    		return;
	    	}
	    	
	    	//$("#frm").submit();
	    	$.ajax({
	    		type : 'post',
	    		url : 'pwdupdate.do',
	    		data : {
	    			userno : $("#userno").val(),
	    			nickname : $("#pwd").val()
	    		},
	    		async:false,
	    		success:function(res) {
	    			if (res.trim() == '1') {
	    				alert('수정되었습니다.');
	    				window.close();
	    				opener.location.reload();
	    			} else {
	    				alert('수정 오류');
	    			}
	    		}
	    	})
	    }
	</script>   
</head>
<body>
    <div class="wrap">
    	<div class="sub">
            <div class="size">
                <h3 class="sub_title">비밀번호 변경</h3>
                <form name="frm" id="frm" action="pwdupdate.do" method="post">
                <table class="board_write">
                    <caption>비밀번호 변경</caption>
                    <colgroup>
                        <col width="20%" />
                        <col width="*" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><small class="star">*</small> 현재 비밀번호 </th>
                            <td><input type="password" name="old_pwd" id="old_pwd" style="float:left;" maxlength="50" ><span class="ptxt"><small id="checkOld_pwd" style="font-size: 15px;"></small></span></td>
                        </tr>
                        <tr>
                            <th><small class="star">*</small> 새 비밀번호 </th>
                            <td><input type="password" name="pwd" id="pwd" style="float:left;" maxlength="50" > <span class="ptxt"><small id="checkPwd1" style="font-size: 15px;"></small></span></td>
                        </tr>
                        <tr>
                            <th><small class="star">*</small> 비밀번호<span>확인</span></th>
                            <td><input type="password" name="pw_check" id="pw_check" style="float:left;" maxlength="50" ><span class="ptxt"><small id="checkPwd2" style="font-size: 15px;"></small></span></td>
                        </tr>
                    </tbody>
                </table>
                		<input type="hidden" name="userno" id="userno" value="${userInfo.userno }">
                </form>
                <div class="btnSet clear">
                    <div><a href="javascript:;" class="btn" onclick="goSave();">변경</a> <a href="javascript:;" class="btn" onclick="window.close();">취소</a></div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
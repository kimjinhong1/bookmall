<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">    
    <title>닉네임수정</title>
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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    $(function() {
	    	// 닉네임 중복체크
    		$("#nickCheckBtn").click(function(){
    			if ($("#nickname").val().trim() == '') {
    				alert('닉네임을 입력해 주세요');
    				$("#nickname").focus();
    			} else {
    				$.ajax({
    					url : 'nickCheck.do',
    					data : {
    						nickname : $("#nickname").val()
    					},
    					async:false,
    					success:function(res) {
    						if (res.trim() == '1') {
    							alert('중복된 닉네임입니다. 다른 닉네임을 입력해 주세요');
    							$("#nickname").val("");
    							$("#nickname").focus();
    						} else {
    							$("#nickcheck").val('1');
    							$("#realnick").val($("#nickname").val());
    							alert('사용가능한 닉네임입니다.')
    						}
    					}
    				})
    			}
    		});
	    })
	
	    function goSave() {
	    	
	    	if ($("#nickname").val().trim() == "") {
	    		alert('닉네임을 입력해 주세요');
	    		$("#nickname").focus();
	    		return;
	    	}
	    	
	    	// 인증된 닉네임인지 확인
	    	if (!($("#nickname").val().trim() == $("#realnick").val().trim())) {
	    		alert('인증된 닉네임이 아닙니다');
	    		$("#nickname").focus();
	    		return;
	    	}
	    	
	    	if ($("#nickcheck").val() == '0') {
	    		alert('닉네임 인증이 되지않았습니다.');
	    		$("#nickname").focus();
	    		return;
	    	}
	    	//$("#frm").submit();
	    	
	    	$.ajax({
	    		type : 'post',
	    		url : 'nickupdate.do',
	    		data : {
	    			userno : $("#userno").val(),
	    			nickname : $("#nickname").val()
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
                <h3 class="sub_title">닉네임 변경</h3>
                <form name="frm" id="frm" action="nickupdate.do" method="post">
                <table class="board_write">
                    <caption>닉네임 변경</caption>
                    <colgroup>
                        <col width="20%" />
                        <col width="*" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><small class="star">*</small> 닉네임</th>
                            <td><input type="text" name="nickname" id="nickname" style="float:left;" maxlength="20" placeholder="닉네임을 입력해주세요">&nbsp;&nbsp;
                            <span class="nick_check"><a href="javascript:;" id="nickCheckBtn"  class="btn bgGray" style=" width:auto; clear:none;">닉네임 중복확인</a></span>
                             </td>
                        </tr>
                    </tbody>
                </table>
                		<input type="hidden" name="userno" id="userno" value="${userInfo.userno }">
                		<input type="hidden" name="nickcheck" id="nickcheck" value='0'> <!-- 이메일중복확인 -->
                		<input type="hidden" name="realnick" id="realnick"> <!-- 인증한 닉네임 -->
                </form>
                <div class="btnSet clear">
                    <div><a href="javascript:;" class="btn" onclick="goSave();">저장</a> <a href="javascript:;" class="btn" onclick="window.close();">취소</a></div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">    
    <title>회원가입</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>    
    <link rel="stylesheet" href="/bookmall/css/reset.css"/>
    <link rel="stylesheet" href="/bookmall/css/common.css"/>
    <link rel="stylesheet" href="/bookmall/css/contents.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <script src="/bookmall/js/common.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <script>
    	$(function() {    		
    		$("#emailCheckBtn").click(function(){
    			if ($("#email").val().trim() == '') {
    				alert('이메일을 입력해 주세요');
    				$("#email").focus();
    			} else {
    				$.ajax({
    					url : 'emailCheck.do',
    					data : {
    						email : $("#email").val()
    					},
    					async:false,
    					success:function(res) {
    						if (res.trim() == '1') {
    							alert('중복된 이메일입니다. 다른 이메일을 입력해 주세요');
    							$("#email").val("");
    							$("#email").focus();
    						} else {
    							// (인증번호)이메일 발송
    							$.ajax({
			    					url : 'emailAuth.do',
			    					data : {
			    						email : $("#email").val()
			    					},
			    					async:false,
			    					success:function(res) {
			    						if (res.trim() == '0') {
			    							alert('메일이 전송되지 않았습니다. 다른 이메일을 입력해 주세요');
			    							$("#email").val("");
			    							$("#email").focus();
			    						} else {
			    							$("#authArea").text("인증번호를 입력해주세요.");
			    							alert("인증번호가 전송되었습니다.");
			    							$(".hide").show()
			    							$("#email_auth").focus();
			    							
			    						}
			    					}
    							})
    						}
    					}
    				})
    			}
    		});
    		$("#auth_CheckBtn").click(function(){
    			if ($("#email_auth").val().trim() == '') {
    				alert('인증번호를 입력해 주세요');
    				$("#email_auth").focus();
    			} else {
    				$.ajax({
    					url : 'authCheck.do',
    					data : {
    						email_auth : $("#email_auth").val()
    					},
    					async:false,
    					success:function(res) {
    						if (res.trim() == '0') {
    							alert('잘못된 인증 번호입니다.');
    							$("#email_auth").val("");
    							$("#email_auth").focus();
    						} else {
    							$("#authArea").text("     인증이 완료되었습니다.");  
    							$("#check").val('1');
    							$("#pwd").focus();
    						}
    						
    					}
    				})
    				
    			}
    		});
    		$("#pwd, #pw_check").on("input", function(){
    		    // 비밀번호 유효성 검사
    		    var regExp = /^(?=.*[a-zA-Z])(?=.*[\~\․\!\@\#\$\%\^\&\*\(\)\_\-\+\=\[\]\|\\\;\:\\'\"\<\>\,\.\?\/])(?=.*[0-9]).{8,16}$/;

    		    var v1 = $("#pwd").val();
    		    var v2 = $("#pw_check").val();

    		    if(!regExp.test(v1)){
    		        $("#checkPwd1").text("비밀번호 형식이 유효하지 않습니다.")
    		        .css("color", "red");
    		    } else{
    		        $("#checkPwd1").text("유효한 비밀번호 형식입니다.")
    		        .css("color", "green");
    		    }
    		
    		});
    		
    		selectDate("birthday");
    	})
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function zipcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    
	                    addr += extraAddr;  //하나의 변수에 합치기  (!1! 내가추가)
	                    
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    //document.getElementById("sample6_extraAddress").value = extraAddr;
	                	                
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('zipcode').value = data.zonecode; //우편번호
 	                document.getElementById("addr1").value = addr; // 주소
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("addr2").focus(); // 상세주소에 포커스
	            }
	        }).open();
	    }
	    
	    function goSave() {
	    	
	    	if ($("#email").val().trim() == "") {
	    		alert('이메일을 입력해 주세요');
	    		$("#email").focus();
	    		return;
	    	}
	    	
			if ($("#check").val() == '0') {
	    		alert('이메일 인증이 되지않았습니다.');
	    		$("#email").focus();
	    		return;
	    	}
			
	    	
	    	if ($("#pwd").val().trim() == "") {
	    		alert('비밀번호를 입력해 주세요');
	    		$("#pwd").focus();
	    		return;
	    	}
	    	var reg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$/;
	    	if( !reg.test($("#pwd").val()) ) {
	    	    alert("비밀번호는 문자+숫자+특수문자 조합으로 8자이상 16자이하 입력해 주세요.");
	    	    $("#pwd").focus();
	    	    return;
	    	}
	    	if ($("#pwd").val() != $("#pw_check").val()) {
	    		alert("비밀번호가 일치하지 않습니다.");
	    		return;
	    	}
	    	if ($("#name").val().trim() == "") {
	    		alert('이름을 입력해 주세요');
	    		$("#name").focus();
	    		return;
	    	}
	    	if ($("#birthday").val().trim() == "") {
	    		alert('생년월일을 입력해 주세요');
	    		$("#birthday").focus();
	    		return;
	    	}
	    	if ($("#tel").val().trim() == "") {
	    		alert('휴대폰번호를 입력해주세요');
	    		$("#tel").focus();
	    		return;
	    	}
	    	$("#frm").submit();
	    }
	</script>   
</head>
<body>
    <div class="wrap">
    	<%@include file="/WEB-INF/view/include/header.jsp" %>
    	<div class="sub">
            <div class="size">
                <h3 class="sub_title">회원가입</h3>
                <form name="frm" id="frm" action="insert.do" method="post">
                <table class="board_write">
                    <caption>회원가입</caption>
                    <colgroup>
                        <col width="20%" />
                        <col width="*" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><small class="star">*</small> 이메일</th>
                            <td>
                                <input type="text" name="email" id="email" class="inNextBtn" style="float:left;">
                                <span class="email_check"><a href="javascript:;" id="emailCheckBtn"  class="btn bgGray" style="float:left; width:auto; clear:none;">E-Mail 인증</a></span>
                            </td>
                        </tr>
                        
                        <tr class="hide" style="display: none;"> <!-- 처음에 숨김 -->
                            <th><small class="star">*</small> 인증번호</th>
                            <td>
                                <input type="text" name="email_auth" id="email_auth" class="inNextBtn" style="float:left;">
                                <span class="auth_Check"><a href="javascript:;" id="auth_CheckBtn"  class="btn bgGray" style="float:left; width:auto; clear:none;">인증번호 확인</a></span>
                                <small id="authArea"></small>
                            </td>
                        </tr>
                        
                        <tr>
                            <th><small class="star">*</small> 비밀번호 </th>
                            <td><input type="password" name="pwd" id="pwd" style="float:left;"> <span class="ptxt"><small id="checkPwd1"></small></span><p><small>문자+숫자 조합으로 8자이상 16자이하 입력해 주세요</small> </td>
                        </tr>
                        <tr>
                            <th><small class="star">*</small> 비밀번호<span>확인</span></th>
                            <td><input type="password" name="pw_check" id="pw_check" style="float:left;"></td>
                            <small id="checkPwd2"></small>
                        </tr>
                        <tr>
                            <th><small class="star">*</small> 닉네임</th>
                            <td><input type="text" name="nickname" id="nickname" style="float:left;"> </td>
                        </tr>
                        <tr>
                            <th><small class="star">*</small> 이름</th>
                            <td><input type="text" name="name" id="name" style="float:left;"> </td>
                        </tr>
                        <tr>
                            <th><small class="star">*</small> 생년월일</th>
                            <td><input type="text" name="birthday" id="birthday" style="float:left;" autocomplete="off"> </td>
                        </tr>
                        <tr>
                            <th><small class="star">*</small> 전화번호</th>
                            <td>
                                <input type="text" name="tel" id="tel" value=""  maxlength="15" style="float:left;">
                            </td>
                        </tr>
                        <tr>
                            <th><small class="star">*</small> 성별</th>
                            <td>
                            <div><input type="radio" name="gender" id="gender" value="1"><small>남성</small></div>
                            <div><input type="radio" name="gender" id="gender" value="2"><small>여성</small></div>
                            </td>
                        </tr>
                        <tr>
                        	<th rowspan="3"><small class="star">*</small> 주소</th>
                        	<td>
                        		<input type="text" name="zipcode" id="zipcode"  style="float:left;">
                                <span class="email_check"><a href="javascript:zipcode();" class="btn bgGray" style="float:left; width:auto; clear:none;">우편번호</a></span>
                        	</td>
                        </tr>
                        <tr>                        	
                        	<td>
                        		<input type="text" name="addr1" id="addr1"  style="float:left;width:500px">
                        	</td>
                        </tr>
                        <tr>                        	
                        	<td>
                        		<input type="text" name="addr2" id="addr2"  style="float:left;width:500px">
                        	</td>
                        </tr>
                    </tbody>
                </table>
                		<input type="hidden" name="check" id="check" value='0'> <!-- 인증확인 값 -->
                		
                		
                       <!--  <input type="hidden" name="cmd" value="write.do"/> -->
                       <!--   <input type="hidden" name="checkEmail" id="checkEmail" value="0"/> -->
                </form>
                <div class="btnSet clear">
                    <div><a href="javascript:;" class="btn" onclick="goSave();">가입</a> <a href="javascript:;" class="btn" onclick="history.back();">취소</a></div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/view/include/footer.jsp" %>       
    </div>
</body>
</html>
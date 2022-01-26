<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">    
    <title>주소수정</title>
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
 	                document.getElementById("address").value = addr; // 주소
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("address2").focus(); // 상세주소에 포커스
	            }
	        }).open();
	    }
	    
	    function goSave() {
	    	if ($("#division").val().trim() == "") {
	    		alert('별칭을 입력해 주세요');
	    		$("#division").focus();
	    		return;
	    	}
	    	
	    	if ($("#name").val().trim() == "") {
	    		alert('수령인을 입력해 주세요');
	    		$("#name").focus();
	    		return;
	    	}

	    	$("#tel").val($("#tel1").val()+$("#tel2").val()+$("#tel3").val())
	    	if ($("#tel1").val().trim() == "") {
	    		alert('휴대폰번호를 입력해주세요');
	    		$("#tel1").focus();
	    		return;
	    	}
	    	if ($("#tel2").val().trim() == "") {
	    		alert('휴대폰번호를 입력해주세요');
	    		$("#tel2").focus();
	    		return;
	    	}
	    	if ($("#tel3").val().trim() == "") {
	    		alert('휴대폰번호를 입력해주세요');
	    		$("#tel3").focus();
	    		return;
	    	}
	    	
	    	if ($("#zipcode").val().trim() == "") {
	    		alert('우편번호를 선택해주세요');
	    		$("#zipcode").focus();
	    		return;
	    	}
	    	if ($("#address").val().trim() == "") {
	    		alert('주소를 입력해주세요');
	    		$("#address").focus();
	    		return;
	    	}
	    	if ($("#address2").val().trim() == "") {
	    		alert('상세주소를 입력해주세요');
	    		$("#address2").focus();
	    		return;
	    	}
	    	$("#frm").submit();
	    }
	    
		function close() {
			window.close();
			}
		
	</script>   
</head>
<body>
    <div class="wrap">
                <h3 class="sub_title" style=" font-size: 30px;">주소 수정</h3>
                <form name="frm" id="frm" action="update.do" method="post">
                <table class="board_write">
                    <caption>주소 수정</caption>
                    <colgroup>
                        <col width="20%" />
                        <col width="*" />
                    </colgroup>
                    <tbody>
                            <th><small class="star">*</small> 별칭</th>
                            <td><input type="text" name="division" id="division" style="float:left;" maxlength="20">&nbsp;&nbsp;
                            <span class="division_check"></span>
                             </td>
                        </tr>
                        <tr>
                            <th><small class="star">*</small> 수령인</th>
                            <td><input type="text" name="name" id="name" style="float:left;" maxlength="20"> </td>
                        </tr>
                        <tr>
                            <th><small class="star">*</small> 전화번호</th>
                            <td>
                            	<select name="tel1" id="tel1" style="width:60px; height:32px;">
	                                <option value="010">010</option>
	                                <option value="011">011</option>
	                                <option value="016">016</option>
	                                <option value="017">017</option>
	                                <option value="018">018</option>
	                                <option value="019">019</option>
                            	</select>
                                <small>&nbsp;-&nbsp;</small>
                                <input type="text" name="tel2" id="tel2" value=""  maxlength="4" style="width:60px;">
                                <small>&nbsp;-&nbsp;</small>
                                <input type="text" name="tel3" id="tel3" value=""  maxlength="4" style="width:60px;">
                            </td>
                        </tr>
                        <tr>
                        	<th rowspan="3"><small class="star">*</small> 주소</th>
                        	<td>
                        		<input type="text" name="zipcode" id="zipcode" value="${addBook.zipcode }" style="float:left;">
                                <span class="email_check"><a href="javascript:zipcode();" class="btn bgGray" style="float:left; width:auto; clear:none;">우편번호</a></span>
                        	</td>
                        </tr>
                        <tr>                        	
                        	<td>
                        		<input type="text" name="address" id="address" value="${addBook.address }" style="float:left;width:500px">
                        	</td>
                        </tr>
                        <tr>                        	
                        	<td>
                        		<input type="text" name="address2" id="address2" value="${addBook.address2 }" style="float:left;width:500px">
                        	</td>
                        </tr>
                    </tbody>
                </table>
                		<input type="hidden" name="check" id="check" value='0'> <!-- 인증확인 값 -->
                		<input type="hidden" name="nickcheck" id="nickcheck" value='0'> <!-- 이메일중복확인 -->
                		<input type="hidden" name="email" id="email"> <!--  폼 입력 이메일 -->
                		<input type="hidden" name="birthday" id="birthday">
                		<input type="hidden" name="realemail" id="realemail"> <!-- 인증한 이메일 -->
                		<input type="hidden" name="realnick" id="realnick"> <!-- 인증한 닉네임 -->
                		<input type="hidden" name="tel" id="tel">
                		
                       <!--  <input type="hidden" name="cmd" value="write.do"/> -->
                       <!--   <input type="hidden" name="checkEmail" id="checkEmail" value="0"/> -->
                </form>
                <div class="btnSet clear">
                    <div><a href="javascript:goSave();" class="btns">등록하기</a> &nbsp;&nbsp;&nbsp;
                    <a href="javascript:close();" class="btns">닫기</a></div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
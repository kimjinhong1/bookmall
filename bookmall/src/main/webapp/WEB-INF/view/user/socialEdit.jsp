<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">    
    <title>소셜회원수정</title>
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
	    	
	    	if ($("#name").val().trim() == "") {
	    		alert('이름을 입력해 주세요');
	    		$("#name").focus();
	    		return;
	    	}

	    	$("#birthday").val($("#yy").val()+"-"+$("#mm").val()+"-"+$("#dd").val())
	    	
	    	if ($("#birthday").val().trim() == "") {
	    		alert('생년월일을 입력해 주세요');
	    		$("#birthday").focus();
	    		return;
	    	}
	    	if ($("#yy").val().trim() == "") {
	    		alert('생년을 입력해 주세요');
	    		$("#yy").focus();
	    		return;
	    	}
	    	if ($("#mm").val().trim() == "") {
	    		alert('월을 입력해 주세요');
	    		$("#mm").focus();
	    		return;
	    	}
	    	if ($("#dd").val().trim() == "") {
	    		alert('일을 입력해 주세요');
	    		$("#dd").focus();
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
	    	if ($("#addr1").val().trim() == "") {
	    		alert('주소를 입력해주세요');
	    		$("#addr1").focus();
	    		return;
	    	}
	    	if ($("#addr2").val().trim() == "") {
	    		alert('상세주소를 입력해주세요');
	    		$("#addr2").focus();
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
                <h3 class="sub_title">추가정보를 입력하세요</h3>
                <form name="frm" id="frm" action="update.do" method="post">
                <table class="board_write">
                    <caption>추가정보 입력</caption>
                    <colgroup>
                        <col width="20%" />
                        <col width="*" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><small class="star">*</small> 이메일</th>
                            <td>
                                <span style="color: black;">${user.email }</span>
                            </td>
                        </tr>
                        <tr>
                            <th><small class="star">*</small> 닉네임</th>
                            <td><input type="text" name="nickname" id="nickname" style="float:left;" maxlength="20" placeholder="닉네임을 입력해주세요" value="${user.nickname }">&nbsp;&nbsp;
                            <span class="nick_check"><a href="javascript:;" id="nickCheckBtn"  class="btn bgGray" style=" width:auto; clear:none;">닉네임 중복확인</a></span>
                             </td>
                        </tr>
                        <tr>
                            <th><small class="star">*</small> 이름</th>
                            <td><input type="text" name="name" id="name" style="float:left;" maxlength="20" placeholder="이름을 입력해주세요" value="${user.name }"> </td>
                        </tr>
                        <tr>
                            <th><small class="star">*</small> 생년월일</th>
                            <td>
				            <!-- BIRTH -->
			                	<!-- BIRTH_YY -->
			                	<div id="bir">
	                            <span class="box">
                               	<input type="text" id="yy" class="int" maxlength="4" placeholder="년(4자리)" style="width:120px; height:32px;"><small class="golbang">&nbsp;년</small>
                               	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                        <!-- BIRTH_MM -->
                                <select id="mm" style="width:60px; height:32px;">
	                                <option value="">월</option>
	                                <option value="01">1</option>
	                                <option value="02">2</option>
	                                <option value="03">3</option>
	                                <option value="04">4</option>
	                                <option value="05">5</option>
	                                <option value="06">6</option>
	                                <option value="07">7</option>
	                                <option value="08">8</option>
	                                <option value="09">9</option>                                    
	                                <option value="10">10</option>
	                                <option value="11">11</option>
	                                <option value="12">12</option>
                            	</select>&nbsp;<small>월</small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                        <!-- BIRTH_DD -->
	                        	<select id="dd" style="width:60px; height:32px;">
	                                <option value="">일</option>
	                                <option value="01">1</option>
	                                <option value="02">2</option>
	                                <option value="03">3</option>
	                                <option value="04">4</option>
	                                <option value="05">5</option>
	                                <option value="06">6</option>
	                                <option value="07">7</option>
	                                <option value="08">8</option>
	                                <option value="09">9</option>                                    
	                                <option value="10">10</option>
	                                <option value="11">11</option>
	                                <option value="12">12</option>
	                                <option value="13">13</option>
	                                <option value="14">14</option>
	                                <option value="15">15</option>
	                                <option value="16">16</option>
	                                <option value="17">17</option>
	                                <option value="18">18</option>
	                                <option value="19">19</option>
	                                <option value="20">20</option>
	                                <option value="21">21</option>
	                                <option value="22">22</option>
	                                <option value="23">23</option>
	                                <option value="24">24</option>
	                                <option value="25">25</option>
	                                <option value="26">26</option>
	                                <option value="27">27</option>
	                                <option value="28">28</option>
	                                <option value="29">29</option>
	                                <option value="30">30</option>
	                                <option value="31">31</option>
                            	</select>&nbsp;<small>일</small>
                            	</span>
			                    <span class="error_next_box"></span>    
			                	</div>
                            </td>
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
                            <th><small class="star">*</small> 성별</th>
                            <td>
                            <div>&nbsp;
                            	<input type="radio" name="gender" id="gender" value="1" <c:if test="${user.gender == 1}">checked="checked"</c:if>>&nbsp;<span style="font-size: 16px; color:#000000;">남성</span>
                            	&nbsp;&nbsp;&nbsp;
                            	<input type="radio" name="gender" id="gender" value="2" <c:if test="${user.gender == 2}">checked="checked"</c:if>>&nbsp;<span style="font-size: 16px; color:#000000;">여성</span>
                            	</div>
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
                		<input type="hidden" name="nickcheck" id="nickcheck" value='0'> <!-- 이메일중복확인 -->
                		<input type="hidden" name="birthday" id="birthday">
                		<input type="hidden" name="realnick" id="realnick"> <!-- 인증한 닉네임 -->
                		<input type="hidden" name="tel" id="tel">
                		<input type="hidden" name="userno" value="${userInfo.userno }">
                		
                </form>
                <div class="btnSet clear">
                    <div><a href="javascript:;" class="btn" onclick="goSave();">확인</a> </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/view/include/footer.jsp" %>       
    </div>
</body>
</html>
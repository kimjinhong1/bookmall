<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BookMoll:주문하기</title>
<link rel="stylesheet" href="/bookmall/css/com.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- 주소검색 -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
                    addr += extraAddr; // 하나의 변수에 합치기
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample6_extraAddress").value = extraAddr;
                
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; // 우편번호
                document.getElementById("addr1").value = addr; // 주소
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();
            }
        }).open();
    }
</script>

<script>
   	function addressCheck() {
   		if ($("#name").val() == '') {
   			alert('주문인을 입력해 주세요');
   			$("#name").focus();
   			return false;
   		}
   		if ($("#receiver_name").val() == '') {
   			alert('받으시는분을 입력해 주세요');
   			$("#receiver_name").focus();
   			return false;
   		}
   		if ($("#zipcode").val() == '') {
   			alert('우편번호를 입력해 주세요');
   			$("#zipcode").focus();
   			return false;
   		}
   		if ($("#addr1").val() == '') {
   			alert('주소를 입력해 주세요');
   			$("#addr1").focus();
   			return false;
   		}
   		if ($("#addr2").val() == '') {
   			alert('상세주소를 입력해 주세요');
   			$("#addr2").focus();
   			return false;
   		}
   		if ($("#receiver_phone").val() == '') {
   			alert('휴대전화번호를 입력해 주세요');
   			$("#receiver_phone").focus();
   			return false;
   		}
   	}
</script>

<script>
<!-- 배송지정보 선택 -->
$(function(){
	$('#uinfo1').click(function(){
		custF.name.value="${loginUser.name}";
		custF.receiver_phone.value="${loginUser.tel}";
		custF.zipcode.value="${loginUser.zipcode}";
		custF.addr1.value="${loginUser.addr1}";
		custF.addr2.value="${loginUser.addr2}";
	});
	
	$('#uinfo2').click(function(){
		custF.name.value="${loginUser.name}";
		custF.receiver_phone.value="${loginUser.tel}";
		custF.zipcode.value="";
		custF.addr1.value="";
		custF.addr2.value="";
	});
	
	$('#uinfo3').click(function(){
		custF.name.value="";
		custF.receiver_phone.value="";
		custF.zipcode.value="";
		custF.addr1.value="";
		custF.addr2.value="";
	});
	
});
$(function(){
	$("input[name='info']").click(function() {
		//console.log(1);
		if ($(this).val() == '2') {
		  window.open("/bookmall/addrList.do", "주소록", "width=740, height=400");
		}
		
	})
})

</script>

<!-- 결제방법선택 -->
<script>
	function showSelect(v,id){
	 // 라디오 버튼 value 값 조건 비교
		if(v == "무통장"){
		 $("#settle_bank").show(); // 보여줌
		}else{
		 $("#settle_bank").hide(); // 숨김
		}
	}
	
	$(function() {
		$(".orderBtn").click(function() {
			$("#frm").submit();
		})
	})
</script>



<script>
	<%-- 전화번호 합치기
	function check() {
		var phone = $("input[name='phone1']").val()+'-'+$("input[name='phone2']").val()+'-'+$("input[name='phone3']").val();
		$("input[name='receiver_phone']").val(phone);
	} --%>
</script>

</head>
<body>
	<form name="custF" id="frm" action="orderInsert.do" method="POST" onsubmit="return addressCheck();">
	
		<div class="wrap_orders">
			<%@ include file="/WEB-INF/view/include/header.jsp"%>
			<div class="container" align="center">
				<div class="size">
					<div class="text">
						<div class="col-md-7 offset-md-1" align="center">
							<h1 class="text-primary text-center mt-4">${loginUser.name}님의 주문정보
							</h1>
						</div>
						<br><br>
						<p>▷ 주문 상품 정보</p>
						<br>

						<!--상품리스트-->
						<div class="list">
							<table style="width: 1200px; border: 1px solid #d3d3d3;">
								<tr>
									<td align="center" width="86" height="28" bgcolor="#f4f4f4" class="popup">Thanks to</td>
									<td align="center" bgcolor="#f4f4f4" class="popup">상품명</td>
									<td align="center" width="138" bgcolor="#f4f4f4" class="popup">가격/할인율</td>
									<td align="center" width="74" bgcolor="#f4f4f4" class="popup">수량</td>
								</tr>
								<tbody>
								<c:set var="sum" value="0" />
								<c:forEach items="${bookList}" var="book">
								<tr>
									<td height="28" align="center" bgcolor="#FFFFFF"><img src="/bookmall/img/thanks_b.gif"></td>
									<td bgcolor="#FFFFFF" style="padding-left: 8px;" align="center"><a href="" target="_blank">${book.btitle_first}</a></td> <!-- product -->
									<td align="center" bgcolor="#FFFFFF"><fmt:formatNumber pattern="###,###,###" value="${book.price}" />원/${book.discountrate}</td> <!-- price -->
									<td align="center" bgcolor="#FFFFFF">${book.bookcount }</td> <!-- count -->
									
									<td><input type="hidden" name="price" value="${book.price}"> <!-- 책 가격 --> 
										<input type="hidden" name="discountrate" value="${book.discountrate}"> <!-- 할인율 --> 
										<input type="hidden" name="bookcount" value="${book.bookcount }"> <!-- 수량 --> 
										<input type="hidden" name="salesprice" value="${book.salesprice}"> <!-- 판매가 --> 
										<input type="hidden" name="bookno" value="${book.bookno}"> <!-- 도서번호 --></td>
								</tr>
								<c:set var="sum" value="${sum + (book.salesprice * book.bookcount)}" />
								</c:forEach>
						 		</tbody>
							</table>
						</div>

						<!--예상총액/장바구니 이동버튼-->
						<table style="margin-left: auto; margin-right: auto; width: 1200px;">
							<tr>
								<td valign="top" style="padding-top: 8px"><strong>총 결제 예상 금액 :<font color="#cc3333"><fmt:formatNumber pattern="###,###,###" value="${sum }" />원</font></strong> <!-- total_price -->
							</tr>  
							<tr>
								<td align="right" style="padding-top: 5px;"><a href="" style="border: 1px solid #d3d3d3;"><strong>장바구니로 돌아가기</strong></a></td>
							</tr>
						</table>
					</div>
					<br>
					<br>
					
					<!--배송지 정보 선택/입력-->
					<table
						style="margin-left: auto; margin-right: auto; width: 1200px;">
						<tr>
							<td>▷ 배송지 정보 입력<font color="#f2291f">(*필수 입력 항목)</font></td>
						</tr>
					</table>
					<table style="width: 100px; align: center; border: 0;">
						<tr>
							<td><div id="AddressBook" align=center style="margin: 30px 0px 0px 330px; position: absolute; vertical-align: top;"></div></td>
						</tr>
					</table>
					<table style="cellSpacing: 1; cellPadding: 3; width: 1200px; bgColor: #83b8c2; border: 0; align: center; border: 1px solid #d3d3d3;">
						<tr>
							<td class="popup" align="left" width="23%" bgColor="#edf5fc" style="padding-left: 14px;"><SPAN class="warning">*</SPAN>주문인</td>
							<td bgColor="#ffffff"><input type="text" name="name" id="name" value="${loginUser.name}" class="form" maxlength="20" /> [${loginUser.tel }]</td>
						</tr>
						<tr>
							<td class="popup" align="left" width="23%" bgColor="#edf5fc" style="padding-left: 14px;"><SPAN class="warning">* </SPAN>받으시는 분</td>
							<td bgColor="#ffffff"><INPUT class=form type=text maxLength=20 value="${receiver_name}" name="receiver_name" id="receiver_name" id="receiver_name"> <!-- receiver_name --></td>
						</tr>
						<tr>
							<td class="popup" align="left" width="23%" bgColor="#edf5fc" style="padding-left: 14px;">배송지 선택</td>
							<td bgColor="#ffffff">
								<input type="radio" name="info" id="uinfo1" value="1" checked>주문고객 정보와 동일 
								<input type="radio" name="info" id="uinfo2" value="2">배송주소록에서 선택 
								<input type="radio" name="info" id="uinfo3" value="3">새주소 입력
							</td>
						</tr>
						<tr>
							<td rowspan="3" class="popup" align="left" width="23%" bgColor="#edf5fc" style="padding-left: 14px;"><SPAN class="warning">* </SPAN>주소</td>
							<td><input type="text" name="zipcode" id="zipcode" class="inNextBtn" value="${loginUser.zipcode}" style="float: left;"> 
								<span class="addr_check"> <!-- address1 -->
									<a href="javascript:zipcode();" class="btn bgGray" style="float: left; width: auto; clear: none; border: 1px solid #d3d3d3;">주소검색</a>
								</span>  
							</td>
						</tr>
						<tr>
							<td><input type="text" name="addr1" id="addr1" value="${loginUser.addr1}" style="float: left; width: 500px;"> <!-- address2 --></td>
						</tr>
						<tr>
							<td><input type="text" name="addr2" id=addr2 value="${loginUser.addr2}" style="float: left; width: 500px;"> <!-- address3 --></td>
						</tr>
						<tr>
							<td class="popup" align="left" width="23%" bgColor="#edf5fc" style="padding-left: 14px;"><SPAN class="warning">*</SPAN>휴대전화번호</TD> <!-- receiver_phone -->
							<td bgColor="#ffffff"><input type="text" name="receiver_phone" id="receiver_phone" value="${loginUser.tel}" size="15" maxlength="15" /></td>
						</tr>
					</table>
					<br><br><br>
				</div>
				
				<!-- 결제수단 -->
				<section id="sod_frm_pay" style="width: 1200px; align: left;">

					<fieldset id="sod_frm_paysel">
						<legend>결제방법 선택</legend>
						<input type="radio" id="bank" name="methodOfPayment" value="무통장" onclick="showSelect(this.value)">무통장입금
						<input type="radio" id="card" name="methodOfPayment" value="신용카드" onclick="showSelect(this.value)">신용카드
						<input type="radio" id="NPay" name="methodOfPayment" value="NPay" onclick="showSelect(this.value)">NPay
						
						<div id="settle_bank" style="display: none">
							<label for="bankToDeposit">입금할 계좌 : </label> <input type="hidden" name="bankToDeposit" value="국민은행 658102-01-312772 bookmall">국민은행 658102-01-312772 bookmall <br>
							<label for="nameOfDepositor">입금자명</label> <input type="text" name="nameOfDepositor" id="nameOfDepositor" class="frm_input" size="10" maxlength="20">
						</div>
					</fieldset>
				</section>
				<br><br>

				<div class="button" align="center">
					<button style="font-size: 18px; background-color: #fff; border: 1px solid #d3d3d3;">결제하기</button>
				</div>
			</div>
		</div>
	</form>
	<%@ include file="/WEB-INF/view/include/footer2.jsp"%>
</body>
</html>
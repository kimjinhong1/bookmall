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
<link rel="stylesheet" href="/bookmall/css/orders.css" />

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 아임포트 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.2.0.js"></script>


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
      
        // window.open("open할 window", "자식창 이름", "팝업창 옵션");
      //console.log(1);
      if ($(this).val() == '2') {
        window.open("/bookmall/addrList.do", "주소록", "width=740, height=400");
      }
      
   })
})
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

<!-- 결제방법선택 -->
<script>
   function showSelect(v,id){
    // 라디오 버튼 value 값 조건 비교
      if(v == "무통장입금"){
       $("#settle_bank").show(); // 보여줌
      }else{
       $("#settle_bank").hide(); // 숨김
      }
   }
</script>

<script>
   $(function() {
      $(".orderBtn").click(function() {
         var con = addressCheck();
         if (con == false) return;
         if ($("input[name='methodOfPayment']:checked").val() == "신용카드") {
            requestPay();
         } else { 
        	 $.ajax({
                 url: 'orderInsertAjax.do', // 예: https://www.myservice.com/payments/complete
                 method: "POST",
                 data : $("#frm").serialize(),
                 success:function(res) {
                    if (res.trim() > 0 ) {
                       alert("정상적으로 결제되었습니다.");
                       location.href='complete.do?orderno='+res.trim();
                    } else {
                    	alert('결제에 실패하였습니다.');
                 	}
                  }
             });
         }
            
      })
   })
</script>

</head>
<body>
	<form name="custF" id="frm" action="orderInsertAjax.do" method="POST" onsubmit="return false;">
	<input type="hidden" name="imp_uid" id="imp_uid" value="">
	<input type="hidden" name="apply_num" id="apply_num" value="">
	<input type="hidden" name="creditCard" id="creditCard" value="">
	<input type="hidden" name="status" id="status" value="1">  <!-- 무통장:1, 신용카드:2 -->
	<input type="hidden" name="bookname" id="bookname" value="${result.btitle_first } (총 ${param.bookcount}권)">
	
	
	<div class="wrap">
		<%@ include file="/WEB-INF/view/include/header.jsp"%>
		<div class="orders">
			<div class="orders_visual">
				<h1 class="username">[${loginUser.name}]님의 주문정보</h1>
            </div>
            <div class="size">
            	<div class="box">
                	<br><br>
                	<p>■주문 상품 정보</p>
					<!--상품리스트-->
					<table class="list">
						<colgroup>
							<col width="100px" />
							<col width="600px" />
							<col width="300px" />
							<col width="200px" />
						</colgroup>
						<thead>
							<tr>
								<th>Thanks to</th>
								<th>상품명</th>
								<th>가격</th>
								<th>수량</th>
							</tr>
						</thead>
						<thead>
							<c:set var="sum" value="0" />
							<tr>
								<td><img src="/bookmall/img/thanks_b.gif"></td>
								<td>${result.btitle_first} [${result.btitle_second}]</td>
								<td><fmt:formatNumber pattern="###,###,###" value="${result.salesprice}" />원</td>
								<td>${param.bookcount }</td> <!-- ${result.bookcount } -->
							</tr>
							<c:set var="sum" value="${sum + (result.salesprice * param.bookcount)}" />
						</thead>
						<tr>
							<td>		
								<input type="hidden" name="bookcount" value="${param.bookcount}">
								<input type="hidden" name="salesprice" value="${result.salesprice}">
								<input type="hidden" name="bookno" value="${param.bookno}">
							</td>
						</tr>
					</table>
					<!-- 예상총액/장바구니 이동버튼 -->
					<p>총 결제 예상 금액(총 수량) :<font><fmt:formatNumber pattern="###,###,###" value="${sum }"/>원 (총 ${param.bookcount}권)</font></p>
					<p style="text-align:right; float:right"><a href="/bookmall/cart.do?userno=${loginUser.userno }"><strong>장바구니로 돌아가기</strong></a></p>
				</div>
			</div>     
			<br><br>
			<div class="size2">
				<div class="box">  
               		<!--배송지 정보 선택/입력-->
	                <p>■배송지 정보 입력<font>(*필수 입력 항목)</font></p>
	                <table class="list2">
						<colgroup>
							<col width="300px" />
							<col width="900px" />
						</colgroup>
						<thead>
                			<tr>
								<th scope="row">*주문인</th>
           						<td><input type="text" name="name" id="name" value="${loginUser.name}"/> [${loginUser.tel} ]</td>
                  			</tr>
                  			<tr>
								<th scope="row">*받으시는 분</th>
           						<td><input type="text" name="receiver_name" id="receiver_name" value="${receiver_name}"/></td>
                  			</tr>
                  			<tr>
								<th scope="row">*배송지 선택</th>
           						<td>
	           						<input type="radio" name="info" id="uinfo1" value="1" checked>주문고객 정보와 동일 
			                        <input type="radio" name="info" id="uinfo2" value="2">배송주소록에서 선택
			                        <input type="radio" name="info" id="uinfo3" value="3">새주소 입력
		                        </td>
                  			</tr>
                  			<tr>
								<th rowspan="3">*주소</th>
           						<td>
           							<input type="text" name="zipcode" id="zipcode" class="inNextBtn" value="${loginUser.zipcode}"> 
			                        <span class="addr_check">
			                           <a href="javascript:zipcode();" class="btn bgGray">주소검색</a>
			                        </span>
			                    </td>      
                  			</tr>
                  			<tr>
			                     <td><input type="text" name="addr1" id="addr1" value="${loginUser.addr1}"></td>
			                </tr>
			                <tr>
			                     <td><input type="text" name="addr2" id="addr2" value="${loginUser.addr2}"></td>
			                </tr>
                  			<tr>
								<th scope="row">*휴대전화번호</th>
           						<td><input type="text" name="receiver_phone" id="receiver_phone" value="${loginUser.tel}"/></td>
                  			</tr>
                  		</thead>
					</table>
            	</div>
         	</div>
            <br><br>
         	<div class="size">
            	<div class="box">
                	<p>■결제방법 선택</p>
		            <!-- 결제수단 -->
		            <section>
		               <fieldset>
		                  <input type="radio" name="methodOfPayment" id="bank" value="무통장입금" onclick="showSelect(this.value)">무통장입금
		                  <input type="radio" name="methodOfPayment" id="card" value="신용카드" onclick="showSelect(this.value)">신용카드
		                  <div class="bank" id="settle_bank">
		                     <label>입금 계좌번호 :</label><input type="hidden" name="bankToDeposit" id="bankToDeposit" value="국민은행 658102-01-312772 bookmall">국민은행 658102-01-312772 bookmall<br>
		                     <label>입금자명</label><input type="text" name="nameOfDepositor" id="nameOfDepositor">
		                  </div>
		               </fieldset>
		            </section>
            		<br><br>
            	</div>
            </div> 
            <div class="oBtn">
               <button class="orderBtn">결제하기</button>
            </div>
		</div>
	</div>
 	<input type="hidden" name="paid_amount" id="paid_amount" value="${sum }">  
	</form>
<!-- 아임포트 신용카드 -->
<script>
   function requestPay() {
   
      var IMP = window.IMP; // 생략가능
      IMP.init('imp75172657'); //가맹점식별코드를 넣어주세요
      // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
      // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
      IMP.request_pay({
         pg: 'html5_inicis', // html5_inicis : 이니시스(웹표준결제)
         pay_method: 'card',
         
         merchant_uid: 'merchant_' + new Date().getTime(),
         <%--
         https://docs.iamport.kr/implementation/payment 참고
         --%>
         name: "${result.btitle_first } : ${result.btitle_second }",  	 //상품명
         amount: ${result.salesprice },      							 // 가격 ${result.salesprice }
         buyer_email: '${loginUser.email }',							 // 이메일
         buyer_name: '${loginUser.name }',      						 // 이름
         buyer_tel: '${loginUser.tel }',        						 // 연락처
         buyer_addr: '${loginUser.addr1 } ${loginUser.addr2 }', 		 // 주소
         buyer_postcode: '${result.bookno }', 							 // 상품코드
         m_redirect_url: 'https://localhost:8080/bookmall/orderComplete.do'
         }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
            	$("#imp_uid").val(rsp.imp_uid);							//고유Id
            	$("#paid_amount").val(rsp.paid_amount);					//결제금액
            	$("#apply_num").val(rsp.apply_num);						//승인번호
            	$("#creditCard").val(rsp.card_name);					//신용카드 -> 카드이름
            	$("#bankToDeposit").val("");							//무통장_은행 -> 빈값
            	$("#nameOfDepositor").val("");							//무통장_입금자명 -> 빈값
            	$("#status").val("2");									//무통장:1, 신용카드:2
            	
               var msg = '결제가 완료되었습니다.';
                      msg += '고유ID : ' + rsp.imp_uid;
                      msg += '상점 거래ID : ' + rsp.merchant_uid;
                      msg += '결제 금액 : ' + rsp.paid_amount;
                      msg += '카드 승인번호 : ' + rsp.apply_num;
                      msg += '카드 승인날짜 : ' + new Date().getTime();
                      msg += '회원 주소 : ' + '${loginUser.addr1 } ${loginUser.addr2 }';
                      msg += '회원 휴대전화 : ' + '${loginUser.tel }';
                      msg += '카드 이름 : ' + rsp.card_name;
                      msg += '결제 구분 : ' + rsp.pay_method;
               console.log("결제성공 " + msg);
               $.ajax({
                        url: 'orderInsertAjax.do',
                        method: "POST",
                        data : $("#frm").serialize(),
                        success:function(res) {
                           if (res.trim() > 0 ) {
                              	alert("정상적으로 결제되었습니다.");
                              location.href='complete.do?orderno='+res.trim();
							} else {
								alert('결제에 실패하였습니다.');
							}
						}
				});
			}      
		});
	}
</script>
   <%@ include file="/WEB-INF/view/include/footer2.jsp"%>
</body>
</html>
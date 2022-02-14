<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=request.getContextPath()%>/css/admin/member.css" rel="stylesheet" type="text/css"/>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>회원상세정보</title>
<script>
$(function(){ 
	$("#memberInfoDetatilEdit").hide();
	
	// 전화번호 분할
	var tel = "${member.tel}";
	if (tel.toString().length == 11) { //11자리 일 때
		$("#tel1").val(tel.toString().substring(0,3));
		$("#tel2").val(tel.toString().substring(3,7));
		$("#tel3").val(tel.toString().substring(7,11));
	} else {
		$("#tel1").val(tel.toString().substring(0,3));
		$("#tel2").val(tel.toString().substring(3,6));
		$("#tel3").val(tel.toString().substring(6,10));
	}
	
	//생년월일 분할
	var birthday = "${member.birthday}";
	$("#yy").val(birthday.toString().substring(0,4));
	$("#mm").val(birthday.toString().substring(5,7));
	$("#dd").val(birthday.toString().substring(8,10));
	
}) 

// 정보 수정 확인
function detail_edit() {
	$("#memberInfoDetatil").hide();
	$("#memberbuy").hide();
	$("#memberInfoDetatilEdit").show();
}
// 정보 수정 뒤로가기
function detail_back() {
	$("#memberInfoDetatil").show();
	$("#memberbuy").show();
	$("#memberInfoDetatilEdit").hide();
}

//
function detail_editOn() {
	$("#tel").val($("#tel1").val()+$("#tel2").val()+$("#tel3").val());
	$("#birthday").val($("#yy").val()+"-"+$("#mm").val()+"-"+$("#dd").val());
	
	$.ajax({
		type: 'get',
		url : 'update.do',
		data : {
			userno : $("#userno").val(),
			name : $("#name").val(),
			zipcode : $("#zipcode").val(),
			addr1 : $("#addr1").val(),
			addr2 : $("#addr2").val(),
			tel : $("#tel").val(),
			birthday : $("#birthday").val(),
			gender : $("#gender").val()
		},
		async:false,
		success:function(res) {
			if (res.trim() == '1') {
				alert('수정되었습니다.');
				location.href = 'detail.do?userno='+${member.userno}
			} else {
				alert('수정 오류');
			}
		}
	});
	
}

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
</script>
</head>
<body>
<div class="top" style="background-color: #000; color: #fff; width:100%; height:30px;">
	<span style="font-size: 18px">&nbsp;&nbsp;${member.name }님 (${member.nickname }, ${member.email })의 회원정보입니다.</span>
</div >



<div class="memberInfoDetail" id="memberInfoDetatil">
	<div style="background-color: #fff; width:100%; height:20px;"></div>
	<div class="memberinfo">&nbsp;● 회원 정보</div>
	<div style="background-color: #fff; width:100%; height:10px;"></div>
	<table class="infoTable" id="infoTable">
		<tbody>
		<tr>
			<td class="infoname">상태</td>
			<td class="info">
				<c:if test="${member.state  == 1}">
					정상회원
				</c:if>
				<c:if test="${member.state  == 2}">
					탈퇴회원
				</c:if>
				<c:if test="${member.state  == 3}">
					휴먼회원
				</c:if>  
			</td>
		</tr>
		<tr >
			<td class="infoname">이메일</td>
			<td class="info">${member.email }</td>
		</tr>
		<tr>
			<td class="infoname">이름</td>
			<td class="info">${member.name }</td>
		</tr>
		<tr>
			<td class="infoname">가입일</td>
			<td class="info">${member.regdate }</td>
		</tr>
		<tr>
			<td class="infoname">로그인</td>
			<td class="info">총 로그인 ${member.checkNumber }회 (최근 로그인 :
			<c:if test="${member.checkNumber ==0 }">로그인 기록 없음</c:if>
			<c:if test="${member.checkNumber != 0 }">${member.recently_accessed}</c:if>)
			</td>
		</tr>
		<tr>
			<td class="infoname">가입유형</td>
			<td class="info">
				<c:choose>
					<c:when test="${member.state == 1 }">
						일반
					</c:when>
					<c:when test="${member.state == 2 }">
						카카오
					</c:when>
					<c:when test="${member.state == 3 }">
						네이버
					</c:when>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td class="infoname">
				우편번호
			</td>
			<td class="info">
				${member.zipcode }
			</td>			
		</tr>
		<tr>
			<td class="infoname">
				주소
			</td>
			<td class="info">
				${member.addr1 }
			</td>
		</tr>
		<tr>
			<td class="infoname">
				상세주소
			</td>
			<td class="info">
				${member.addr2 }
			</td>
		</tr>
		<tr>
			<td class="infoname">
				전화번호
			</td>
			<td class="info">
				${member.tel }
			</td>
		</tr>
		<tr>
			<td class="infoname">
				닉네임(별명)
			</td>
			<td class="info">
				${member.nickname }
			</td>
		</tr>
		<tr>
			<td class="infoname">
				생년월일
			</td>
			<td class="info">
				${member.birthday }
			</td>
		</tr>
		<tr>
			<td class="infoname">
				성별
			</td>
			<td class="info">
				<c:if test="${member.gender == 1}">남</c:if> 
				<c:if test="${member.gender == 2}">여</c:if> 
			</td>
		</tr>
		</tbody>
	</table>
	<div class="editBtn_Zone">
		<button class="editBtn" onclick="detail_edit();" style="margin: auto; display: block; margin-top: 4px;">
			수정하기
		</button>
	</div>
</div>


<div class="memberInfoDetatilEdit" id="memberInfoDetatilEdit">
	<div style="background-color: #fff; width:100%; height:20px;"></div>
	<div class="memberinfo">&nbsp;● 회원 정보 수정</div>
	<div style="background-color: #fff; width:100%; height:10px;"></div>
	<form id="infoDetatilEdit">
	<input type="hidden" name="userno" id="userno" value="${member.userno }">
	<table class="infoTable" id="infoTable">
		<tr>
			<td class="infoname">이메일</td>
			<td>${member.email }</td>
		</tr>
		<tr>
			<td class="infoname">이름</td>
			<td><input type="text" name="name" id="name"  value="${member.name }"></td>
		</tr>
		<tr>
			<td class="infoname">
				우편번호
			</td>
			<td>
				<input type="text" name="zipcode" id="zipcode" value="${member.zipcode }">
				<a href="javascript:zipcode();" class="btn bgGray" style="float: width:auto; clear:none;">우편번호</a>
			</td>			
		</tr>
		<tr>
			<td class="infoname">
				주소
			</td>
			<td>
				<input type="text" name="addr1" id="addr1" value="${member.addr1 }">
			</td>
		</tr>
		<tr>
			<td class="infoname">
				상세주소
			</td>
			<td>
				<input type="text" name="addr2" id="addr2" value="${member.addr2 }">
			</td>
		</tr>
		<tr>
			<td class="infoname">
				전화번호
			</td>
			<td>
            	<input type="text" name="tel1" id="tel1" maxlength="3" style="width:60px;">
               		<small>&nbsp;-&nbsp;</small>
                <input type="text" name="tel2" id="tel2" maxlength="4" style="width:60px;">
                	<small>&nbsp;-&nbsp;</small>
                <input type="text" name="tel3" id="tel3" maxlength="4" style="width:60px;">
                <input type="hidden" name="tel" id="tel">
            </td>
		</tr>
		<tr>
			<td class="infoname">
				생년월일
			</td>
			<td>
				<input type="text" name="yy" id="yy" maxlength="4" style="width:60px;">년
				<input type="text" name="mm" id="mm" maxlength="2" style="width:60px;">월
				<input type="text" name="dd" id="dd" maxlength="2" style="width:60px;">일
				<input type="hidden" name="birthday" id="birthday">
			</td>
		</tr>
		<tr>
			<td class="infoname">
				성별
			</td>
			<td>
				<input type="radio" name="gender" id="gender" value="1" <c:if test="${member.gender == 1}">checked="checked"</c:if>>&nbsp;<span style="font-size: 16px; color:#000000;">남성</span>
               	&nbsp;&nbsp;&nbsp;
               	<input type="radio" name="gender" id="gender" value="2" <c:if test="${member.gender == 2}">checked="checked"</c:if>>&nbsp;<span style="font-size: 16px; color:#000000;">여성</span>
			</td>
		</tr>
	</table>
	</form>
	<div class="editBtn_Zone">
		<button class="editBtn" onclick="detail_editOn();" >등록</button>
		<button class="editBtn" onclick="location.href='detail.do?userno='+${member.userno};" >취소</button>
	</div>
</div>


<div class="memberbuy" id="memberbuy">

	<div class="memberBuyinfo">
	<div style="background-color: #fff; width:100%; height:20px;"></div>
		&nbsp;● 회원 구매 정보
	<div style="background-color: #fff; width:100%; height:20px;"></div>
	</div>

	
	<div class="price">
		<table class="buyTable">
		<tbody>
		<tr>
			<td class="infoname">총 구매액</td>
			<td class="info">${buyprice }&nbsp;원</td>
		</tr>
		<tr>
			<td class="infoname">총 구매수량</td>
			<td class="info"> ${buycount } &nbsp;개</td>
		</tr>
		</tbody>
		</table>
	</div>
	<br>
	<div class="buyBookinfo"">
		<span style="font-size: 12px;">
			총 구매 횟수 : ${totCount }개
			&nbsp; |&nbsp;  ${userVo.page }/${totPage }페이지
		</span>
		<table class="buyinfo">
		<thead>
		    <tr>
		        <th>ISBN13</th>
		        <th>구매 도서명</th>
		        <th>수량</th>
		        <th>가격</th>
		        <th>구매일</th>
		        <th>결제방식</th>
		    </tr>
	    </thead>
	    <tbody>
		<c:if test="${empty memberBuy }">
			<tr>
				<td colspan="6">구매한 도서가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${!empty memberBuy }">
			<c:forEach var="vo" items="${memberBuy }" varStatus="status">
		    <tr data-userno="${vo.userno }">
		        <td>${vo.isbn }</td>
		        <td>${vo.btitle }</td>
		        <td>${vo.bookcount }</td>
		        <td>${vo.salesprice }</td>
		        <td>${vo.order_date }</td>
		        <td>${vo.methodOfPayment }</td>
		    </tr>
		    </c:forEach>
		</c:if>
		</tbody>
		</table>
	</div>
	<div>${pageArea}</div>
</div>
</body>
</html>
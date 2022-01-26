<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 목록</title>
<script>
	function detailView(zipcode, addr1, addr2) {
		window.opener.document.custF.zipcode.value = zipcode;
		window.opener.document.custF.addr1.value = addr1;
		window.opener.document.custF.addr2.value = addr2;
		//window.opener.document.custF.submit();    //폼 전송
		self.close();    //자식창 닫기
	}
</script>


</head>
<body> 
	<div align="center">
		<hr color="#d3d3d3" width="100%">
		<h2>배송 주소록</h2>
		<hr color="#d3d3d3" width="100%">
	</div>	
		<form name="f" method="post" align="left" onsubmit="return check();">
			<b>ㆍ</b>아래의 주소를 클릭하시면 자동으로 주소가 입력됩니다.
			<a class="button" href="/bookmall/addrInsert.do" onclick="" >새 주소 등록</a><a> /</a>
			<a class="button" href="마이 페이지 배송 주소록 관리로 이동" target="_blank">주소록 관리</a><br>
			<b>ㆍ</b>우편번호나 부정확한 주소로 인해 배송 사고가 발생할 위험이 있는 주소는 표시되지 않습니다.
			<table  style="width:100%; border:0; cellspacing:0; cellpadding:0; class:address_list;">
				<tbody><tr align="center" bgcolor="F0F0F0">
					<td style="width:100px" bgcolor="F0F0F0">별칭/이름</td>
					<td style="width:auto" bgcolor="F0F0F0">배송주소</td>
					<td style="width:100px">선택하기</td>
				</tr></tbody>
			</table>
			<table>
			<c:forEach items="${addrlist}" var="list">
				<tr>
					<td style="width:100px;" >
						<a href="javascript:detailView('${list.zipcode }', '${list.address }', '${list.address2 }')">${list.division }</a>
					<td style="width:540px;" >
						<a href="javascript:detailView('${list.zipcode }', '${list.address }', '${list.address2 }')"><br>주 소 : ${list.zipcode }<br>${list.address }<br>${list.address2 }<span class="info1"></span></a></td>							
					<td style="width:100px;" >
						<div align="center" style="padding: 0px;">
							<a href="javascript:detailView('${list.zipcode }', '${list.address }', '${list.address2 }')">선택하기</a>
						</div>
					<input type="hidden" name="addrno" value="${list.addrno }">
					<input type="hidden" name="zipcode" value="${list.zipcode }">
					<input type="hidden" name="add1" value="${list.address }">
					<input type="hidden" name="add2" value="${list.address2 }">
					<input type="hidden" name="add2" value="${list.division }">
					</td>
				</tr>
			</c:forEach>		
			</table>
			<br>
			<input type="button" value="창닫기" onclick="window.close()">
		</form>
</body>
</html>
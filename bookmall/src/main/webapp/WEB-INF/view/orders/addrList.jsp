<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="/bookmall/css/order.css" />
<link rel="stylesheet" href="/bookmall/css/com.css" />

<meta charset="UTF-8">
<title>주소록 목록</title>
<script>
	function detailView(zipcode, address, address2) {
		window.opener.document.custF.zipcode.value = zipcode;
		window.opener.document.custF.addr1.value = address;
		window.opener.document.custF.addr2.value = address2;
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
	<table style="width:100%; border:0; cellspacing:0; cellpadding:0; class:address_list;">
	    <colgroup>
	        <col width="5%" />
	        <col width="10%" />
	        <col width="5%"/>
	    </colgroup>
		<thead>
		    <tr>
		        <th>별칭/이름</th>
		        <th>주소</th>
		        <th>전화번호</th>
		    </tr>
		</thead>
		<tbody>
	    <c:forEach items="${addrlist}" var="list" varStatus="status">
	        <tr id="board_tr"data-addno="${list.addno}">
	        	<td>
		            <input type="hidden" name="division" value="${list.division}" />
		            <input type="hidden" name="name" value="${list.name}" />
		            <input type="hidden" name="zipcode" value="${list.zipcode}" />
		            <input type="hidden" name="address" value="${list.address}" />
		            <input type="hidden" name="address2" value="${list.address2}" />
		            <input type="hidden" name="tel1" value="${list.tel1}" />
		            <input type="hidden" name="tel2" value="${list.tel2}" />
		            <input type="hidden" name="tel3" value="${list.tel3}" />
	            </td>
	        </tr>
	    </c:forEach>	                  	
	    	<c:if test="${empty addrlist }">
                   <tr>
                       <td class="first" colspan="6">등록된 주소가 없습니다.</td>
                   </tr> 
               </c:if>
	    </tbody>
			<form name="f" id="addspace" onsubmit="return check();">
				<c:forEach items="${addrlist}" var="list">
					<tr class="board_tr" data-addno="${list.addno}"
						style="cursor: pointer; ">
						<tr style="font-size: 15px; height: 60px; ">
						<td><center>
							<a href="javascript:detailView('${list.zipcode}','${list.address}','${list.address2}')">${list.division}/${list.name}</a> 
						<center></td>
						<td><center>
						<a href="javascript:detailView('${list.zipcode}','${list.address}','${list.address2}')">${list.zipcode}<br>${list.address} ${list.address2}</a> 
						<center></td>
						<td><center>${list.tel1}-${list.tel2 }-${list.tel3 }</center></td>
					</tr>
				</c:forEach>
			</form>
		</tbody>
	</table>
	<div class="xbtn">
		<input type="button" value="창닫기" onclick="window.close()">
	</div>
</body>
</html>
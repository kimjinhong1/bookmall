<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/bookmall/css/admin/user.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
</head>
<body>
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
	<table class="menu" style="">
	    <thead>
	    
	    <div>&nbsp;</div>
	    <div>&nbsp;</div>
	    </thead>
	    <tbody>
	    <tr>
	        <th scope="row" style="text-align:center;">가입유형</th>
	        <td>
	        	<input type="radio" name="info"> 전체&nbsp;&nbsp;&nbsp;&nbsp;
	        	<input type="radio" name="info"> 일반&nbsp;&nbsp;&nbsp;&nbsp;
	        	<input type="radio" name="info"> 카카오&nbsp;&nbsp;&nbsp;&nbsp;
	        	<input type="radio" name="info"> 네이버
	        </td>
	        <th scope="row" style="text-align:center;">회원상태</th>
	        <td>
	        	<input type="radio" name="state"> 전체&nbsp;&nbsp;&nbsp;&nbsp;
	        	<input type="radio" name="state"> 정상&nbsp;&nbsp;&nbsp;&nbsp;
	        	<input type="radio" name="state"> 탈퇴&nbsp;&nbsp;&nbsp;&nbsp;
	        	<input type="radio" name="state"> 휴먼
	        </td>
	    </tr>
	    </tbody>
	</table>
	</div>
</body>
</html>
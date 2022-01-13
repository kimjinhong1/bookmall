<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
	function getSearchMember() {
		$.ajax({
			url : '/admin/member/index.do',
			data : {
				searchType : $('#searchType').val(),
				searchWord : $('#searchWord').val()
			},
			async:false,
			success:function(res) {
				return false;
			}
		})
	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
	<div id="canvas">
	<div id="container">
		<div id="content">
			<div class="con_tit">
                <div class="bbs">				
					<h2>회원 관리 </h2>
	<table class="menu">
	    <thead>
	    </thead>
	    <tbody>
	    <tr>
	        <th scope="row" style="text-align:center;">가입유형</th>
	        <td>
	        	&nbsp;&nbsp;&nbsp;&nbsp;
	        	<input type="radio" name="info"> 전체&nbsp;&nbsp;&nbsp;&nbsp;
	        	<input type="radio" name="info"> 일반&nbsp;&nbsp;&nbsp;&nbsp;
	        	<input type="radio" name="info"> 카카오&nbsp;&nbsp;&nbsp;&nbsp;
	        	<input type="radio" name="info"> 네이버
	        </td>
	        <th scope="row" style="text-align:center;">회원상태</th>
	        <td>
	        	&nbsp;&nbsp;&nbsp;&nbsp;
	        	<input type="radio" name="state"> 전체&nbsp;&nbsp;&nbsp;&nbsp;
	        	<input type="radio" name="state"> 정상&nbsp;&nbsp;&nbsp;&nbsp;
	        	<input type="radio" name="state"> 탈퇴&nbsp;&nbsp;&nbsp;&nbsp;
	        	<input type="radio" name="state"> 휴먼
	        </td>
	    </tr>
	    <tr>
	    	<td class="search" colspan='4' style="text-align:center;">
	    		<select name="searchType" id="searchType" style="width:160px; height:32px; text-align:center;">
	                <option value="email">이메일</option>
	                <option value="name">회원명</option>
	                <option value="tel">전화번호</option>
	                <option value="regdate">가입날짜</option>
                </select>&nbsp;&nbsp;
	    		<input type="text" id="searchWord" name="searchWord" style=" width:300px;  height:32px;">&nbsp;&nbsp;
	    		<input type="button" onclick="getSearchMember()" value="검색" style=" width:100px; height:32px; ">
	    	</td>
	    </tr>
	    </tbody>
	</table>
	<h3 style="font-size:20px; margin-left: 160px; margin-bottom: 10px">회원 목록 </h3>
	<hr style="width: 75%; margin-left: auto; margin-right: auto;">
	<p style="margin-left: 160px; margin-top: 40px; margin-bottom: 1px;">
	<span >
		<strong>
			총 회원수 : ${totCount }명
		</strong>  |  ${userVo.page }/${totPage }페이지
	</span>
	</p>
	<table class="index">
	    <thead>
		    <tr>
		        <th>번호</th>
		        <th style="width:300px;">이메일</th>
		        <th>회원명</th>
		        <th style="width:200px;">전화번호</th>
		        <th>가입 날짜</th>
		        <th>최근 접속일</th>
		        <th>가입 유형</th>
		        <th>상태</th>
		        <th style="width:300px;">관리</th>
		    </tr>
	    </thead>
	    <tbody>
	    	<c:if test="${empty list }">
                <tr>
                    <td colspan="9">등록된 회원이 없습니다.</td>
                </tr> 
            </c:if>
            <c:if test="${!empty list }">
            	<c:forEach var="vo" items="${list }" varStatus="status">
			    <tr data-userno="${vo.userno }">
			        <td>${vo.userno }</td>
			        <td>${vo.email }</td>
			        <td>${vo.name }</td>
			        <td>${vo.tel }</td>
			        <td>${vo.regdate }</td>
			        <td>${vo.recently_accessed }</td>
			        <td>
			        	<c:choose>
			        		<c:when test="${vo.user_type == 1 }">일반</c:when>
			        		<c:when test="${vo.user_type == 2 }">카카오</c:when>
			        		<c:when test="${vo.user_type == 3 }">네이버</c:when>
			        	</c:choose>
			        </td>
			        <td>
			        	<c:choose>
			        		<c:when test="${vo.state == 1 }">정상</c:when>
			        		<c:when test="${vo.state == 2 }">휴먼</c:when>
			        		<c:when test="${vo.state == 3 }">탈퇴</c:when>
			        	</c:choose>
			        </td>
			        <td>
			        	<input type="button" value="상세" style="cursor:pointer;">
			        	<input type="button" value="수정" style="cursor:pointer;">
			        </td>
			    </tr>
			    </c:forEach>
			</c:if>
	    </tbody>
	</table>
	<div>${pageArea }</div>
	</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
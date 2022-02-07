<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="size">
		<div class="login" style="text-align: right; background-color:#5f7994; color: white; font-size: 12px;">
			<c:if test="${empty userInfo }"> &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="/bookmall/user/login.do" style="color: white;">로그인|</a> 
                    <a href="/bookmall/user/join.do"  style="color: white;">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;
                </c:if>
                <c:if test="${!empty userInfo }">
                	
                	<c:if test="${userInfo.user_type == 2 }">
                		<img alt="카카오아이콘" src="<%=request.getContextPath()%>/img/kakaologo.jpg" width="18" height="16">
                	</c:if>
                	<c:if test="${userInfo.user_type == 3 }">
                		<img alt="네이버아이콘" src="<%=request.getContextPath()%>/img/naverlogo.jpg" width="18" height="16">
                	</c:if>
                	${userInfo.name }님 환영합니다. &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="/bookmall/user/logout.do" style="color: white;">로그아웃 |</a> 
                    <a href="/bookmall/user/mypage.do" style="color: white;">마이페이지|</a> 
                    <a href="/bookmall/cart.do" style="color: white;">장바구니|</a>
                    <a href="/bookmall/ask/askindex.do" style="color: white;">1:1문의</a>&nbsp;&nbsp;&nbsp;&nbsp;
                </c:if>
		</div>
	<center style=" background-color:#5f7994;">
	<a href="/bookmall/main.do"><img src="/bookmall/img/logo.png" width="200px" height="150px" ></a>
	</center>

<div class="menu" >
	<ul class="depth1">
	    <li>
	        <a href="/bookmall/search/index.do">통합검색</a>
	    </li>
	    <li>
	        <a href="/bookmall/book/mainbook.do?bc=0">국내도서</a>	        
	    </li>
	    <li>
	        <a href="/bookmall/book/mainbook.do?bc=1">국외도서</a>
	    </li>
	    <li>
	        <a href="">게시판</a>
	        <ul class="depth2">
	            <li><a href="/bookmall/center/suda/index.do">수다게시판</a></li>
	        </ul>
	    </li>
	    <li>
	        <a href="">고객센터</a>
	        <ul class="depth2">
	            <li><a href="/bookmall/center/notice/index.do">공지사항</a></li>
	            <li><a href="/bookmall/center/faq/index.do">FAQ</a></li>
	        </ul>
	    </li>
	</ul>
</div>
</div>

        
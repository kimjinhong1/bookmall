<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="header">
	<div class="size">
		<div>
			<a href="/bookmall/main.do" >
				<img src="<c:url value="/img/welogo.png" ></c:url>" width="192">
			</a>
		</div>
		
		<div class="login">
			<c:if test="${empty userInfo }">
                    <a href="/bookmall/user/login.do">로그인</a> | 
                    <a href="/bookmall/user/join.do">회원가입</a> |
                    <a href="/bookmall/user/mypage.do">마이페이지</a> |
                    <a href="/bookmall/cart.do">장바구니</a>
                    
                </c:if>
                <c:if test="${!empty userInfo }">
                	${userInfo.name }님 환영합니다. &nbsp;&nbsp;&nbsp;
                    <a href="/bookmall/user/logout.do">로그아웃</a>  |
                    <a href="/bookmall/user/mypage.do">마이페이지</a> | 
                    <a href="/bookmall/cart.do">장바구니</a>|
                    <a href="/bookmall/ask/askindex.do">1:1문의</a>
                    
                </c:if>
		</div>
	</div>
</div>

<div class="menu">
	<ul class="depth1">
	    <li>
	        <a href="">통합검색</a>
	    </li>
	    <li>
	        <a href="/bookmall/book/korean.do">국내도서</a>	        
	    </li>
	    <li>
	        <a href="/bookmall/book/abroad.do">해외도서</a>
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
        
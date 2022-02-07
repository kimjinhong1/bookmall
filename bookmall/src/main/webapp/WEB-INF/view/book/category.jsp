<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="oldnum" value="" />
<div class="nav_category">
	<c:forEach var="vo" items="${cate}" varStatus="status">
	
	<c:if test="${oldnum == ''}">
		<a href="/bookmall/book/mainbook.do?bc=0">국내도서</a>
	</c:if>
	<c:if test="${oldnum == '27' and vo.blev1 == '348'}">
		<a href="/bookmall/book/mainbook.do?bc=1">국외도서</a>
	</c:if>
		
		<c:if test="${vo.blev1 != oldnum}">
			<div class='cate1'>
			<a href="/bookmall/book/booklist.do?bc=${vo.bclassify }&blev=1&cano=${vo.blev1 }" data-blev="1" data-cano="${vo.blev1 }">
				<em><b>${vo.blev1name }</b></em>
			</a>
			<a href="#;" class="cate2Slide" data-blev="${vo.blev1 }">+</a>
			</div>
		</c:if>
		<c:if test="${vo.blev1 == oldnum}">
			<div class='cate2 cate2_${vo.blev1}'>
				<a href="/bookmall/book/booklist.do?bc=${vo.bclassify }&blev=2&cano=${vo.blev2 }" data-blev="2" data-cano="${vo.blev2 }">
					<em>${vo.blev2name }</em>	
				</a>
			</div>
		</c:if>
		<c:set var="oldnum" value="${vo.blev1 }" />
	</c:forEach>
</div>
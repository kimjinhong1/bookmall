<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>해외도서</title>
    
    <!-- css -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="/bookmall/css/reset.css"/>
    <link rel="stylesheet" href="/bookmall/css/com.css"/>
    
    <!-- js -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <script src="/bookmall/js/common.js"></script>
    <script src="/bookmall/js/main.js"></script>

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
				<em>${vo.blev1name }</em>
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

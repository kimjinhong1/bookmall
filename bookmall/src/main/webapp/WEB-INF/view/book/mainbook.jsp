<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>국내도서</title>
    
    <!-- css -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="/bookmall/css/reset.css"/>
    <link rel="stylesheet" href="/bookmall/css/common.css"/>
    <link rel="stylesheet" href="/bookmall/css/book/book.css"/>
    <!-- js -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <script src="/bookmall/js/common.js"></script>
    <script src="/bookmall/js/main.js"></script>
    <script>
    	$(function() {
    		$(".cate2Slide").click(function() {
    			var blev = $(this).data("blev");
    			$(".cate2").slideUp();
    			$(".cate2_"+blev).slideDown();
    		});
    	})
    </script>
</head>
<body>
<div class="wrap"> 	
   	<!-- HEADER 시작 -->
    <%@ include file="/WEB-INF/view/include/header.jsp" %>
    <!-- HEADER 종료 -->
         
        <div class="container">
        	<%@ include file="/WEB-INF/view/book/category.jsp" %>
        <!-- 새로 나온 도서 영역 시작 -->
        	<div class="bookArea">
	            <div class="size">
	            	<div class="text">
						<p style="font-size:20px"><b>새로 나온 도서 ▶</b></p>
	            	</div>
	            	<c:forEach var="vo" items="${newBook }">
						<div class="section_new">
							<div class="newBook">
								<a href="/bookmall/book/detail.do?bookno=${vo.bookno }"><img src="/bookmall/upload/${vo.bthumb_real }" width="130"></a><br>
				                <!--  <span style="color:blue"><b>[건강에세이/건강기타]</b></span><br>  bcategory -->
				                <a href="/bookmall/book/detail.do?bookno=${vo.bookno }"><b>${vo.btitle_first }</b></a> <!-- btitle_first -->
				                <p>${vo.author } 저</p>  <!-- author -->
				                <p>${vo.publisher }</p> <!-- publisher -->
								<p><b>${vo.salesprice }&nbsp;원</b></p> <!-- salesprice -->
							</div>
		             	</div>	
		             </c:forEach>
				</div>
				<!-- 새로 나온 도서 영역 종료 -->
			
			<!-- 인기 있는 도서 영역 시작 -->	
	        	<div class="size">
	                <div class="text">
						<p style="font-size:20px"><b>인기 있는 도서 ▶</b></p>
	            	</div>
	            	<c:forEach var="hot" items="${hotBook }">
		                <div class="section_hot">
							<div class="hotBook">
								<!-- <p style="text-align:left"><b>사회/정치</b></p><br> -->
								<a href="/bookmall/book/detail.do?bookno=${hot.bookno }"><img src="/bookmall/upload/${hot.bthumb_real }" width="200" height="300" align="left" float="left" ></a>
								<div class="hotBooktitle" style="padding-top: 20px; height: 300px;">
					                <a href="/bookmall/book/detail.do?bookno=${hot.bookno }"><b>${hot.btitle_first }</b></a><br> <!-- btitle_first -->
					                
					                <div class="hotBookAuthor" style="padding-top: 5px; height: 300px;">
					            		<p>${hot.author } 저</p> <!-- author -->
					            		
					            		<div class="hotBookPublisher" style="padding-top: 5px; height: 300px;">
					            			<p>${hot.publisher }</p><br>  <!-- publisher -->
					            			
					            			 <div class="hotBookPrice" style="padding-top: 5px; height: 300px;">    
										     	<p><b>${hot.salesprice }(원)</b></p> <!-- salesprice -->
											 </div>
					           			</div>
					            	</div>
					            </div>
							</div>
	             	 	</div>
	             	</c:forEach>
	            </div>
            </div>
        </div>
        <!-- 인기 있는 도서 영역 종료  -->
</div>   
       
        <!-- FOOTER 시작 -->
        <%@ include file="/WEB-INF/view/include/footer.jsp" %>
        <!-- FOOTER 종료 -->
</body>
</html>
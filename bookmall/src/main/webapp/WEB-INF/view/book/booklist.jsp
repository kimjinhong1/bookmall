<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도서 목록</title>
    
    <!-- css -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="/bookmall/css/reset.css"/>
    <link rel="stylesheet" href="/bookmall/css/book/booklist.css"/>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/jquery-ui.css" />
    
    <!-- js -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <script src="/bookmall/js/common.js"></script>
    <script src="/bookmall/js/main.js"></script>

<script>
//장바구니 담기
		$("#cartbtn").click(function() {
			$.ajax({
				url : '/bookmall/cart/add',
				type : 'POST',
				data : {
					vo.bookno

				},
				success : function(result) {
					alert('장바구니에 등록되었습니다.');
					$(".bookcount").val("1");
				}
			})
		});
</script>
</head>
<body>
<div class="wrap"> 	
   	<!-- HEADER 시작 -->
    <%@ include file="/WEB-INF/view/include/header.jsp" %>
    <!-- HEADER 종료 -->
         
        <div class="container">
        <!-- 새로 나온 도서 영역 시작 -->
            <div class="size">
            	<div class="bbs">
                    <table class="list">
                        <caption>도서 목록</caption>
                        <colgroup>
                            <col width="10px" />
                            <col width="100px" />
                            <col width="250px" />
                            <col width="100px" />
                            <col width="100px" />
                            <col width="50px" />
                        </colgroup>
                        <tbody>
                        <c:forEach var="vo" items="${list}" varStatus="status">
                           	<tr class="board_tr" data-boardno="${vo.bookno }" style="cursor: pointer;">
                           		<td class="first">
                                	<input type="checkbox" name="bookno" id="bookno" value=""/>
                                </td>
                           		<td class="bookimg">
                           			<a href="/bookmall/book/detail.do?bookno=${vo.bookno }" ><img src="/bookmall/img/book_1.png" width="192"></a>
                           		</td>
                                <td class="txt_l" style="text-align:left;">
                                    <h2><a href="/bookmall/book/detail.do?bookno=${vo.bookno }" >${vo.btitle_first }</h2>${vo.btitle_second }</a>
                                </td>
                                <td>
                               		${vo.author } 저 | ${vo.publisher } | ${vo.pubdate }
                                </td>
                                <td>
                                	${vo.salesprice } 원 
                                </td>
                                <td class="review">
                                    회원 리뷰(건) | 별점
                                </td>
                                <td class="bintroduce">
                                	${vo.bintroduce}
                                </td>
                                
                                <td class="btnTop">
                                	<a class="btns" href="#" id ="cartbtn" name="cartinsert"><strong>장바구니에 담기</strong> </a>
                                </td>
                                <td class="btnMiddle">
                                	<a class="btns" href="#" onclick=""><strong>바로 주문하기</strong> </a>
                                </td>
                                <td class="btnBottom">
                                	<a class="btns" href="#" onclick=""><strong>리스트에 담기</strong> </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    </div>
                   </div>
		</div>
</div>   
       
        <!-- FOOTER 시작 -->
        <%@ include file="/WEB-INF/view/include/footer.jsp" %>
        <!-- FOOTER 종료 -->
</body>
</html>
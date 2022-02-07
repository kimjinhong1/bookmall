<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<link rel="stylesheet" href="/bookmall/css/common.css"/>
    <link rel="stylesheet" href="/bookmall/css/book/book.css"/>    
    <!-- js -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <script src="/bookmall/js/common.js"></script>
    <script src="/bookmall/js/main.js"></script>

	<script>
		$(function(){
			
			// 도서 수량 변경 - 버튼 이벤트
			$("input[id^='minusCount']").click(function() {
				var bno = $(this).data("bno");
				if($("#bookcount_"+bno).val() <= 1) {
					alert("최소 수량은 1권입니다.");
				} else {
					var bc = $("#bookcount_"+bno).val();
					bc--;
					$("#bookcount_"+bno).val(bc);
				}
			});
			
			// 도서 수량 변경 + 버튼 이벤트
			$("input[id^='plusCount']").click(function() {
				var bno = $(this).data("bno");
				if($("#bookcount_"+bno).val() >= 100) {
					alert("최대 수량은 100권입니다.");
				} else {
					var bc = $("#bookcount_"+bno).val();
					bc++;
					$("#bookcount_"+bno).val(bc);
				}
			});
			
			// 카테고리 중분류 보여주기 이벤트
			$(".cate2Slide").click(function() {
    			var blev = $(this).data("blev");
    			$(".cate2").slideUp();
    			$(".cate2_"+blev).slideDown();
    		});
			
			// 정렬 이벤트
			$('a[name="listOrder"]').click(function(){
				window.location = "/bookmall/book/booklist.do?bc="+${param.bc}+"&blev="+${param.blev}+"&cano="+${param.cano}+"&listOrder="+$(this).data('listOrder');
			});
			
			// 목록에 보여주는 갯수
			$("#numchoose").change(function(){
				window.location = "/bookmall/book/booklist.do?bc="+${param.bc}+"&blev="+${param.blev}+"&cano="+${param.cano}+"&page=1&numchoose="+$(this).val();
			});

		});
		
		// 도서 검색 
		function goSearch(){
			window.location = "/bookmall/book/booklist.do?bc="+${param.bc}+"&blev="+${param.blev}+"&cano="+${param.cano}+"&page=1&numchoose="+$('#numchoose').val()+"&searchWord="+$("#searchWord").val();
		}
	</script>

	<script>
	//장바구니 담기
	$(function() {
		$("#cartbtn").click(function(){
			$.ajax({
				url: '/bookmall/cart/add',
				type: 'POST',
				data: {
					bookno : ${data.bookno}, btitle_first : ${vo.btitle_first}, salesprice: ${vo.salesprice}
					
				},
				success: function(result){
					alert('장바구니에 등록되었습니다.');
				}
			})
		});
	});


	$(function() {
		$("#listbtn").click(function(){
			$.ajax({
				url: '/bookmall/mylist/insert.do',
				type: 'POST',
				data: {
					bookno : ${vo.bookno}, btitle_first : '${vo.btitle_first}', author: '${vo.author}', publisher: '${vo.publisher }'
				},
				success: function(result){
					if (result.trim() == "2") {
						alert("이미 등록되었습니다.");
					} else {
						alert('마이리스트에 등록되었습니다.');
					}
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
       
		<!-- 도서 목록 캡션 시작 -->   
		<hr>
			<caption>
			<br><h2>도서 목록</h2>
			</caption>
		<hr>
        <!-- 도서 목록 캡션 종료 -->
        
        <!-- 카테고리 시작 -->
		<%@ include file="/WEB-INF/view/book/category.jsp" %>
        <!-- 카테고리 종료 -->
            
            <!-- 카테고리 내 검색 시작 -->
            <div class="cateSelectBox" style="padding-top: 15px;">
				<input type="text" value="" id="searchWord" style="width:400px;" placeholder="검색어를 입력해주세요." >
				<button type="button" onclick="goSearch();">
					<img  src="<%=request.getContextPath()%>/img/search.png" style=" width:35px; height:25px; ">	
				</button>
			</div>
			<!-- 카테고리 내 검색 종료 -->
			
            <!-- 도서 목록 정렬 시작 -->
            <div class="listOrder">
            	
            	<a href="javascript:void(0);" name="listOrder" data-list-order="sales">판매량순</a>
            	<a href="javascript:void(0);" name="listOrder" data-list-order="score">평점순</a>
            	<a href="javascript:void(0);" name="listOrder" data-list-order="newBook">신상품순</a>
            	<a href="javascript:void(0);" name="listOrder" data-list-order="lowPrice">최저가순</a>
            	<a href="javascript:void(0);" name="listOrder" data-list-order="highPrice">최고가순</a>
            	<a href="javascript:void(0);" name="listOrder" data-list-order="review_count">리뷰개수순</a>
            	
            	<select style="width: 100px; margin-right: 10px" name="numchoose" id="numchoose">
					<option value="10" <c:if test="${param.numchoose=='10' }">selected</c:if>>10개씩</option>
					<option value="20" <c:if test="${param.numchoose=='20' }">selected</c:if>>20개씩</option>
				</select>
			</div>
            <!-- 도서 목록 정렬 종료 -->
            
            		<!-- 도서 목록 시작 -->
                    <table class="booklist">
                        <colgroup>
                            <col width="200px" />
                            <col width="200px" />
                            <col width="200px" />
                            <col width="120px" />
                            <col width="180px" />
                            <col width="100px" />
                            <col width="200px" />
                        </colgroup>
                        <thead>
							<tr>
								<th scope="col" class="first"></th>
								<th scope="col">도서명</th>
								<th scope="col">저자 | 출판사 | 출간일</th> 
								<th scope="col">가격</th> 
								<th scope="col">리뷰 | 별점</th> 
								<th scope="col">수량선택</th>
								<th scope="col">상품담기</th>
							</tr>
						</thead>
                        <tbody>
			
                        <c:if test="${list != null && fn:length(list) > 0 }">
                        <c:forEach var="vo" items="${list}" varStatus="status">
                        	<div class="salesBook">
                           	<tr class="board_tr" data-boardno="${vo.bookno }" style="cursor: pointer;">
                           		<td class="bookimg">
                           			<a href="/bookmall/book/detail.do?bookno=${vo.bookno }" >
                           				<img src="/bookmall/upload/${vo.bthumb_real }" width="150"></a>
                           		</td>
                                <td class="txt_l" style="text-align: center;">
                                    <a href="/bookmall/book/detail.do?bookno=${vo.bookno }" ><h2>${vo.btitle_first }</h2>${vo.btitle_second }</a>
                                </td>
                                <td>
                               		${vo.author } 저 <br>
                               		${vo.publisher } <br> 
                               		${vo.pubdate }
                                </td>
                                <td>
                                	${vo.salesprice } 원 
                                </td>
                                <td class="review">
                                    회원 리뷰(${vo.review_count }건)<br>
                                    별점 : ${vo.review_score }
                                </td>
                                <td>
                                	<a>수량 선택 <br> 
						         	<input type="button" name="minusCount_${vo.bookno }" id="minusCount_${vo.bookno }" value="-" class="" data-bno="${vo.bookno }">
						         		<input type="text" name="bookcount_${vo.bookno }" id="bookcount_${vo.bookno }" value="1" style="width: 30px;" readonly>
						         	<input type="button" name="plusCount_${vo.bookno }" id="plusCount_${vo.bookno }" value="+" class="" data-bno="${vo.bookno }"></a>
                                </td>
                                <td class="btnTop">
                                	<a id ="cartbtn" name="cartinsert" href="#"><strong>장바구니 담기</strong> </a> <br>
                                	<a class="btns" href="#" onclick=""><strong>바로 주문하기</strong> </a> <br>
                                	<a id ="listbtn" name="mylistinsert" href="#"><strong>마이리스트 담기</strong> </a>
                                </td>
							</div>
                        </c:forEach>
                        </c:if>
                        <c:if test="${fn:length(list) <= 0 }">
                        	해당 도서 목록이 존재 하지 않습니다.
                        </c:if>
                        </tbody>
                    </table>
                    <!-- 도서 목록 종료 -->
                    
                    <!-- 페이징 처리 시작 -->
                    <div>
                    	${pageArea }
                    </div>
                    <!-- 페이징 처리 종료 -->
		</div>
</div>   
       
        <!-- FOOTER 시작 -->
        <%@ include file="/WEB-INF/view/include/footer.jsp" %>
        <!-- FOOTER 종료 -->
</body>
</html>
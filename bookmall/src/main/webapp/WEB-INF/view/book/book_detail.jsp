<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="bookmall.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도서 정보</title>
    
    <!-- css -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="/bookmall/css/reset.css"/>
    <link rel="stylesheet" href="/bookmall/css/common.css"/>
    <link rel="stylesheet" href="/bookmall/css/contents.css"/>
    
    <!-- js -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <script src="/bookmall/js/common.js"></script>
    <script src="/bookmall/js/main.js"></script>
	
	<script>
		$(function(){
			$('#minusCount').click(function() {
				if($("#bookcount").val() <= 1) {
					alert("최소 수량은 1권입니다.");
				} else {
					var bc = $("#bookcount").val();
					bc--;
					$("#bookcount").val(bc);
				}
			});
			
			$('#plusCount').click(function() {
				if($("#bookcount").val() > 100) {
					alert("최대 수량은 100권입니다.");
				} else {
					var bc = $("#bookcount").val();
					bc++;
					$("#bookcount").val(bc);
				}
			})
		});
	</script>
</head>
<script>
function goSave() {
    $.ajax({ 
       url:'/bookmall/center/review/insert.do', 
       type:'post', 
       data:$("#frm").serialize(), 
       success:function(res) {
          if (res.trim() == 1) { 
             alert('댓글이 등록되었습니다.');
             $("#frm #content").val("");
             reviewList(${data.bookno}); 
          } else { 
             alert("댓글 등록 오류");
          }
       }
    })
 }

 function reviewList(bookno, page) {
    $.ajax({
       url : '/bookmall/center/review/list.do', 
       data : {bookno:bookno, page:page},  
       success : function(res) { 
          $("#bookReview").html(res);
       }
    })
 }
 $(function() { 
    reviewList(${data.bookno}, 1); 
 })
 
 function goDelete(no) {  
	   if (confirm('댓글을 삭제하시겠습니까?')) { 
		   $.ajax ({
			 	url:"/bookmall/center/review/delete.do", 
			 	data: {no : no}, 
			 	success: function(res){
			 		if(res.trim() =='1') {  
			 			reviewList(${data.bookno}); 
			 		} else {
			 			alert('댓글 삭제 오류');
			 		}
			 	}
		   })
	   }
 }
 
 function goReply(no) {  
	   if (confirm('댓글을 수정하시겠습니까?')) { 
		   $.ajax ({
			 	url:"/bookmall/center/review/update.do", 
			 	data: $("#frm"+no).serialize(), 
			 	type:'post',
			 	success: function(res){
			 		if(res.trim() =='1') {  
			             alert('댓글이 수정되었습니다.');
			             $("#tr"+no).hide();
			             reviewList(${data.bookno}); 
			 		} else {
			 			alert('댓글 수정 오류');
			 		}
			 	}
		   })
	   }
 }
 
 function showTr(no){
	 $(".replyTr").hide();
	 $("#tr"+no).show();
 }
 
function socre(bookno) {
    $.ajax({
       url : '/bookmall/center/review/score.do', 
       data : {bookno:bookno},  
       success : function(res) { 
          $("#bookScore").html(res);
       }
    })
 }
$(function() { 
	socre(${data.bookno}, 1); 
 })
</script>  
<body>
<div class="wrap"> 	
   	<!-- HEADER 시작 -->
    <%@ include file="/WEB-INF/view/include/header.jsp" %>
    <!-- HEADER 종료 -->
    <input type="hidden" name="bookno" value="${data.bookno }">
    	 <!-- 도서 기본 정보 시작 -->
    	 <span style="align:center"><h3>도서 정보</h3></span>
    	 <hr>
         <div class="bookNormalInfo">
         	<img src="/bookmall/upload/${data.bthumb_real }" width="130"></a><br>
         	<a><h3>${data.btitle_first}</h3>${data.btitle_second }</a><br>
         	<a>${data.author } | ${data.publisher } | ${data.pubdate }</a><br>
         	<a>별점 &nbsp;&nbsp;&nbsp;| 판매 지수 : 500</a><br>
         	<hr>
         	<a>정가 : ${data.price }</a><br>
         	<span style="color:red" ><b>판매가 : ${data.salesprice}</b></span><br>
         	<hr>
         	<a>수량 선택 : 
         	<input type="button" name="minusCount" id="minusCount" value="-" class="">
         		<input type="text" name="bookcount" id="bookcount" value="1" readonly>
         	<input type="button" name="plusCount" id="plusCount" value="+" class="" ></a>
         </div>	
         <!-- 도서 기본 정보 종료 -->
         
         	<!-- 구매/장바구니 버튼 시작 -->
         	<div class="butSet clear">
				<div class="buyBtn">
					<input type="button" value="바로 구매" class="" onclick="">
					<input type="button" value="리스트에 담기" class="" onclick="">
					<input type="button" value="장바구니에 담기" class="" onclick="">
				</div>
			</div>
         	<!-- 구매/장바구니 버튼 종료 -->
         	
         	<!-- 도서 정보/리뷰/배송환불 이동 버튼 시작 -->
			<div class="viewSet clear">
				<div class="viewBtn">
					<a href="#bookDetailInfo" class="btn">도서 정보</a>
					<a href="#bookReviewInfo" class="btn">리뷰</a>
					<a href="#bookDeliveryInfo" class="btn">배송/반품/교환</a>
				</div>
			</div>
			<!-- 도서 정보/리뷰/배송환불 이동 버튼 종료 -->
			
			<!-- 도서 상세 정보 시작 -->
			<a name="bookDetailInfo"></</a>
         	<div class="bookDetailInfo">
         		<a><h2>품목 정보</h2></a><br>
         		<a>출간일 : ${data.pubdate }</a><br>
         		<a>쪽수, 무게, 크기 : ${data.bpages }쪽 | ${data.bweight }g | ${data.bwidth } * ${data.bvertical } * ${data.bheight }mm </a><br>
         		<a>ISBN13 : ${data.isbn }</a><br>
         		
         		<a><h2>관련 분류</h2></a><br>
         		<c:forEach items="${list }" var="cate">
	         		<c:if test="${data.classify eq 0}">국내도서 ></c:if>
	         		<c:if test="${data.classify eq 1}">국외도서 ></c:if>
	         		${cate.parentname} >	
         			${cate.bcategoryname }<br>
         		</c:forEach>
         		<hr>
         		
         		<a><h2>책 소개</h2></a><br>
         		<div class="bookInfo">
         			${data.bintroduce }
         		</div>
				<hr>
				<a><h2>목차</h2></a>
				<div class="bookIndex">
					${data.bindex }
				</div>         	
				<hr>
				
				<a><h2>도서 리뷰</h2></a><br>
				<div>
				<img src="/bookmall/img/score.png" style='width:100px;'>   
				<b id="bookScore" style="font-size:30px;"></b>/5
				</div>
				</div>
				<div id="bookReview" class="bbs">
				</div>
				<div class="bbs">
					<c:if test="${!empty userInfo}">
                    <form method="post" name="frm" id="frm" action="" enctype="multipart/form-data" >
                       <input type="hidden" name="bookno" value="${data.bookno }">  
                       <input type="hidden" name="userno" value="${userInfo.userno }"> 
                        <table class="board_write">
                            <colgroup>
                                <col width="*" />
                                <col width="100px" />
                            </colgroup>
                            <tbody>
                            <tr>
                                <td style="color:#000000;">
                                	<input type="radio" name="score" value="5" checked>5점&nbsp;&nbsp;
                                	<input type="radio" name="score" value="4" >4점&nbsp;&nbsp;
                                	<input type="radio" name="score" value="3" >3점&nbsp;&nbsp;
                                	<input type="radio" name="score" value="2" >2점&nbsp;&nbsp; 
                                	<input type="radio" name="score" value="1" >1점&nbsp;&nbsp; 
                                    <textarea name="content" id="content" placeholder="주제와 무관한 댓글, 악플 등의 글은 임의 삭제될 수 있습니다." style="height:50px;" width:100%;"></textarea> <!-- 서버로 전송 댓글내-->
                                </td>
                                <td>
                                    <div class="btnSet"  style="text-align:right;">
                                        <a class="btn2" href="javascript:goSave();">저장 </a>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                      </form>
                    </c:if> 
                 </div> 
         	</div>
         	
         	<!-- 도서 상세 정보 종료 -->
         	
         	<!-- 배송/반품/교환 시작 -->
         	<a name="bookDeliveryInfo"></</a>
         	<div class="bookDelivery">
         		<a><h2>배송/반품/교환</h2></a>
         		<span style="color:blue">배송 안내</span><br>
         			배송 시 주의 사항<br>
         		<span style="color:blue">반품 안내</span><br>
         			반품 시 주의 사항<br>
         		<span style="color:blue">교환 안내</span><br>
         			교환 시 주의 사항<br>
         	</div>
         </div>
 
        <!-- FOOTER 시작 -->
        <%@ include file="/WEB-INF/view/include/footer.jsp" %>
        <!-- FOOTER 종료 -->
</body>
</html>
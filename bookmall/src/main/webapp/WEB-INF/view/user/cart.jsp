<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>cart</title>
<link rel="stylesheet"
   href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="/bookmall/css/order.css" />
<link rel="stylesheet" href="/bookmall/css/com.css" />
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="/bookmall/js/common.js"></script>
<script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<head>
<link rel="stylesheet"
   href="request.getContextPath()/resources/css/bootstrap.min.css">
<title>장바구니</title>
<script>
$(function(){
    //체크박스 전체 선택&해제
    $('#checkall').click(function(){
         if($("#checkall").prop("checked")){
            $("input[type=checkbox]").prop("checked",true); 
        }else{
            $("input[type=checkbox]").prop("checked",false); 
        }
    });
    
    // 선택삭제
    $(".deleteClick").on('click', function() {
      if (confirm('선택한 상품을 삭제하시겠습니까?')) {
         $.ajax({
            type : 'post',
            url : '/bookmall/cart/deleteAjax.do', // <<-- 처리 요청 URL
            data : $("#cartspace").serialize(),
            success : function(res) { // 비동기요청  성공시
               alert('총 '+res.trim()+"건이 삭제되었습니다.");
               location.reload(); // 페이지 새로고침
            }
         });
      }
   });
    
    //수량 수정 버튼
   $(".quantity_modify_btn").on("click", function() {
      var idx = $(".quantity_modify_btn").index(this); // 클릭한게 몇번째 인덱스인지
      var cartno = $(this).data("cartid"); // 내가클릭한 객체의 data-cartId속성값
      var bookcount = $(".bookcount").eq(idx).val(); // 내가클릭한 객체와 같은순서(인덱스)에 있는 수량값
      $.ajax({
         url : '/bookmall/cart/update',
         data : {cartno:cartno, bookcount:bookcount},
         type : 'post',
         success : function(res) {
            if (res.trim() == '1') {
               alert('수량이 변경되었습니다.');
               location.reload();
            }
         }
      })
   });
  
   //수량버튼
   $(".plus_btn").on("click", function() {
      let quantity = $(this).parent("div").find("input").val();
      $(this).parent("div").find("input").val(++quantity);
   });
   $(".minus_btn").on("click", function() {
      let quantity = $(this).parent("div").find("input").val();
      if (quantity > 1) {
         $(this).parent("div").find("input").val(--quantity);
      }
   });
});
   
   
</script>
</head>
<body>
   <div class="wrap">
      <%@ include file="/WEB-INF/view/include/header.jsp"%>
      <div class="sub">
         <div class="sub_visual">
            <div class="slogan">
               [${userInfo.name}]님의 cart

            </div>
         </div>
         <div class="size">
            <div class="box">
               <table class="table table-striped" style="border-bottom: 1px solid black">
                  <thead>
                     <tr>
                        <th scope="col" width="50px"></th>
                        <th scope="col" width="100px">제품</th>
                        <th scope="col" width="500px">상세</th>
                        <th scope="col" width="200px">단가</th>
                        <th scope="col" width="150px">수량</th>
                        <th scope="col" width="200px">금액</th>
                     </tr>
                  </thead>
                  <tbody>
                     <!--if 하고 forEach 돌리기 ------------ -->
                  <c:if test="${cartInfo eq null or empty cartInfo}">
                        <tr>
                           <td colspan="6"><center><b>담긴 상품이 없습니다.</b></center></td>
                        </tr>
                     </c:if>
                     <form name="cartspace" id="cartspace" action="/bookmall/order2.do">
                     <input type="hidden" name="booktitle" value=${booktitle }>
                     <c:set var="totPrice" value="0"/>
                     <c:if test="${cartInfo ne null and not empty cartInfo}">
                        <c:forEach var="cart" items="${cartInfo}">
                           <tr>
                              <td>
                                 <label> 
                                    <input type="checkbox" name="cartnos" value="${cart.cartno }" id="1" checked="checked">
                                 </label>
                              </td>
                              <td> 
                                 <a href="/bookmall/book/detail.do?bookno=${cart.bookno}" >
                                 <img src=" /bookmall/img/${cart.bthumb_org}" class="img-thumbnail" style="width: 100px; "></a>
                              </td>
                              <td> 
                                 <a href="/bookmall/book/detail.do?bookno=${cart.bookno }" >
                                 <center>${cart.btitle_first } </center>
                                 <center> ${cart.btitle_second }</center>
                                 <center>저자 : ${cart.author }</center>
                                 </a>
                              </td>
                              <td style="font-weight: bold;">
                                 <center><fmt:formatNumber value="${cart.salesprice}" pattern="###,###" />원</center>
                              </td>
                              <td>
                                 <center><input type="number" class="bookcount" value="${cart.bookcount}" min="1" max="50" size="3">개
                                 <a class="quantity_modify_btn" data-cartid="${cart.cartno}" style="cursor: pointer;">변경</a></center>
                              </td>
                              <td style="font-weight: bold;text-align: right;">
                                 <center><fmt:formatNumber value="${cart.salesprice * cart.bookcount}" pattern="###,###" /> 원</center>
                                 <c:set var="totPrice" value="${cart.salesprice * cart.bookcount + totPrice}"/>
                              </td>
                           </tr>
                        </c:forEach>
                     </c:if>
                     </form>
                  </tbody>
               </table>
                     <tr>
                        <td>
                           <h5 style="float:right; font-size: 20px;"> 장바구니 총 액: 
                              <span class="text-danger"> 
                              <fmt:formatNumber value="${totPrice}" pattern="###,###" />원 
                              </span>
                           </h5>
                        </td>
                        
                        
                        <td>
                           <input type="checkbox" id="checkall" style="cursor: pointer;"><label for = 'checkall'><b>전체선택</b></label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <a href="javascript:;" class="btn deleteClick"style="font-size: 16px; font-weight: bold; cursor: pointer;">삭제</a>
                        </td>
                        
                     </tr><br><br><br>
                     
                     <tr>
                        <td>
                           <a href="javascript:$('#cartspace').submit();" class="orderBtn" style="font-size:15px; float: right; color:red;">주문하기</a>
                           <a href="/bookmall/main.do"  style="font-size:15px;float: left;"><< 쇼핑 계속하기</a>
                        </td>
                     </tr>
               </div>
         </div>
      </div>
   </div>
   <!-- 수량 조정 form -->
         <form action="/cart/update" method="post" class="quantity_update_form">
            <input type="hidden" name="cartno" class="update_cartno">
            <input type="hidden" name="bookcount" class="update_bookcount">
            <input type="hidden" name="userno" value="${userInfo.userno}">
         </form>
   </div>
   <%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<head>
<link rel="stylesheet"
	href="request.getContextPath()/resources/css/bootstrap.min.css">
<title>장바구니</title>
<script>
$(function(){
    //체크박스 전체 선택&해제
    $('#ck_all').click(function(){
         if($("#ck_all").prop("checked")){
            $("input[type=checkbox]").prop("checked",true); 
        }else{
            $("input[type=checkbox]").prop("checked",false); 
        }
    });
    
    //품목삭제
    function cartDel(cartno, bookno){
		//alert(num);
		var yn=confirm(cartno+'번 상품을 정말 삭제하시겠습니까?');
		if(yn){
		df.cartno.value=num;
		df.method='post';
		df.submit();
		}
	}
</script>
</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/view/include/header.jsp"%>
		<div class="sub">
			<div class="sub_visual">
				<div class="slogan">
					${loginUser.name} [${loginUser.userid}]님 cart
				</div>
			</div>
			<div class="size">
				<div class="box">
					<table class="table table-striped" style="border-bottom: 1px solid black">
						<thead>
							<tr>
								<th scope="col" width="20%">상품번호</th>
								<th scope="col" width="30%">상품명</th>
								<th scope="col" width="10%">수량</th>
								<th scope="col" width="20%">단가</th>
								<th scope="col" width="20%">금액</th>
								<th scope="col" width="20%"></th>
							</tr>
						</thead>
						<tbody>
							<!--if 하고 forEach 돌리기 ------------ -->
						<c:if test="${cartList eq null or empty cartList}">
								<tr>
									<td colspan="6"><center><b>담긴 상품이 없습니다.</b></center></td>
								</tr>
							</c:if>
							<c:if test="${cartList ne null and not empty cartList}">
								<c:forEach var="cp" items="${cartList}">
									<tr>
										<td>
											<label> 
												<input type="checkbox" name="bnum" idx="">${cp.bookno}
											</label>
										</td>
										<td>${cp.product_name}<br> 
											<a href="../prodDetail.do?bnum=${cart.bookno}" target="_blank">
											<img src="../images/${cart.pimage1}" class="img-thumbnail" alt="${cart.product_name}" style="width: 140px"></a>
											</td>
										<td>
											<input type="number" value="${cart.bookamount}" min="1" max="50" size="3">개
											<button type="button" class="btn-info">수정</button>
										</td>
										<td style="font-weight: bold">
											<fmt:formatNumber value="${cart.price}" pattern="###,###" />원<br> 
										</td>
										<td style="font-weight: bold">
											<fmt:formatNumber value="${cart.totalPrice}" pattern="###,###" />원<br> 
										</td>
										<td>
										<a class="btn btn-outline-danger" onclick="cartDel('${cart.cartno}','${cart.bookno}')">삭제</a>
										</td>
									</tr>
								</c:forEach>
							</c:if>
							<!-- ------------ -->
						</tbody>
					</table>
							<tr>
								<td colspan="3">
									<h5 style="float:right; font-size: 15px;"> 장바구니 총 액: 
										<span class="text-danger"> 
										<fmt:formatNumber value="${cartTotalPrice}" pattern="###,###" />
										</span>원
									</h5>
								</td>
								<td>
									<input type="checkbox" id="ck_all" value="전체선택">
									<span style="background-color:white; border:none; font-size: 16px; font-weight: bold;">전체선택</span>
								</td>
							</tr><br><br><br>
							
							<tr>
								<td>
									<a href="/bookmall/order1.do" style="font-size:15px; float: right; color:red;">주문하기</a> 
									<a href="/bookmall/main.do" style="font-size:15px;float: left;"><< 쇼핑 계속하기</a>
								</td>
							</tr>
					</div>
					<form name="df" action="cartDel">
						<input type="hidden" name="cartNum">
					</form>
			</div>
		</div>
	</div>
	</div>
	<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>
</html>
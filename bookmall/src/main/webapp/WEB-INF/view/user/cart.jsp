<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
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
<style>
.containel {
	width: 100vw;
	height: 100vh;
}
</style>
</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/view/include/header.jsp"%>
		<div class="sub">
			<div class="sub_visual">
				<div class="slogan">장바구니</div>
				<br> <br>
				<div class="container">
					<div class="size">
						<div class="box">
							<p class="title">
							<div class="container">
								<div class="row">
									<table width="100%">
										<tr>
											<td align="left"><a href="deleteCart.jsp?cartIdcartId"
												class="btn btn-danger" style="font-size: 16px; color: red;">삭제하기</a></td>
											<td align="right"><a href="/bookmall/order1.do"
												class="btn btn-success"
												style="font-size: 16px; color: green;  padding: 5px;">주문하기</a></td>
										</tr>
									</table>
								</div>
								<div style="padding-top: 50px">
									<table class="table table-hover">
										<tr>
											<th>상품</th>
											<th>가격</th>
											<th>수량</th>
											<th>소계</th>
											<th>비고</th>
										</tr>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td><a href="removeCart.jsp?id=product.getProductId"
												class="badge badge-danger">삭제</a></td>
										</tr>
										<tr>
											<th></th>
											<th></th>
											<th>총액</th>
											<th></th>
											<th></th>
										</tr>
									</table>
									<a href="products.jsp" class="btn btn-secondary"> &laquo;
										쇼핑계속하기</a>
								</div>
								<hr>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>
</html>
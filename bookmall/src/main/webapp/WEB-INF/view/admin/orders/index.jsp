<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<link rel="stylesheet" href="/bookmall/css/orders.css" />
<link rel="stylesheet" href="/bookmall/css/com.css" />
<link rel="stylesheet" href="/bookmall/css/admin.css" />

<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>

<script src="/bookmall/js/common.js"></script>


<script>
function getDateStr(myDate){
	var year = myDate.getFullYear();
	var month = (myDate.getMonth() + 1);
	var day = myDate.getDate();
	
	Month = (Month < 10) ? "0" + String(Month) : Month;
	Day = (Day < 10) ? "0" + String(Day) : Day;
	
	return  year + '-' + month + '-' + day );
}

function today() {
	  var d = new Date();
	  return getDateStr(d);
	}
	
function lastWeek() {
	  var d = new Date();
	  var dayOfMonth = d.getDate();
	  d.setDate(dayOfMonth - 7);
	  return getDateStr(d);
	}

function lastMonth() {
	  var d = new Date();
	  var monthOfYear = d.getMonth();
	  d.setMonth(monthOfYear - 1);
	  return getDateStr(d);
	}
	
$(document).ready(function(){
	console.log(today());
	console.log(lastWeek());
	console.log(lastMonth());
});	

</script>

<script>
function checkAll(){
	if ($("#allChk").prop('checked')) {
		$("input[name='check']").each(function(idx){
			$("input[name='check']").eq(idx).prop("checked",true);
		})
	} else {
		$("input[name='check']").each(function(idx){
			$("input[name='check']").eq(idx).prop("checked",false);
		})
	}
}

</script>

</head>
<body> 
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<!-- E N D :: headerArea-->
		 
		<!-- S T A R T :: containerArea--> 
		<div id="container" align="center">
			<div id="content">
				<div class="con_tit" align="left">
					<h2>전체주문목록</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
						<form name="searchForm" id="searchForm" action="index.do"  method="get">
						<input type="hidden" name="numchoose" id="numchoose" value="${ordersAdminVo.numchoose }" >
							<table width="100%" hight="50px" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col width="300px" />
									<col width="auto" />
								</colgroup>
								<thead>
									<tr>
										<th scope="row">검색어</th>
										<td style="background-color:#fff; border-bottom: 1px solid #cccdd0;">
										<select name="stype" id="selectinquiry" title="검색을 선택해주세요" style="width: 100px; height: 25px;">
											<option value="" >전체</option>
											<option value="orderno" <c:if test="${param.searchType=='orderno'}">selected</c:if>>주문번호</option>
											<option value="name" <c:if test="${param.searchType=='name'}">selected</c:if>>주문자명</option>
											<option value="btitle_first" <c:if test="${param.searchType=='btitle_first'}">selected</c:if>>주문상품</option>
										</select>
										<input type="text" name="searchWord" value="${param.searchWord }" title="검색할 내용을 입력해주세요" />
										</td>
									</tr>
									<tr>
										<th scope="row">주문상태</th>
										<td style="background-color:#fff; border-bottom: 1px solid #cccdd0;"  >
											<input name="searchState" type="radio" value="1" <c:if test="${param.searchState==1}">checked="checked"</c:if>/>입금대기
											<input name="searchState" type="radio" value="2" <c:if test="${param.searchState==2}">checked="checked"</c:if>/>결제완료
											<input name="searchState" type="radio" value="3" <c:if test="${param.searchState==3}">checked="checked"</c:if>/>상품준비중
											<input name="searchState" type="radio" value="4" <c:if test="${param.searchState==4}">checked="checked"</c:if>/>출고완료
											<input name="searchState" type="radio" value="5" <c:if test="${param.searchState==5}">checked="checked"</c:if>/>배송중
											<input name="searchState" type="radio" value="6" <c:if test="${param.searchState==6}">checked="checked"</c:if>/>배송완료
											<input name="searchState" type="radio" value="7" <c:if test="${param.searchState==7}">checked="checked"</c:if>/>주문취소요청
											<input name="searchState" type="radio" value="8" <c:if test="${param.searchState==8}">checked="checked"</c:if>/>주문취소완료
											<input name="searchState" type="radio" value="9" <c:if test="${param.searchState==9}">checked="checked"</c:if>/>교환요청
											<input name="searchState" type="radio" value="10" <c:if test="${param.searchState==10}">checked="checked"</c:if>/>교환완료
											<input name="searchState" type="radio" value="11" <c:if test="${param.searchState==11}">checked="checked"</c:if>/>반품신청
											<input name="searchState" type="radio" value="12" <c:if test="${param.searchState==12}">checked="checked"</c:if>/>반품완료
											<input name="searchState" type="radio" value="13" <c:if test="${param.searchState==13}">checked="checked"</c:if>/>환불신청
											<input name="searchState" type="radio" value="14" <c:if test="${param.searchState==14}">checked="checked"</c:if>/>환불완료
										</td>
									</tr>
									<tr>
										<th scope="row">기간</th>
										<td style="background-color:#fff; border-bottom: 1px solid #cccdd0;">
											<div>
												<button>
													<span
														style="display: block; background-color: white; width: 70px; height: 30px; line-height: 30px; cursor: pointer;">최근1주일</span>
												</button>
												<button>
													<span
														style="display: block; background-color: white; width: 70px; height: 30px; line-height: 30px; cursor: pointer;">1개월</span>
												</button>
												<button>
													<span
														style="display: block; background-color: white; width: 70px; height: 30px; line-height: 30px; cursor: pointer;">3개월</span>
												</button>
												<button>
													<span
														style="display: block; background-color: white; width: 70px; height: 30px; line-height: 30px; cursor: pointer;">6개월</span>
												</button>
												&nbsp;&nbsp;
							
							
												<%-- 검색 시작날짜선택 --%>
												<input id="startDate" type="date"
													style="background-color: #ffffff; color: #808080; width: 160px; font-size: 15px; line-height: 30px;">
												~
												<%-- 검색 마지막날짜선택 --%>
												<input id="endDate" type="date"
													style="background-color: #ffffff; color: #808080; width: 160px; font-size: 15px; line-height: 30px;"><br>
												<br>
											</div>	
										</td>
									</tr>
									<tr>
										<th scope="row">결제방법</th>
										<td style="background-color:#fff; border-bottom: 1px solid #cccdd0;" >
											<input name="searchPay" type="radio" value="1" <c:if test="${param.searchPay=='무통장입금'}">checked="checked"</c:if>/>무통장입금
											<input name="searchPay" type="radio" value="2"<c:if test="${param.searchPay=='신용카드'}">checked="checked"</c:if>/>신용카드
										</td>
									</tr>
								</thead>
						</table>
						<br><br>
						<div class="obtn" style="text-align: content;">
							<input type="submit" value="검색" style=" width:100px; height:32px; ">
							<input type="submit" value="초기화" style=" width:100px; height:32px; ">
						</div>
						</form>
						<br><br>
						<p align="left"><span><strong>총 ${totCount }</strong>  |  ${ordersAdminVo.page }/${totPage }페이지</span>
							<span style="text-align:right;float:right">
								<select id="numsel" onchange="$('#numchoose').val($('#numsel').val());$('#searchForm').submit();">
									<option value="10" <c:if test="${10 == ordersAdminVo.numchoose}">selected</c:if>>10개씩</option>
									<option value="20" <c:if test="${20 == ordersAdminVo.numchoose}">selected</c:if>>20개씩</option>
									<option value="30" <c:if test="${30 == ordersAdminVo.numchoose}">selected</c:if>>30개씩</option>
								</select>
							</span>
						</p>
							
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w10" />
									<col class="w10" />
									<col class="w20" />
									<col class="w10" />
									<col class="w10" />
									<col class="w10" />
									<col class="w10" />
									<col class="w10" />
									<col class="" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">주문번호</th>
										<th scope="col">주문일</th> 
										<th scope="col">상품명</th> 
										<th scope="col">주문자명</th> 
										<th scope="col">주문금액</th> 
										<th scope="col">결제방법</th> 
										<th scope="col">주문상태</th> 
										<th scope="col">사유</th> 
										<th scope="col">적용</th> 
									</tr>
								</thead>
								<tbody>
								<c:if test="${empty  list}">
		                            <tr>
		                                <td class="first" colspan="8">조회된 주문이 없습니다.</td>
		                            </tr> 
		                        </c:if>
								<c:if test="${!empty  list}">
									<c:forEach items="${list }" var="vo" varStatus="status">
									<tr>
										<td>${vo.orderno }</td>
										<td class="date"><fmt:formatDate value="${vo.order_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td>${vo.btitle_first }<br>[${vo.btitle_second }]
										<td>${vo.name }</td>
										<td><fmt:formatNumber pattern="###,###,###" value="${vo.paid_amount }" />원</td>
										<c:if test="${vo.methodOfPayment eq '무통장입금'}">
											<td>${vo.methodOfPayment }</td>
										</c:if>
										<c:if test="${vo.methodOfPayment eq '신용카드'}">
											<td>${vo.methodOfPayment }(${vo.creditCard })</td>
										</c:if>
										<td>
										<form name="frm${status.index }" id="frm${status.index }" action="update.do" method="post">
											<input type="hidden" name="orderno" id="orderno" value="${vo.orderno }"/>
											<select name="status" id="status" style="width: 115px; height: 30px;">
												<option value="1" <c:if test="${vo.status=='1'}">selected</c:if>>입금대기</option>
												<option value="2" <c:if test="${vo.status=='2'}">selected</c:if>>결제완료</option>
												<option value="3" <c:if test="${vo.status=='3'}">selected</c:if>>상품준비중</option>
												<option value="4" <c:if test="${vo.status=='4'}">selected</c:if>>출고완료</option>
												<option value="5" <c:if test="${vo.status=='5'}">selected</c:if>>배송중</option>
												<option value="6" <c:if test="${vo.status=='6'}">selected</c:if>>배송완료</option>
												<option value="7" <c:if test="${vo.status=='7'}">selected</c:if>>주문취소요청</option>
												<option value="8" <c:if test="${vo.status=='8'}">selected</c:if>>주문취소완료</option>
												<option value="9" <c:if test="${vo.status=='9'}">selected</c:if>>교환요청</option>
												<option value="10" <c:if test="${vo.status=='10'}">selected</c:if>>교환완료</option>
												<option value="11" <c:if test="${vo.status=='11'}">selected</c:if>>반품신청</option>
												<option value="12" <c:if test="${vo.status=='12'}">selected</c:if>>반품완료</option>
												<option value="13" <c:if test="${vo.status=='13'}">selected</c:if>>환불신청</option>
												<option value="14" <c:if test="${vo.status=='14'}">selected</c:if>>환불완료</option>
											</select>
											</form>
										</td>
										<td>
											사유 : 
										</td>
										<td>
											<span style="display: block; background-color: white; width: 70px; height: 30px; line-height: 30px; cursor: pointer; align-content: center;" onclick="$('#frm${status.index }').submit();">적용</span>
										</td>
									</tr>
									</c:forEach>
								</c:if>	
								</tbody>
							</table>
							<br><br>
							
							
							<!-- 페이징 처리 -->
							${pageArea }
							<!-- //페이징 처리 -->
					</div>
				</div>
			</div>
		</div>	
		</div>
	</div>
</div>
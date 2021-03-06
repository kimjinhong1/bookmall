<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<link rel="stylesheet" href="/bookmall/css/orders.css" />
<link rel="stylesheet" href="/bookmall/css/admin/orders.css" />
<link rel="stylesheet" href="/bookmall/css/com.css" />
<link rel="stylesheet" href="/bookmall/css/admin.css" />

<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>

<script src="/bookmall/js/common.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment-with-locales.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/js/bootstrap-datetimepicker.min.js"></script>
<script>
	$(function() {
		$("#spreadBtn02").click(function() {
			if ($("#hiddenList01").is(":visible")) {
				$("#hiddenList01").slideUp();
			} else {
				$("#hiddenList01").slideDown();
			}
		});
		
		
		$(".date7").click(function() {
			var date = new Date();
	        var today = date.getFullYear() + "-" + ("0" + (date.getMonth()+1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
	        var date2 = date.getTime() - (7 * 24 * 60 * 60 * 1000);
            date.setTime(date2);
            var result = date.getFullYear() + "-" + ("0" + (date.getMonth()+1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
            $("#startDate").val(result);
            $("#endDate").val(today);
		})
		$(".dateM1").click(function() {
			var date = new Date();
	        var today = date.getFullYear() + "-" + ("0" + (date.getMonth()+1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
	        var date3 = date.getTime() - (30 * 24 * 60 * 60 * 1000);
            date.setTime(date3);
            var result = date.getFullYear() + "-" + ("0" + (date.getMonth()+1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
            $("#startDate").val(result);
            $("#endDate").val(today);
		})
		$(".dateM3").click(function() {
			var date = new Date();
	        var today = date.getFullYear() + "-" + ("0" + (date.getMonth()+1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
	        var date4 = date.getTime() - (60 * 24 * 60 * 60 * 1000);
            date.setTime(date4);
            var result = date.getFullYear() + "-" + ("0" + (date.getMonth()+1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
            $("#startDate").val(result);
            $("#endDate").val(today);
		})
		$(".dateM6").click(function() {
			var date = new Date();
	        var today = date.getFullYear() + "-" + ("0" + (date.getMonth()+1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
	        var date5 = date.getTime() - (180 * 24 * 60 * 60 * 1000);
            date.setTime(date5);
            var result = date.getFullYear() + "-" + ("0" + (date.getMonth()+1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
            $("#startDate").val(result);
            $("#endDate").val(today);
		})
	});
</script>

<script>
$(document).ready(function(){
    //btn_reset ??? ?????????????????? ??????
    $( "#btn_reset").click(function () {
        //$( "#searchForm" )[0].reset();
        $("#searchType").val("");
        $("#searchWord").val("");
        $("input[name='status']").eq(0).prop('checked',true);
        $("#startDate").val("");
        $("#endDate").val("");
        $("input[name='methodOfPayment']").eq(0).prop('checked',true);
    });
});
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
		<div id="container">
			<div id="content" align="center">
				<div class="con_tit" align="left">
					<h2>??????????????????</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- ?????? : s -->
					<div id="bbs">
						<div id="blist">
						<form name="searchForm" id="searchForm" action="index.do"  method="get">
						<input type="hidden" name="numchoose" id="numchoose" value="${ordersAdminVo.numchoose }" >
							<table>
								<colgroup>
									<col width="300px" />
									<col width="auto" />
								</colgroup>
								<thead>
									<tr>
										<th scope="row">?????????</th>
										<td>
										<select name="searchType" id="searchType" title="????????? ??????????????????">
											<option value="" selected>??????</option>
											<option value="a.orderno" <c:if test="${param.searchType=='a.orderno'}">selected</c:if>>????????????</option>
											<option value="name" <c:if test="${param.searchType=='name'}">selected</c:if>>????????????</option>
											<option value="bookname" <c:if test="${param.searchType=='bookname'}">selected</c:if>>???????????????</option>
										</select>
				 						<input type="text" name="searchWord" id="searchWord" value="${param.searchWord }" title="????????? ????????? ??????????????????" />
										</td>
									</tr>
									<tr>
										<th scope="row">????????????</th>
										<td>
											<input type="radio" name="status" value="" checked="checked" >??????
											<input type="radio" name="status" value="1" <c:if test="${param.status==1}">checked="checked"</c:if>/>????????????
											<input type="radio" name="status" value="2" <c:if test="${param.status==2}">checked="checked"</c:if>/>????????????
											<input type="radio" name="status" value="3" <c:if test="${param.status==3}">checked="checked"</c:if>/>???????????????
											<input type="radio" name="status" value="4" <c:if test="${param.status==4}">checked="checked"</c:if>/>????????????
											<input type="radio" name="status" value="5" <c:if test="${param.status==5}">checked="checked"</c:if>/>?????????
											<input type="radio" name="status" value="6" <c:if test="${param.status==6}">checked="checked"</c:if>/>????????????
											<input type="radio" name="status" value="7" <c:if test="${param.status==7}">checked="checked"</c:if>/>??????????????????
											<input type="radio" name="status" value="8" <c:if test="${param.status==8}">checked="checked"</c:if>/>??????????????????
											<input type="radio" name="status" value="9" <c:if test="${param.status==9}">checked="checked"</c:if>/>????????????
											<input type="radio" name="status" value="10" <c:if test="${param.status==10}">checked="checked"</c:if>/>????????????
											<input type="radio" name="status" value="11" <c:if test="${param.status==11}">checked="checked"</c:if>/>????????????
											<input type="radio" name="status" value="12" <c:if test="${param.status==12}">checked="checked"</c:if>/>????????????
											<input type="radio" name="status" value="13" <c:if test="${param.status==13}">checked="checked"</c:if>/>????????????
											<input type="radio" name="status" value="14" <c:if test="${param.status==14}">checked="checked"</c:if>/>????????????
										</td>
									</tr>
									<tr>
										<th scope="row">??????</th>
										<td>
											<div class="underClendar">
												<input type="button" name="order_date" class="date7" value="??????1??????">
												<input type="button" name="order_date" class="dateM1" value="?????? 1??????">
												<input type="button" name="order_date" class="dateM3" value="?????? 3??????">
												<input type="button" name="order_date" class="dateM6" value="?????? 6??????">
												&nbsp;&nbsp;
												<%-- ?????? ?????????????????? --%> 
												<input id="startDate" name="startDate" id="startDate" type="date" value="${param.startDate }">
												 ~ 
												<%-- ?????? ????????????????????? --%>
												<input id="endDate" name="endDate" id="endDate" type="date" value="${param.endDate }">
											 </div>
										</td>
									</tr>
									<tr>
										<th scope="row">????????????</th>
										<td>
											<input type="radio" name="methodOfPayment" value="" checked="checked" />??????
											<input type="radio" name="methodOfPayment" value="???????????????" <c:if test="${param.methodOfPayment=='???????????????'}">checked="checked"</c:if>/>???????????????
											<input type="radio" name="methodOfPayment" value="????????????" <c:if test="${param.methodOfPayment=='????????????'}">checked="checked"</c:if>/>????????????
										</td>
									</tr>
								</thead>
							</table>
							<br><br>
							<div class="obtn">
								<input type="submit" value="??????" >
								<input type="button" id="btn_reset" value="?????????" >
							</div>
						</form>
						<br><br>
						<p align="left"><span><strong>??? ${totCount }</strong>  |  ${ordersAdminVo.page }/${totPage }?????????</span>
							<span style="text-align:right; float:right"> 
								<select id="numsel" onchange="$('#numchoose').val($('#numsel').val());$('#searchForm').submit();">
									<option value="10" <c:if test="${10 == ordersAdminVo.numchoose}">selected</c:if>>10??????</option>
									<option value="20" <c:if test="${20 == ordersAdminVo.numchoose}">selected</c:if>>20??????</option>
									<option value="30" <c:if test="${30 == ordersAdminVo.numchoose}">selected</c:if>>30??????</option>
								</select>
							</span>
						</p>
						<table summary="????????? ?????????????????????.">
							<colgroup>
								<col class="w8" />
								<col class="w10" />
								<col class="w15" />
								<col class="w10" />
								<col class="w10" />
								<col class="w10" />
								<col class="w12" />
								<col class="w30" />
								<col class="" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">????????????</th>
									<th scope="col">?????????</th> 
									<th scope="col">???????????????</th> 
									<th scope="col">????????????</th> 
									<th scope="col">????????????</th> 
									<th scope="col">????????????</th> 
									<th scope="col">????????????</th> 
									<th scope="col">??????</th> 
									<th scope="col">??????</th> 
								</tr>
							</thead>
							<tbody>
							<c:if test="${empty  list}">
	                            <tr>
	                                <td class="first" colspan="9">????????? ????????? ????????????.</td>
	                            </tr> 
	                        </c:if>
							<c:if test="${!empty  list}">
								<c:forEach items="${list }" var="vo" varStatus="status">
								<tr>
									<td>${vo.orderno }</td>
									<td class="date"><fmt:formatDate value="${vo.order_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td>${vo.bookname }
									<td>${vo.name }</td>
									<td><fmt:formatNumber pattern="###,###,###" value="${vo.paid_amount }" />???</td>
									<td>
									<c:if test="${vo.methodOfPayment eq '???????????????'}">
										${vo.methodOfPayment }
									</c:if>
									<c:if test="${vo.methodOfPayment eq '????????????'}">
										${vo.methodOfPayment }(${vo.creditCard })
									</c:if>
									</td>
									<td>
									<form name="frm${status.index }" id="frm${status.index }" action="update.do" method="post">
										<input type="hidden" name="orderno" id="orderno" value="${vo.orderno }"/>
										<select name="status" id="status" style="width: 115px; height: 30px;">
											<option value="1" <c:if test="${vo.status=='1'}">selected</c:if>>????????????</option>
											<option value="2" <c:if test="${vo.status=='2'}">selected</c:if>>????????????</option>
											<option value="3" <c:if test="${vo.status=='3'}">selected</c:if>>???????????????</option>
											<option value="4" <c:if test="${vo.status=='4'}">selected</c:if>>????????????</option>
											<option value="5" <c:if test="${vo.status=='5'}">selected</c:if>>?????????</option>
											<option value="6" <c:if test="${vo.status=='6'}">selected</c:if>>????????????</option>
											<option value="7" <c:if test="${vo.status=='7'}">selected</c:if>>??????????????????</option>
											<option value="8" <c:if test="${vo.status=='8'}">selected</c:if>>??????????????????</option>
											<option value="9" <c:if test="${vo.status=='9'}">selected</c:if>>????????????</option>
											<option value="10" <c:if test="${vo.status=='10'}">selected</c:if>>????????????</option>
											<option value="11" <c:if test="${vo.status=='11'}">selected</c:if>>????????????</option>
											<option value="12" <c:if test="${vo.status=='12'}">selected</c:if>>????????????</option>
											<option value="13" <c:if test="${vo.status=='13'}">selected</c:if>>????????????</option>
											<option value="14" <c:if test="${vo.status=='14'}">selected</c:if>>????????????</option>
										</select>
										</form>
									</td>
									<td>
										<p>${vo.reason }</p> 
									</td>
									<td class="Sbtn">
										<span onclick="$('#frm${status.index }').submit();">??????</span>
									</td>
								</tr>
								</c:forEach>
							</c:if>	
							</tbody>
						</table>
						<br><br>
						<!-- ????????? ?????? -->
						${pageArea }
						<!-- //????????? ?????? -->
						</div>
					</div>
				</div>
			</div>	
		</div>
	</div>
</div>
</body>
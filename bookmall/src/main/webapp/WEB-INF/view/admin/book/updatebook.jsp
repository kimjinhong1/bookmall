<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" /> 
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="http://code.jquery.com/jquery-1.12.4.js"></script>

<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
	var oEditors = [];
	var oEditors2 = [];
	
	$(function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "bintroduce", // textarea ID
			sSkinURI: "../../smarteditor/SmartEditor2Skin.html",	
			htParams : {
				bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				fOnBeforeUnload : function(){
					
				}
			}, //boolean
			fOnAppLoad : function(){
				//예제 코드
				//oEditors.getById["bintroduce"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
			},
			fCreator: "createSEditor2"
		});
		
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors2,
			elPlaceHolder: "bindex", // textarea ID
			sSkinURI: "../../smarteditor/SmartEditor2Skin.html",	
			htParams : {
				bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				fOnBeforeUnload : function(){
					
				}
			}, //boolean
			fOnAppLoad : function(){
			},
			fCreator: "createSEditor2"
		});
	});
	
	
</script>
<script>
	$(function(){
		
		$("#hide").hide();
		
		$("#isbnCheckBtn").click(function(){
			
			
		});
		
		$('#selectDiscountrate').change(function(){
			   $("#selectDiscountrate option:selected").each(function () {
					
					if($(this).val()== '101') {                       //직접입력일 경우
						 $("#discountrate").val('');                 //값 초기화
						 $("#discountrate").attr("disabled", false); //활성화
					} else { 										//직접입력이 아닐경우
						 
						 $("#discountrate").val(($(this).text()).replace("%", ''));//선택값 입력
						 $("#discountrate").attr("disabled", true); //비활성화
					}

					if($("#price") != '') {
						$("#salesprice").val($("#price").val() * ((100 - $("#discountrate").val()) / 100));
					}
			   });
		});
		
		$('#price').change(function() {
			if($("#discountrate") != '') {
				$("#salesprice").val($("#price").val() * ((100 - $("#discountrate").val()) / 100));
			} else {
				$("#salesprice").val('0');
			}
		})
		
		$('#discountrate').change(function() {
			if($("#price") != '') {
				$("#salesprice").val($("#price").val() * ((100 - $("#discountrate").val()) / 100));
			} else {
				$("#salesprice").val('0');
			}
		})
		
		$('#classify0').click(function() {
			$("#hide").show();
		});
		
		$('#classify1').click(function() {
			$("#translator").val('');
			$("#hide").hide();
		});
		
	})
	
</script>

<script>
	function goSave() {
		
		if ($("#isbn").val().trim() == "") {
			alert('isbn 번호를 입력해 주세요');
			$("#isbn").focus();
			return;
		} 
		
		if(isNaN("#isbn") == false) {
			alert('숫자만 입력해주세요.');
			$("#isbn").focus();
			return;
		} 
		
		var con = true;
		
/* 		$.ajax({
			url : 'isbnCheck.do',
			data : {
				isbn: $("#isbn").val()
			},
			async: false,
			success: function(res) {
				if (res.trim() == '1') {  //0이 나오는건 필요없음
					alert('이미 등록된 도서입니다. isbn 번호를 다시 확인해주세요.');
					$("#isbn").val("");
					$("#isbn").focus();
					con = false;
				}
			}
		}) */
		
		if (con == false) 
			return;
		
	 	oEditors.getById["bintroduce"].exec("UPDATE_CONTENTS_FIELD", []); 
		oEditors2.getById["bindex"].exec("UPDATE_CONTENTS_FIELD", []);  
		$("#frm").submit();
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
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>도서관리 - [도서 수정]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<form name="frm" id="frm" action="edit.do" method="post" enctype="multipart/form-data">
					<input type="hidden" name="bookno" value="${data.bookno }">
					<table class="book_insert" style="width: 100%; text-align: left;">
					<tbody>
						<tr>
							<th><small class="star">*</small> ISBN13</th>
                            <td>
                                <input type="text" name="isbn" id="isbn" class="inNextBtn" style="float:left; width: 300px;" maxlength="13" value="${data.isbn }" readonly> 
                            </td>
						</tr>
						<tr>
                            <th><small class="star">*</small> 도서명 </th>
                            <td>
                            	<input type="text" name="btitle_first" id="btitle_first" style="float:left; width: 200px; padding-top: 5px;" maxlength="50" value="${data.btitle_first }">
                            	<input type="text" name="btitle_second" id="btitle_second" style="float:left; width: 200px; padding-top: 5px;" maxlength="50" value="${data.btitle_second }">
                            </td>
                        </tr>
                        <tr>
                            <th><small class="star">*</small> 저자 </th>
                            <td>
                            	<input type="text" name="author" id="author" style="float:left; width: 200px; padding-top: 5px;" maxlength="20" value="${data.author }" placeholder="저자를 입력해주세요"> 
                            </td>
                        </tr>
                        <tr>
                            <th><small class="star">*</small> 출판사 </th>
                            <td>
                            	<input type="text" name="publisher" id="publisher" style="float:left; width: 200px; padding-top: 5px;" maxlength="20" value="${data.publisher }" placeholder="출판사를 입력해주세요"> 
                            </td>
                        </tr>
                        <tr>
                            <th><small class="star">*</small> 출간일 </th>
                            <td>
                            	<input type="text" name="pubdate" id="pubdate" style="float:left; width: 200px; padding-top: 5px;" maxlength="20" value="${data.pubdate }" placeholder="출간일을 선택해주세요.">
                            </td>
                        </tr>
                        <tr>
                            <th><small class="star">*</small> 가격 </th>
                            <td>
                            	<input type="text" name="price" id="price" style="float:left; width: 200px; padding-top: 5px;" maxlength="20" value="${data.price }" placeholder="가격을 입력해주세요.">
                            </td>
                        </tr>
                        <tr>
                            <th><small class="star">*</small> 할인율 </th>
                            <td>
                            	<input type="number" name="discountrate" id="discountrate" style="float:left; width: 200px; padding-top: 5px;" min="0" max="100" maxlength="15" placeholder="할인율을 입력해주세요." value="${data.discountrate }"> 
                            	<select style="width: 100px; margin-right: 10px" name="selectDiscountrate" id="selectDiscountrate">
									 <option value="101" selected>직접입력</option>
									 <option value="0">0%</option>
									 <option value="5">5%</option>
									 <option value="10">10%</option>
									 <option value="10">20%</option>
									 <option value="10">30%</option>
								</select> 
                            </td>
                        </tr>
                        <tr>
                            <th><small class="star">*</small> 판매가 </th>
                            <td>
                            	<input type="text" name="salesprice" id="salesprice" value="${data.salesprice }"style="float:left; width: 200px; padding-top: 5px;" maxlength="20" readonly>원 
                            </td>
                        </tr>
                        <tr>
                            <th><small class="star">*</small> 도서분류 </th>
                            <td>
                            	<div>&nbsp;
                            	<input type="radio" name="classify" id="classify0" <c:if test="${data.classify eq 0}"> checked="checked" </c:if> value="0" >&nbsp;
                            		<span style="font-size: 16px; color:#000000;">국내도서</span>
                            	&nbsp;&nbsp;&nbsp;
                            	<input type="radio" name="classify" id="classify1" <c:if test="${data.classify eq 1}"> checked="checked" </c:if> value="1" >&nbsp;
                            		<span style="font-size: 16px; color:#000000;">국외도서</span>
                            	</div>
                            </td>
                        </tr>
                        <tr class="hide" id="hide"> <!-- 처음에 숨김 -->
                            <th><small class="star">*</small> 번역가 </th>
                            <td>
                                <input type="text" name="translator" id="translator" class="inNextBtn" style="float: left; width: 200px; padding-top: 5px;" value="${data.translator }" placeholder="번역한 이를 입력해주세요.">
                            </td>
                        </tr>
                        <tr>
                            <th><small class="star">*</small> 카테고리 </th>
                            <td>
                                
                            </td>
                        </tr>
                        <tr>
                            <th><small class="star">*</small> 페이지 수 </th>
                            <td>
                            	<input type="text" name="bpages" id="bpages" style="float:left; width: 200px; padding-top: 5px;" maxlength="20" value="${data.bpages }"placeholder="페이지를 입력해주세요.">(쪽) 
                            </td>
                        </tr>
                        <tr>
                            <th><small class="star">*</small> 무게 </th>
                            <td>
                            	<input type="text" name="bweight" id="bweight" style="float:left; width: 200px; padding-top: 5px;" maxlength="20" value="${data.bweight }"placeholder="무게를 입력해주세요.">(g) 
                            </td>
                        </tr>
                        <tr>
                            <th><small class="star">*</small> 크기 </th>
                            <td>
                            	<input type="text" name="bwidth" id="bwidth" style="float: left; padding-top: 5px;" maxlength="5" value="${data.bwidth }"placeholder="가로">
                            	<input type="text" name="bvertical" id="bvertical" style="float: left; padding-top: 5px;" maxlength="5" value="${data.bvertical }"placeholder="세로">
                            	<input type="text" name="bheight" id="bheight" style="float: left; padding-top: 5px;" maxlength="5" value="${data.bheight }"placeholder="높이">(mm) 
                            </td>
                        </tr>
                        <tr>
                            <th><small class="star">*</small> 재고 </th>
                            <td>
                            	<input type="text" name="bstack" id="bstack" style="float:left; padding-top: 5px;" maxlength="20" value="${data.bstack }"placeholder="재고를 입력해주세요."> 
                            </td>
                        </tr>
                        <tr>
							<th scope="row">
								<label for="">*도서 소개</label>
							</th>
							<td colspan="30">
								<textarea id="bintroduce" name="bintroduce" title="내용을 입력해주세요" style="width: 100%;">${data.bintroduce }</textarea>	
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="">*도서 목차</label></th>
							<td colspan="30">
								<textarea id="bindex" name="bindex" title="내용을 입력해주세요" style="width: 100%;">${data.bindex }</textarea>	
							</td>
						</tr>
						<tr>
							<th><small class="star">*</small> 썸네일 등록 </th>
							<td colspan="10">
								<input type="file" id="bthumb_org" name="bthumb_org_file" class="w100" title="첨부파일을 업로드 해주세요." />${data.bthumb_org }	
							</td>
						</tr>
					</tbody>
					</table>
					</form>
					<div class="btn">
						<div class="btnLeft" style="float: right; padding-top: 10px;">
							<a href="javascript:;" class="btns" onclick="goSave();"><strong>수정</strong></a>
							<a class="btns" href="javascript:window.history.back();"><strong>취소</strong></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
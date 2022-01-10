<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="/project/smarteditor/js/HuskyEZCreator.js"></script>
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script>
	var oEditors = [];
$(function() {
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "contents", // textarea ID
		sSkinURI: "<%=request.getContextPath()%>/smarteditor/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			fOnBeforeUnload : function(){
				
			}
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["contents"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});
	
	$.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년'
    });
   $( "#inputDate").datepicker();

});

function goSave() {
	if ($("#title").val() == '') {
		alert("제목을 입력하세요");
		$("#title").focus();
		return;
	}
	
	//console.log($("input[name='checkDate']:checked").val());
	if ($("input[name='checkDate']:checked").val()=='2') {
		if ($("#inputDate").val()==''){
			alert('일자를 입력하세요');
			return false;
		} else {
			$("#sendDate").val($("#inputDate").val()+" " + $("#hour").val() +":"+$("#minute").val()+":00");
		}
	} else {
		$("#sendDate").val('');
	}
	console.log($("#sendDate").val());
	
	oEditors.getById['contents'].exec("UPDATE_CONTENTS_FIELD",[]);
	$("#insertFrm").submit();
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
					<h2>공지사항 관리 [글작성]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="insertFrm" action="insert.do" enctype="multipart/form-data">
							<input type="hidden" name="sendDate" id="sendDate">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="10%" />
									<col width="15%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<col width="15%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">*제목</label></th>
										<td colspan="10">
											<input type="text" id="title" name="title" class="w100" title="제목을 입력해주세요" />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*게시일</label></th>
										<td colspan="10">
											<input type="radio" name="checkDate" value="1" checked onclick="$('#regdateArea').hide();">즉시
											<input type="radio" name="checkDate" value="2" onclick="$('#regdateArea').show();">설정
											<span id="regdateArea" style="display:none;">
												<input type="text" name="inputDate" id="inputDate" style="width:80px;" autocomplete="off">
												<select name="hour" id="hour">
												<% 
													for (int i=0; i<24; i++){
														String hour = "";
														if (i < 10) {
															hour = "0"+i;
														} else {
															hour = i+"";
														}
												%>
													<option value="<%=hour%>"><%=hour%></option>
												<% } %>
												</select> 시 
												<select name="minute" id="minute">
													<option value="00">00</option>
													<option value="10">10</option>
													<option value="20">20</option>
													<option value="30">30</option>
													<option value="40">40</option>
													<option value="50">50</option>
												</select> 분 
											</span>
										</td>
									</tr>									
									<tr>
										<th scope="row"><label for="">*내용</label></th>
										<td colspan="10">
											<textarea id="contents" name="content" title="내용을 입력해주세요" style="width:100%;"></textarea>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">첨부파일</label></th>
										<td colspan="10">
											<input type="file" id="file" name="file" class="w100" title="첨부파일을 업로드 해주세요." />	
										</td>
									</tr>
								</tbody>
							</table>
							<input type="hidden" name="cmd" value="write" />
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="index.do"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" href="javascript:goSave();" style="cursor:pointer;"><strong>저장</strong></a>
								</div>
							</div>
							<!--//btn-->
						</div>
						<!-- //bread -->
					</div>
					<!-- //bbs --> 
					<!-- 내용 : e -->
				</div>
				<!--//con -->
			</div>
			<!--//content -->
		</div>
		<!--//container --> 
		<!-- E N D :: containerArea-->
	</div>
	<!--//canvas -->
</div>
<!--//wrap -->

</body>
</html>
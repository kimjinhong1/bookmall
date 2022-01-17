<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="/project/smarteditor/js/HuskyEZCreator.js"></script>
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
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
});

function goSave() {
	if ($("#title").val() == '') {
		alert("제목을 입력하세요");
		$("#title").focus();
		return;
	}
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
					<h2>수다게시판 관리 [수정]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="insertFrm" action="update.do" enctype="multipart/form-data">
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
										<th scope="row"><label for="">*제목 </label></th>
										<td colspan="10">
											<input type="text" id="title" name="title" class="w100" title="제목을 입력해주세요" value="${data.title }"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*TOP 공지</label></th>
										<td colspan="2">
											<input type="radio" name="top_notice" value="1" <c:if test="${data.top_notice == 1 }">checked</c:if>>공지
											<input type="radio" name="top_notice" value="0" <c:if test="${data.top_notice == 0 }">checked</c:if>>공지안함 
										</td>
										<th scope="row"><label for="">*NEW 아이콘</label></th>
										<td colspan="2">
											<input type="radio" name="new_icon" value="1" <c:if test="${data.new_icon == 1 }">checked</c:if>>항상&nbsp;&nbsp;
											<input type="radio" name="new_icon" value="2" <c:if test="${data.new_icon == 2 }">checked</c:if>>7일 &nbsp;&nbsp;
											<input type="radio" name="new_icon" value="3" <c:if test="${data.new_icon == 3 }">checked</c:if>>표기안함 
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*공개 여부</label></th>
										<td colspan="5">  
											<input type="radio" name="secret" value="1" <c:if test="${data.secret == 1 }">checked</c:if>>공개 
											<input type="radio" name="secret" value="2" <c:if test="${data.secret == 2 }">checked</c:if>>비공개 
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*내용</label></th>
										<td colspan="6">
											<textarea id="contents" name="content" title="내용을 입력해주세요" style="width:100%;">${data.content}</textarea>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">첨부파일</label></th>
										<td colspan="6">
											<input type="file" id="file" name="file" class="w100" title="첨부파일을 업로드 해주세요." />	
										</td>
									</tr>
								</tbody>
							</table>
							<input type="hidden" name="no" value="${data.no}" />
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="index.do"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" href="javascript:goSave();" style="cursor:pointer;"><strong>수정</strong></a>
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
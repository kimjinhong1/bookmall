<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>1:1문의게시판</title>
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="/bookmall/css/reset.css"/>
<link rel="stylesheet" href="/bookmall/css/com.css"/>
<link rel="stylesheet" href="/bookmall/css/common.css"/>
<link rel="stylesheet" href="/bookmall/css/contents.css"/>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="/project/js/common.js"></script>
<script>
function goDelete(){
	if (confirm('문의를 취소하시겠습니까?')) {
		location.href='askdelete.do?askno=${askdata.askno }';
	}
}

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
	<div class="wrap">
		<%@ include file="/WEB-INF/view/include/header.jsp"%>
		<div class="sub">
			<div class="size">
				<h3 class="sub_title">1:1문의내용</h3>
				<div class="bbs">
					<div class="view" >
						<div class="title">
							<dl>
								<dt> [${askuser.subject }]   ${askuser.title }</dt>
								<dd class="date">작성일 : ${askuser.regdate }</dd>
							</dl>
						</div>
						<div class="content" style="font-size: 15px;">
							${askuser.content }
						</div>
						<dl class="file">
							<dt>첨부파일</dt>
							<dd>
								<a
									href="/bookmall/common/download.jsp?path=/upload/&org=${askuser.filename_org}&real=${askuser.filename_real}"
									target="_blank">${askuser.filename_org } </a>
							</dd>
							</dl>
					<hr color="#d3d3d3" width="100%">
					<div class="content" style="font-size: 15px;">
					<h1>답변</h1>
					${askuser.answer }
					</div>
					<hr color="#d3d3d3" width="100%">
						<div class="btnSet clear">
							<div class="fl_l">
								<a href="/bookmall/ask/askindex.do" class="btns">목록으로</a>&nbsp;&nbsp;&nbsp;
								<a class="btns" style="cursor:pointer;" href="javascript:goDelete();">문의삭제</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/view/include/footer.jsp"%>
	</div>
</body>
</html>
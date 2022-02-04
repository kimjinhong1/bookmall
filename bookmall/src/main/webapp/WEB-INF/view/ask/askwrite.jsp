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
<link rel="stylesheet" href="/bookmall/css/reset.css" />
<link rel="stylesheet" href="/bookmall/css/com.css" />
<link rel="stylesheet" href="/bookmall/css/contents.css" />
<link rel="stylesheet" href="/bookmall/css/ask.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script type="text/javascript"
	src="/bookmall/smarteditor/js/HuskyEZCreator.js"></script>
<script src="/bookmall/js/common.js"></script>
<script src="https://malsup.github.io/jquery.form.js"></script> 
<script>
	var oEditors;
	$(function() {
		oEditors = setEditor("content");
		/*
		$("#frm").ajaxForm({
			url: '/bookmall/ask/askinsert.do', //<<-- 처리 요청 URL
			success: function(result){ // 비동기요청  성공시
				alert('문의내용이 등록되었습니다.');
			}
		});*/
		
	});
	function goSave() {
		if ($("#selectinquiry").val() == '') {
				alert("문의종류를 선택하세요");
			return;
		}
		if($("#title").val() == '') {
				alert("제목을 입력하세요");
				$("#content").focus();
			return;
		}
		oEditors.getById['content'].exec("UPDATE_CONTENTS_FIELD",[]);
		console.log($("#content").val());
		if($("#content").val() == '<p>&nbsp;</p>') {
				alert("내용을 입력하세요");
				$("#content").focus();
				return;
		}
		$("#frm").submit();
	}

	
</script>

</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/view/include/header.jsp"%>
		<div class="sub">
			<div class="size">
				<h3 class="sub_title">1:1 문의하기</h3>
				<div class="bbs">
					<form method="post" name="frm" id="frm" action="askinsert.do"
						enctype="multipart/form-data">
						<table class="topselect"> <%-- FAQ 보기 --%> 
							<tbody>
								<tr>
									<th>잠깐! 문의하기전 FAQ를 확인해보세요.</th>
								</tr>
								<td>
								<details>
									<summary><b>[로그인]아이디와 비밀번호를 잊어버렸어요. 어떻게 찾을 수 있나요?</b></summary>
									<p><b>아이디 찾기</b></p>
									<p>회원 로그인 화면에서 [아이디 찾기]를 클릭 하여 간편찾기(이메일)를 통해 확인이 가능합니다.</p><br>
									<p><b>비밀번호 찾기</b></p>
									<p>회원 로그인 화면에서 [비밀번호 찾기]를 클릭 하여 아이디 와 가입 시 기입한 이메일 주소 또는 휴대폰번호를 입력 하여 임시비밀번호 발급이 가능합니다.
									위의 정보로 받을 수 없는 경우 본인인증 후 새 비밀번호로 변경해주세요.</p><br>
								</details>
								</td>
								<tr>
								</tr>
								<td>
								<details>
									<summary><b>[로그인]비밀번호 변경은 어떻게 하나요?</b></summary>
									<p>마이페이지 > 회원정보관리 > 비밀번호 입력 후 변경이 가능합니다. </p>
									<p>보안정책 강화로 인하여 영문 대/소문자가 구분됩니다.</p><br>
									<p><b>※유의사항※</b></p>
									<p>아이디 및 아이디를 포함한 문자/숫자는 비밀번호로 사용 불가</p>
									<p>특수문자는 !@#$%^&*()-_ 사용가능</p>
									<p>생년월일, 전화번호와 동일한 번호는 사용자제</p><br>
								</details>
								</td>
								<tr>
								</tr>
								<td>
								<details>
									<summary><b>[회원]네이버아이디로 가입은 어떻게 하나요?</b></summary>
									<p>로그인 화면에서 [네이버ID로 가입/로그인] 접속 후 </p>
									<p>아이디, 필수전화, 생년월일, 주소 기재 후 입력완료 후 회원가입이 완료됩니다</p><br>
								</details>
								</td>
								<tr>
								</tr>
								<td>
								<details>
									<summary><b>[주문]주문내역은 어디서 확인하나요?</b></summary>
									<p>마이페이지 > 최근주문내역에서 확인할 수 있습니다.</p><br>
								</details>
								</td>
								<tr>
								</tr>
								<td>
								<details>
									<summary><b>[반품]마음에 들지 않아 반품하는 경우는 어떻게 하나요?</b></summary>
									<p>로그인 > 마이페이지 > 반품/교환신청 및 조회 > 반품/교환신청하기 선택 > 반품선택  </p>
									<p> > [변심] 반품 항목선택 > 주문번호 조회 후 상품선택 > 회송정보 입력 후 확인 버튼을 선택하시면 됩니다. </p>
									<p>상품은 훼손되지 않도록 포장부탁드리며, 메모지에 반품 도서의 주문번호, 성함, 연락처를 기재하려 동봉 부탁 드립니다.</p><br>
								</details>
								</td>
							</tbody>
						</table>
						<br><br>
						<table class="board_write"> <%-- 문의사항 작성 --%>
							<tbody>
									<th>문의선택</th>
									<td><select name="subject" id="selectinquiry"
										style="width: 45%; height: 30px; float: left;">
											<option value="">문의종류를 선택하세요.</option>
											<option value="상품문의">상품문의</option>
											<option value="결제문의">결제문의</option>
											<option value="배송문의">배송문의</option>
											<option value="교환/반품문의">교환/반품문의</option>
											<option value="취소/환불문의">취소/환불문의</option>
											<option value="기타문의">기타문의</option>
									</select>${ask.subject}</td>
								</tr>
								<tr>
									<th>제목</th>
									<td><input type="text" name="title" id="title"
										class="wid100" value="${ask.title}" style="width: 100%;" /></td>
								</tr>
								<tr>
									<th>내용</th>
									<td><textarea name="content" id="content"
											style="width: 100%;">${ask.content}</textarea></td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td><input type="file" name="file"
										style="width: 50%; height: 50px; float: left;">
										<p class="menual">
											*첨부가능 용량은 파일당 5MB 미만이며, 최대 6개까지 가능합니다.<br> *첨부가능 파일 확장자
											: jpg, gif, bmp, png, hwp, doc, ppt, xls, zip, pdf, txt<br>
											*첨부파일 중 개인 정보가 포함되어있는 파일은 상담 완료 후 즉각 파기하며, 상담 외의 목적으로는 사용되지
											않습니다.
										</p></td>
								</tr>
							</tbody>
						</table>
					 <div class="btnSet"  style="text-align:center; font-size: 16px;">
                        <a id ="askbtn" href="javascript:goSave();;">등록</a>
                    </div>
					</form>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/view/include/footer.jsp"%>
	</div>
</body>
</html>
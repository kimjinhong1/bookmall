<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://code.jquery.com/jquery-1.12.4.js"></script>

<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp"%>
<script type="text/javascript">
	var oEditors = [];
	var oEditors2 = [];

	$(function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "bintroduce", // textarea ID
			sSkinURI : "../../smarteditor/SmartEditor2Skin.html",
			htParams : {
				bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				fOnBeforeUnload : function() {

				}
			}, //boolean
			fOnAppLoad : function() {
				//예제 코드
				//oEditors.getById["bintroduce"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
			},
			fCreator : "createSEditor2"
		});

		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors2,
			elPlaceHolder : "bindex", // textarea ID
			sSkinURI: "../../smarteditor/SmartEditor2Skin.html",
			htParams: {
				bUseToolbar: true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer: true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger: true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				fOnBeforeUnload: function() {
					
				}
			}, //boolean
			fOnAppLoad : function() {
			},
			fCreator : "createSEditor2"
		});
	});
</script>

<script type="text/javascript">
	$(function() {
		
		// 번역가는 처음에 숨김 처리
		$("#hide").hide();
		
		// 할인율 변경시 판매가격 변동 이벤트
		$('#selectDiscountrate').change(function() {
			$("#selectDiscountrate option:selected").each(function() {
				if ($(this).val() == '101') { //직접입력일 경우
						$("#discountrate").val(''); //값 초기화
						$("#discountrate").attr("disabled", false); //활성화
					} else { //직접입력이 아닐경우
						$("#discountrate").val(($(this).text()).replace("%",''));//선택값 입력
						$("#discountrate").attr("disabled", true); //비활성화
					}
				if ($("#price") != '') {
						$("#salesprice").val($("#price").val() * ((100 - $("#discountrate").val()) / 100));
					}
				});
		});
		
		// 가격 변경시 판매가격 변동 이벤트
		$('#price').change(function() {
			if ($("#discountrate") != '') {
					$("#salesprice").val($("#price").val() * ((100 - $("#discountrate").val()) / 100));
				} else {
					$("#salesprice").val('0');
				}
			})
		
		// 할인율 변경시 판매가격 변동
		$('#discountrate').change(function() {
			if ($("#price") != '') {
					$("#salesprice").val($("#price").val() * ((100 - $("#discountrate").val()) / 100));
				} else {
					$("#salesprice").val('0');
				}
			})
			
		// 국내/국외 도서(라디오 버튼) 클릭 시 변경 이벤트
		$('#classify0').click(function() {
			$("#hide").show();
			$("#selectClassify").val('0').prop("selected", true);
			changeClassify(0, null, null);
		});

		$('#classify1').click(function() {
			$("#translator").val('');
			$("#hide").hide();
			$("#selectClassify").val('1').prop("selected", true);
			changeClassify(1, null, null);
		});
		
 	 	$('#selectClassify').change(function() {
 	 		changeClassify($('#selectClassify').val(), null, null);
		});
 	 	
 	 	$('#selectCateList').change(function() {
 	 		
 	 		if($('#selectCateList').find('option:checked').val() == 0) {
				$('#selectChild').empty();
 	 			return false;
 	 		}
 	 		
 	 		changeCateList($('#selectClassify').val(), 
 	 						$('#selectCateList').find('option:checked').data('blevel'),
 	 						$('#selectCateList').find('option:checked').val()
 	 		);
 	 		
 	 	});
 	 	
 	 	
 	 	// 카테고리 추가 버튼 클릭 이벤트  
		$('#plusCateBtn').click(function(){
			
			// 카테고리를 4개 이상 추가 할 경우 
			if($('#categoryName').data('cateCnt') >= 3) {
				alert('카테고리는 최대 3개까지만 등록 가능합니다.');
				return false;
			} 
			
			var bcategoryno = $('#selectChild').find('option:checked').val();
			var isDupl = false;
			var catenoArrStr = '';
			
			// 카테고리 추가시 중복체크.
			$.each($('#categoryName').data('selectedCategory'), function(i, cateno) {
				catenoArrStr += cateno.bcategoryno + ',';
				if(cateno.bcategoryno == bcategoryno ) {
					isDupl = true;
				}
					
			});
			
			if(isDupl){
				alert('카테고리가 중복되었습니다.');
				return false;
			}
			
			var originCateNames = $('#categoryName').text();
			var cateName = $('#selectChild').find('option:checked').text();
			
			// 추가되어있는 카테고리가 있을 시에는 구분자 (,)를 주어서 가독성을 높임.
			if($('#categoryName').data('cateCnt') > 0) {
				cateName = ', ' + cateName;
			}
			else {
				originCateNames = '';
			}
			
			// 관리자가 확인 할 수 있게 카테고리 이름 추가
			$('#categoryName').text(originCateNames + cateName); 
			
			// 카테고리 추가한 갯수 확인
			$('#categoryName').data('cateCnt', ($('#categoryName').data('cateCnt') + 1)); 
			
			// 카테고리 넘버를 추가
			$('#categoryName').data('selectedCategory').push({    
				'bcategoryno': bcategoryno
			});
			
			// INSERT시 필요한 카테고리 번호를 배열로.
			catenoArrStr += bcategoryno;
			$('#categoryList').val(catenoArrStr);
			
			
			$('#selectCateList').find('option:checked').removeAttr('selected');
			$('#selectChild').empty();
		});
		
 	 	// 카테고리 초기화 버튼 이벤트
 	 	$('#delCateBtn').click(function() {
 	 		$('#categoryName').text('없음');
 	 		$('#categoryName').data('cateCnt', 0);
 	 		$('#categoryName').data('selectedCategory', []);
 	 	});
 	 	
 	 	// 카테고리 대분류 변경 이벤트
 	 	function changeClassify(bclassify, blevel, bcategoryno) {
 	 		
 	 		var param = {
 	 				'bclassify': bclassify,
 	 				'blevel': blevel,
 	 				'bcategoryno': bcategoryno
 	 				};

			$.ajax({
				url: 'selectCateList.do',
				method: 'GET',
				data : param,
		        dataType: 'json',
				async: false,
				success: function(res) {
					$('#selectCateList').empty();
					
					var html = '<option value="0">선택</option>';
					
					$.each(res, function(i, val) {
						html += '<option data-bclassify="' + val.bclassify + '" data-blevel="' + val.blevel + '" value="' + val.bcategoryno + '">' + val.bcategoryname + '</option>';
					});
					
					$('#selectCateList').append(html);
				}
			});
 	 	};
 	 	
 	 	// 카테고리 중분류 변경 이벤트
 	 	function changeCateList(bclassify, blevel, bcategoryno) {
 	 		var param = {
 	 				'bclassify': bclassify,
 	 				'blevel': blevel,
 	 				'bcategoryno': bcategoryno
 	 				};
 	 		$.ajax({
				url: 'selectCateList.do',
				method: 'GET',
				data : param,
		        dataType: 'json',
				async: false,
				success: function(res) {
					$('#selectChild').empty();
					var html = '';
					$.each(res, function(i, val) {
						html += '<option data-bclassify="' + val.bclassify + '" data-blevel="' + val.blevel + '" value="' + val.bcategoryno + '">' + val.bcategoryname + '</option>';
					});
					$('#selectChild').append(html);
				}
			});
 	 	}
 	 	
	})
</script>

<script>

	// 도서 등록시 절차
	function goSave() {

		if ($("#isbn").val().trim() == "") {
			alert('isbn 번호를 입력해 주세요');
			$("#isbn").focus();
			return;
		}

		if (isNaN("#isbn") == false) {
			alert('숫자만 입력해주세요.');
			$("#isbn").focus();
			return;
		}

		var con = true;
		
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
			<%@ include file="/WEB-INF/view/admin/include/top.jsp"%>
			<!-- E N D :: headerArea-->

			<!-- S T A R T :: containerArea-->
			<div id="container">
				<div id="content">
					<div class="con_tit">
						<h2>도서관리 - [도서 등록]</h2>
					</div>
					<!-- //con_tit -->
					<div class="con" >
						<form name="frm" id="frm" action="insert.do" method="post" enctype="multipart/form-data">
							<input type="hidden" value="" id="categoryList" name="categoryList">
							<table class="book_insert" style="width: 100%; text-align: left;">
								<tbody>
									<tr>
										<th><small class="star">*</small> ISBN13</th>
										<td><input type="text" name="isbn" id="isbn" class="inNextBtn" style="float: left; width: 300px;" maxlength="13" placeholder="ISBN번호를 13자리 입력해주세요.(숫자만)"></td>
									</tr>
									<tr>
										<th><small class="star">*</small> 도서명</th>
										<td><input type="text" name="btitle_first" id="btitle_first" style="float: left; width: 200px; padding-top: 5px;" maxlength="50" placeholder="대제목을 입력해주세요"> 
											<input type="text" name="btitle_second" id="btitle_second" style="float: left; width: 200px; padding-top: 5px;" maxlength="50" placeholder="소제목을 입력해주세요"></td>
									</tr>
									<tr>
										<th><small class="star">*</small> 저자</th>
										<td><input type="text" name="author" id="author" style="float: left; width: 200px; padding-top: 5px;" maxlength="20" placeholder="저자를 입력해주세요">
										</td>
									</tr>
									<tr>
										<th><small class="star">*</small> 출판사</th>
										<td><input type="text" name="publisher" id="publisher" style="float: left; width: 200px; padding-top: 5px;" maxlength="20" placeholder="출판사를 입력해주세요">
										</td>
									</tr>
									<tr>
										<th><small class="star">*</small> 출간일</th>
										<td><input type="text" name="pubdate" id="pubdate" style="float: left; width: 200px; padding-top: 5px;" maxlength="20" placeholder="출간일을 선택해주세요."></td>
									</tr>
									<tr>
										<th><small class="star">*</small> 가격</th>
										<td><input type="text" name="price" id="price" style="float: left; width: 200px; padding-top: 5px;" maxlength="20" placeholder="가격을 입력해주세요.">
										</td>
									</tr>
									<tr>
										<th><small class="star">*</small> 할인율</th>
										<td><input type="number" name="discountrate" id="discountrate" style="float: left; width: 200px; padding-top: 5px;" min="0" max="100" maxlength="15" placeholder="할인율을 입력해주세요."> 
										<select style="width: 100px; margin-right: 10px" name="selectDiscountrate" id="selectDiscountrate">
												<option value="101" selected>직접입력</option>
												<option value="0">0%</option>
												<option value="5">5%</option>
												<option value="10">10%</option>
												<option value="20">20%</option>
												<option value="30">30%</option>
										</select>
										</td>
									</tr>
									<tr>
										<th><small class="star">*</small> 판매가</th>
										<td><input type="text" name="salesprice" id="salesprice" style="float: left; width: 200px; padding-top: 5px;" maxlength="20" readonly>원</td>
									</tr>
									<tr>
										<th><small class="star">*</small> 도서분류</th>
										<td>
											<div>
												<input type="radio" name="classify" id="classify0" value="0">&nbsp; 
													<span style="font-size: 16px; color: #000000;">국내도서</span>
												&nbsp;&nbsp;&nbsp; <input type="radio" name="classify" id="classify1" value="1">&nbsp; 
													<span style="font-size: 16px; color: #000000;">국외도서</span>
											</div>
										</td>
									</tr>
									<tr class="hide" id="hide">
										<!-- 처음에 숨김 -->
										<th><small class="star">*</small> 번역가</th>
										<td><input type="text" name="translator" id="translator" class="inNextBtn" style="float: left; width: 200px; padding-top: 5px;" placeholder="번역한 이를 입력해주세요."></td>
									</tr>
									<tr>
										<th><small class="star">*</small> 카테고리</th>
										<td>
										<select style="width: 100px; margin-right: 10px;" name="selectClassify" id="selectClassify" disabled>
												<option value="" selected disabled>전체</option>
												<option value="0">국내도서</option>
												<option value="1">국외도서</option>
										</select>
										
										<select style="width: 100px; margin-right: 10px; " name="selectCateList" id="selectCateList">
												
										</select>
										<select style="width: 100px; margin-right: 10px; " name="selectChild" id="selectChild">
												
										</select>
											<a href="javascript:void(0);" id="plusCateBtn" class="btns"><strong>추가</strong></a>
											<a href="javascript:void(0);" id="delCateBtn" class="btns"><strong>초기화</strong></a>
										</td>
									</tr>
									<tr>
										<th><small class="star">*</small> 선택된 카테고리</th>
										<td>
											<label id="categoryName" style="width: 200px; padding-top: 5px;"data-cate-cnt="0" data-selected-category="[]">없음</label>
										</td>
									</tr>
									<tr>
										<th><small class="star">*</small> 페이지 수</th>
										<td><input type="text" name="bpages" id="bpages" style="float: left; width: 200px; padding-top: 5px;" maxlength="20" placeholder="페이지를 입력해주세요.">(쪽)</td>
									</tr>
									<tr>
										<th><small class="star">*</small> 무게</th>
										<td><input type="text" name="bweight" id="bweight" style="float: left; width: 200px; padding-top: 5px;" maxlength="20" placeholder="무게를 입력해주세요.">(g)
										</td>
									</tr>
									<tr>
										<th><small class="star">*</small> 크기</th>
										<td><input type="text" name="bwidth" id="bwidth" style="float: left; padding-top: 5px;" maxlength="5" placeholder="가로">
											<input type="text" name="bvertical" id="bvertical" style="float: left; padding-top: 5px;" maxlength="5" placeholder="세로">
											<input type="text" name="bheight" id="bheight" style="float: left; padding-top: 5px;" maxlength="5" placeholder="높이">(mm)
										</td>
									</tr>
									<tr>
										<th><small class="star">*</small> 재고</th>
										<td><input type="text" name="bstack" id="bstack" style="float: left; padding-top: 5px;" maxlength="20" placeholder="재고를 입력해주세요.">
										</td>
									</tr>
									<tr>
										<th scope="row">
											<label for="">*도서 소개</label>
										</th>
										<td colspan="30">
											<textarea id="bintroduce" name="bintroduce" title="내용을 입력해주세요" style="width: 100%"></textarea>
										</td>
									</tr>
									<tr>
										<th scope="row">
											<label for="">*도서 목차</label>
										</th>
										<td colspan="30">
											<textarea id="bindex" name="bindex" title="내용을 입력해주세요" style="width: 100%"></textarea>
										</td>
									</tr>
									<tr>
										<th><small class="star">*</small> 썸네일 등록</th>
										<td colspan="10">
											<input type="file" id="bthumb_org" name="bthumb_org_file" class="w100" title="첨부파일을 업로드 해주세요." />
										</td>
									</tr>
								</tbody>
							</table>
						</form>
						<div class="btn">
							<div class="btnLeft" style="float: right; padding-top: 10px;">
								<a href="javascript:;" class="btns" onclick="goSave();"><strong>등록</strong></a>
								<a class="btns" href="index.do"><strong>취소</strong></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/goodsEnroll.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<link rel="stylesheet" href="../resources/css/main1.css">
<link rel="stylesheet"
	href="../resources/css/bootstrap4.4.1/bootstrap.min.css">
<script src="../resources/js/main.js" defer></script>	
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
</head>
<body>

	<%@include file="../includes/admin/header.jsp"%>
	<div class="content_area">
		<div class="section__container2">
			<div class="admin_content_wrap">
				<div class="admin_content_subject">
					<span>상품 등록</span>
				</div>
				<div class="admin_content_main">
					<form action="/admin/goodsEnroll" method="post" id="enrollForm">
						<div class="form_section">
							<div class="form_section_title">
								<label>상품</label>
							</div>
							<div class="form_section_content">
								<input name="bookName"> <span
									class="ck_warn bookName_warn">상품 이름을 입력해주세요</span>
							</div>
						</div>
						<!--  <div class="form_section">
							<div class="form_section_title">
								<label>고객아이디</label>
							</div>
							<div class="form_section_content">
								<input name="authorId" value="0"> <span
									class="ck_warn authorId_warn">고객 ID를 입력해주세요</span>
							</div>
						</div> -->
						<div class="form_section">
							<div class="form_section_title">
								<label>고객이름</label>
							</div>
							<div class="form_section_content">
								<input id="authorName_input" readonly="readonly"
									name="authorName"> <input id="authorId_input"
									name="authorId" type="hidden">
								<button class="authorId_btn">고객 선택</button>
							</div>
							<span class="ck_warn authorId_warn">고객 이름를 입력해주세요</span>
						</div>
						<div class="form_section">
							<div class="form_section_title">
								<label>상품 카테고리</label>
							</div>
							<div class="form_section_content">
								<div class="cate_wrap">
									<span>대분류</span> <select class="cate1">
										<option selected value="none">선택</option>
										<!--  	<option value="100000">해외1</option>
                    						<option value="200000">해외2</option>-->
									</select>
								</div>
								<div class="cate_wrap">
									<span>중분류</span> <select class="cate2">
										<option selected value="none">선택</option>
									</select>
								</div>
								<div class="cate_wrap">
									<span>소분류</span> <select class="cate3" name="cateCode">
										<option selected value="none">선택</option>
									</select>
								</div>
								<span class="ck_warn cateCode_warn">카테고리를 선택해주세요</span>
							</div>

						</div>
						<div class="form_section">
							<div class="form_section_title">
								<label>상품 가격</label>
							</div>
							<div class="form_section_content">
								<input name="bookPrice" value="0"> <span
									class="ck_warn bookPrice_warn">상품가격을 입력해주세요</span>
							</div>
						</div>
						<div class="form_section">
							<div class="form_section_title">
								<label>상품 재고</label>
							</div>
							<div class="form_section_content">
								<input name="bookStock" value="0"> <span
									class="ck_warn bookStock_warn">상품재고 입력해주세요</span>
							</div>
						</div>
					</form>
					<div class="btn_section">
						<button id="cancelBtn" class="btn btn-secondary btn-sm ">취
							소</button>
						<button id="enrollBtn" class="btn btn-secondary btn-sm ">등
							록</button>


					</div>

				</div>
			</div>
</div>
</div>

			<%@include file="../includes/admin/footer.jsp"%>

			<script>
	let enrollFrom = $("#enrollForm")
	
	/*취소 버튼*/
	$("#cancelBtn").click(function(e){
		
		location.href="/admin/goodsManage"
	
	
	});
	
	$("#enrollBtn").on("click",function(e){
		
		e.preventDefault();
		
		enrollForm.submit();
		
	});
	
	
	
	
	/* 고객 선택 버튼 */
	$('.authorId_btn').on("click",function(e){
		
		e.preventDefault();
		
		let popUrl = "/admin/authorPop";
		let popOption = "width = 650px, height=550px, top=300px, left=300px, scrollbars=yes";
		
		window.open(popUrl,"고객 찾기",popOption);	
		
	});

	/*
	$(document).ready(function(){
		console.log('${cateList}');
	});
	*/
	
	/*카테고리*/
	
	let cateList = JSON.parse('${cateList}');
	
	let cate1Array = new Array();
	let cate2Array = new Array();
	let cate3Array = new Array();
	let cate1Obj = new Object();
	let cate2Obj = new Object();
	let cate3Obj = new Object();
	
	let cateSelect1 = $(".cate1");		
	let cateSelect2 = $(".cate2");
	let cateSelect3 = $(".cate3");
	
	/* 카테고리 배열 초기화 메서드 */
	function makeCateArray(obj,array,cateList, tier){
		for(let i = 0; i < cateList.length; i++){
			if(cateList[i].tier === tier){
				obj = new Object();
				
				obj.cateName = cateList[i].cateName;
				obj.cateCode = cateList[i].cateCode;
				obj.cateParent = cateList[i].cateParent;
				
				array.push(obj);				
				
			}
		}
	}	
	
	/* 배열 초기화 */
	makeCateArray(cate1Obj,cate1Array,cateList,1);
	makeCateArray(cate2Obj,cate2Array,cateList,2);
	makeCateArray(cate3Obj,cate3Array,cateList,3);
	
	/*
	$(document).ready(function(){
		console.log(cate1Array);
		console.log(cate2Array);
		console.log(cate3Array);
	});
	*/
	
	/*대분류 옵션 태그*/
	for(let i = 0; i < cate1Array.length; i++){
		cateSelect1.append("<option value='"+cate1Array[i].cateCode+"'>" + cate1Array[i].cateName + "</option>");
	}
	
	/*중분류 옵션 태그*/
	$(cateSelect1).on("change",function(){
		let selectVal1 = $(this).find("option:selected").val();
		
		cateSelect2.children().remove();
		cateSelect3.children().remove();
		
		cateSelect2.append("<option value='none'>선택</option>");
		cateSelect3.append("<option value='none'>선택</option>");
		
		
		for(let i = 0; i < cate2Array.length; i++){
			if(selectVal1 === cate2Array[i].cateParent){
				cateSelect2.append("<option value='"+cate2Array[i].cateCode+"'>" + cate2Array[i].cateName + "</option>");	
			}
		}// for
	});

	/*소분류 <option>태그*/
	$(cateSelect2).on("change",function(){
		
		let selectVal2 = $(this).find("option:selected").val();
		
		cateSelect3.children().remove();
		
		cateSelect3.append("<option value='none'>선택</option>");
		
		for(let i = 0; i < cate3Array.length; i++){
			if(selectVal2 === cate3Array[i].cateParent){
				cateSelect3.append("<option value='"+cate3Array[i].cateCode+"'>" + cate3Array[i].cateName + "</option>");	
			}
		}// for		
		
	});

</script>
</body>
</html>
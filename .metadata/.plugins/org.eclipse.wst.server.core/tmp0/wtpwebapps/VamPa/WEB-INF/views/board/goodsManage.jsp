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
<link rel="stylesheet"
	href="../resources/css/bootstrap4.4.1/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/admin/goodsManage.css">
<link rel="stylesheet" href="../resources/css/main1.css">
<script src="../resources/js/main.js" defer></script>	
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
</head>
<body>

	<!-- Navbar -->
	<nav id="navbar">
		<div class="navbar__logo">
			<img src="../resources/img/logo.png" class="home__a" />KYAS
		</div>
		<ul class="navbar__menu">
			<c:if test="${member == null}">
				<a href="/main"><li class="navbar__menu__item ">Home</li></a>
				<a href="/member/login"><li class="navbar__menu__item">로그인</li></a>
				<a href="/member/join"><li class="navbar__menu__item">회원가입</li></a>
			</c:if>

			<c:if test="${member != null }">
				<c:if test="${member.adminCk == 1 }">
					<a href="/admin/main"><li class="navbar__menu__item ">관리자
							페이지</li></a>
				</c:if>
				<a href="/main"><li class="navbar__menu__item ">Home</li></a>

				<a href="/board/list"><li class="navbar__menu__item ">게시판</li></a>
				<li class="navbar__menu__item"><a id="gnb_logout_button">로그아웃</a></li>
			</c:if>

		</ul>

		<!-- header -->
		<button class="navbar__toggle-btn">
			<i class="fas fa-bars"></i>>
		</button>
	</nav>
	<section id="home">
		<div class="home__container">
			<img src="../resources/img/main.jpg" class="home__avatar" />
			<h3 class="home__title">
				Hello, <br />We provide you with any alcohol you want.
			</h3>


		</div>
	</section>
	<div class="content_area" style="  padding-top: 30px;">
		<div class="section__container2">
			<!-- <div class="admin_content_wrap"> -->
			<!-- <div class="admin_content_subject"> -->
			
		
		<div class="table_wrap">
			<!-- 상품 리스트 O -->
			<c:if test="${listcheck != 'empty'}">
				<table class="table table-striped">
					<thead>
						<tr>
							<td scope="col" class="text-center">상품 번호</td>
							<td scope="col" class="text-center">상품 이름</td>
							<td scope="col" class="text-center">고객 이름</td>
							<td scope="col" class="text-center">남은 양</td>
							<td scope="col" class="text-center">재고</td>
							<td scope="col" class="text-center">등록날짜</td>
						</tr>
					</thead>
					<c:forEach items="${list}" var="list">
						<tr>
							<td scope="col" class="text-center"><c:out value="${list.bookId}"></c:out></td>
							<td scope="col" class="text-center"><c:out value="${list.bookName}"></c:out></td>
							<td scope="col" class="text-center"><c:out value="${list.authorName}"></c:out></td>
							<td scope="col" class="text-center"><c:out value="${list.cateName}"></c:out></td>
							<td scope="col" class="text-center"><c:out value="${list.bookStock}"></c:out></td>
							<td scope="col" class="text-center"><fmt:formatDate value="${list.regDate}"
									pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<!-- 상품 리스트 X -->
			<c:if test="${listCheck == 'empty'}">
				<div class="table_empty">등록된 고객이 없습니다.</div>
			</c:if>
		</div>

		<!-- 검색 영역 -->
		<div class="search_wrap">
			<form id="searchForm" action="/board/goodsManage" method="get">
				<div class="search_input">
					<input type="text" name="keyword" style="padding-bottom: 0px;padding-top: 0px;height: 29px;"
						value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
					<input type="hidden" name="pageNum"
						value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
					<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
					<input type="hidden" name="type" value="G">
					<button class='btn search_btn'>검 색</button>
				</div>
			</form>
		</div>

		<!-- 페이지 이름 인터페이스 영역 -->
		<div class="pageMaker_wrap">
			<ul class="pageMaker">

				<!-- 이전 버튼 -->
				<c:if test="${pageMaker.prev }">
					<li class="pageMaker_btn prev"><a
						href="${pageMaker.pageStart -1}">이전</a></li>
				</c:if>

				<!-- 페이지 번호 -->
				<c:forEach begin="${pageMaker.pageStart }"
					end="${pageMaker.pageEnd }" var="num">
					<li
						class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
						<a href="${num}">${num}</a>
					</li>
				</c:forEach>

				<!-- 다음 버튼 -->
				<c:if test="${pageMaker.next}">
					<li class="pageMaker_btn next"><a
						href="${pageMaker.pageEnd + 1 }">다음</a></li>
				</c:if>
			</ul>
		</div>

		<form id="moveForm" action="/board/goodsManage" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		</form>
	</div>
</div>


	<!-- Footer 영역 -->

	<!-- class="footer_nav" -->
	<section id="contact" class="section">

		<h2 class="contact__email">bit.kipping@gmail.com</h2>
		<div class="contact__links">
			<a href="https://github.com/dream-ellie" target="_blank"> <i
				class="fab fa-github"></i>
			</a> <a href="#" target="_blank"> <i class="fa fa-linkedin-square"></i>
			</a>
		</div>
		<p class="contact__rights">
			(주) Vam alchoal 대표이사 : 다이노 <br> 사업자등록번호 : o10-123-56789 <br>
			대표전화 : 1440-2293(발신자 부담전화) <br> <br> COPYRIGHT(C) <strong>bit.camp.com</strong>
			ALL RIGHTS RESERVED.
		</p>
	</section>
	<!-- class="footer" -->

	<script>
		$(document).ready(function() {

			/* 등록 성공 이벤트 */
			let eResult = '<c:out value="${enroll_result}"/>';
			checkResult(eResult);
			function checkResult(result) {

				if (result === '') {
					return;
				}

				alert("상품'" + eResult + "'을 등록하였습니다.");

			}

			/* 수정 성공 이벤트 */
			let modify_result = '${modify_result}';

			if (modify_result == 1) {
				alert("수정 완료");
			}

			/* 삭제 결과 경고창 */
			let delete_result = '${delete_result}';

			if (delete_result == 1) {
				alert("삭제 완료");
			}
		});
		let searchForm = $('#searchForm');
		let moveForm = $('#moveForm');

		/* 작가 검색 버튼 동작 */
		$("#searchForm button").on("click", function(e) {

			e.preventDefault();

			/* 검색 키워드 유효성 검사 */
			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하십시오");
				return false;
			}

			searchForm.find("input[name='pageNum']").val("1");

			searchForm.submit();

		});
		/* 페이지 이동 버튼 */
		$(".pageMaker_btn a").on("click", function(e) {

			e.preventDefault();

			moveForm.find("input[name='pageNum']").val($(this).attr("href"));

			moveForm.submit();

		});
		/* 상품 조회 페이지 */
		$(".move")
				.on(
						"click",
						function(e) {

							e.preventDefault();

							moveForm
									.append("<input type='hidden' name='bookId' value='"
											+ $(this).attr("href") + "'>");
							moveForm.attr("action", "/admin/goodsDetail");
							moveForm.submit();

						});
	</script>

</body>
</html>
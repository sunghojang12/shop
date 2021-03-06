<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>로그인</title>
<link rel="stylesheet"
	href="../resources/css/bootstrap4.4.1/bootstrap.min.css">
<script src="../resources/js/main.js" defer></script>	
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resources/css/main1.css">
<link rel="stylesheet" href="/resources/css/member/login.css">
</head>
<body>
	<!-- Navbar -->
	<nav id="navbar">
		<div class="navbar__logo">
			<img src="../resources/img/logo.png" class="home__a" />KYAS
		</div>
		<ul class="navbar__menu">
			<c:if test="${member == null}">
				<li class="navbar__menu__item "><a href="/main">Home</a></li>
				
				<li class="navbar__menu__item"><a href="/member/login">로그인</a></li>
				<li class="navbar__menu__item"><a href="/member/join">회원가입</a></li>
			</c:if>

			<c:if test="${member != null }">
				<c:if test="${member.adminCk == 1 }">
					<a href="/admin/main"><li class="navbar__menu__item ">관리자
							페이지</li></a>
				</c:if>
				<a href="/main"><li class="navbar__menu__item ">Home</li></a>

				<a href="/board/list"><li class="navbar__menu__item active">게시판</li></a>
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
			<h2 class="home__title">
				Hello, <br />We provide you with any alcohol you want.
			</h2>


		</div>
	</section>

	<div class="section__container2">
		<div class="wrapper">

			<div class="wrap">
				<form id="login_form" method="post">
					<div class="logo_wrap" style="margin-top: 50px; margin-bottom: 50px;">
						<span>Login</span>
					</div>
					<div class="form-group row">
					<label for="inputEmail3" class="col-sm-2 col-form-label">ID</label>
						<div class="col-sm-10">
								<input class="form-control"  name="memberId">
						</div>
					</div>
						<div class="form-group row">
						<label for="inputPassword3" class="col-sm-2 col-form-label">PW</label>
							<div class="col-sm-10" >
								<input type="password" class="form-control" id="inputPassword3" name="memberPw">
							</div>
						</div>
						

						<c:if test="${result == 0 }">
							<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
						</c:if>

						<div class="login_button_wrap">
							<input type="button" class="login_button" value="로그인">
						</div>
					
				</form>

			</div>

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
			(주) Vam alchoal 대표이사 : 다이노 <br> 사업자등록번호 : o11-123-56789 <br>
			대표전화 : 1440-2293(발신자 부담전화) <br> <br> COPYRIGHT(C) <strong>bit.camp.com</strong>
			ALL RIGHTS RESERVED.
		</p>
	</section>
	<!-- class="footer" -->


	<script>
		/* 로그인 버튼 클릭 메서드 */
		$(".login_button").click(function() {

			//alert("로그인 버튼 작동");

			/* 로그인 메서드 서버 요청 */
			$("#login_form").attr("action", "/member/login.do");
			$("#login_form").submit();

		});
	</script>
	<script>
		/* gnb_area 로그아웃 버튼 작동 */
		$("#gnb_logout_button").click(function() {
			//alert("버튼 작동");
			$.ajax({
				type : "POST",
				url : "/member/logout.do",
				success : function(data) {
					alert("로그아웃 성공");
					document.location.reload();
				}
			}); // ajax     
		});
	</script>
</body>
</html>
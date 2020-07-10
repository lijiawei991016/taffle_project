<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="statics/images/favicon.png"
	type="image/x-icon">

<title>About</title>

<!-- Fonts -->
<link rel="stylesheet" href="statics/assets/fonts/Lato/Lato.css">

<!-- Icons -->
<link rel="stylesheet" href="statics/assets/fonts/flaticon/flaticon.css">
<link rel="stylesheet"
	href="statics/assets/fonts/webfont/css/materialdesignicons.min.css">

<!-- Libs -->
<link rel="stylesheet"
	href="statics/libs/bootstrap-4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="statics/libs/select2/css/select2.min.css">
<link rel="stylesheet" href="statics/libs/slick/slick.css">

<!-- Theme -->
<link rel="stylesheet" href="statics/assets/css/style.css">
<meta name="theme-color" content="#ECECEC">
</head>
<body>
	<div class="head-line"></div>

	<!-- head -->
	<%@ include file="ClientCommon/ClientCommon_header.jsp"%>

	<div class="page-wrap">

		<div class="section-featured-icons d-lg-block d-none">
			<div class="container">
				<div class="row">
					<div class="col-lg-4">
						<div
							class="icon-box icon-box-left icon-box-circle justify-content-lg-center">
							<div class="icon-box__icon">
								<i class="flaticon flaticon-delivery-truck"></i>
							</div>
							<div class="icon-box__title">Delivery to all regions</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div
							class="icon-box icon-box-left icon-box-circle justify-content-lg-center">
							<div class="icon-box__icon">
								<i class="flaticon flaticon-sales-ticket"></i>
							</div>
							<div class="icon-box__title">Don't miss this great deal!</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div
							class="icon-box icon-box-left icon-box-circle justify-content-lg-center">
							<div class="icon-box__icon">
								<i class="flaticon flaticon-thumb-up-gesture"></i>
							</div>
							<div class="icon-box__title">The highest quality of
								products</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Breadcrumbs -->
		<nav aria-label="breadcrumb" class="page-breadcrumb">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">About</li>
				</ol>
			</div>
		</nav>

		<!-- Page content -->
		<div class="page-content">
			<main class="main-content">
			<section class="section-about">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-lg-5">
							<h3 class="section-title mb-40">About Us</h3>

							<p>Our store is more than just another average online
								retailer. We sell not only top unique products, but give our
								customers a positive online shopping experience. Purchase the
								things you need every day or just like in a few clicks or taps,
								depending on the device you use to access the Internet. We work
								to make your life more enjoyable.</p>
						</div>
						<div class="col-lg-7">
							<img src="statics/images/11_about_page_001.jpg" alt="">
						</div>
					</div>
				</div>
			</section>

			<section class="section-team">
				<div class="container">
					<h3 class="section-title text-center">Our team</h3>

					<div class="row">
						<div class="col-lg-3 col-md-6">
							<div class="team">
								<div class="team__thumb">
									<img src="statics/images/11_about_page_002.jpg" alt="">
								</div>
								<div class="team__name h4">Barry McCoy</div>
								<div class="team__position">Exec. Creative Director</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="team">
								<div class="team__thumb">
									<img src="statics/images/11_about_page_003.jpg" alt="">
								</div>
								<div class="team__name h4">Barbara Garner</div>
								<div class="team__position">Client Partner</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="team">
								<div class="team__thumb">
									<img src="statics/images/11_about_page_004.jpg" alt="">
								</div>
								<div class="team__name h4">Justin Gomez</div>
								<div class="team__position">Photographer</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="team">
								<div class="team__thumb">
									<img src="statics/images/11_about_page_005.jpg" alt="">
								</div>
								<div class="team__name h4">Eddie Douglas</div>
								<div class="team__position">Senior Strategist</div>
							</div>
						</div>
					</div>
				</div>
			</section>

			<section class="section-subscribe">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-6">
							<div class="section-title section-title-w-text text-center">
								<h2 class="h3 section-title__heading">Newsletter
									subscription</h2>
								<div class="section-title__text">Newest products,
									promotions and sales</div>
							</div>

							<form class="subscribe-form form-inline justify-content-center">
								<div class="form-group">
									<input type="text"
										class="form-control form-control-lg subscribe-form__input"
										placeholder="E-mail adress">
								</div>
								<button type="submit"
									class="btn btn-primary btn-lg subscribe-form__btn">subscribe</button>
							</form>
						</div>
					</div>
				</div>
			</section>
			</main>
			<!-- end of main -->
		</div>
		<!-- /.page-content -->
	</div>
	<!-- /.page-wrap -->


	<!-- footer -->
	<%@ include file="ClientCommon/ClientCommon_footer.jsp"%>

	<div id="js-back-to-top" class="back-to-top">
		<i class="flaticon-up-arrow-sign"></i> Page top
	</div>

	<div class="full-search-wrap">
		<div class="full-search container">
			<div
				class="close-s float-right js-close-search flaticon-cancel-button fi-2x"></div>
			<form action="/" class="search-full-form">
				<div class="position-relative">
					<div class="position-relative">
						<i class="search-icon flaticon-magnifying-glass-browser fi-2x"></i>
						<input type="text" id="s-full" class="search-full-form__input"
							placeholder="Search"> <input type="submit" class="d-none">
					</div>
				</div>
				<p class="hint">Type in your search and press enter</p>
			</form>
		</div>
	</div>

	<!-- Libs -->
	<script src="statics/libs/jquery-2.2.3.min.js"></script>
	<script src="statics/libs/bootstrap-4.3.1/js/bootstrap.min.js"></script>
	<script src="statics/libs/select2/js/select2.min.js"></script>
	<script src="statics/libs/slick/slick.min.js"></script>

	<!-- Theme -->
	<script src="statics/assets/js/custom.js"></script>
</body>
</html>
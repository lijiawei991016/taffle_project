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

<title>Shortcodes</title>

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

		<!-- Breadcrumbs -->
		<nav aria-label="breadcrumb" class="page-breadcrumb">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/">Home</a></li>
					<li class="breadcrumb-item"><a href="about.html">About</a></li>
					<li class="breadcrumb-item active" aria-current="page">Shortcodes</li>
				</ol>
			</div>
		</nav>

		<!-- Page content -->
		<div class="page-content">
			<div class="container">
				<div class="row justify-content-between">
					<main id="main" class="main-content col-lg-8">
					<div class="post-content">
						<section class="mb-5">
							<h2>Shortcodes</h2>
							<p>All kinds of goodies to be used anywhere in the theme!</p>
							<hr />
						</section>

						<section class="mb-5" id="slider">
							<h4>Slider</h4>

							<div class="slider js-slider"
								data-slick='{"slidesToShow": 1, "slidesToScroll": 1}'>
								<div class="slider-item">
									<img src="statics/images/slider1.jpg" alt="slide1">
								</div>
								<div class="slider-item">
									<img src="statics/images/slider1.jpg" alt="slide2">
								</div>
								<div class="slider-item">
									<img src="statics/images/slider1.jpg" alt="slide3">
								</div>
							</div>
						</section>

						<section class="mb-5" id="accordions">
							<h4>Accordions</h4>

							<div class="accordion mb-5" id="accordionExamplePrimary">
								<div class="card">
									<div class="card-header" id="headingOnePrimary">
										<button class="btn btn-primary btn-lg " type="button"
											data-toggle="collapse" data-target="#collapseOnePrimary"
											aria-expanded="true" aria-controls="collapseOnePrimary">
											Accordion item #1</button>
									</div>

									<div id="collapseOnePrimary" class="collapse show"
										aria-labelledby="headingOnePrimary"
										data-parent="#accordionExamplePrimary">
										<div class="card-body">Lorem Ipsum is simply dummy text
											of the printing and typesetting industry. Lorem Ipsum has
											been the industry’s standard dummy text ever since the 1500s,
											when an unknown printer took a galley of type and scrambled
											it to make a type specimen book.</div>
									</div>
								</div>
								<div class="card">
									<div class="card-header" id="headingTwoPrimary">
										<button class="btn btn-primary btn-lg collapsed" type="button"
											data-toggle="collapse" data-target="#collapseTwoPrimary"
											aria-expanded="false" aria-controls="collapseTwoPrimary">
											Accordion item #2</button>
									</div>
									<div id="collapseTwoPrimary" class="collapse"
										aria-labelledby="headingTwoPrimary"
										data-parent="#accordionExamplePrimary">
										<div class="card-body">Lorem Ipsum is simply dummy text
											of the printing and typesetting industry. Lorem Ipsum has
											been the industry’s standard dummy text ever since the 1500s,
											when an unknown printer took a galley of type and scrambled
											it to make a type specimen book.</div>
									</div>
								</div>
								<div class="card">
									<div class="card-header" id="headingThreePrimary">
										<button class="btn btn-primary btn-lg collapsed" type="button"
											data-toggle="collapse" data-target="#collapseThreePrimary"
											aria-expanded="false" aria-controls="collapseThreePrimary">
											Accordion item #3</button>
									</div>
									<div id="collapseThreePrimary" class="collapse"
										aria-labelledby="headingThreePrimary"
										data-parent="#accordionExamplePrimary">
										<div class="card-body">Lorem Ipsum is simply dummy text
											of the printing and typesetting industry. Lorem Ipsum has
											been the industry’s standard dummy text ever since the 1500s,
											when an unknown printer took a galley of type and scrambled
											it to make a type specimen book.</div>
									</div>
								</div>
							</div>
							<!-- #headingOnePrimary -->

							<div class="accordion" id="accordionExampleOutline">
								<div class="card">
									<div class="card-header" id="headingOneOutline">
										<button class="btn btn-outline-primary btn-lg" type="button"
											data-toggle="collapse" data-target="#collapseOneOutline"
											aria-expanded="true" aria-controls="collapseOneOutline">
											Accordion item #1</button>
									</div>

									<div id="collapseOneOutline" class="collapse show"
										aria-labelledby="headingOneOutline"
										data-parent="#accordionExampleOutline">
										<div class="card-body">Lorem Ipsum is simply dummy text
											of the printing and typesetting industry. Lorem Ipsum has
											been the industry’s standard dummy text ever since the 1500s,
											when an unknown printer took a galley of type and scrambled
											it to make a type specimen book.</div>
									</div>
								</div>
								<div class="card">
									<div class="card-header" id="headingTwoOutline">
										<button class="btn btn-outline-primary btn-lg collapsed"
											type="button" data-toggle="collapse"
											data-target="#collapseTwoOutline" aria-expanded="false"
											aria-controls="collapseTwoOutline">Accordion item #2
										</button>
									</div>
									<div id="collapseTwoOutline" class="collapse"
										aria-labelledby="headingTwoOutline"
										data-parent="#accordionExampleOutline">
										<div class="card-body">Lorem Ipsum is simply dummy text
											of the printing and typesetting industry. Lorem Ipsum has
											been the industry’s standard dummy text ever since the 1500s,
											when an unknown printer took a galley of type and scrambled
											it to make a type specimen book.</div>
									</div>
								</div>
								<div class="card">
									<div class="card-header" id="headingThreeOutline">
										<button class="btn btn-outline-primary btn-lg collapsed"
											type="button" data-toggle="collapse"
											data-target="#collapseThreeOutline" aria-expanded="false"
											aria-controls="collapseThreeOutline">Accordion item
											#3</button>
									</div>
									<div id="collapseThreeOutline" class="collapse"
										aria-labelledby="headingThreeOutline"
										data-parent="#accordionExampleOutline">
										<div class="card-body">Lorem Ipsum is simply dummy text
											of the printing and typesetting industry. Lorem Ipsum has
											been the industry’s standard dummy text ever since the 1500s,
											when an unknown printer took a galley of type and scrambled
											it to make a type specimen book.</div>
									</div>
								</div>
							</div>
							<!-- #accordionExampleOutline -->

						</section>

						<section class="mb-5" id="progress">
							<h4>Progress bar</h4>

							<div class="progress progress-sm">
								<div class="progress-bar bg-secondary" role="progressbar"
									style="width: 58%" aria-valuenow="58" aria-valuemin="0"
									aria-valuemax="58"></div>
							</div>
							<div class="progress progress-sm mb-4">
								<div class="progress-bar bg-primary" role="progressbar"
									style="width: 35%" aria-valuenow="35" aria-valuemin="0"
									aria-valuemax="35"></div>
							</div>

							<div class="progress">
								<div class="progress-bar bg-secondary" role="progressbar"
									style="width: 67%" aria-valuenow="67" aria-valuemin="0"
									aria-valuemax="67">67%</div>
							</div>
							<div class="progress">
								<div class="progress-bar bg-primary" role="progressbar"
									style="width: 32%" aria-valuenow="32" aria-valuemin="0"
									aria-valuemax="32">32%</div>
							</div>
						</section>

						<section class="mb-5" id="buttons">
							<h4>Buttons</h4>

							<div class="d-block d-md-inline-block">
								<button type="button" class="btn btn-primary btn-lg mr-1 mb-3">Default</button>
								<button type="button"
									class="btn btn-primary btn-lg active mr-3 mb-3">Hover</button>
							</div>
							<div class="d-block d-md-inline-block">
								<button type="button"
									class="btn btn-outline-primary btn-lg mr-1 mb-3">Stroke</button>
								<button type="button"
									class="btn btn-outline-primary btn-lg active mb-3">Hover</button>
							</div>
							<div class="d-block d-md-inline-block">
								<button type="button" class="btn btn-primary mr-1 mb-3">Medium</button>
								<button type="button" class="btn btn-primary active mr-3 mb-3">Medium</button>
							</div>
							<div class="d-block d-md-inline-block">
								<button type="button" class="btn btn-outline-primary mr-1 mb-3">Medium</button>
								<button type="button"
									class="btn btn-outline-primary active mb-3">Medium</button>
							</div>
							<div class="d-block d-md-inline-block">
								<button type="button" class="btn btn-primary btn-sm mr-1 mb-3">Small</button>
								<button type="button"
									class="btn btn-primary btn-sm active mr-3 mb-3">Small</button>
							</div>
							<div class="d-block d-md-inline-block">
								<button type="button"
									class="btn btn-outline-primary btn-sm mr-1 mb-3">Small</button>
								<button type="button"
									class="btn btn-outline-primary btn-sm active mb-3">Small</button>
							</div>
						</section>

						<section class="mb-2" id="featured">
							<h4>Featured box</h4>
							<div class="row">
								<div class="col-md-5">
									<div class="offer-box">
										<img class="offer-box__bg"
											src="statics/images/01_home_page_002.jpg" alt="">
										<div class="offer-box__body">
											<div class="offer-box__title">S1 table</div>
											<a href="single-product.html" class="btn btn-outline-primary">buy
												$29.99</a>
										</div>
									</div>
								</div>

								<div class="col-md-7">
									<a href="shop.html" class="offer-box offer-box-sm"> <img
										class="offer-box__bg"
										src="statics/images/01_home_page_003.jpg" alt="">
										<div class="offer-box__body">
											<div class="offer-box__title">
												<span class="offer-percent">50%</span> sale
											</div>
										</div>
									</a> <a href="shop.html" class="offer-box offer-box-sm"> <img
										class="offer-box__bg"
										src="statics/images/01_home_page_004.jpg" alt="">
										<div class="offer-box__body">
											<div class="offer-box__title">Airshelf</div>
										</div>
									</a>
								</div>
							</div>

							<div class="row">
								<div class="col-md-6">
									<div class="icon-box icon-box-left icon-box-circle mb-40">
										<div class="icon-box__icon">
											<i class="flaticon flaticon-delivery-truck"></i>
										</div>
										<div class="icon-box__title">Delivery to all regions</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="icon-box icon-box-left icon-box-circle mb-40">
										<div class="icon-box__icon">
											<i class="flaticon flaticon-sales-ticket"></i>
										</div>
										<div class="icon-box__title">Don't miss this great deal!</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="icon-box icon-box-left icon-box-circle mb-40">
										<div class="icon-box__icon">
											<i class="flaticon flaticon-thumb-up-gesture"></i>
										</div>
										<div class="icon-box__title">The highest quality of
											products</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="icon-box icon-box-left icon-box-circle mb-40">
										<div class="icon-box__icon">
											<i class="flaticon flaticon-star-shape-favorite"></i>
										</div>
										<div class="icon-box__title">Only best items</div>
									</div>
								</div>
							</div>
						</section>

						<section class="mb-5" id="forms">
							<h4 class="mb-4">Forms &amp; controls</h4>

							<div class="shortcodes-col-sm">
								<div class="form-group mb-20">
									<input type="text" class="form-control mb-10"
										placeholder="Default"> <input type="text"
										class="form-control mb-10 hover" placeholder="Default hover">
									<input type="text" class="form-control mb-10 active"
										placeholder="Default active">
								</div>

								<div class="form-group mb-20">
									<div class="form-group mb-10">
										<select class="form-control js-select2"
											data-placeholder="List default">
											<option value="">List default</option>
											<option value="1">List item</option>
											<option value="2">List item</option>
											<option value="3">List item</option>
										</select>
									</div>

									<div class="form-group mb-10">
										<select class="form-control js-select2 hover"
											data-placeholder="List default">
											<option value="">List hover</option>
											<option value="1">List item</option>
											<option value="2">List item</option>
											<option value="3">List item</option>
										</select>
									</div>

									<div class="form-group mb-10">
										<select class="form-control js-select2 active"
											data-placeholder="List default">
											<option value="">List active</option>
											<option value="1">List item</option>
											<option value="2">List item</option>
											<option value="3">List item</option>
										</select>
									</div>
								</div>

								<div class="form-group">
									<div class="input-group mb-10">
										<input type="text" class="form-control"
											placeholder="Icon default"> <span
											class="input-group-addon"><i class="mdi mdi-lock"></i></span>
									</div>
									<div class="input-group mb-10">
										<input type="text" class="form-control hover"
											placeholder="Icon hover"> <span
											class="input-group-addon"><i class="mdi mdi-lock"></i></span>
									</div>
									<div class="input-group mb-10">
										<input type="text" class="form-control active"
											placeholder="Icon active"> <span
											class="input-group-addon"><i class="mdi mdi-lock"></i></span>
									</div>
								</div>
							</div>
						</section>

						<section class="mb-5" id="icons">
							<h4>Material design icons</h4>

							<div class="shortcodes-col-sm">
								<div class="icons-list">
									<span class="icon"><i class="mdi mdi-lock"></i></span> <span
										class="icon"><i class="mdi mdi-account"></i></span> <span
										class="icon"><i class="mdi mdi-calendar"></i></span> <span
										class="icon"><i class="mdi mdi-map-marker"></i></span> <span
										class="icon"><i class="mdi mdi-arrow-left"></i></span> <span
										class="icon"><i class="mdi mdi-arrow-right"></i></span> <span
										class="icon"><i class="mdi mdi-phone"></i></span> <span
										class="icon"><i class="mdi mdi-autorenew"></i></span> <span
										class="icon"><i class="mdi mdi-eye"></i></span>
								</div>

								<ul class="social-links social-links_demo">
									<li><a href="#"><i class="mdi mdi-facebook"></i></a></li>
									<li><a href="#"><i class="mdi mdi-vimeo"></i></a></li>
									<li><a href="#"><i class="mdi mdi-twitter"></i></a></li>
									<li><a href="#"><i class="mdi mdi-pinterest"></i></a></li>
									<li><a href="#"><i class="mdi mdi-medium"></i></a></li>
									<li><a href="#"><i class="mdi mdi-linkedin"></i></a></li>
									<li><a href="#"><i class="mdi mdi-instagram"></i></a></li>
									<li><a href="#"><i class="mdi mdi-google-plus"></i></a></li>
									<li><a href="#"><i class="mdi mdi-disqus"></i></a></li>
								</ul>
								<ul class="social-links social-links_hovered">
									<li><a href="#"><i class="mdi mdi-facebook"></i></a></li>
									<li><a href="#"><i class="mdi mdi-vimeo"></i></a></li>
									<li><a href="#"><i class="mdi mdi-twitter"></i></a></li>
									<li><a href="#"><i class="mdi mdi-pinterest"></i></a></li>
									<li><a href="#"><i class="mdi mdi-medium"></i></a></li>
									<li><a href="#"><i class="mdi mdi-linkedin"></i></a></li>
									<li><a href="#"><i class="mdi mdi-instagram"></i></a></li>
									<li><a href="#"><i class="mdi mdi-google-plus"></i></a></li>
									<li><a href="#"><i class="mdi mdi-disqus"></i></a></li>
								</ul>
							</div>
						</section>

						<section class="mb-5" id="alerts">
							<h4>Alert message</h4>

							<div class="shortcodes-col-sm">
								<div class="alert-message">
									<div class="alert alert-success">
										<strong>Well done!</strong> You successfully read this
										important alert message.
									</div>

									<div class="alert alert-info">
										<strong>Heads up!</strong> This alert needs your attention.
									</div>

									<div class="alert alert-warning">
										<strong>Warning!</strong> Best check yo self, you're not
										looking too good.
									</div>

									<div class="alert alert-danger">
										<strong>Oh snap!</strong> Change a few things up and try
										submitting again.
									</div>
								</div>
							</div>
						</section>

						<section class="mb-5" id="tabs">
							<h4>Tabs</h4>

							<div class="shortcodes-col-sm">
								<ul class="nav nav-tabs nav-justified nav-tabs-responsive mb-30">
									<li class="nav-item"><a class="nav-link active" href="#0">Active</a>
									</li>
									<li class="nav-item"><a class="nav-link hover" href="#0">Hover</a>
									</li>
									<li class="nav-item"><a class="nav-link disabled"
										href="#0">Non-active</a></li>
								</ul>

								<ul
									class="nav nav-tabs nav-justified nav-tabs-responsive style-2 mb-30">
									<li class="nav-item"><a class="nav-link active" href="#0">Active</a>
									</li>
									<li class="nav-item"><a class="nav-link hover" href="#0">Hover</a>
									</li>
									<li class="nav-item"><a class="nav-link disabled"
										href="#0">Non-active</a></li>
								</ul>

								<ul
									class="nav nav-tabs nav-justified nav-tabs-responsive style-3">
									<li class="nav-item"><a class="nav-link active" href="#0">Active</a>
									</li>
									<li class="nav-item"><a class="nav-link hover" href="#0">Hover</a>
									</li>
									<li class="nav-item"><a class="nav-link disabled"
										href="#0">Non-active</a></li>
								</ul>
							</div>
						</section>

						<section class="mb-5 pb-md-5" id="typography">
							<div class="shortcodes-col-sm">
								<h4>Typography</h4>
								<div class="typography">
									<h1>Heading h1</h1>
									<h2>Heading h2</h2>
									<h3>Heading h3</h3>
									<h4>Heading h4</h4>
									<p>Body text. Lorem Ipsum is simply dummy text of the
										printing and typesetting industry. Lorem Ipsum has been the
										industry’s standard dummy text ever since the 1500s, when an
										unknown printer.</p>
								</div>
							</div>
						</section>

					</div>
					<!-- end of content --> </main>

					<aside id="aside" class="sidebar sidebar-shortcodes col-lg-3">
						<div class="sidebar-widget">
							<h4 class="widget-title">Categories</h4>
							<ul>
								<li class="active"><a href="#">Slider</a></li>
								<li><a href="#accordions">Accordions</a></li>
								<li><a href="#progress">Progress bar</a></li>
								<li><a href="#buttons">Buttons</a></li>
								<li><a href="#featured">Featured box</a></li>
								<li><a href="#forms">Forms &amp; controls</a></li>
								<li><a href="#icons">Icons Material design</a></li>
								<li><a href="#alerts">Alert message</a></li>
								<li><a href="#tabs">Tabs</a></li>
								<li><a href="#typography">Typorgaphy</a></li>
							</ul>
						</div>
					</aside>
				</div>
				<!-- /.row-->
			</div>
			<!-- /.container-->
		</div>
		<!-- /.page-content-->

	</div>
	<!-- /.page-wrap-->

	<!-- footer -->
	<%@ include file="ClientCommon/ClientCommon_footer.jsp"%>

	<div class="full-search-wrap">
		<div class="full-search container">
			<div
				class="close-s float-right js-close-search flaticon-cancel-button fi-2x"></div>
			<form action="/" class=" search-full-form">
				<div class="position-relative">
					<i class="search-icon flaticon-magnifying-glass-browser fi-2x"></i>
					<input type="text" id="s-full" class="search-full-form__input"
						placeholder="Search"> <input type="submit" class="d-none">
				</div>
				<p class="hint">Type in your search and press enter</p>
			</form>
		</div>
	</div>
	<div id="js-back-to-top" class="back-to-top">
		<i class="flaticon-up-arrow-sign"></i> Page top
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
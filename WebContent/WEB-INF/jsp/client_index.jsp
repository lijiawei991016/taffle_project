<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/statics/images/favicon.png"
	type="image/x-icon">

<title>Taffle</title>

<!-- Fonts -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/assets/fonts/Lato/Lato.css">

<!-- Icons -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/assets/fonts/flaticon/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/assets/fonts/webfont/css/materialdesignicons.min.css">

<!-- Libs -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/libs/bootstrap-4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/libs/select2/css/select2.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/libs/slick/slick.css">

<!-- Theme -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/assets/css/style.css">
<meta name="theme-color" content="#ECECEC">
</head>
<body class="home">

	<div class="head-line"></div>
	<!-- head -->
	<%@ include file="ClientCommon/ClientCommon_header.jsp"%>


	<div class="page-wrap">
		<div class="page-content">
			<main class="main-content">
			<section class="home-slider">
				<div id="hero-slider" class="hero-slider slider js-hero-slider">
					<div class="slider-item"
						style="background-image: url('${pageContext.request.contextPath}/statics/images/01_home_page_001.jpg'); ">
						<div class="container">
							<div class="slider-item-inner">
								<h1 class="hero-slider__title">Discover design things</h1>
								<div class="hero-slider__text">a truly aesthetic theme for
									selling</div>
								<div class="hero-slider__btn">
									<a
										href="${pageContext.request.contextPath}/client/client_goods_by_categoryId?categoryId=0&goodsName=search"
										class=" btn btn-primary btn-lg">shop now</a>
								</div>
							</div>
						</div>
					</div>
					<div class="slider-item"
						style="background-image: url('${pageContext.request.contextPath}/statics/images/01_home_page_001.jpg'); ">
						<div class="container">
							<div class="slider-item-inner">
								<div class="h1 hero-slider__title">Discover design things</div>
								<div class="hero-slider__text">a truly aesthetic theme for
									selling</div>
								<div class="hero-slider__btn">
									<a
										href="${pageContext.request.contextPath}/client/client_goods_by_categoryId?categoryId=0&goodsName=search"
										class=" btn btn-primary btn-lg">shop now</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>

			<section class="section-featured-icons">
				<div class="container">
					<h2 class="screen-reader-text">Our features</h2>
					<div class="row">
						<div class="col-lg-4">
							<div
								class="icon-box icon-box-left icon-box-circle justify-content-sm-center">
								<div class="icon-box__icon">
									<i class="flaticon flaticon-delivery-truck"></i>
								</div>
								<div class="icon-box__title">Delivery to all regions</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div
								class="icon-box icon-box-left icon-box-circle justify-content-sm-center">
								<div class="icon-box__icon">
									<i class="flaticon flaticon-sales-ticket"></i>
								</div>
								<div class="icon-box__title">Don't miss this great deal!</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div
								class="icon-box icon-box-left icon-box-circle justify-content-sm-center">
								<div class="icon-box__icon">
									<i class="flaticon flaticon-thumb-up-gesture"></i>
								</div>
								<div class="icon-box__title">The highest quality of
									products</div>
							</div>
						</div>
					</div>
				</div>
			</section>

			<section class="section-offers">
				<div class="container">
					<h2 class="screen-reader-text">Offers</h2>
					<div class="row">
						<div class="col-md-7">
							<div class="offer-box">
								<img class="offer-box__bg"
									src="${pageContext.request.contextPath}/statics/images/01_home_page_002.jpg"
									alt="">
								<div class="offer-box__body">
									<div class="offer-box__title">S1 table</div>
									<a
										href="${pageContext.request.contextPath}/client/client_goods_by_categoryId?categoryId=0&goodsName=search"
										class="btn btn-outline-dark btn-lg">buy $29.99</a>
								</div>
							</div>
						</div>

						<div class="col-md-5">
							<a href="${pageContext.request.contextPath}/client//client_promo"
								class="offer-box offer-box-sm"> <img class="offer-box__bg"
								src="${pageContext.request.contextPath}/statics/images/01_home_page_003.jpg"
								alt="">
								<div class="offer-box__body">
									<div class="offer-box__title">
										<span class="offer-percent">50%</span> sale
									</div>
								</div>
							</a> <a
								href="${pageContext.request.contextPath}/client/client_goods_by_categoryId?categoryId=0&goodsName=search"
								class="offer-box offer-box-sm"> <img class="offer-box__bg"
								src="${pageContext.request.contextPath}/statics/images/01_home_page_004.jpg"
								alt="">
								<div class="offer-box__body">
									<div class="offer-box__title">Airshelf</div>
								</div>
							</a>
						</div>
					</div>
					<!-- end of featured -->
				</div>
			</section>

			<section class="section-featured-products">
				<div class="container">
					<div class="section-title text-center">
						<h2 class="h3 section-title__heading">更多产品</h2>
					</div>
					<ul class="products featured-products columns-4">
						<li class="product">
							<div class="product-thumb">
								<a
									href="${pageContext.request.contextPath}/client/client_goods_by_categoryId?categoryId=0&goodsName=search"
									class="product-thumb__link"> <img
									src="${pageContext.request.contextPath}/statics/images/01_home_page_005.jpg"
									alt=""> <span class="btn btn-outline-light shop-link">Shop</span>
								</a>
							</div>
							<div class="product-title">
								<a>电热灯</a>
							</div>
							<div class="price">
								<ins>
									<span class="amount">￥56.00</span>
								</ins>
								<del>
									<span class="amount">￥73.00</span>
								</del>
							</div>
						</li>
						<li class="product">
							<div class="product-thumb">
								<a
									href="${pageContext.request.contextPath}/client/client_goods_by_categoryId?categoryId=0&goodsName=search"
									class="product-thumb__link"> <img
									src="${pageContext.request.contextPath}/statics/images/01_home_page_006.jpg"
									alt=""> <span class="btn btn-outline-light shop-link">Shop</span>
								</a>
							</div>
							<div class="product-title">
								<a>荷兰书包</a>
							</div>
							<div class="price">
								<span class="amount">￥33.00</span>
							</div>
						</li>
						<li class="product">
							<div class="product-thumb">
								<a
									href="${pageContext.request.contextPath}/client/client_goods_by_categoryId?categoryId=0&goodsName=search"
									class="product-thumb__link"> <img
									src="${pageContext.request.contextPath}/statics/images/01_home_page_007.jpg"
									alt=""> <span class="btn btn-outline-light shop-link">Shop</span>
								</a>
							</div>
							<div class="product-title">
								<a>木平板电脑甲板</a>
							</div>
							<div class="price">
								<span class="amount">￥30.00</span>
							</div>
						</li>
						<li class="product">
							<div class="product-thumb">
								<a
									href="${pageContext.request.contextPath}/client/client_goods_by_categoryId?categoryId=0&goodsName=search"
									class="product-thumb__link"> <img
									src="${pageContext.request.contextPath}/statics/images/01_home_page_008.jpg"
									alt=""> <span class="btn btn-outline-light shop-link">Shop</span>
								</a>
							</div>
							<div class="product-title">
								<a>Roniq 手表</a>
							</div>
							<div class="price">
								<span class="amount">￥128.00</span>
							</div>
						</li>
					</ul>
				</div>
			</section>

			<section class="section-last-posts">
				<div class="container">
					<div class="section-title text-center">
						<h2 class="h3 section-title__heading">博客展示</h2>
					</div>

					<div class="post-grid row">
						<c:forEach items="${listblogs }" var="listblog">
							<div class="col-lg-4 col-md-6">
								<article class="post-item">
									<a
										href="${pageContext.request.contextPath}/client/client_single_post/${listblog.blogId }"
										class="post-thumb"> <img
										src="${pageContext.request.contextPath}/statics/file/${listblog.blogPhoto }"
										alt="">
									</a>
									<div class="post-item__content">
										<div class="post-date">
											<fmt:formatDate value="${listblog.blogCreateDate }"
												pattern="yyyy-MM-dd" />
										</div>
										<h3 class="post-title">
											<a
												href="${pageContext.request.contextPath}/client/client_single_post/${listblog.blogId }">${listblog.blogTitle }</a>
										</h3>
									</div>
								</article>
							</div>
						</c:forEach>
					</div>

					<div class="text-center mt-lg-4">
						<a
							href="${pageContext.request.contextPath}/client/client_list_blog"
							class="btn btn-outline-primary btn-lg">更多博客</a>
					</div>
				</div>
			</section>

			</main>
			<!-- end of main -->
		</div>
	</div>

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
	<script
		src="${pageContext.request.contextPath}/statics/libs/jquery-2.2.3.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/statics/libs/bootstrap-4.3.1/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/statics/libs/select2/js/select2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/statics/libs/slick/slick.min.js"></script>

	<!-- Theme -->
	<script
		src="${pageContext.request.contextPath}/statics/assets/js/custom.js"></script>

</body>
</html>
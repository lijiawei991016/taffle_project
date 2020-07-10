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

<title>促销商品</title>

<!-- Theme -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/assets/css/all.min.css">
<meta name="theme-color" content="#ECECEC">
</head>
<body>
	<div class="head-line"></div>

	<!-- head -->
	<%@ include file="ClientCommon/ClientCommon_header.jsp"%>

	<div class="page-wrap">
		<div class="page-content">
			<main class="main-content">
			<section
				class="promo-hero text-center d-flex flex-column justify-content-center align-items-center"
				style="background-image: url(${pageContext.request.contextPath}/statics/images/10_promo_page_001.jpg);">
				<div class="container">
					<h1 class="promo-hero__title">Discover unique products, buy it
						in one place</h1>
					<div class="promo-hero__text">Our products never go out of
						style</div>

					<div class="promo-hero__scroll" id="js-scroll-down">
						Scroll down<br>
						<i class="flaticon-down-chevron"></i>
					</div>
				</div>
			</section>
			<section class="promo-section" id="scroll-to">
				<div class="container">
					<div class="row justify-content-end">
						<div class="col-lg-5 promo-section__img">
							<img
								src="${pageContext.request.contextPath}/statics/images/10_promo_page_002.jpg"
								alt="">
						</div>
						<div class="col-lg-7 promo-section__card">
							<div class="promo-card">
								<a>
									<img
									src="${pageContext.request.contextPath}/statics/images/10_promo_page_003.jpg"
									alt="" class="promo-card__img">
								</a>
								<div class="promo-card__content">
									<h2 class="promo-card__title">
										<a href="single-product.html">Dutch grey bag</a>
									</h2>
									<div class="promo-card__text">Style and functionality go
										hand in hand</div>
									<a
										href="${pageContext.request.contextPath}/client/client_goods_by_categoryId?categoryId=0&goodsName=search"
										 class="btn btn-primary btn-lg">发现更多</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>

			<section class="promo-section">
				<div class="container">
					<div class="row">
						<div class="col-lg-7 promo-section__card">
							<div class="promo-card promo-card-offset-left">
								<a>
									<img
									src="${pageContext.request.contextPath}/statics/images/10_promo_page_005.jpg"
									alt="" class="promo-card__img">
								</a>
								<div class="promo-card__content">
									<h2 class="promo-card__title">
										<a href="single-product.html">PEARL PAPER CLUTCH</a>
									</h2>
									<div class="promo-card__text">The bottom is structured by
										an inside plastic rectangle cut</div>
									<a
										href="${pageContext.request.contextPath}/client/client_goods_by_categoryId?categoryId=0&goodsName=search"
										class="btn btn-primary btn-lg">发现更多</a>
								</div>
							</div>
						</div>
						<div class="col-lg-5 promo-section__img">
							<img
								src="${pageContext.request.contextPath}/statics/images/10_promo_page_004.jpg"
								alt="">
						</div>
					</div>
				</div>
			</section>


			<section class="promo-featured">
				<div class="container">
					<h3 class="section-title text-center">Featured products</h3>
					<ul class="products featured-products columns-4">
						<c:forEach items="${goods }" var="listgoods">
							<li class="product">
								<div class="product-thumb">
									<!-- 商品折扣判断 -->
									<!-- <span class="onsale">-30%</span> -->

									<!-- 折扣 -->
									<c:if test="${listgoods.goodsSell!=0}">
										<span class="onsale">-${listgoods.goodsSell}%</span>
									</c:if>
									<c:if test="${listgoods.goodsSell==0}">
										<span></span>
									</c:if>
									<a
										href="${pageContext.request.contextPath}/client/client_single_product/${listgoods.goodsId}"
										class="product-thumb__link"> <img
										src="${pageContext.request.contextPath}/statics/file/${listgoods.goodsPhoto}"
										alt=""> <span class="btn btn-outline-light shop-link">Shop</span>
									</a>
								</div>
								<div class="product-title">
									<a href="#">${listgoods.goodsName }</a>
								</div>
								<div class="price">
									<!-- 价格判断 -->

									<!-- 价格 -->
									<c:if test="${listgoods.goodsSell!=0}">
										<ins>
											<span class="amount">$${Math.ceil((1-listgoods.goodsSell/100)*listgoods.goodsPrice)}</span>
										</ins>
										<del>
											<span class="amount">$${listgoods.goodsPrice}</span>
										</del>
									</c:if>
									<c:if test="${listgoods.goodsSell==0}">
										<ins>
											<span class="amount">$${listgoods.goodsPrice}</span>
										</ins>
									</c:if>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</section>


			</main>
		</div>
	</div>

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
					<i class="search-icon flaticon-magnifying-glass-browser fi-2x"></i>
					<input type="text" id="s-full" class="search-full-form__input"
						placeholder="Search"> <input type="submit" class="d-none">
				</div>
				<p class="hint">Type in your search and press enter</p>
			</form>
		</div>
	</div>

	<!-- Theme -->
	<script
		src="${pageContext.request.contextPath}/statics/assets/js/all.min.js"></script>
</body>
</html>
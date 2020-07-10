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

<title>DUTCH GREY BAG - Shop</title>

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
<body>
	<div class="head-line"></div>

	<!-- head -->
	<%@ include file="ClientCommon/ClientCommon_header.jsp"%>

	<div class="page-wrap single shop">
		<!-- Breadcrumbs -->
		<nav aria-label="breadcrumb" class="page-breadcrumb">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item">首页</li>
					<li class="breadcrumb-item">商品</li>

					<li class="breadcrumb-item active" aria-current="page">${goods.goodsName}</li>
				</ol>
			</div>
		</nav>

		<div class="page-content">
			<main class="main-content" id="main" class="main-content col-lg-8">
			<section class="section-single-product product">
				<div class="container">
					<div class="row">
						<div class="col-lg-5">
							<div class="product-thumb">
								<!--普通用户显示正常折扣 -->
								<c:if test="${userScore<3000}">
									<c:if test="${goods.goodsSell!=0}">
										<span class="onsale">-${goods.goodsSell}%</span>
									</c:if>

									<c:if test="${goods.goodsSell==0}">
										<span></span>
									</c:if>
								</c:if>
								<!-- 会员用户 -->
								<c:if test="${userScore>=3000}">
									<c:if test="${goods.goodsSell<30}">
										<span class="onsale">-30%</span>
									</c:if>

									<c:if test="${goods.goodsSell>=30}">
										<span class="onsale">-${goods.goodsSell}%</span>
									</c:if>
								</c:if>

								<div class="product-gallery">
									<div id="js-product-big" class="product-gallery__big">
										<img
											src="${pageContext.request.contextPath}/statics/file/${goods.goodsPhoto}"
											alt="">
									</div>

								</div>
							</div>
						</div>

						<div class="product-summary summary col-lg-7">
							<h1 class="h2 product-title">${goods.goodsName}</h1>

							<div class="price">
								<!-- 价格判断 -->

								<!-- 价格 -->
								<!-- userScore<3000为普通用户按照正常折扣算总价 -->
								<c:if test="${userScore<3000}">
									<c:if test="${goods.goodsSell!=0}">
										<del>
											<span class="amount">￥${goods.goodsPrice}</span>
										</del>
									 &nbsp;&nbsp;&nbsp;
									<ins>
											<span class="amount">￥${Math.ceil((1-goods.goodsSell/100)*goods.goodsPrice)}</span>
										</ins>
									</c:if>
									<c:if test="${goods.goodsSell==0}">
										<ins>
											<span class="amount">￥${goods.goodsPrice}</span>
										</ins>
									</c:if>
								</c:if>

								<!-- userScore>=3000为会员用户按照折扣大于7折按七折计算小于7折按原折扣计算 -->
								<c:if test="${userScore>=3000}">
									<!-- 打了折的商品 -->
									<c:if test="${goods.goodsSell!=0}">
										<del>
											<span class="amount">￥${goods.goodsPrice}</span>
										</del>
									 &nbsp;&nbsp;&nbsp;
									 <!-- 小于7折的按7折计算 -->
										<c:if test="${goods.goodsSell<30}">
											<ins>
												<span class="amount">￥${Math.ceil(0.7*goods.goodsPrice)}</span>
											</ins>
										</c:if>
										<!-- 否则按原折扣计算 -->
										<c:if test="${goods.goodsSell>=30}">
											<ins>
												<span class="amount">￥${Math.ceil((1-goods.goodsSell/100)*goods.goodsPrice)}</span>
											</ins>
										</c:if>

									</c:if>

									<!-- 未打折商品 -->
									<c:if test="${goods.goodsSell==0}">
										<del>
											<span class="amount">￥${goods.goodsPrice}</span>
										</del>
									&nbsp;&nbsp;&nbsp;
									<ins>
											<span class="amount">￥${Math.ceil(goods.goodsPrice*0.7)}</span>
										</ins>
									</c:if>
								</c:if>

							</div>

							<form action="/" class="cart-form">
								<div class="cart-form__item quantity quantity">
									<label for="quantity"><strong>Material:</strong></label> <span
										id="quantity" class="select-style qty js-qty"> Body —
										100% cotton trims / other — 100% polyurethane. </span>
								</div>

							</form>

							<a
								href="${pageContext.request.contextPath}/client/addclient_cart/${goods.goodsId}"
								class="btn btn-primary btn-lg add_to_cart_button">Add to
								cart</a> <span style="color: red; font-size: 20px;"></span>

							<div class="product-summary__featured">
								<div class="row">
									<div class="product-featured-item">
										<div class="icon-box icon-box-left icon-box-circle">
											<div class="icon-box__icon">
												<i class="flaticon flaticon-delivery-truck"></i>
											</div>
											<div class="icon-box__title">Free shipping</div>
										</div>
									</div>
									<div class="product-featured-item">
										<div class="icon-box icon-box-left icon-box-circle">
											<div class="icon-box__icon">
												<i class="flaticon flaticon-blocked-padlock"></i>
											</div>
											<div class="icon-box__title">100% secure</div>
										</div>
									</div>
									<div class="product-featured-item">
										<div class="icon-box icon-box-left icon-box-circle">
											<div class="icon-box__icon">
												<i class="flaticon flaticon-refresh-page-arrow"></i>
											</div>
											<div class="icon-box__title">30 day refund</div>
										</div>
									</div>
								</div>
							</div>

							<div class="product-summary__share">
								<div></div>

								<ul class="social-links">
									<li><a href="#"><i class="mdi mdi-pinterest"></i></a></li>
									<li><a href="#"><i class="mdi mdi-facebook"></i></a></li>
									<li><a href="#"><i class="mdi mdi-instagram"></i></a></li>
									<li><a href="#"><i class="mdi mdi-twitter"></i></a></li>
								</ul>
							</div>

							<div class="description-block">
								<h3 class="mb-30">Description</h3>

								<div class="product-description text-content">
									<p>${goods.goodsMessage}</p>
								</div>
							</div>
							<div class="product-attributes">
								<div class="product-attributes__item">
									<strong>Care:</strong> Wipe clean with a damp sponge, do not
									dry clean, do not iron
								</div>
								<div class="product-attributes__item"></div>
							</div>
						</div>


						<section class="comments">
							<h3 class="mb-40">用户评论</h3>
							<c:forEach items="${goodsComments}" var="listcomments">
								<ul class="comment-list">
									<li class="comment">
										<div class="comment-body">
											<div class="comment-avatar">
												<img
													src="${pageContext.request.contextPath}/statics/file/${listcomments.user.userPhoto}"
													alt="">
											</div>
											<div class="comment-content">
												<div class="comment-author">${listcomments.user.userAlice}</div>
												<div class="comment-date">
													<fmt:formatDate value="${listcomments.commentDate }"
														pattern="yyyy-MM-dd" />
												</div>
												<div class="comment-text">${listcomments.commentMessage }</div>

											</div>
										</div>
									</li>
								</ul>
							</c:forEach>
							<div class="comment-respond">
								<h3 class="mb-4">发表评论</h3>
								<span style="color: red;">${err }</span>
								<form class="comment-form" method="post"
									action="${pageContext.request.contextPath}/client/client_goodscomment/${goods.goodsId}">
									<div class="form-group">
										<textarea rows="4" class="form-control" placeholder="你的信息"
											name="commentMessage" required="required"></textarea>
									</div>
									<div class="form-submit mt-3">
										<input type="submit" class="btn btn-primary btn-lg"
											value="发布评论" />
									</div>
								</form>
							</div>
						</section>
					</div>
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
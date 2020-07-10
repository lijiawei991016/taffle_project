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

<title>商品</title>

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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/css/styleButton.css">

<meta name="theme-color" content="#ECECEC">
</head>
<body>
	<div class="head-line"></div>

	<!-- head -->
	<%@ include file="ClientCommon/ClientCommon_header.jsp"%>
	<!-- end of container -->

	<div class="shop-categories-nav">
		<div class="container">
			<ul class="nav justify-content-between">
				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/client/client_goods_by_categoryId?categoryId=0&goodsName=search"
					class="nav-link hoverClass">All</a></li>
				<c:forEach items="${categorys }" var="catg">
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/client/client_goods_by_categoryId?categoryId=${catg.categoryId }&goodsName=search"
						class="nav-link hoverClass">${catg.category}</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="page-wrap archive shop">
		<!-- Breadcrumbs -->
		<nav aria-label="breadcrumb" class="page-breadcrumb">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item">首页</li>
					<li class="breadcrumb-item active" aria-current="page">商品</li>
				</ol>
			</div>
		</nav>

		<div class="page-content">
			<main class="main-content">
			<div class="container">
				<div class="shop-controls d-flex align-items-center"></div>
				<ul class="products columns-4">
					<c:forEach items="${pageInfos.list }" var="goods">
						<li class="product">
							<div class="product-thumb">
								<!-- 商品折扣判断 -->

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

								<a
									href="${pageContext.request.contextPath}/client/client_single_product/${goods.goodsId}"
									class="product-thumb__link"> <img
									src="${pageContext.request.contextPath}/statics/file/${goods.goodsPhoto}"
									alt=""> <span class="btn btn-outline-light shop-link">Shop</span>
								</a>
							</div>
							<div class="product-title">
								<a href="#">${goods.goodsName }</a>
							</div>
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
						</li>
					</c:forEach>
				</ul>


				<nav class="shop-pagination text-center">


					<div class="social-btns">


						<a class="btn facebook"
							href='${pageContext.request.contextPath}/client/client_goods_by_categoryId?pageNo=${pageInfos.firstPage}&categoryId=${categoryId }&goodsName=${goodsName }'>
							<p class="fa fa-twitter">第一页</p>

						</a> <a class="btn facebook"
							href='${pageContext.request.contextPath}/client/client_goods_by_categoryId?pageNo=${pageInfos.pageNum-1}&categoryId=${categoryId }&goodsName=${goodsName }'>
							<li class="fa fa-twitter">上一页</li>

						</a> <a class="btn facebook"
							href='${pageContext.request.contextPath}/client/client_goods_by_categoryId?pageNo=${pageInfos.pageNum+1}&categoryId=${categoryId }&goodsName=${goodsName }'>
							<p class="fa fa-twitter">下一页</p>
						</a> <a class="btn facebook"
							href='${pageContext.request.contextPath}/client/client_goods_by_categoryId?pageNo=${pageInfos.lastPage}&categoryId=${categoryId }&goodsName=${goodsName }'>

							<p class="fa fa-twitter">最后页</p>
						</a>

					</div>
					<br>
					<p>第${pageInfos.pageNum}页,总${pageInfos.pages }页,总
						${pageInfos.total } 条记录</p>
				</nav>
			</div>
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
	<script>
		$(function() {
			$(".hoverClass").hover(function() {
				$(this).addClass("active");
			}, function() {
				$(this).removeClass("active");
			});
		});
	</script>
</body>
</html>
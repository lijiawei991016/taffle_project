<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/statics/images/favicon.png"
	type="image/x-icon">

<title>Cart</title>

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

	<div class="page-wrap cart shop">
		<!-- Breadcrumbs -->
		<nav aria-label="breadcrumb" class="page-breadcrumb">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item">首页</li>
					<li class="breadcrumb-item active" aria-current="page">购物车</li>
				</ol>
			</div>
		</nav>

		<div class="page-content">
			<main class="main-content">
			<div class="container">
				<h1 class="page-title h3 text-center">您的购物车</h1>

				<table class="cart-table cart table">
					<thead>
						<tr>
							<th class="product-thumbnail">Product</th>
							<th class="product-name">&nbsp;</th>
							<th class="product-price">Price</th>
							<th class="product-quantity">Quantity</th>
							<th class="product-remove">&nbsp;</th>
							<th class="product-subtotal">Total</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${goods }" var="goods">

							<tr class="cart-item">
								<td class="product-thumbnail"><a href="single-product.html">

										<img width="170" height="240"
										src="${pageContext.request.contextPath}/statics/file/${goods.goodsPhoto}"
										alt="" class="attachment-shop_thumbnail" />
								</a></td>
								<td class="product-name">
									<h4>
										<a href="single-product.html">${goods.goodsName}</a>
									</h4>
								</td>
								<td class="product-price" data-title="Price: ">
									<!-- 价格判断 --> <!-- 价格 --> <!-- userScore<3000为普通用户按照正常折扣算总价 -->
									<c:if test="${userScore<3000}">
										<c:if test="${goods.goodsSell!=0}">
											<del>
												<span class="amount">￥${goods.goodsPrice}</span>
											</del>
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<ins>
												<span class="amount">￥${Math.ceil((1-goods.goodsSell/100)*goods.goodsPrice)}</span>
											</ins>
										</c:if>
										<c:if test="${goods.goodsSell==0}">
											<ins>
												<span class="amount">￥${goods.goodsPrice}</span>
											</ins>
										</c:if>
									</c:if> <!-- userScore>=3000为会员用户按照折扣大于7折按七折计算小于7折按原折扣计算 --> <c:if
										test="${userScore>=3000}">
										<!-- 打了折的商品 -->
										<c:if test="${goods.goodsSell!=0}">
											<del>
												<span class="amount">￥${goods.goodsPrice}</span>
											</del>
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
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
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<ins>
												<span class="amount">￥${Math.ceil(goods.goodsPrice*0.7)}</span>
											</ins>
										</c:if>
									</c:if>

								</td>
								<td class="product-quantity" data-title="Quantity: ">

									<form
										action="${pageContext.request.contextPath}/client/upclient_cart/${goods.goodsId}">
										<div class="quantity" style="left: 40px; position: relative;">
											<label>数量：</label> <input type="number" name="goodsNumber"
												value="${goods.goodsNumber}"
												style="width: 65px; text-align: center;" step="1" min="1" />&nbsp;&nbsp;&nbsp;个
										</div>
										<a onclick="document:formId.submit()">
											<button class="remove"
												style="top: 173px; position: relative;">
												<span class="remove__text"><b>更新数量</b></span>
											</button>
										</a>
									</form>

								</td>
								<td class="product-remove"><a
									href="${pageContext.request.contextPath}/client/declient_cart/${goods.goodsId}">
										<button class="remove" onclick="return   ok()">
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br /> <i class="flaticon-waste-can"></i> <span
												class="remove__text"><b>移除商品</b></span>
										</button>
								</a></td>
								<td class="product-subtotal" data-title="Total: ">
									<!-- 小计判断 --> <!-- userScore<3000为普通用户按照正常折扣算小计 --> <c:if
										test="${userScore<3000}">
										<c:if test="${goods.goodsSell!=0}">
											<del>
												<span class="amount">￥${goods.goodsPrice*goods.goodsNumber}</span>
											</del>
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<ins>
												<span class="amount">￥${Math.ceil((1-goods.goodsSell/100)*goods.goodsPrice*goods.goodsNumber)}</span>
											</ins>
										</c:if>
										<c:if test="${goods.goodsSell==0}">
											<ins>
												<span class="amount">￥${goods.goodsPrice*goods.goodsNumber}</span>
											</ins>
										</c:if>
									</c:if> <!-- userScore>=3000为会员用户按照折扣大于7折按七折计算小于7折按原折扣计算 --> <c:if
										test="${userScore>=3000}">
										<!-- 打了折的商品 -->
										<c:if test="${goods.goodsSell!=0}">
											<del>
												<span class="amount">￥${goods.goodsPrice*goods.goodsNumber}</span>
											</del>
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<!-- 小于7折的按7折计算 -->
											<c:if test="${goods.goodsSell<30}">
												<ins>
													<span class="amount">￥${Math.ceil(0.7*goods.goodsPrice*goods.goodsNumber)}</span>
												</ins>
											</c:if>
											<!-- 否则按原折扣计算 -->
											<c:if test="${goods.goodsSell>=30}">
												<ins>
													<span class="amount">￥${Math.ceil((1-goods.goodsSell/100)*goods.goodsPrice*goods.goodsNumber)}</span>
												</ins>
											</c:if>

										</c:if>

										<!-- 未打折商品 -->
										<c:if test="${goods.goodsSell==0}">
											<del>
												<span class="amount">￥${goods.goodsPrice*goods.goodsNumber}</span>
											</del>
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<br />
											<ins>
												<span class="amount">￥${Math.ceil(goods.goodsPrice*0.7*goods.goodsNumber)}</span>
											</ins>

										</c:if>
									</c:if>
								</td>
							</tr>
						</c:forEach>



					</tbody>
				</table>

				<div class="row justify-content-between">
					<div class="col-lg-3">
						<h3 class="simple-heading mb-4"></h3>

						<form action="/" class="calc-shipping">

							<div class="form-group"></div>
							<div class="form-group"></div>
							<div class="form-submit"></div>
						</form>
					</div>

					<div class="col-lg-6 cart-total">
						<div
							class="cart-subtotal d-flex justify-content-between align-items-center">
							<span>小计</span> <span>${goods6}${goods4+goods5}</span>
						</div>

						<div class="cart-total__btns text-lg-right">

							<a href="${pageContext.request.contextPath}/client/client_pay"
								class="btn btn-primary btn-lg cart-checkout-btn">支付</a>


						</div>
					</div>
				</div>

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
	<script src="statics/assets/js/custom.js"></script>

	<script type="text/javascript">
		function ok() {
			if (confirm("确定要删除吗(yes/no)")) {
				return true;
			} else {
				return false;
			}
		}
	</script>
</body>
</html>
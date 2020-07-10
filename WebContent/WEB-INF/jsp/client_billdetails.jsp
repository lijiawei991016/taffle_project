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
					<li class="breadcrumb-item active" aria-current="page">订单详情</li>
				</ol>
			</div>
		</nav>

		<div class="page-content">
			<main class="main-content">
			<div class="container">
				<h1 class="page-title h3 text-center">订单</h1>


				<div style="border: 1px solid gray; width: 1300px; height: 550px;">
					<div
						style="width: 48%; height: 100%; float: left; text-align: center;">
						<img
							src="${pageContext.request.contextPath}/statics/images/userBill.jpg"
							width="100%" style="padding-top: 60px;text-align: center;padding-left: 15px;">
					</div>
					<div
						style="width: 48%; height: 100%; float: right; text-align: left;  overflow: auto;">
						<table>
							<tr>
								<td><span><b>订单号：</b></span>${billCode}</td>
							</tr>



							<tr>

								<th><b>商品名称</b></th>
								<th style="width: 100px"><b>商品数量</b></th>
								<th><b>商品单价</b></th>
								<th><b>商品小计</b></th>

							</tr>

							<c:forEach items="${billgoods }" var="billgoods">

								<tr>

									<td>${billgoods.goodsName}</td>
									<td style="text-align: center;">x${billgoods.goodsNumber}</td>
									<td>
										<!-- 价格判断 --> <!-- 价格 --> <!-- userScore<3000为普通用户按照正常折扣算总价 -->
										<c:if test="${userScore<3000}">
											<c:if test="${billgoods.goodsSell!=0}">
												<del>
													<span class="amount">￥${billgoods.goodsPrice}</span>
												</del><br/>
									<ins>
													<span class="amount">￥${Math.ceil((1-billgoods.goodsSell/100)*billgoods.goodsPrice)}</span>
												</ins>
											</c:if>
											<c:if test="${billgoods.goodsSell==0}">
												<ins>
													<span class="amount">￥${billgoods.goodsPrice}</span>
												</ins>
											</c:if>
										</c:if> <!-- userScore>=3000为会员用户按照折扣大于7折按七折计算小于7折按原折扣计算 --> <c:if
											test="${userScore>=3000}">
											<!-- 打了折的商品 -->
											<c:if test="${billgoods.goodsSell!=0}">
												<del>
													<span class="amount">￥${billgoods.goodsPrice}</span>
												</del><br/>
									 <!-- 小于7折的按7折计算 -->
												<c:if test="${billgoods.goodsSell<30}">
													<ins>
														<span class="amount">￥${Math.ceil(0.7*billgoods.goodsPrice)}</span>
													</ins>
												</c:if>
												<!-- 否则按原折扣计算 -->
												<c:if test="${billgoods.goodsSell>=30}">
													<ins>
														<span class="amount">￥${Math.ceil((1-billgoods.goodsSell/100)*billgoods.goodsPrice)}</span>
													</ins>
												</c:if>

											</c:if>

											<!-- 未打折商品 -->
											<c:if test="${billgoods.goodsSell==0}">
												<del>
													<span class="amount">￥${billgoods.goodsPrice}</span>
												</del><br/>
												<ins>
													<span class="amount">￥${Math.ceil(billgoods.goodsPrice*0.7)}</span>
												</ins>
											</c:if>
										</c:if>
									</td>
									<td>
										<!-- 小计判断 --> <!-- userScore<3000为普通用户按照正常折扣算小计 --> <c:if
											test="${userScore<3000}">
											<c:if test="${billgoods.goodsSell!=0}">
												<del>
													<span class="amount">￥${billgoods.goodsPrice*billgoods.goodsNumber}</span>
												</del><br/>
									<ins>
													<span class="amount">￥${Math.ceil((1-billgoods.goodsSell/100)*billgoods.goodsPrice*billgoods.goodsNumber)}</span>
												</ins>
											</c:if>
											<c:if test="${billgoods.goodsSell==0}">
												<ins>
													<span class="amount">￥${billgoods.goodsPrice*billgoods.goodsNumber}</span>
												</ins>
											</c:if>
										</c:if> <!-- userScore>=3000为会员用户按照折扣大于7折按七折计算小于7折按原折扣计算 --> <c:if
											test="${userScore>=3000}">
											<!-- 打了折的商品 -->
											<c:if test="${billgoods.goodsSell!=0}">
												<del>
													<span class="amount">￥${billgoods.goodsPrice*billgoods.goodsNumber}</span>
												</del><br/>
									 <!-- 小于7折的按7折计算 -->
												<c:if test="${billgoods.goodsSell<30}">
													<ins>
														<span class="amount">￥${Math.ceil(0.7*billgoods.goodsPrice*billgoods.goodsNumber)}</span>
													</ins>
												</c:if>
												<!-- 否则按原折扣计算 -->
												<c:if test="${billgoods.goodsSell>=30}">
													<ins>
														<span class="amount">￥${Math.ceil((1-billgoods.goodsSell/100)*billgoods.goodsPrice*billgoods.goodsNumber)}</span>
													</ins>
												</c:if>

											</c:if>

											<!-- 未打折商品 -->
											<c:if test="${billgoods.goodsSell==0}">
												<del>
													<span class="amount">￥${billgoods.goodsPrice*billgoods.goodsNumber}</span>
												</del><br/>
												<ins>
													<span class="amount">￥${Math.ceil(billgoods.goodsPrice*0.7*billgoods.goodsNumber)}</span>
												</ins>

											</c:if>
										</c:if>

									</td>

								</tr>
							</c:forEach>
							<tr>
								<td><span><b>收货地址：${billss.userAddress}</b></span></td>
							</tr>
							<tr>
								<td><span><b>联系电话：${billss.userPhone}</b></span></td>
							</tr>

						</table>
					</div>
				</div>
				<br />
				<div class="row justify-content-between">
					<div class="col-lg-3"></div>

					<div class="col-lg-6 cart-total">
						<div
							class="cart-subtotal d-flex justify-content-between align-items-center">
							<span>总价</span> <span>${goods1+goods2+goods3}</span>
						</div>


						<div class="cart-total__btns text-lg-right">

							<a
								href="${pageContext.request.contextPath}/client/client_userBill"
								class="btn btn-primary btn-lg cart-checkout-btn">返回</a>
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
</body>
</html>
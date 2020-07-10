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

<title>我的订单</title>

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
					<li class="breadcrumb-item active" aria-current="page">我的订单</li>
				</ol>
			</div>
		</nav>

		<div class="page-content">
			<main class="main-content">
			<div class="container">
				<h1 class="page-title h3 text-center">个人订单</h1>


				<div style="border: 1px solid gray; width: 1300px; height: 500px; overflow: auto;">

					<table>

						<tr>
							<td><span><b>订单号</b></span></td>
							<td><span><b>商品名称列表</b></span></td>
							<td><span><b>收货地址</b></span></td>
							<td><span><b>联系电话</b></span></td>
							<td><span><b>状态</b></span></td>
							<td style="text-align: center;"><span><b>操作</b></span></td>
						</tr>
						<c:forEach items="${bills}" var="bill">
							<tr>
								<td><span>${bill.billCode}</span></td>
								<td><span>${bill.billGoods}</span></td>
								<td><span>${bill.userAddress}</span></td>
								<td><span>${bill.userPhone}</span></td>
								<c:choose>
									<c:when test="${bill.status==0}">
										<td class="center"><span>未支付</span></td>
									</c:when>
									<c:when test="${bill.status==1}">
										<td class="center"><span>已支付</span></td>
									</c:when>
									<c:when test="${bill.status==2}">
										<td class="center"><span>已发货</span></td>
									</c:when>
									<c:when test="${bill.status==3}">
										<td class="center"><span>已确认收货</span></td>
									</c:when>
									<c:otherwise>
										<td class="center"><span>订单已完成</span></td>
									</c:otherwise>
								</c:choose>
								<td style="text-align: center;">
								<c:choose>
									<c:when test="${bill.status==0}">
										<span><a href="${pageContext.request.contextPath}/client/client_otherpay/${bill.billCode}"><b>去支付</b></a>
										</span>&nbsp;&nbsp;&nbsp;&nbsp;
									</c:when>
									<c:otherwise>
										<span><a href="${pageContext.request.contextPath}/client/client_billdetails/${bill.billCode}"><b>查看订单</b></a>
										</span>&nbsp;&nbsp;&nbsp;&nbsp;
									</c:otherwise>
								</c:choose>
									<span><a
										href="${pageContext.request.contextPath}/client/sure_bill/${bill.billCode}"><b>确认收货</b></a></span>&nbsp;&nbsp;&nbsp;&nbsp;
									<span><a
										href="${pageContext.request.contextPath}/client/delete_bill/${bill.billCode}"
										onclick="return   ok()"><b>删除订单</b></a></span></td>

							</tr>
						</c:forEach>



					</table>

				</div>
				<br />


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
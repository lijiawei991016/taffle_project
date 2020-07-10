<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isErrorPage="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/statics/images/favicon.png"
	type="image/x-icon">

<title>Page not found</title>

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

	<div class="page-wrap">
		<!-- Page content -->
		<div class="page-content">
			<main class="main-content">
			<section class="not-found-wrap text-center">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-8">
							<h2>500</h2>
							<p><%=exception%></p>
							<a href="/" class="btn btn-primary btn-lg">返回首页</a>
						</div>
					</div>
				</div>
			</section>
			</main>
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
	<script
		src="${pageContext.request.contextPath}/statics/assets/js/custom.js"></script>
</body>
</html>
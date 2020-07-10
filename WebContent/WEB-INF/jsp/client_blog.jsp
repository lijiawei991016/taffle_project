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

<title>Blog</title>

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

	<div class="page-wrap archive blog">

		<!-- Breadcrumbs -->
		<nav aria-label="breadcrumb" class="page-breadcrumb">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item">首页</li>
					<li class="breadcrumb-item active" aria-current="page">博客</li>
				</ol>
			</div>
		</nav>

		<!-- Page content -->
		<div class="page-content">
			<div class="container">
				<div class="row justify-content-between">
					<main id="main" class="main-content col-lg-8">
					<h1 class="screen-reader-text">博客</h1>
					<div class="post-list">
						<c:forEach items="${listblogs }" var="listblog">
							<article class="post-item">
								<a class="post-thumb"> <img
									src="${pageContext.request.contextPath}/statics/file/${listblog.blogPhoto }"
									alt="">
								</a>
								<div class="post-item__content">
									<h3 class="post-title">${listblog.blogTitle }</h3>
									<div class="post-date">
										<fmt:formatDate value="${listblog.blogCreateDate }"
											pattern="yyyy-MM-dd" />
									</div>
									<a
										href="${pageContext.request.contextPath}/client/client_single_post/${listblog.blogId }"
										class="read-more btn btn-outline-primary btn-lg">点击阅读更多</a>
								</div>
							</article>
						</c:forEach>
					</div>
					</main>
					<aside class="sidebar col-lg-3">
						<div class="sidebar-widget">
							<h4 class="widget-title">标题</h4>
							<ul>
								<c:forEach items="${listblogs }" var="listblog">
									<h4 class="post-title">
										<a
											href="${pageContext.request.contextPath}/client/client_single_post/${listblog.blogId }">${listblog.blogTitle }</a>
									</h4>
								</c:forEach>
							</ul>
						</div>

					</aside>
					<!-- /.sidebar -->
				</div>
			</div>
		</div>
		<!-- /.page-wrap -->
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
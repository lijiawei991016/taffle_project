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

<title>博客详情页</title>

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

	<div class="page-wrap single blog">

		<!-- Breadcrumbs -->
		<nav aria-label="breadcrumb" class="page-breadcrumb">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item">首页</li>
					<li class="breadcrumb-item">博客详情</li>
					<li class="breadcrumb-item active" aria-current="page">${blogs.blogTitle }</li>
				</ol>
			</div>
		</nav>

		<!-- Page content -->
		<div class="page-content">
			<div class="container">
				<div class="row justify-content-between">
					<main id="main" class="main-content col-lg-8">
					<article class="post-content">
						<div class="post-thumb">
							<img
								src="${pageContext.request.contextPath}/statics/file/${blogs.blogPhoto }"
								alt="">
						</div>

						<h1 class="h3 post-title">${blogs.blogTitle }</h1>

						<div class="post-date">
							<fmt:formatDate value="${blogs.blogCreateDate }"
								pattern="yyyy-MM-dd" />
						</div>

						<div class="post-text">
							<p>${blogs.blogMessage }</p>

						</div>
					</article>
					<!-- /.post-content -->

					<section class="comments">
						<h3 class="mb-40">评论</h3>
						<c:forEach items="${listblogsays}" var="listblogsay">
							<ul class="comment-list">
								<li class="comment">
									<div class="comment-body">
										<div class="comment-avatar">
											<img
												src="${pageContext.request.contextPath}/statics/file/${listblogsay.user.userPhoto}"
												alt="">
										</div>
										<div class="comment-content">
											<div class="comment-author">${listblogsay.user.userAlice}</div>
											<div class="comment-date">
												<fmt:formatDate value="${listblogsay.sayCreateDate }"
													pattern="yyyy-MM-dd" />
											</div>
											<div class="comment-text">${listblogsay.sayMessage }</div>

										</div>
									</div>
								</li>
							</ul>
						</c:forEach>
						<div class="comment-respond">
							<h3 class="mb-4">发表评论</h3>
							<span style="color: red;">${err }</span>
							<form method="post" class="comment-form"
								action="${pageContext.request.contextPath}/client/client_add_blogasy/${blogs.blogId}">
								<div class="form-group">
									<textarea rows="4" class="form-control"
										placeholder="Your message" name="sayMessage"
										required="required"></textarea>
								</div>
								<div class="form-submit mt-3">
									<input type="submit" class="btn btn-primary btn-lg" value="发布" />
								</div>
							</form>
						</div>
					</section>
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
								<h4 class="post-title">
										<a
											href="${pageContext.request.contextPath}/client/client_list_blog">返回博客页</a>
									</h4>
							</ul>
						</div>

					</aside>
					<!-- /.sidebar -->
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
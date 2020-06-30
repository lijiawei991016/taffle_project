<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="statics/images/favicon.png" type="image/x-icon">

	<title>Shop</title>

	<!-- Fonts -->
	<link rel="stylesheet" href="statics/assets/fonts/Lato/Lato.css">

	<!-- Icons -->
	<link rel="stylesheet" href="statics/assets/fonts/flaticon/flaticon.css">
	<link rel="stylesheet" href="statics/assets/fonts/webfont/css/materialdesignicons.min.css">

	<!-- Libs -->
	<link rel="stylesheet" href="statics/libs/bootstrap-4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="statics/libs/select2/css/select2.min.css">
	<link rel="stylesheet" href="statics/libs/slick/slick.css">

	<!-- Theme -->
	<link rel="stylesheet" href="statics/assets/css/style.css">
	<meta name="theme-color" content="#ECECEC">
</head>
<body>
	<div class="head-line"></div>

	<!-- head -->
<%@ include file="ClientCommon/ClientCommon_header.jsp" %>

	<div class="page-wrap archive shop">
		<!-- Breadcrumbs -->
		<nav aria-label="breadcrumb" class="page-breadcrumb">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">Shop</li>
				</ol>
			</div>
		</nav>

		<div class="page-content">
			<main class="main-content">
				<div class="container">
					<div class="shop-controls d-flex align-items-center">
						<div class="shop-control">
							<label for="per_page" class="control-label">View:</label>
							<select id="per_page" name="perpage" class="prod-per-page js-select2 select-style">
								<option value="12">12</option>
								<option value="24">24</option>
							</select>
						</div>
						<div class="shop-control">
							<label for="order_by" class="control-label">Sort by:</label>
							<select id="order_by" name="orderby" class="orderby js-select2 select-style">
								<option value="1">Newest to oldest</option>
								<option value="1">Oldest to newest</option>
							</select>
						</div>
					</div>

					<ul class="products columns-4">
						<li class="product">
							<div class="product-thumb">
								<span class="onsale">-30%</span>
								<a href="single-product.html" class="product-thumb__link">
									<img src="statics/images/02_catalogue_page_001.jpg" alt="">
									<span class="btn btn-outline-light shop-link">Shop</span>
								</a>
							</div>
							<div class="product-title"><a href="single-product.html">Touchless bottle</a></div>
							<div class="price">
								<ins><span class="amount">$15.00</span></ins>
								<del><span class="amount">$178.00</span></del>
							</div>
						</li>

						<li class="product">
							<div class="product-thumb">
								<a href="single-product.html" class="product-thumb__link">
									<img src="statics/images/02_catalogue_page_002.jpg" alt="">
									<span class="btn btn-outline-light shop-link">Shop</span>
								</a>
							</div>
							<div class="product-title"><a href="single-product.html">Coffee machine</a></div>
							<div class="price">
								<span class="amount">$178.00</span>
							</div>
						</li>

						<li class="product">
							<div class="product-thumb">
								<a href="single-product.html" class="product-thumb__link">
									<img src="statics/images/01_home_page_007.jpg" alt="">
									<span class="btn btn-outline-light shop-link">Shop</span>
								</a>
							</div>
							<div class="product-title"><a href="single-product.html">Wood tablet deck</a></div>
							<div class="price">
								<span class="amount">$25.00</span>
							</div>
						</li>
						<li class="product">
							<div class="product-thumb">
								<a href="single-product.html" class="product-thumb__link">
									<img src="statics/images/02_catalogue_page_004.jpg" alt="">
									<span class="btn btn-outline-light shop-link">Shop</span>
								</a>
							</div>
							<div class="product-title"><a href="single-product.html">Stone carpet</a></div>
							<div class="price">
								<span class="amount">$34.00</span>
							</div>
						</li>

						<li class="product">
							<div class="product-thumb">
								<a href="single-product.html" class="product-thumb__link">
									<img src="statics/images/02_catalogue_page_005.jpg" alt="">
									<span class="btn btn-outline-light shop-link">Shop</span>
								</a>
							</div>
							<div class="product-title"><a href="single-product.html">poly knife</a></div>
							<div class="price">
								<span class="amount">$8.00</span>
							</div>
						</li>

						<li class="product">
							<div class="product-thumb">
								<a href="single-product.html" class="product-thumb__link">
									<img src="statics/images/01_home_page_006.jpg" alt="">
									<span class="btn btn-outline-light shop-link">Shop</span>
								</a>
							</div>
							<div class="product-title"><a href="single-product.html">Dutch grey bag</a></div>
							<div class="price">
								<span class="amount">$33.00</span>
							</div>
						</li>

						<li class="product">
							<div class="product-thumb">
								<a href="single-product.html" class="product-thumb__link">
									<img src="statics/images/02_catalogue_page_007.jpg" alt="">
									<span class="btn btn-outline-light shop-link">Shop</span>
								</a>
							</div>
							<div class="product-title"><a href="single-product.html">Monaco Set lamp</a></div>
							<div class="price">
								<span class="amount">$19.00</span>
							</div>
						</li>

						<li class="product">
							<div class="product-thumb">
								<a href="single-product.html" class="product-thumb__link">
									<img src="statics/images/02_catalogue_page_008.jpg" alt="">
									<span class="btn btn-outline-light shop-link">Shop</span>
								</a>
							</div>
							<div class="product-title"><a href="single-product.html">Cosmo ice bottle</a></div>
							<div class="price">
								<span class="amount">$27.00</span>
							</div>
						</li>

						<li class="product">
							<div class="product-thumb">
								<a href="single-product.html" class="product-thumb__link">
									<img src="statics/images/01_home_page_005.jpg" alt="">
									<span class="btn btn-outline-light shop-link">Shop</span>
								</a>
							</div>
							<div class="product-title"><a href="single-product.html">Cogen warm lamp</a></div>
							<div class="price">
								<span class="amount">$56.00</span>
							</div>
						</li>

						<li class="product">
							<div class="product-thumb">
								<a href="single-product.html" class="product-thumb__link">
									<img src="statics/images/02_catalogue_page_010.jpg" alt="">
									<span class="btn btn-outline-light shop-link">Shop</span>
								</a>
							</div>
							<div class="product-title"><a href="single-product.html">green Card pen</a></div>
							<div class="price">
								<span class="amount">$12.00</span>
							</div>
						</li>

						<li class="product">
							<div class="product-thumb">
								<span class="onsale">-25%</span>
								<a href="single-product.html" class="product-thumb__link">
									<img src="statics/images/02_catalogue_page_011.jpg" alt="">
									<span class="btn btn-outline-light shop-link">Shop</span>
								</a>
							</div>
							<div class="product-title"><a href="single-product.html">Confetti lamp</a></div>
							<div class="price">
								<ins><span class="amount">$45.00</span></ins>
								<del><span class="amount">$60.00</span></del>
							</div>
						</li>

						<li class="product">
							<div class="product-thumb">
								<a href="single-product.html" class="product-thumb__link">
									<img src="statics/images/02_catalogue_page_012.jpg" alt="">
									<span class="btn btn-outline-light shop-link">Shop</span>
								</a>
							</div>
							<div class="product-title"><a href="single-product.html">hop tablet cover</a></div>
							<div class="price">
								<span class="amount">$20.00</span>
							</div>
						</li>
					</ul>

					<nav class="shop-pagination text-center">
						<ul class="pagination justify-content-center">
							<!-- <li>
							  <a href="#" aria-label="Previous">
								<span aria-hidden="true"><i class="flaticon-left-arrow-sign"></i> Previous</span>
							  </a>
							</li> -->
							<li class="active"><a href="#">01</a></li>
							<li><a href="#">02</a></li>
							<li><a href="#">03</a></li>
							<li><a href="#">04</a></li>
							<li><a href="#">05</a></li>
							<li><a href="#">...</a></li>
							<li><a href="#">28</a></li>
							<li>
								<a href="#" aria-label="Next">
									<span aria-hidden="true">Next <i class="flaticon-right-direction"></i></span>
								</a>
							</li>
						</ul>
					</nav>
				</div>
			</main>
		</div>
	</div>

	<!-- footer -->
<%@ include file="ClientCommon/ClientCommon_footer.jsp" %>

	<div id="js-back-to-top" class="back-to-top"><i class="flaticon-up-arrow-sign"></i> Page top</div>

	<div class="full-search-wrap">
		<div class="full-search container">
			<div class="close-s float-right js-close-search flaticon-cancel-button fi-2x"></div>
			<form action="/" class="search-full-form">
				<div class="position-relative">
					<i class="search-icon flaticon-magnifying-glass-browser fi-2x"></i>
					<input type="text" id="s-full" class="search-full-form__input" placeholder="Search">
					<input type="submit" class="d-none">
				</div>
				<p class="hint">Type in your search and press enter</p>
			</form>
		</div>
	</div>

	<!-- Libs -->
	<script src="statics/libs/jquery-2.2.3.min.js"></script>
	<script src="statics/libs/bootstrap-4.3.1/js/bootstrap.min.js"></script>
	<script src="statics/libs/select2/js/select2.min.js"></script>
	<script src="statics/libs/slick/slick.min.js"></script>

	<!-- Theme -->
	<script src="statics/assets/js/custom.js"></script>
</body>
</html>
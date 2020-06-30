<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="statics/images/favicon.png" type="image/x-icon">

	<title>DUTCH GREY BAG - Shop</title>

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

	<div class="page-wrap single shop">
		<!-- Breadcrumbs -->
		<nav aria-label="breadcrumb" class="page-breadcrumb">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/">Home</a></li>
					<li class="breadcrumb-item"><a href="shop.html">Shop</a></li>
					<li class="breadcrumb-item"><a href="shop.html">Sale</a></li>
					<li class="breadcrumb-item active" aria-current="page">Dutch Grey Bag</li>
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
									<span class="onsale">-25%</span>
									<div class="product-gallery">
										<div id="js-product-big" class="product-gallery__big">
											<img src="statics/images/05_home_page_001.jpg" alt="">
										</div>
										<div id="js-product-nav" class="product-gallery-thumbs">
											<div class="product-gallery-thumbs__item active" data-large-src="statics/images/05_home_page_001.jpg">
												<img src="statics/images/05_home_page_001.jpg" alt="">
											</div>
											<div class="product-gallery-thumbs__item" data-large-src="statics/images/product-single-big-2.jpg">
												<img src="statics/images/05_home_page_003.jpg" alt="">
											</div>
											<div class="product-gallery-thumbs__item" data-large-src="statics/images/product-single-big-3.jpg">
												<img src="statics/images/05_home_page_004.jpg" alt="">
											</div>
											<div class="product-gallery-thumbs__item" data-large-src="statics/images/product-single-big-4.jpg">
												<img src="statics/images/05_home_page_005.jpg" alt="">
											</div>
											<div class="product-gallery-thumbs__item" data-large-src="statics/images/product-single-big-5.jpg">
												<img src="statics/images/05_home_page_006.jpg" alt="">
											</div>
											<div class="product-gallery-thumbs__item" data-large-src="statics/images/product-single-big-6.jpg">
												<img src="statics/images/05_home_page_007.jpg" alt="">
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="product-summary summary col-lg-7">
								<h1 class="h2 product-title">dutch grey bag</h1>

								<div class="price">
									<ins><span class="amount">$33.00</span></ins>
									<del><span class="amount">$44.00</span></del>
								</div>

								<form action="/" class="cart-form">
									<div class="cart-form__item quantity quantity">
										<label for="quantity">Qty:</label>
										<select id="quantity" class="select-style qty js-qty">
											<option value="usd">1</option>
											<option value="eur">2</option>
											<option value="gbr">3</option>
										</select>
									</div>

									<div class="color-variants">
										<div>Color: <span id="active-color">Gray</span></div>
										<ul class="colors-list">
											<li class="colors-list__item colors-list__item_active"><a href="single-product.html"><span class="prod-color" style="background-color: #7E7D82"></span></a></li>
											<li class="colors-list__item"><a href="single-product.html"><span class="prod-color" style="background-color: #333339"></span></a></li>
										</ul>
									</div>
								</form>

								<a href="cart.html" class="btn btn-primary btn-lg add_to_cart_button">Add to cart</a>

								<div class="product-summary__featured">
									<div class="row">
										<div class="product-featured-item">
											<div class="icon-box icon-box-left icon-box-circle">
												<div class="icon-box__icon"><i class="flaticon flaticon-delivery-truck"></i></div>
												<div class="icon-box__title">Free shipping</div>
											</div>
										</div>
										<div class="product-featured-item">
											<div class="icon-box icon-box-left icon-box-circle">
												<div class="icon-box__icon"><i class="flaticon flaticon-blocked-padlock"></i></div>
												<div class="icon-box__title">100% secure</div>
											</div>
										</div>
										<div class="product-featured-item">
											<div class="icon-box icon-box-left icon-box-circle">
												<div class="icon-box__icon"><i class="flaticon flaticon-refresh-page-arrow"></i></div>
												<div class="icon-box__title">30 day refund</div>
											</div>
										</div>
									</div>
								</div>

								<div class="product-summary__share">
									<div>Share:</div>

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
										<p>Dutch Bag crafts high quality tees and accessories that are comfortable,
											stylish, and imbued with the laid back spirit of Taffle. Comfortably holds
											your sneakers and your laptop in addition to a plethora of other
											necessities, while keeping everything organized and well protected.
										</p>
									</div>
								</div>
								<div class="product-attributes">
									<div class="product-attributes__item">
										<strong>Material:</strong>
										Body — 100% cotton trims / other — 100% polyurethane.
									</div>
									<div class="product-attributes__item">
										<strong>Care:</strong>
										Wipe clean with a damp sponge, do not dry clean, do not iron
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<section class="comments">
                            <h3 class="mb-40">3 comments</h3>
                            <ul class="comment-list">
                                <li class="comment">
                                    <div class="comment-body">
                                        <div class="comment-avatar">
                                            <img src="statics/images/13_blog_details_page_005.jpg" alt="">
                                        </div>
                                        <div class="comment-content">
                                            <div class="comment-author">Leo Daniels</div>
                                            <div class="comment-date">14 Oct 2016 at 16:41am</div>
                                            <div class="comment-text">Increasing prosperity in our lives can be accomplished
                                                by having the right frame of mind. The truth is, our thoughts are very
                                                powerful.</div>
                                            <div class="comment-reply">
                                                <button type="button" class="btn btn-outline-primary btn-sm">Reply</button>
                                            </div>
                                        </div>
                                    </div>
                                    <ul class="children">
                                        <li class="comment">
                                            <div class="comment-body">
                                                <div class="comment-avatar">
                                                    <img src="statics/images/13_blog_details_page_006.jpg" alt="">
                                                </div>
                                                <div class="comment-content">
                                                    <div class="comment-author">Florence Curry</div>
                                                    <div class="comment-date">07 Feb 2016 at 14:11am</div>
                                                    <div class="comment-text">Notes are very powerful. </div>
                                                    <div class="comment-reply">
                                                        <button type="button" class="btn btn-outline-primary btn-sm">Reply</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li class="comment">
                                    <div class="comment-body">
                                        <div class="comment-avatar">
                                            <img src="statics/images/13_blog_details_page_007.jpg" alt="">
                                        </div>
                                        <div class="comment-content">
                                            <div class="comment-author">Paul Gutierrez</div>
                                            <div class="comment-date">21 Jul 2015 at 15:34 am</div>
                                            <div class="comment-text">It is never too late to become what you might have
                                                been.</div>
                                            <div class="comment-reply">
                                                <button type="button" class="btn btn-outline-primary btn-sm">Reply</button>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>

                            <div class="comment-respond">
                                <h3 class="mb-4">Post a comment</h3>

                                <form class="comment-form">
                                    <div class="form-row">
                                        <div class="form-group col-lg-6">
                                            <input type="text" class="form-control" placeholder="Name">
                                        </div>
                                        <div class="form-group col-lg-6">
                                            <input type="text" class="form-control" placeholder="Last name">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <textarea rows="4" class="form-control" placeholder="Your message"></textarea>
                                    </div>
                                    <div class="form-submit mt-3">
                                        <input type="submit" class="btn btn-primary btn-lg" value="Post comment"/>
                                    </div>
                                </form>
                            </div>
                        </section>
				</section>
						
				<section class="section-related">
					<div class="container">
						<h2 class="section-title text-center h3">Other items you may like</h2>
						<ul class="products featured-products columns-5">
							<li class="product">
								<div class="product-thumb">
									<span class="onsale">-30%</span>
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
								<div class="product-title"><a href="single-product.html">Green Card pen</a></div>
								<div class="price">
									<span class="amount">$12.00</span>
								</div>
							</li>
							<li class="product">
								<div class="product-thumb">
									<a href="single-product.html" class="product-thumb__link">
										<img src="statics/images/02_catalogue_page_011.jpg" alt="">
										<span class="btn btn-outline-light shop-link">Shop</span>
									</a>
								</div>
								<div class="product-title"><a href="single-product.html">CONFETTI LAMP</a></div>
								<div class="price">
									<span class="amount">$45.00</span>
								</div>
							</li>
							<li class="product">
								<div class="product-thumb">
									<a href="single-product.html" class="product-thumb__link">
										<img src="statics/images/02_catalogue_page_012.jpg" alt="">
										<span class="btn btn-outline-light shop-link">Shop</span>
									</a>
								</div>
								<div class="product-title"><a href="single-product.html">HOT TABLET COVER</a></div>
								<div class="price">
									<span class="amount">$20.00</span>
								</div>
							</li>
							<li class="product">
								<div class="product-thumb">
									<a href="single-product.html" class="product-thumb__link">
										<img src="statics/images/02_catalogue_page_008.jpg" alt="">
										<span class="btn btn-outline-light shop-link">Shop</span>
									</a>
								</div>
								<div class="product-title"><a href="single-product.html">COSMO ICE BOTTLE</a></div>
								<div class="price">
									<span class="amount">$27.00</span>
								</div>
							</li>
						</ul>
					</div>
				</section>
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
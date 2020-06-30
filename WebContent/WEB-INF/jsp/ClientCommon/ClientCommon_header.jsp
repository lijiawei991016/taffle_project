<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<header class="page-header header-home">
		<div class="container">
			<div class="top-bar row align-items-center">
				<div class="search col-lg-4">
					<div class="form-search-toggle js-open-search">
						<i class="search-icon flaticon-magnifying-glass-browser fi-2x"></i>
						<span>Search</span>
					</div>
					<div id="js-open-mob-menu" class="mob-menu-toggle">
						<span>Menu</span> <i class="flaticon-menu-options fi-2x"></i>
					</div>
				</div>

				<div class="logo col-lg-4">
					 <a href="index.html"><img src="statics/images/logo.png" alt=""></a>
				</div>
				<div class="quick-access-menu col-lg-4">
					<div class="quick-access__item">
						<div class="select-currency">
							<select class="select-style js-select2">
								<option value="usd">USD</option>
								<option value="eur">EUR</option>
								<option value="gbr">GBR</option>
							</select>
						</div>
					</div>
					<div class="quick-access__item quick-access__item_border-r">
						<a href="#"><span class="account"><i class="flaticon-messenger-user-avatar fi-2x"></i></span></a>
					</div>

					<div class="quick-access__item">
						<div class="header-mini-cart">
							<a href="cart.html" class="mini-cart-link">
								<i class="cart__icon flaticon-online-shopping-cart fi-2x"></i>
								<span class="mini-cart-link__qty">0 items</span>
							</a>
							<div class="mini-cart">
								<div class="mini-cart__content">
									<div class="empty-message">You have no items in your cart</div>
									<a href="shop.html" class="btn btn-primary btn-lg mini-cart__btn">shop more</a>
								</div>
								<div class="mini-cart__footer">
									<div class="icon-box icon-box-left justify-content-center">
										<div class="icon-box__icon"><i class="flaticon flaticon-delivery-truck"></i></div>
										<div class="icon-box__title">Delivery to all regions</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div><!-- end of quick-access-menu -->
			</div> <!-- end of top-bar -->

			<nav class="header-navigation">
				<button class="mob-menu-close" id="js-close-mob-menu">
					<span>Close</span>
					<i class="flaticon-cancel-button"></i>
				</button>

				<ul class="nav justify-content-center">
					<li class="nav-item">
						<a class="nav-link active" href="index.html">Home</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="shop.html">Shop</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="promo.html">Promo</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="about.html">About</a>
						<ul class="sub-menu">
							<li class="nav-item">
								<a class="nav-link" href="shortcodes.html">Shortcodes</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="404.html">404 Page</a>
							</li>
						</ul>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/client/client_list_blog">Blog</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="contact.html">Contact</a>
					</li>
				</ul>
			</nav>
		</div>
	</header>
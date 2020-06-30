<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="statics/images/favicon.png" type="image/x-icon">

	<title>Cart</title>

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

	<div class="page-wrap cart shop">
		<!-- Breadcrumbs -->
		<nav aria-label="breadcrumb" class="page-breadcrumb">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">Cart</li>
				</ol>
			</div>
		</nav>

		<div class="page-content">
			<main class="main-content">
				<div class="container">
					<h1 class="page-title h3 text-center">Your cart</h1>

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
						<tr class="cart-item">
							<td class="product-thumbnail">
								<a href="single-product.html">
									<img width="170" height="240" src="statics/images/cart1.jpg" alt="" class="attachment-shop_thumbnail"/>
								</a>
							</td>
							<td class="product-name">
								<h4><a href="single-product.html">Cogen warm lamp</a></h4>
							</td>
							<td class="product-price" data-title="Price: ">
								<span class="amount">$56.00</span>
							</td>
							<td class="product-quantity" data-title="Quantity: ">
								<div class="quantity">
									<select class="select-style js-select2">
										<option value="usd">1</option>
										<option value="eur">2</option>
										<option value="gbr">3</option>
									</select>
								</div>
							</td>
							<td class="product-remove">
								<button class="remove">
									<i class="flaticon-waste-can"></i>
									<span class="remove__text">Remove</span>
								</button>
							</td>
							<td class="product-subtotal" data-title="Total: ">
								<span class="amount">$56.00</span>
							</td>
						</tr>
						<tr class="cart-item">
							<td class="product-thumbnail">
								<a href="single-product.html">
									<img width="170" height="240" src="statics/images/cart2.jpg" alt="" class="attachment-shop_thumbnail"/>
								</a>
							</td>
							<td class="product-name">
								<h4><a href="single-product.html">roniq watch</a></h4>
							</td>
							<td class="product-price" data-title="Price:">
								<span class="amount">$128.00</span>
							</td>
							<td class="product-quantity" data-title="Quantity:">
								<div class="quantity">
									<select class="select-style">
										<option value="usd">1</option>
										<option value="eur">2</option>
										<option value="gbr">3</option>
									</select>
								</div>
							</td>
							<td class="product-remove">
								<button class="remove">
									<i class="flaticon-waste-can"></i>
									<span class="remove__text">Remove</span>
								</button>
							</td>
							<td class="product-subtotal" data-title="Total:">
								<span class="amount">$128.00</span>
							</td>
						</tr>
						</tbody>
					</table>

					<div class="row justify-content-between">
						<div class="col-lg-3">
							<h3 class="simple-heading mb-4">Calculate shipping</h3>

							<form action="/" class="calc-shipping">
								<div class="form-group">
									<select class="form-control js-select2" data-placeholder="Choose country">
										<option value="">Choose country</option> <!-- Require for select placeholder -->
										<option value="Canada">Canada</option>
										<option value="China">China</option>
										<option value="Ukraine">Ukraine</option>
										<option value="USA">USA</option>
									</select>
								</div>
								<div class="form-group">
									<select class="form-control js-select2" data-placeholder="Select state">
										<option value="">Select state</option> <!-- Require for select placeholder -->
										<option value="Arizona">Arizona</option>
										<option value="California">California</option>
									</select>
								</div>
								<div class="form-group">
									<input type="text" class="form-control" placeholder="Zip / Postal code">
								</div>
								<div class="form-submit">
									<input type="submit" class="btn btn-outline-primary btn-block" name="update_cart" value="Calculate" />
								</div>
							</form>
						</div>

						<div class="col-lg-6 cart-total">
							<div class="cart-subtotal d-flex justify-content-between align-items-center">
								<span>Subtotal</span>
								<span>$128.00</span>
							</div>

							<div class="cart-total__btns text-lg-right">
								<button class="btn btn-outline-primary btn-lg cart-update-btn">Update</button>
								<a href="checkout.html" class="btn btn-primary btn-lg cart-checkout-btn">Checkout</a>
							</div>
						</div>
					</div>

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
			<form action="/" class=" search-full-form">
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
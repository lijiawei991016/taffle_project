<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<footer class="page-footer">
	<div class="container">
		<div class="foot-info row">
			<div class="col-md-8">
				<div class="d-lg-flex align-items-end text-center text-md-left">
					<a href="${pageContext.request.contextPath}//" class="logo-footer">
						<img
						src="${pageContext.request.contextPath}/statics/images/logo-white.png"
						alt="">
					</a>
					<div class="ml-lg-4 page-footer__text">Is a design-focused
						wordpress theme for unique products</div>
				</div>
			</div>

			<div class="social col-md-4">
				<span>Follow us:</span>
				<ul class="social-links ml-md-3">
					<li><a href="#"><i class="mdi mdi-pinterest"></i></a></li>
					<li><a href="#"><i class="mdi mdi-facebook"></i></a></li>
					<li><a href="#"><i class="mdi mdi-instagram"></i></a></li>
					<li><a href="#"><i class="mdi mdi-twitter"></i></a></li>
				</ul>
			</div>
		</div>

		<nav class="footer-navigation">
			<ul class="nav justify-content-center">
				<li class="nav-item"><a class="nav-link active"
					href="${pageContext.request.contextPath}//">首页</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/client/client_goods_by_categoryId?categoryId=0&goodsName=search">商品</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/client/client_promo">促销</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/client/client_list_blog">博客</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/client/client_view_contact">联系我们</a>
				</li>
			</ul>
		</nav>

		<div class="footer-bottom">
			<div class="copyright">Copyright &copy; 2020.Company name All
				rights reserved.</div>
			<ul class="footer-bottom__menu">
				<li><a href="#">Privacy Policy</a></li>
				<li><a href="#">Terms of use</a></li>
			</ul>
		</div>
	</div>
</footer>
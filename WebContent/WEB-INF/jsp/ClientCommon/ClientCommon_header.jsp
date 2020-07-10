<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<header class="page-header header-home">
	<div class="container">
		<div class="top-bar row align-items-center">
			<div class="search col-lg-4">
				<div>
					<form
						action="${pageContext.request.contextPath}/client/client_goods_by_categoryId"
						method="post">
						<i class="search-icon flaticon-magnifying-glass-browser fi-2x"></i>
						<c:choose>
							<c:when test="${goodsName ==null }">
								<input type="text" placeholder="search" name="goodsName" />&nbsp;&nbsp;
							</c:when>
							<c:otherwise>
								<input type="text" placeholder="${goodsName }" name="goodsName" />&nbsp;&nbsp;
							</c:otherwise>
						</c:choose>
						<input type="hidden" value="${categoryId }" /> <input
							type="submit" value="搜索" />
					</form>
				</div>
				<div id="js-open-mob-menu" class="mob-menu-toggle">
					<span>Menu</span> <i class="flaticon-menu-options fi-2x"></i>
				</div>
			</div>

			<div class="logo col-lg-4">
				<a href="${pageContext.request.contextPath}//"><img
					src="${pageContext.request.contextPath}/statics/images/logo.png"
					alt=""></a>
			</div>
			<div class="quick-access-menu col-lg-4">

				<div class="quick-access__item quick-access__item_border-r">
					<c:choose>
						<c:when test="${empty loginer }">
							<span class="account"><i
								class="flaticon-messenger-user-avatar fi-2x"></i><a
								href="${pageContext.request.contextPath}/login"><b>请登录</b></a></a></span>
						</c:when>
						<c:otherwise>
							<c:if test="${loginer.userScore >= 3000}">
								<img
									src="${pageContext.request.contextPath}/statics/images/member.jpg"
									width="30px" height="30px" />
							</c:if>
							<i class="flaticon-messenger-user-avatar fi-2x"></i>
							<span style="color: red;">&nbsp;<b>你好，${loginer.userAlice}</b></span>
                    			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
								href="${pageContext.request.contextPath}/loginer_out"><b>登出</b></a>
						</c:otherwise>
					</c:choose>

				</div>
				<div class="quick-access__item">
					<div id="userSelect">
						<!-- 登陆后才有个人信息设置修改操作 -->
						<c:if test="${!empty loginer }">
							<div class="container" style="height: 41px;">
								<nav class="header-navigation">
									<ul class="nav justify-content-center">
										<li class="nav-item"><a class="nav-link"
											href="${pageContext.request.contextPath}/client/client_view_person">个人信息</a>
											<ul class="sub-menu" style="font-size: 13px;">
												<li class="nav-item"><a class="nav-link"
													href="${pageContext.request.contextPath}/client/client_view_person">个人信息</a>
												</li>
												<li class="nav-item"><a class="nav-link"
													href="${pageContext.request.contextPath}/client/client_update_person">用户设置</a>
												</li>
												<li class="nav-item"><a class="nav-link"
													href="${pageContext.request.contextPath}/client/client_user_alterpsw">密码修改</a>
												</li>
												<li class="nav-item"><a class="nav-link"
													href="${pageContext.request.contextPath}/client/client_userBill">个人订单</a>
												</li>
												<c:if test="${loginer.userId == '000000' }">
													<li class="nav-item"><a class="nav-link"
														href="${pageContext.request.contextPath}/server/server_index">后台首页</a>
													</li>
												</c:if>
											</ul></li>
									</ul>
								</nav>
							</div>
						</c:if>
					</div>
				</div>
				<div class="quick-access__item">
					<div class="header-mini-cart">

						<c:choose>
							<c:when test="${!empty loginer}">
								<a href="${pageContext.request.contextPath}/client/client_cart"
									class="mini-cart-link"> <i
									class="cart__icon flaticon-online-shopping-cart fi-2x"></i> <span
									class="mini-cart-link__qty"><b>我的购物车</b></span>
								</a>
								<!-- 登陆后显示购物车中的商品数量 -->
								<div class="mini-cart">
									<!-- 购物车标识悬浮div -->
									<div class="mini-cart__content">
										<div class="empty-message">看看你的购物车</div>
										<a
											href="${pageContext.request.contextPath}/client/client_cart"
											class="btn btn-primary btn-lg mini-cart__btn">显示购物车</a>
									</div>
									<div class="mini-cart__footer">
										<div class="icon-box icon-box-left justify-content-center">
											<div class="icon-box__icon">
												<i class="flaticon flaticon-delivery-truck"></i>
											</div>
											<div class="icon-box__title">运送到所有地区</div>
										</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<i class="cart__icon flaticon-online-shopping-cart fi-2x"></i>
								<span class="mini-cart-link__qty"><b>请先登录再购买吧</b></span>
							</c:otherwise>
						</c:choose>





					</div>
				</div>
			</div>
			<!-- end of quick-access-menu -->
		</div>
		<!-- end of top-bar -->

		<nav class="header-navigation">
			<button class="mob-menu-close" id="js-close-mob-menu">
				<span>Close</span> <i class="flaticon-cancel-button"></i>
			</button>

			<ul class="nav justify-content-center">
				<li class="nav-item"><a class="nav-link active"
					href="${pageContext.request.contextPath}/">首页</a></li>
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
	</div>
</header>


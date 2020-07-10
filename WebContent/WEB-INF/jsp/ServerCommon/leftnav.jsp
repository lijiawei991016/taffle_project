<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<div class="header bg-main">
	<div class="logo fadein-top "
		style="margin: 3px 1px 0 1px; padding: 0px 0px;">
		<h1>
			后台管理中心
		</h1>
	</div>
	<div class="head-l">
		<a class="button button-little bg-green"
			href="${pageContext.request.contextPath}//" target="_blank"> 前台首页</a>
		&nbsp;&nbsp; &nbsp;&nbsp;<a class="button button-little bg-red"
			href="${pageContext.request.contextPath}/server_loginer_out">
			退出登录</a>
	</div>
	<c:if test="${!empty loginer}">
		<div class="head-l" style="position: relative; left: 40px;">
			<img style="width: 30px;"
				src="${pageContext.request.contextPath}/statics/file/${loginer.userPhoto}"
				alt="" />&nbsp;&nbsp;&nbsp; <span
				style="color: white; font-size: 15px; position: relative; bottom: 6px;">您好,
				${loginer.userAlice }</span>
		</div>
	</c:if>
</div>
<div class="leftnav">
	<div class="leftnav-title">
		<strong><span class="icon-list"></span>菜单列表</strong>
	</div>
	<h2>
		<span class="icon-user"></span>基本设置
	</h2>
	<ul style="display: block">
		<li><a
			href="${pageContext.request.contextPath}/server/serverblogadd"
			target="right"><span class="icon-caret-right"></span>添加博客</a></li>
		<li><a
			href="${pageContext.request.contextPath}/server/server_list_blog"
			target="right"><span class="icon-caret-right"></span>博客管理</a></li>
		<li><a
			href="${pageContext.request.contextPath}/server/server_contact"
			target="right"><span class="icon-caret-right"></span>联系我们管理</a></li>
		<li><a href="${pageContext.request.contextPath}/server/viewgoods"
			target="right"><span class="icon-caret-right"></span>商品管理</a></li>
		<li><a href="${pageContext.request.contextPath}/server/category"
			target="right"><span class="icon-caret-right"></span>商品分类管理</a></li>
		<li><a
			href="${pageContext.request.contextPath}/server/server_bill"
			target="right"><span class="icon-caret-right"></span>订单管理</a></li>
		<li><a
			href="${pageContext.request.contextPath}/server/server_userManage"
			target="right"><span class="icon-caret-right"></span>用户管理</a></li>

	</ul>
</div>
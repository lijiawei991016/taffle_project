<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/css/pintuer.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/css/admin.css">
<script src="${pageContext.request.contextPath}/statics/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/pintuer.js"></script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>用户详情</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="">
				<div class="form-group">
					<label>账户名：</label>${user.userId }
				</div>
				<div class="form-group">
					<label>昵称：</label>${user.userAlice }
				</div>
				<div class="form-group">
					<label>邮箱：</label>${user.userEmail }
				</div>
				<div class="form-group">
					<label>性别：</label>${user.userSex }
				</div>
				<div class="form-group">
					<label>收货地址：</label>${user.userAddress }
				</div>
				<div class="form-group">
					<label>手机号：</label>${user.userPhone }
				</div>
				<div class="form-group">
					<label>头像：</label><img
						src="${pageContext.request.contextPath}/statics/file/${user.userPhoto}"
						alt="">
				</div>
				<div class="form-group">
					<label>积分：</label>${user.userScore }
				</div>
				<div class="form-group">
					<label>创建时间：</label>
					<fmt:formatDate value="${user.userCreateDate }"
						pattern="yyyy-MM-dd" />
				</div>
				<div class="form-group">
					<label>更新时间：</label>
					<fmt:formatDate value="${user.userUpdateDate }"
						pattern="yyyy-MM-dd" />
				</div>
				<div class="form-group">
					<label>屏蔽状态：</label>
					<c:choose>
						<c:when test="${user.isEnable==0}">
							<td class="center">未屏蔽</td>
						</c:when>
						<c:otherwise>
							<td class="center">已屏蔽</td>
						</c:otherwise>
					</c:choose>

				</div>
			</form>
		</div>
	</div>

</body>
</html>
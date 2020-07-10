<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
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
<script src="${pageContext.request.contextPath}/statics/js/common.js"></script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>添加商品</strong>&nbsp;&nbsp;&nbsp;&nbsp;
			<a style="color: red; font-weight: bold;">${messg }</a>
		</div>
		<div class="body-content">
			<form method="post" class="form-x"
				action="${pageContext.request.contextPath}/server/addgoods2"
				enctype="multipart/form-data">
				<div class="form-group">
					<div class="label">
						<label>商品名称：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="goodsName"
							data-validate="required:请输入商品名称" />
						<div class="tips"></div>
					</div>
				</div>
				<div style="position: relative; left: 120px;">
					<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
					<span><img style="display: none;" id="preview" /></span>
				</div>
				<br /> <br />
				<div class="form-group">
					<div class="label">
						<label>商品图片：</label>
					</div>
					<div class="field">
						<label for="upload"
							style="font-size: 20px; border: none; color: #FFF; border-radius: 5px; background: #00AAEE; padding: 10px 30px;">点击这里上传图片</label>
						<input id="upload" type="file" name="andgoodsPhoto"
							style="position: relative; display: none;"
							onchange="viewImage(this)" required="required">
					</div>
				</div>
				<if condition="$iscid eq 1">
				<div class="form-group">
					<div class="label">
						<label>商品分类：</label>
					</div>
					<div class="field">
						<select name="category.categoryId" class="input w50">
							<option value="">请选择分类</option>
							<c:forEach items="${categorys }" var="cgt">
								<option value="${cgt.categoryId }">${cgt.category }</option>
							</c:forEach>
						</select>
						<div class="tips"></div>
					</div>
				</div>
				</if>
				<div class="form-group">
					<div class="label">
						<label>商品描述：</label>
					</div>
					<div class="field">
						<textarea class="input" name="goodsMessage"
							style="height: 90px; resize: none;"
							data-validate="required:请输入商品描述"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>商品单价：</label>
					</div>
					<div class="field">
						<input type="number" step="0.01" class="input w50" value=""
							name="goodsPrice" data-validate="required:请输入商品单价" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o" type="submit">
							添加商品</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
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
<link href="${pageContext.request.contextPath}/statics/css/main.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/statics/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/jquery-ui.min.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/forms/jquery.cleditor.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/forms/jquery.validationEngine.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/forms/jquery.tagsinput.min.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/forms/autogrowtextarea.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/forms/jquery.maskedinput.min.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/forms/jquery.dualListBox.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/forms/jquery.inputlimiter.min.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/forms/chosen.jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/wizard/jquery.validate.min.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/wizard/jquery.form.wizard.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/jquery.plupload.queue.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/datatable.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/tablesort.min.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/resizable.min.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/jquery.collapsible.min.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/jquery.sourcerer.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/custom.js"></script>

</head>
<body>

	<ul class="search" style="padding-left: 10px;">
		<li><a class="button border-main icon-plus-square-o"
			href="${pageContext.request.contextPath}/server/addgoods"> 添加商品</a></li>



	</ul>
	<!-- Main content wrapper -->
	<div class="wrapper">
		<div class="widget">
			<div class="title">
				<img
					src="${pageContext.request.contextPath}/statics/image/icons/dark/full2.png"
					alt="" class="titleIcon" />
				<h6>商品管理列表</h6>
				<h6>
					<a style="color: red; font-weight: bold;">${messg }</a>
				</h6>
			</div>
			<table cellpadding="0" cellspacing="0" border="0"
				class="display dTable">
				<thead>
					<tr>
						<th>商品名称</th>
						<th>商品分类</th>
						<th>商品单价</th>
						<th>是否促销</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${goods }" var="goods">
						<tr class="gradeC even">
							<td class="center"><a
								href="${pageContext.request.contextPath}/server/updateGoods/${goods.goodsId }">${goods.goodsName }</a></td>
							<td class="center">${goods.category.category }</td>
							<td class="center">${goods.goodsPrice }</td>
							<c:choose>
								<c:when test="${goods.goodsSell==0}">
									<td class="center">未促销</td>
								</c:when>
								<c:otherwise>
									<td class="center">促销</td>
								</c:otherwise>
							</c:choose>
							<td class="center">
								<div class="button-group" style="margin-left: 25px">
									<a class="button border-red"
										href="${pageContext.request.contextPath}/server/deleteGoods/${goods.goodsId }"
										onclick="return   ok()"> 删除</a>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<script type="text/javascript">
		function ok() {
			if (confirm("确定要删除吗(yes/no)")) {
				return true;
			} else {
				return false;
			}
		}
	</script>

</body>
</html>

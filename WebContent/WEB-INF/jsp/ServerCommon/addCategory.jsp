<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<style>
.abc {
	width: 900px;
	margin-left: 100px;
	height: 40px;
}
</style>



</head>
<body>


	<form method="post"
		action="${pageContext.request.contextPath}/server/add_category"
		id="listform">
		<div class="panel admin-panel">
			<div class="panel-head">
				<strong class="icon-reorder">添加商品分类 </strong> <span
					style="color: red;"> ${error }</span> <a href=""
					style="float: right; display: none;">添加字段</a>
			</div>

			<div class="table table-hover text-center">
				<br> <br> <label for="category" style="font-size: 15px;">
					分类标题: <span class="req">*</span>
				</label> <input type="text" name="category" class="abc" required="required" />

				<br>
				<volist name="list" id="vo">
			</div>

			<br>
			<br>
			<br>
			<br>

		</div>

		<br> <br>
		<div class="panel admin-panel">

			<input type="submit" value="添加" class="redB"
				style="width: 100%; height: 50px" />


		</div>
		<br>
		<center>
			<a href="${pageContext.request.contextPath}/server/category">返回上一页</a>
		</center>

	</form>

</body>
</html>
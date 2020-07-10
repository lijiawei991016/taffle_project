<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
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

<script type="text/javascript">
	// 两秒bai后模拟点击
	setTimeout(function() {
		// IE
		if (document.all) {
			document.getElementById("clickMe").click();
		}
		// 其它浏览du器
		else {
			var e = document.createEvent("MouseEvents");
			e.initEvent("click", true, true);
			document.getElementById("clickMe").dispatchEvent(e);
		}
	}, 300);
</script>


</head>






<body>
	<form method="post" action="" id="listform">
		<div class="panel admin-panel">
			<div class="panel-head">
				<strong class="icon-reorder"> 分类管理列表 </strong> <a href=""
					style="float: right; display: none;">添加字段</a>
			</div>
			<div class="padding border-bottom">
				<ul class="search" style="padding-left: 10px;">
					<li><a class="button border-main icon-plus-square-o"
						href="${pageContext.request.contextPath}/server/addcategory">
							添加分类</a></li>



				</ul>
			</div>
			<table class="table table-hover text-center">
				<tr>

					<th width="40%" colspan="2">商品分类</th>

					<c:choose>
						<c:when test="${bug!=null}">
							<th width="310" id="clickMe" onclick="alert('${bug}');">操作</th>
						</c:when>
						<c:otherwise>

							<th width="310">操作</th>
						</c:otherwise>
					</c:choose>
				</tr>


				<c:forEach items="${categories}" var="ctg">
					<tr>

						<td></td>

						<td style="text-align: center; padding-right: 67px;">${ctg.category}</td>




						<td><div class="button-group">
								<a class="button border-main"
									href="${pageContext.request.contextPath}/server/update/${ctg.categoryId}"><span
									class="icon-edit"></span> 修改</a> <a class="button border-red"
									href="${pageContext.request.contextPath}/server/del_category/${ctg.categoryId}"
									onclick="javascript:return p_del()"><span
									class="icon-trash-o"></span> 删除</a>
							</div></td>
					</tr>

				</c:forEach>



			</table>
		</div>
	</form>
	<script type="text/javascript">
		//单个删除
		function p_del() {
			var msg = "您真的确定要删除吗？";
			if (confirm(msg) == true) {
				return true;
			} else {
				return false;
			}
		}
	</script>
</body>
</html>
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
<title>联系我们管理</title>
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


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/css/pintuer.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/css/admin.css">

</head>
<body>

	<div class="wrapper">
		<div class="widget">
			<div class="title">
				<img
					src="${pageContext.request.contextPath}/statics/image/icons/dark/full2.png"
					alt="" class="titleIcon" />
				<h6>联系我们</h6>
			</div>
			<table cellpadding="0" cellspacing="0" border="0"
				class="display dTable">
				<thead>
					<tr>
						<th>联系人</th>
						<th>联系邮箱</th>
						<th>信息</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listcontacts }" var="listcontact">

						<tr class="gradeC even">
							<td class="center">${listcontact.contactName }</td>
							<td class=" sorting_1 center">${listcontact.contactEmail }</td>
							<td class="center">${listcontact.contactMessage }</td>
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
	</script>
	<script>
		$(function() {
			// 触发点击 “<th>发帖日期</th>” 单击事件
			$(".dTable").find("th").first().trigger("click");
		});
	</script>
</body>
</html>
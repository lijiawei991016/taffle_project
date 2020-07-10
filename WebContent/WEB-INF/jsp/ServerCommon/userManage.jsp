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
	<!-- Main content wrapper -->
	<div class="wrapper">
		<div class="widget">
			<div class="title">
				<img
					src="${pageContext.request.contextPath}/statics/image/icons/dark/full2.png"
					alt="" class="titleIcon" />
				<h6>用户管理</h6>
			</div>
			<table cellpadding="0" cellspacing="0" border="0"
				class="display dTable">
				<thead>
					<tr>
						<th>用户id</th>
						<th>用户昵称</th>
						<th>邮箱</th>
						<th>积分</th>
						<th>创建时间</th>
						<th>修改时间</th>
						<th>是否屏蔽</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${users }" var="listusers">
						<tr class="gradeC even">
							<td class="center"><a
								href="${pageContext.request.contextPath}/server/server_userMessage/${listusers.userId }">${listusers.userId }</a></td>
							<td class="center">${listusers.userAlice }</td>
							<td class="center">${listusers.userEmail }</td>
							<td class="center">${listusers.userScore }</td>
							<td class="center"><fmt:formatDate
									value="${listusers.userCreateDate }" pattern="yyyy-MM-dd" /></td>
							<td class="center"><fmt:formatDate
									value="${listusers.userUpdateDate }" pattern="yyyy-MM-dd" /></td>
							<c:choose>
								<c:when test="${listusers.isEnable==0}">
									<td class="center"><a
										href="${pageContext.request.contextPath}/server/updateisEnable1/${listusers.userId }">点击屏蔽</a></td>
								</c:when>
								<c:otherwise>
									<td class="center"><a
										href="${pageContext.request.contextPath}/server/updateisEnable0/${listusers.userId }">取消屏蔽</a></td>
								</c:otherwise>
							</c:choose>
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

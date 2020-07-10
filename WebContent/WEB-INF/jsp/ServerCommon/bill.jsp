<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" co
	ntent="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>订单</title>
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
				<h6>订单列表</h6>
			</div>
			<table cellpadding="0" cellspacing="0" border="0"
				class="display dTable">
				<thead>
					<tr>
						<th width="120">ID</th>
						<th>订单号</th>
						<th>订单商品信息</th>
						<th>下单用户</th>
						<th>联系方式</th>
						<th width="120">收货地址</th>
						<th>状态</th>
						<th>操作</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${bills}" var="bill">

						<tr class="gradeC even">
							<td class="center"><input type="checkbox" name="id[]"
								value="" />${bill.billid}</td>
							<td class="center">${bill.billCode}</td>
							<td class="center">${bill.billGoods}</td>
							<td class="center">${bill.userId}</td>
							<td class="center">${bill.userPhone}</td>
							<td class="center">${bill.userAddress}</td>
							<c:choose>
								<c:when test="${bill.status==0}">
									<td class="center">未支付</td>
								</c:when>
								<c:when test="${bill.status==1}">
									<td class="center">已支付</td>
								</c:when>
								<c:when test="${bill.status==2}">
									<td class="center">已发货</td>
								</c:when>
								<c:when test="${bill.status==3}">
									<td class="center">用户确认订单</td>
								</c:when>
								<c:otherwise>
									<td class="center">订单已完成</td>
								</c:otherwise>
							</c:choose>
							<td class="center">
								<div class="button-group">
									<a class="button border-red"
										href="${pageContext.request.contextPath}/server/updatefindBillCodetoone/${bill.billCode}"
										onclick="return del(1)">发货</a> &nbsp;&nbsp;&nbsp; <a
										class="button border-red"
										href="${pageContext.request.contextPath}/server/updatefindBillCodetotwo/${bill.billCode}"
										onclick="return del(1)">确认订单</a>&nbsp;&nbsp;&nbsp; <a
										class="button border-red"
										href="${pageContext.request.contextPath}/server/deletBillCodebystatus?billCode=${bill.billCode}&userId=${bill.userId}"
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
		function deleteUser() {
			var result = "";
			var count = 0;
			$(".checkb").each(function() {
				if ($(this).is(':checked')) {
					result += $(this).val() + ",";
					count++;
				} else {
				}
			});
			if (!confirm("确定删除这" + count + "件商品?")) {
				return;
			}
			window.location.href = "leyigou/deletesomeUser?tag=" + result;
		}

		function ok() {
			if (confirm("确定要删除吗(yes/no)")) {
				return true;
			} else {
				return false;
			}
		}

		/*  function del(id){
		 if(confirm("您确定要发货吗?")){
		
		 }
		 }

		 $("#checkall").click(function(){ 
		 $("input[name='id[]']").each(function(){
		 if (this.checked) {
		 this.checked = false;
		 }
		 else {
		 this.checked = true;
		 }
		 });
		 })

		 function DelSelect(){
		 var Checkbox=false;
		 $("input[name='id[]']").each(function(){
		 if (this.checked==true) {		
		 Checkbox=true;	
		 }
		 });
		 if (Checkbox){
		 var t=confirm("您确认要删除选中的内容吗？");
		 if (t==false) return false; 		
		 }
		 else{
		 alert("请选择您要删除的内容!");
		 return false;
		 }
		 }  */
	</script>
</body>
</html>
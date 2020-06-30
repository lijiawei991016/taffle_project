<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/pintuer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/admin.css">
<script src="statics/js/jquery.js"></script>
<script src="statics/js/pintuer.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/datatable.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/resizable.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/tablesort.min.js"></script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong class=""> 商品列表</strong></div>
  <div class="padding border-bottom">
    <button type="button" class="button border-yellow" onclick="window.location.href='${pageContext.request.contextPath}/server/addgoods'"><span class="icon-plus-square-o"></span> 添加商品</button>
  </div>
  <!-- Main content wrapper -->
    <div class="">
    	<!-- Dynamic table -->
        <div class="">
            <div class="title"><h6>商品信息</h6></div>                      
            <table class="display dTable">
            <thead>
            <tr>
            <th>商品名称</th>
            <th>商品分类</th>
            <th>商品单价</th>
            <th>操作</th>
            </tr>
            </thead>
            <tbody>
            	<tr class="gradeC">
            	<c:forEach items="${goods }" var="goods">
            		<td><a href="${pageContext.request.contextPath}/server/updateGoods/${goods.goodsId }">${goods.goodsName }</a></td>
            		<td>${goods.category.categoryId }</td>
            		<td>${goods.goodsPrice }</td>
            		<td><a href="${pageContext.request.contextPath}/server/deleteGoods/${goods.goodsId }">删除</a></td>
            	</tr>
            	</c:forEach>
            </tbody>
            </table>  
        </div>
    </div>
</div>
<script type="text/javascript">
function del(id,mid){
	if(confirm("您确定要删除吗?")){			
		
	}
}
</script>
</body>
</html>
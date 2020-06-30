<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>博客管理</title>  
<link href="${pageContext.request.contextPath}/statics/css/main.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/statics/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/forms/jquery.cleditor.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/forms/jquery.validationEngine.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/forms/jquery.tagsinput.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/forms/autogrowtextarea.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/forms/jquery.maskedinput.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/forms/jquery.dualListBox.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/forms/jquery.inputlimiter.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/forms/chosen.jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/wizard/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/wizard/jquery.form.wizard.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/jquery.plupload.queue.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/datatable.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/tablesort.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/resizable.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/jquery.collapsible.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/jquery.sourcerer.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/custom.js"></script>
  
   
	<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/admin.css">

</head>
<body>

<div class="wrapper">
<div class="widget">
            <div class="title"><img src="${pageContext.request.contextPath}/statics/image/icons/dark/full2.png" alt="" class="titleIcon" /><h6>贴子</h6></div>                          
            <table cellpadding="0" cellspacing="0" border="0" class="display dTable">
            <thead>
            <tr>
            <th>发帖日期</th>
            <th>标题</th>
            <th>发帖者</th>
            <th>板块</th>
            <th>分类</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listblogss }" var="listblog">
						<tbody>
							<tr class="gradeC even">
								<td class=""><fmt:formatDate
										value="${listblog.blogCreateDate }" pattern="yyyy-MM-dd" /></td>
								<td class=" sorting_1"><img
									src="${pageContext.request.contextPath}/statics/file/${listblog.blogPhoto }"
									alt=""></td>
								<td>${listblog.blogTitle }</td>
								<td>${listblog.blogMessage }</td>
								<td><div class="button-group" style="margin-left: 25px">
										<a class="button border-red" href="javascript:void(0)"
											onclick="return del(1)"> 删除</a>
									</div></td>
							</tr>
					</c:forEach>
            </tbody>
            </table></div> 
        </div>
        
<script type="text/javascript">

function del(id){
	if(confirm("您确定要删除吗?")){
		
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
}

</script>
<script>
$(function(){
	// 触发点击 “<th>发帖日期</th>” 单击事件
	$(".dTable").find("th").first().trigger("click");
});
</script>
</body></html>
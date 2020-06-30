<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<script src="${pageContext.request.contextPath}/statics/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/pintuer.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/wangEditor.min.js"></script>
</head>
<body>

<div class="panel admin-panel">
  
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加内容</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="${pageContext.request.contextPath}/server/serverblogadd" enctype="multipart/form-data">  
     <input type="hidden" name="blogMessage" id="blogMessage"/>
      <div class="form-group">
        <div class="label">
          <label>标题：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="blogTitle" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>图片：</label>
        </div>
        <div class="field">
          <input type="file" class="button bg-blue margin-left" id="image1" name="bbPhoto" style="float:left;">
         </div>
      </div>     
      <div class="form-group">
        <div class="label">
          <label>描述：</label>
        </div>
        <div class="field">
           <div class="input" id="editor"></div>
		<div class="tips"></div>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
        </div>
      </div>
    </form>
   
  </div>
</div>

</body>
<script>
	var E = window.wangEditor;
	var editor = new E('#editor');
	// 自定义菜单配置
	editor.customConfig.menus = [
    	'head',// 标题
   	 	'bold',// 加粗
    	'fontSize',//字号
    	'fontName', //字体
    	'italic',//倾斜
    	'underline',//下划线
    	'strikeThrough',  // 删除线
    	'foreColor',  // 文字颜色
    	'backColor',  // 背景颜色
    	'justify',  // 对齐方式
    	'emoticon',  // 表情
    	
    	'undo',  // 撤销
    	'redo'  // 重复
	];
	// 自定义配置颜色（字体颜色、背景色）
	editor.customConfig.colors = [
'#000000','#eeece0','#1c487f','#4d80bf','#c24f4a','#8baa4a','#7b5ba1','#46acc8','#f9963b'
	];
	// 自定义字体
	editor.customConfig.fontNames = [
    '宋体','黑体','华文新魏','微软雅黑','Arial','Tahoma','Verdana'
];
	// 关闭粘贴样式的过滤
	editor.customConfig.pasteFilterStyle = true;
	
	editor.create();
	// 下面的script用于处理提交 
$(function(){
 $("form").submit(function(){
	 // 把富文本框中的内容作为id为ansMessage的值
	 $("#blogMessage").val(editor.txt.html());
 });
});
</script></html>
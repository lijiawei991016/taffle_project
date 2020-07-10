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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/css/pintuer.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/css/admin.css">
<script src="${pageContext.request.contextPath}/statics/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/pintuer.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/wangEditor.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/common.js"></script>
</head>
<body>

	<div class="panel admin-panel">

		<div class="panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>添加博客</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x"
				action="${pageContext.request.contextPath}/server/serverblogadd"
				enctype="multipart/form-data">
				<input type="hidden" name="blogMessage" id="blogMessage" />
				<div class="form-group">
					<div class="label">
						<label>博客标题：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="blogTitle"
							data-validate="required:请输入标题" />
						<div class="tips"></div>
					</div>
				</div>
				<div style="position: relative; left: 120px;">
					<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
					<span><img style="display: none;" id="preview" /></span>
				</div>
				<div class="form-group">
					<div class="label">
						<label>添加图片：</label>
					</div>
					<div class="field">
						<input type="file" class="button bg-blue margin-left" id="image1"
							name="bbPhoto" style="float: left;" onchange="viewImage(this)">
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>博客内容：</label>
					</div>
					<div class="field">
						<div id="editor"></div>
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o" type="submit">
							提交</button>
					</div>
				</div>
			</form>

		</div>
	</div>

	<script>
		var E = window.wangEditor;
		var editor = new E('#editor');
		// 自定义菜单配置
		editor.customConfig.menus = [ 'head',// 标题
		];
		// 关闭粘贴样式的过滤
		editor.customConfig.pasteFilterStyle = true;
		// 忽略粘贴内容中的图片
		editor.customConfig.pasteIgnoreImg = true;
		// 上传图片到服务器
		editor.customConfig.uploadImgServer = '${pageContext.request.contextPath}/upload';
		// 隐藏“网络图片”tab
		editor.customConfig.showLinkImg = false;
		// 将图片大小限制为 1M
		editor.customConfig.uploadImgMaxSize = 1 * 1024 * 1024;
		// 限制一次最多上传 5 张图片
		editor.customConfig.uploadImgMaxLength = 5;
		// 监听函数，可使用监听函数在上传图片的不同阶段做相应处理
		editor.customConfig.uploadImgHooks = {
			customInsert : function(insertImg, result, editor) {
				for ( var i in result) {
					insertImg('${pageContext.request.contextPath}/statics/file/'
							+ result[i]);
				}
			}
		}
		editor.create();
		// 下面的script用于处理提交 
		$(function() {
			$("form").submit(function() {
				// 把富文本框中的内容作为id为invitationMessage的值
				$("#blogMessage").val(editor.txt.html());
			});
		});
	</script>
</body>
</html>
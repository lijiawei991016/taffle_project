<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
<meta charset="utf-8">
<title>登录注册页面</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/login/css/style.css">
</head>



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

	function changeImg() {
		var img = document.getElementById("codeImg");
		// 当src每次的路径方式变化时，就会去重新请求一次后台
		// new Date().getTime()？它是JavaScript的Date对象的方法，此处的作用是为了避免
		//  浏览器不会去执行后台代码(因为浏览器缓存原因)
		img.src = "${pageContext.request.contextPath}/code_img?"
				+ new Date().getTime();
	}
</script>


<body>
	<div class="content">
		<form:form action="${pageContext.request.contextPath}/login"
			method="post" cssClass="form" modelAttribute="user">

			<div class="form sign-in">

				<center>
					<span style="color: red;">${error }</span>
				</center>
				<br />
				<h2>欢迎回来</h2>

				<label for="userId">账户: <input type="text" name="userId"
					id="userId" /> <form:errors path="userId" cssStyle="color:red;" />
				</label> <label for="userPsw"> &nbsp;&nbsp;密码： <form:password
						path="userPsw" cssClass="validate[required]" /> <form:errors
						path="userPsw" cssStyle="color:red;" />
				</label> <label for="code"> &nbsp;&nbsp;验证码： <input type="text"
					name="code" /> <img id="codeImg"
					src="${pageContext.request.contextPath}/code_img" /> <a
					href="javascript:changeImg();" rel="external nofollow">看不清</a><br />

				</label>



				<p class="forgot-pass">
					<a href="${pageContext.request.contextPath}/user_reset_password">忘记密码？</a>
				</p>
				<br> <input type="submit" value="登录" class="submit" />


			</div>
		</form:form>

		<div class="sub-cont">
			<div class="img">

				<div class="img__text m--in">
					<h2>已有帐号？</h2>
					<p>有帐号就登录吧，好久不见了！</p>
				</div>
				<div class="img__btn" id="dd">
					<span class="m--up" id="clickMe" onclick="alert('${err}');">注
						册</span> <span class="m--in">登 录</span>
				</div>
			</div>
			<form:form action="${pageContext.request.contextPath}/regist"
				method="post" cssClass="form" modelAttribute="user">
				<div class="form sign-up">

					<h2>立即注册</h2>

					<label for="">&nbsp;账户: <input type="text" name="userId"
						id="userId" required="required" pattern="^[0-9]{6,}$"
						title="账户名只能为至少6位数字串" /> <form:errors path="userId"
							cssStyle="color:red;" />
					</label> <label for=""> &nbsp; &nbsp;&nbsp;密码： <form:password
							path="userPsw" cssClass="validate[required]" required="required"
							pattern="^[a-zA-Z0-9_]{6,}$" title="密码至少6位数" />
					</label> <label for="">&nbsp;&nbsp;&nbsp;确认密码： <input
						type="password" name="ruserPsw" id="ruserPsw" required="required"
						pattern="^[a-zA-Z0-9_]{6,}$" title="密码至少6位数" />

					</label> <label for="">&nbsp; &nbsp;&nbsp;昵称： <form:input
							path="userAlice" cssClass="validate[required]"
							required="required" />

					</label> <label for="">&nbsp; &nbsp;&nbsp;邮箱： <input type="text"
						name="userEmail" id="userEmail" required="required" />


					</label> <br /> <input type="submit" value="注册" class="submit" />

				</div>
			</form:form>
		</div>

	</div>

	<script
		src="${pageContext.request.contextPath}/statics/login/js/script.js"></script>
	<script src="${pageContext.request.contextPath}/statics/js/jquery.js"></script>
</body>

</html>

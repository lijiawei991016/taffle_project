<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="statics/images/favicon.png"
	type="image/x-icon">

<title>Contact</title>

<!-- Fonts -->
<link rel="stylesheet" href="statics/assets/fonts/Lato/Lato.css">

<!-- Icons -->
<link rel="stylesheet" href="statics/assets/fonts/flaticon/flaticon.css">
<link rel="stylesheet"
	href="statics/assets/fonts/webfont/css/materialdesignicons.min.css">

<!-- Libs -->
<link rel="stylesheet"
	href="statics/libs/bootstrap-4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="statics/libs/select2/css/select2.min.css">
<link rel="stylesheet" href="statics/libs/slick/slick.css">

<!-- Theme -->
<link rel="stylesheet" href="statics/assets/css/style.css">
<meta name="theme-color" content="#ECECEC">
<script src="${pageContext.request.contextPath}/statics/js/jquery.js"></script>
<script type="text/javascript">
	function changeImg() {
		var img = document.getElementById("codeImg");
		// 当src每次的路径方式变化时，就会去重新请求一次后台
		// new Date().getTime()？它是JavaScript的Date对象的方法，此处的作用是为了避免
		//  浏览器不会去执行后台代码(因为浏览器缓存原因)
		img.src = "${pageContext.request.contextPath}/code_img?"
				+ new Date().getTime();
	}
</script>






</head>
<body>
	<div class="head-line"></div>



	<div class="page-wrap">



		<!-- Page content -->
		<div class="page-content">


			<section class="section-contact-form">

				<center>
					<span style="color: red;">${error }</span>
				</center>
				<br>
				<div class="container">
					<div class="row justify-content-center">

						<div class="col-lg-6 col-md-8 text-center">
							<h2 class="h3 mb-40">Forget &nbsp; Password</h2>





							<form:form
								action="${pageContext.request.contextPath}/user_reset_password"
								cssClass="form" modelAttribute="user">

								<div class="form sign-in">



									<label for="userId"> 账户:&nbsp;&nbsp;&nbsp; <input
										type="text" name="userId" id="userId" />

									</label> <br> <br> <label for="code">

										&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 验证码： <input
										type="text" name="yzm" /> <img id="codeImg"
										src="${pageContext.request.contextPath}/code_img" /> <a
										href="javascript:changeImg();" rel="external nofollow">看不清</a><br />

									</label>
								</div>



								<br />
								<br />

								<div class="form-submit mt-3">
									<input type="submit" class="btn btn-primary btn-lg btn-block"
										value="重置密码" /> <br> <a
										href="${pageContext.request.contextPath}/login"> <span
										class="btn btn-primary btn-lg btn-block">登陆</span>
									</a>
								</div>
							</form:form>
						</div>
					</div>

				</div>
			</section>
		</div>
		<!-- /.page-content -->
		<!-- /.page-wrap -->
	</div>

</body>
</html>
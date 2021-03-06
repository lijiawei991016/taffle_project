<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/statics/images/favicon.png"
	type="image/x-icon">

<title>User Settings</title>

<!-- Fonts -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/assets/fonts/Lato/Lato.css">

<!-- Icons -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/assets/fonts/flaticon/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/assets/fonts/webfont/css/materialdesignicons.min.css">

<!-- Libs -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/libs/bootstrap-4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/libs/select2/css/select2.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/libs/slick/slick.css">

<!-- Theme -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/assets/css/style.css">
<meta name="theme-color" content="#ECECEC">
</head>
<body>
	<div class="head-line"></div>

	<!-- head -->
	<%@ include file="ClientCommon/ClientCommon_header.jsp"%>

	<div class="page-wrap">

		<!-- Breadcrumbs -->
		<nav aria-label="breadcrumb" class="page-breadcrumb">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath}/">首页</a></li>
					<li class="breadcrumb-item active" aria-current="page">用户设置</li>
				</ol>
			</div>
		</nav>

		<!-- Page content -->

		<section class="section-contact-form">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-6 col-md-8 text-center">
						<h2 class="h3 mb-40" style="color: red;">用户设置</h2>
						<br />
						<br />
						<form class="contact-form" method="post"
							action="${pageContext.request.contextPath}/client/client_update_person">
							<div class="form-row">
								<div class="form-group col-md-6">
									<p style="color: black; font-size: 17px">
										<b>用户名</b>
									</p>
									<input type="text" value="${person.userId }" name="userId"
										id="userId" class="form-control" disabled="disabled">
								</div>
								<div class="form-group col-md-6">
									<p style="color: black; font-size: 17px">
										<b>昵称</b>
									</p>
									<input type="text" value="${person.userAlice }"
										name="userAlice" id="userAlice" class="form-control">
								</div>
								<div class="form-group col-md-6">
									<p style="color: black; font-size: 17px">
										<b>性别</b>
									</p>
									<input type="text" value="${person.userSex }" name="userSex"
										id="userSex" class="form-control" pattern="^男{1,}$|^女{1,}$"
										title="输入性别无效">
								</div>
								<div class="form-group col-md-6">
									<p style="color: black; font-size: 17px">
										<b>电话</b>
									</p>
									<input type="text" value="${person.userPhone }"
										name="userPhone" id="userPhone" class="form-control"
										pattern="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)" 
										title="电话号码无效"/>
								</div>
								<p>__________</p>
								<div>
									<p style="color: black; font-size: 17px">
										<b>电子邮箱</b>
									</p>
									<input type="text" value="${person.userEmail }"
										name="userEmail" id="userEmail" class="form-control mb-10"
										size="120px" pattern="[0-9a-zA-Z_.-]+[@][0-9a-zA-Z_.-]+([.][a-zA-Z]+){1,2}" 
										title="邮箱格式无效"/>
								</div>
								<p>__________</p>
								<div>
									<p style="color: black; font-size: 17px">
										<b>收获地址</b>
									</p>
									<input type="text" value="${person.userAddress }"
										name="userAddress" id="userAddress" class="form-control mb-10"
										size="120px">
								</div>
								<p style="color: gray; font-size: 17px; margin: auto;">
									<b> ————————请确认修改信息无误后提交修改————————</b>
								</p>
								<br />
								<br />
								<br />
								<br />
								<div class="form-submit mt-3" style="margin: auto;">
									<input type="submit" class="btn btn-primary btn-lg btn-block"
										value="提交修改" />
								</div>
							</div>
						</form>
						<br />
						<br />
						<p style="color: black; font-size: 17px; margin: auto;">
							<b>更新头像</b>
						</p>
						<br />
						<br />


						<!-- 用户上传头像(AJAX) -->
						<div style="margin: auto;">
							<div>
								<img id="userPhotoImg"
									src="${pageContext.request.contextPath}/statics/file/${person.userPhoto }" />
							</div>
						</div>
						<br />
						<p style="text-align: right;">
							<span><b>请选择要上传的头像：</b></span>
							<!-- onchange -- 当控件的内容发生改变时触发该事件 -->
							<input type="file" id="uPhoto" name="uPhoto"
								onchange="userPhotoUpload();" required="required" />
						</p>


					</div>
				</div>
			</div>
	</div>
	</section>
	</div>
	<!-- /.page-content -->
	</div>
	<!-- /.page-wrap -->
	<!-- footer -->
	<%@ include file="ClientCommon/ClientCommon_footer.jsp"%>


	<div id="js-back-to-top" class="back-to-top">
		<i class="flaticon-up-arrow-sign"></i>回到顶部
	</div>

	<!-- 
	<div class="full-search-wrap">
		<div class="full-search container">
			<div class="close-s float-right js-close-search flaticon-cancel-button fi-2x"></div>
			<form action="/" class="search-full-form">
				<div class="position-relative">
					<i class="search-icon flaticon-magnifying-glass-browser fi-2x"></i>
					<input type="text" id="s-full" class="search-full-form__input" placeholder="Search">
					<input type="submit" class="d-none">
				</div>
				<p class="hint">Type in your search and press enter</p>
			</form>
		</div>
	</div>
-->

	<!-- Libs -->
	<script
		src="${pageContext.request.contextPath}/statics/libs/jquery-2.2.3.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/statics/libs/bootstrap-4.3.1/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/statics/libs/select2/js/select2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/statics/libs/slick/slick.min.js"></script>

	<!-- Theme -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjprc-1BZ4ft8yC81jNUAdtCkSByqP-DY"></script>
	<script
		src="${pageContext.request.contextPath}/statics/assets/js/custom.js"></script>

	<script>
		var map;
		var egglabs = new google.maps.LatLng(38.608890, -121.284995);
		var mapCoordinates = new google.maps.LatLng(38.608890, -121.284995);

		var markers = [];
		var image = new google.maps.MarkerImage(
				'${pageContext.request.contextPath}/statics/images/google.png',
				new google.maps.Size(60, 80), new google.maps.Point(0, 0),
				new google.maps.Point(42, 56));
		function addMarker() {
			markers.push(new google.maps.Marker({
				position : egglabs,
				raiseOnDrag : false,
				icon : image,
				map : map,
				draggable : false
			}));
		}
		function initialize() {
			var mapOptions = {
				backgroundColor : "#ffffff",
				zoom : 14,
				disableDefaultUI : true,
				center : mapCoordinates,
				mapTypeId : google.maps.MapTypeId.ROADMAP,
				styles : [ {
					"featureType" : "administrative",
					"elementType" : "all",
					"stylers" : [ {
						"visibility" : "simplified"
					} ]
				}, {
					"featureType" : "landscape",
					"elementType" : "geometry",
					"stylers" : [ {
						"visibility" : "simplified"
					}, {
						"color" : "#ffffff"
					} ]
				}, {
					"featureType" : "poi",
					"elementType" : "geometry",
					"stylers" : [ {
						"visibility" : "simplified"
					}, {
						"color" : "#fcfcfc"
					} ]
				}, {
					"featureType" : "road.highway",
					"elementType" : "geometry",
					"stylers" : [ {
						"visibility" : "simplified"
					}, {
						"color" : "#000000"
					} ]
				}, {
					"featureType" : "road.arterial",
					"elementType" : "geometry",
					"stylers" : [ {
						"visibility" : "simplified"
					}, {
						"color" : "#000000"
					} ]
				}, {
					"featureType" : "road.local",
					"elementType" : "geometry",
					"stylers" : [ {
						"color" : "#DEDEDE"
					} ]
				}, {
					"featureType" : "water",
					"elementType" : "geometry",
					"stylers" : [ {
						"visibility" : "simplified"
					}, {
						"color" : "#A6A6A6"
					} ]
				} ]
			};
			map = new google.maps.Map(document.getElementById('google-map'),
					mapOptions);
			addMarker();
		}
		google.maps.event.addDomListener(window, 'load', initialize);
	</script>
	<script src="${pageContext.request.contextPath}/statics/js/common.js"></script>


	<script>
		// 用户更新头像执行userPhotoUpload()函数
		function userPhotoUpload() {
			var formData = new FormData();
			// formData suerId取值
			formData.append("userId", $("#userId").val());
			// formData图片文件上传取值
			formData.append("uPhoto", $("#uPhoto")[0].files[0]);
			// AJAX发送异步请求
			$
					.ajax({
						url : '${pageContext.request.contextPath}/client/user_photo_upload',
						type : 'POST',
						data : formData,
						contentType : false,
						processData : false,
						success : function(result) {
							if (result['status'] == 'success') {
								// 修改img的src属性显示更新后的图片
								$("#userPhotoImg").attr(
										"src",
										"${pageContext.request.contextPath}/statics/file/"
												+ result['filename']);
							} else {
								alert(result['status']);
							}
						},
						error : function(XMLHttpRequest, textStatus,
								errorThrown) {
							alert(errorThrown);
						}
					});
		}
	</script>


</body>
</html>
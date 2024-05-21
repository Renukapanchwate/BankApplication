<%@page import="bank_application.dto.Branch"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Change Password</title>
<link rel="shortcut icon" href="assets/images/fav.png"
	type="image/x-icon">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&display=swap"
	rel="stylesheet">
<link rel="shortcut icon" href="assets/images/fav.jpg">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/all.min.css">
<link rel="stylesheet" href="assets/css/animate.css">
<link rel="stylesheet"
	href="assets/plugins/slider/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="assets/plugins/slider/css/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="assets/css/style.css" />
</head>

<body class="form-login-body">
	<div class="container">
		<div class="row">
			<div class="col-lg-10 mx-auto login-desk">
				<div class="row">
					<div class="col-md-7 detail-box">
						<!-- <img class="logo" src="assets/images/logo.png" alt="">  -->
						<div class="detailsh">
							<h4>Welcome Back</h4>
							<img class="help"
								src="https://wealthgenics.com/Themes/Poppy/Content/img/Forgot%20password.gif"
								alt="">

						</div>
					</div>
					<div class="col-md-5 loginform">

						<h3>Reset Password</h3>
						<form action="changePassword">
							<%
							String successMessage = (String) request.getAttribute("message");
							Branch branch = (Branch)session.getAttribute("branch") ;
							if (successMessage != null) {
							%>
							<div class="success-message">
								<%=successMessage%>
							</div>
							<%
							}
							%>


							<div class="login-det">
								<div class="form-row">
									<label for="">Registered Email Id</label>
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon1"> <i
												class="far fa-user"></i></span>
										</div>
										<input type="text" class="form-control"
											placeholder="Enter Username" aria-label="Username"
											aria-describedby="basic-addon1" name="email"
											value="<%=branch.getEmail() %>" readonly>
									</div>
								</div>
							</div>
							<div class="form-row">
								<label for="">Old Password</label>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon1"> <i
											class="fas fa-lock"></i>
										</span>
									</div>
									<input type="password" class="form-control"
										placeholder="Enter Password" aria-label="Username"
										aria-describedby="basic-addon1" name="password">
								</div>
							</div>

							<div class="form-row">
								<label for="">New Password</label>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon1"> <i
											class="fas fa-lock"></i>
										</span>
									</div>
									<input type="password" class="form-control"
										placeholder="Enter Password" aria-label="Username"
										aria-describedby="basic-addon1" id="newPassword"
										name="newPassword">
								</div>
							</div>

							<div class="form-row">
								<label for="">Confirm Password</label>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon2"> <i
											class="fas fa-lock"></i>
										</span>
									</div>
									<input type="password" class="form-control"
										placeholder="Enter Password" aria-label="Username"
										aria-describedby="basic-addon2" id="confirmPassword"
										name="confirmPassword">
								</div>
								<small id="passwordMatchError"
									style="color: red; display: none;">Confirm Password
									doesn't match</small>
							</div>

							<script>
								var passwordInput = document
										.getElementById('newPassword');
								var confirmPasswordInput = document
										.getElementById('confirmPassword');
								var passwordMatchError = document
										.getElementById('passwordMatchError');

								confirmPasswordInput
										.addEventListener(
												'input',
												function() {
													if (passwordInput.value !== confirmPasswordInput.value) {
														passwordMatchError.style.display = 'block';
													} else {
														passwordMatchError.style.display = 'none';
													}
												});
							</script>

							<div class="form-row"></div>


							<div style="display: flex;">
								<div class="button" style="margin-right: 50px; width: 100px;">
									<a href="login.jsp"> <input type="button" value="Cancel"
										class="btn btn-sm btn-danger"></a>
								</div>
								<div class="button" style="width: 100px;">
									<input type="submit" value="Update"
										class="btn btn-sm btn-danger">
								</div>
							</div>


							<div class="social-link">
								<ul class="socil-icon">
									<li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
									<li><a href="#"><i class="fab fa-twitter"></i></a></li>
									<li><a href="#"><i class="fab fa-instagram"></i></a></li>
									<li><a href="#"><i class="fab fa-pinterest-p"></i></a></li>
									<li><a href="#"><i class="fab fa-dribbble"></i></a></li>
									<li><a href="#"><i class="fab fa-behance"></i></a></li>
								</ul>
							</div>
					</div>
					</form>
				</div>
			</div>

		</div>
	</div>
	</div>
</body>

<script src="assets/js/jquery-3.2.1.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
<script src="assets/plugins/slider/js/owl.carousel.min.js"></script>
<script src="assets/js/script.js"></script>
</html>
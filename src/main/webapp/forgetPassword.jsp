<%@page import="java.util.List"%>
<%@page import="bank_application.dao.BranchDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Forget Password</title>
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

						<%
						String message = (String) request.getAttribute("forget");
						if (message != null) {
						%>
						<h6 style="color: red;"><%=message%></h6>

						<%
						}
						%>
						<form action="forget" method="post">
							<h3>Reset Password</h3>
							<div class="login-det">
								<div class="form-row">
									<label for="ifsc_dropdown">IFSC</label>
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon1"><i
												class="far fa-user"></i></span>
										</div>
										<select class="form-control" id="ifsc_dropdown" name="ifsc"
											required>
											<option value="" disabled selected>Select IFSC</option>
											<%
											BranchDao branch = new BranchDao();
											List<String> ifscList = branch.getIfscS();
											for (String ifsc : ifscList) {
											%>
											<option value="<%=ifsc%>"><%=ifsc%></option>
											<%
											}
											%>
										</select>
									</div>
								</div>
								<div class="form-row">
									<label for="email_dropdown">Email</label>
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon1"> <i
												class="fas fa-lock"></i>
											</span>
										</div>
										<select class="form-control" id="email_dropdown"
											name="email" required>
											<option value="" disabled selected>Select Email</option>
											<%
											BranchDao branche = new BranchDao();
											List<String> emailList = branche.getEmail();
											for (String email : emailList) {
											%>
											<option value="<%=email%>"><%=email%></option>
											<%
											}
											%>
										</select>
									</div>
									<small id="emailError" style="color: red; display: none;">Email
										should be in @gmail.com format</small>
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
											aria-describedby="basic-addon1" name="newpassword"
											required="required">
									</div>
								</div>


								<div class="form-row">
									<label for="">Confirm Password</label>
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon1"> <i
												class="fas fa-lock"></i>
											</span>
										</div>
										<input type="password" class="form-control"
											placeholder="Enter Password" aria-label="Username"
											aria-describedby="basic-addon1" name="confirmPassword"
											required="required">
									</div>
								</div>

								<div class="form-row"></div>


								<button class="btn btn-sm btn-danger">Update</button>
						</form>

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
				</div>
			</div>

		</div>
	</div>
	</div>
</body>
<script>
	document.getElementById('email').addEventListener('input', function() {
		var email = this.value;
		var emailError = document.getElementById('emailError');
		if (email && !email.endsWith('@gmail.com')) {
			emailError.style.display = 'block';
		} else {
			emailError.style.display = 'none';
		}
	});
</script>
<script src="assets/js/jquery-3.2.1.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
<script src="assets/plugins/slider/js/owl.carousel.min.js"></script>
<script src="assets/js/script.js"></script>
</html>
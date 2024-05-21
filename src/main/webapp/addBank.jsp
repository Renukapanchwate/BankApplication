<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>SignUp page</title>
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
							<img class="help" src="assets/images/help.png" alt="">

						</div>
					</div>
					<div class="col-md-5 loginform">
						<h4>Welcome Back</h4>
						<p>Signin to your Account</p>
						<form action="addBank" method="post">
							<div class="login-det">
								<div class="form-row">
									<label for="bankName">Bank Name</label>
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text"><i
												class="fas fa-university"></i></span>
										</div>
										<input type="text" id="bankName" class="form-control"
											placeholder="Enter Bank Name" aria-label="Bank Name"
											aria-describedby="bankNameAddon" name="bankName" required>
									</div>
								</div>

								<div class="form-row">
									<label for="location">Location</label>
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text"><i
												class="fas fa-map-marker-alt"></i></span>
										</div>
										<input type="text" id="location" class="form-control"
											placeholder="Enter Location" aria-label="Location"
											aria-describedby="locationAddon" name="location" required>
									</div>
								</div>

								<div class="form-row">
									<label for="customerNumber">Custom Number</label>
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text"><i class="far fa-user"></i></span>
										</div>
										<input type="text" id="customerNumber" class="form-control"
											placeholder="Enter Customer Number"
											aria-label="Customer Number"
											aria-describedby="customerNumberAddon" name="customerNumber"
											required>
									</div>
									<small id="customerNumberError"
										style="color: red; display: none;">Enter a valid
										ten-digit number</small>
								</div>
								<script>
									    document.getElementById('customerNumber').addEventListener('input', function () {
									        var customerNumber = this.value.replace(/\D/g, ''); // Remove non-numeric characters
									        var messageElement = document.getElementById('customerNumberError');
									        if (customerNumber.length > 10) {
									        	customerNumber = customerNumber.slice(0, 10); // Truncate to 10 digits
									        }
									        if (customerNumber.length !== 10) {
									            messageElement.style.display = 'block';
									        } else {
									            messageElement.style.display = 'none';
									        }
									        this.value = customerNumber;
									    });
									</script>


								<div class="form-row">
									<label for="">Email</label>
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon1"> <i
												class="fas fa-lock"></i>
											</span>
										</div>
										<input type="email" class="form-control"
											placeholder="Enter Email" aria-label="Email"
											aria-describedby="basic-addon1" name="email" id="email"
											required="required">
									</div>
									<small id="emailError" style="color: red; display: none;">Email
										should be in @gmail.com format</small>
								</div>
								<script>
									document
											.getElementById('email')
											.addEventListener(
													'input',
													function() {
														var email = this.value
																.toLowerCase();
														var emailError = document
																.getElementById('emailError');
														if (email
																&& !email
																		.endsWith('@gmail.com')) {
															emailError.style.display = 'block';
														} else {
															if (email === '@gmail.com') {
																emailError.style.display = 'block';
															} else {
																emailError.style.display = 'none';
															}
														}
													});
								</script>



								<div class="form-row">
									<label for="password">Password</label>
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text"><i class="fas fa-lock"></i></span>
										</div>
										<input type="password" id="password" class="form-control"
											placeholder="Enter Password" aria-label="Password"
											aria-describedby="passwordAddon" name="password" required>
									</div>
								</div>

								<div class="form-row">
									<label for="confirmPassword">Confirm Password</label>
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text"><i class="fas fa-lock"></i></span>
										</div>
										<input type="password" id="confirmPassword"
											class="form-control" placeholder="Confirm Password"
											aria-label="Confirm Password"
											aria-describedby="confirmPasswordAddon"
											name="confirmPassword" required>
									</div>
									<small id="passwordMatchError"
										style="color: red; display: none;">Confirm Password
										doesn't match</small>
								</div>

								<script>
								    var passwordInput = document.getElementById('password');
								    var confirmPasswordInput = document.getElementById('confirmPassword');
								    var passwordMatchError = document.getElementById('passwordMatchError');
								
								    confirmPasswordInput.addEventListener('input', function () {
								        if (passwordInput.value !== confirmPasswordInput.value) {
								            passwordMatchError.style.display = 'block';
								        } else {
								            passwordMatchError.style.display = 'none';
								        }
								    });
								</script>

								<div style="display: flex;">
									<div class="button" style="margin-right: 50px; width: 500px;">
										<input type="reset" name="Register" value="Cancel"
											class="btn btn-sm btn-danger">
									</div>
									<div class="button" style="width: 500px;">
										<input type="submit" name="Register" value="Register"
											class="btn btn-sm btn-danger" id="registerButton">
									</div>


								</div>
								<div class="button" style="width: 640px;">
									<a href="login.jsp"><p class="arrow">Already have an
											account ?</p> </a>
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
	<%--<script>
										// Get the button element
										var registerButton = document
												.getElementById('registerButton');

										// Add a click event listener to the button
										registerButton
												.addEventListener(
														'click',
														function() {
															// Redirect to afterAddBank.jsp when the button is clicked
															window.location.href = 'afterAddBank.jsp';
														});
									</script>  --%>
</body>

<script src="assets/js/jquery-3.2.1.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
<script src="assets/plugins/slider/js/owl.carousel.min.js"></script>
<script src="assets/js/script.js"></script>
</html>
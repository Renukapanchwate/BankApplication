<%@page import="bank_application.dao.BranchDao"%>
<%@page import="bank_application.dto.Branch"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Login</title>
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/all.min.css">
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
						<form action="login" method="post">
							<%
							String msg = (String) request.getAttribute("forget");
							if (msg != null) {
							%>
							<h5 style="color: green;"><%=msg%></h5>
							<%
							}
							%>
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
							</div>
							<div class="form-row">
								<label for="">Password</label><br>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<button class="btn btn-outline-secondary" type="button"
											id="togglePassword">
											<i class="fas fa-eye"></i>
										</button>
									</div>
									<input type="password" class="form-control"
										placeholder="Enter Password" aria-label="Password"
										aria-describedby="togglePassword" name="password" required>
								</div>
								<%
								String message = (String) request.getAttribute("message");
								if (message != null) {
								%>
								<!-- <h6 style="color:red; font-size: 15px;"><%=message%></h6>-->
								<script>
									alert("Invalid password. Please try again.");
								</script>
								<%
								}
								%>
							</div>

							<p class="forget">
								<a href="forgetPassword.jsp">Forget Password?</a>
							</p>

							<a href="homePage.jsp">
								<button id="login" class="btn btn-sm btn-danger" type="submit">Login</button>
							</a>

							<div class="social-link">
								<ul class="socil-icon">
									<li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
									<li><a href="#"><i class="fab fa-twitter"></i></a></li>
									<li><a href="#"><i class="fab fa-instagram"></i></a></li>
									<li><a href="#"><i class="fab fa-pinterest-p"></i></a></li>
									<li><a href="#"><i class="fab fa-dribbble"></i></a></li>
									<li><a href="#"><i class="fab fa-behance"></i></a></li>
								</ul>

								<br> <br> <br>

								<p>
								<h6>Don't have an account?</h6>
								</p>
								<a href="addBank.jsp">
									<h6
										style="font-weight: bolder; -webkit-text-stroke: 0.5px black;">SignUp</h6>
								</a>
							</div>
						</form>
					</div>


				</div>

			</div>
		</div>
	</div>

	<script>
		document.getElementById('togglePassword').addEventListener(
				'click',
				function() {
					var passwordInput = document
							.querySelector('input[name="password"]');
					if (passwordInput.type === 'password') {
						passwordInput.type = 'text';
					} else {
						passwordInput.type = 'password';
					}
				});
	</script>
</body>
<script>
	function displayInvalidPasswordMessage() {
		alert("Invalid password. Please try again.");
	}
</script>
<script src="assets/js/jquery-3.2.1.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
<script src="assets/plugins/slider/js/owl.carousel.min.js"></script>
<script src="assets/js/script.js"></script>
</html>
<%@page import="bank_application.dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Transaction</title>
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
							<img class="help"
								src="https://static.vecteezy.com/system/resources/previews/002/811/191/non_2x/withdraw-money-and-funds-vector.jpg"
								alt="">

						</div>
					</div>
					<div class="col-md-5 loginform">
						<form action="TransferInDiffBranch" method="post">
							<%
							String mgs = (String) request.getAttribute("transfer");
							User user = (User) session.getAttribute("user");
							if (mgs != null) {
							%>
							<h5 style="color: green;" align="center"><%=mgs%></h5>
							<%
							}
							%>
							<h4>Welcome Back</h4>
							<h5>Transfer in differnt Branch</h5>
							<div class="login-det">
								<div class="form-row">
									<label for="">sender's account number</label>
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon1"> <i
												class="far fa-user"></i>
											</span>
										</div>
										<input type="text" class="form-control" id="accountNumber"
											placeholder="Enter Account Number" aria-label="Username"
											aria-describedby="basic-addon1"
											value="<%=user.getAccountNumber()%>" name="account1" readonly>
									</div>
								</div>
								<div class="form-row">
									<label for="">Receiver's Account Number</label>
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon1"> <i
												class="fas fa-lock"></i>
											</span>
										</div>
										<input type="text" class="form-control"
											placeholder="Enter Receiver's Account Number"
											aria-label="Username" aria-describedby="basic-addon1" name="account2">
									</div>
								</div>
								<div class="form-row">
									<label for="">Receiver's IFSC</label>
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon1"> <i
												class="fas fa-lock"></i>
											</span>
										</div>
										<input type="text" class="form-control"
											placeholder="Enter Receiver's Account Number"
											aria-label="Username" aria-describedby="basic-addon1" name="ifsc">
									</div>
								</div>

								<div class="form-row">
								<label for="">Enter Amount</label>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon1"> <i
											class="far fa-user"></i>
										</span>
									</div>
									<input type="text" class="form-control"
										placeholder="Enter Amount" aria-label="Username"
										aria-describedby="basic-addon1" id="amountInput" name="amount">
								</div>
								<small id="amountError" style="color: red; display: none;">Enter
									a valid number</small>
							</div>

							<script>
								var amountInput = document
										.getElementById('amountInput');
								var amountError = document
										.getElementById('amountError');

								amountInput
										.addEventListener(
												'input',
												function() {
													var amount = parseFloat(amountInput.value);
													if (isNaN(amount)
															|| amount <= 0
															|| !/^\d*\.?\d*$/
																	.test(amountInput.value)) {
														amountError.style.display = 'block';
													} else {
														amountError.style.display = 'none';
													}
												});
							</script>
								<p class="forget">
									<a href="">Forget Password?</a>
								</p>

								<button class="btn btn-sm btn-danger" type="submit">Send</button>


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
									<a href="signup.html"><h6
											style="font-weight: bolder; -webkit-text-stroke: 0.5px black;">SignUp</h6></a>
								</div>
						</form>
					</div>
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

<%@page import="bank_application.dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Withdraw</title>
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/all.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/style.css" />
<style>
h5 {
	margin-top: -50px;
	margin-left: 110px;
}

p {
	margin-left: 50px;
}
</style>
</head>

<body class="form-login-body">

	<script>
		function validateAmount() {
			var amount = document.getElementById("amount").value;

			// Amount validation
			var amountPattern = /^\d+(\.\d{1,2})?$/; // Allows positive decimal numbers with up to two decimal places
			if (!amount.match(amountPattern)) {
				document.getElementById("amountError").innerText = "Enter a valid amount";
				return false;
			} else {
				document.getElementById("amountError").innerText = "";
				return true;
			}
		}
	</script>
	<script>
		function validateAccountNumber() {
			var accountNumber = document.getElementById("accountNumber").value;

			// Account number validation
			var accountNumberPattern = /^\d{12}$/; // Assumes account number is a 12-digit number
			if (!accountNumber.match(accountNumberPattern)) {
				document.getElementById("accountNumberError").innerText = "Enter a valid 12-digit account number";
				return false;
			} else {
				document.getElementById("accountNumberError").innerText = "";
				return true;
			}
		}

		function withdraw() {
			var accountNumber = document.getElementById("accountNumber").value;
			var amount = document.getElementById("amount").value;

			// Perform account number validation
			if (!validateAccountNumber()) {
				return;
			}

			// Check if account number exists in the database (you need to implement this logic)
			// For now, assume the account number does not exist
			var accountExists = false;

			if (!accountExists) {
				document.getElementById("withdrawError").innerText = "Account number not present";
				return;
			} else {
				document.getElementById("withdrawError").innerText = "";
				// Perform withdrawal logic here
			}
		}
	</script>
	<div class="container">
		<div class="row">
			<div class="col-lg-10 mx-auto login-desk">
				<div class="row">
					<div class="col-md-7 detail-box">
						<!-- <img class="logo" src="assets/images/logo.png" alt="">  -->
						<div class="detailsh">
							<h4>Withdraw Page</h4>
							<video class="help" src="Female Investors.mp4" muted autoplay
								loop     " alt="">
						</div>

					</div>
					<div class="col-md-5 loginform">

						<form action="Withdraw" method="post">
							<%
							String msg = (String) request.getAttribute("account");
							User user = (User) session.getAttribute("user");
							if (msg != null) {
							%>
							<h6 style="color: red;"><%=msg%></h6>
							<%
							}
							%>
							<h3>Withdraw to your account</h3>
							<br> <br>
							<div class="form-row">
								<label for="accountNumber">Account Number</label>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon1"> <i
											class="far fa-user"></i>
										</span>
									</div>
									<input type="text" class="form-control" id="accountNumber"
										placeholder="Enter Account Number" aria-label="Username"
										aria-describedby="basic-addon1"
										value="<%=user.getAccountNumber()%>"
										onblur="validateAccountNumber()" name="account" readonly>
								</div>
								<div id="accountNumberError" style="color: red;"></div>
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

							<br> <br>
							<button class="btn btn-sm btn-danger" type="submit">WithDraw</button>


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
								<a href="addUser.jsp"><h6
										style="font-weight: bolder; -webkit-text-stroke: 0.5px black;">Create</h6></a>
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
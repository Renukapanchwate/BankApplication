<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="kisan_registration.css">
<title>Add User</title>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Anton&family=Montserrat:wght@100;400&family=Poppins:wght@300&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	display: flex;
	height: 100vh;
	justify-content: center;
	align-items: center;
	/* background: linear-gradient(135deg, #71b7e6, #9b59b6); */
	background-image:
		url("https://c8.alamy.com/comp/MC8N0B/modern-abstract-vector-web-banner-template-colorful-web-design-elements-abstract-geometric-background-web-banner-template-header-design-MC8N0B.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}

.container {
	max-width: 780px;
	width: 100%;
	background: #fff;
	padding: 20px;
	border-radius: 50px;
	background: transparent;
	backdrop-filter: blur(10px);
	margin-left: 370px;
	margin-top: 20px;
	box-shadow: 0px 0px 5px 5px #838485;;
	height: 902px;
}

.container .title {
	font-size: 28px;
	font-weight: 700;
	position: relative;
}

.container .title::before {
	content: '';
	position: absolute;
	left: 0;
	bottom: 0;
	height: 3px;
	width: 30px;
	background: linear-gradient(135deg, #71b7e6, #9b59b6);
}

.container form .user-details {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	margin: 20px 0 12px 0;
}

form .user-details .input-box {
	margin-bottom: 15px;
	width: calc(100%/ 2 - 20px);
}

.user-details .input-box .details {
	display: block;
	font-weight: 600;
	margin-bottom: 29px;
}

.user-details .input-box input {
	height: 30px;
	width: 100%;
	outline: none;
	border-radius: 5px;
	border: 1px solid #ccc;
	padding-left: 85px;
	font-size: 16px;
	border-bottom-width: 2px;
	transition: all 0.3s ease;
}

.user-details .input-box input:focus, .user-details .input-box input:valid
	{
	border-color: #9b59b6;
}

form .button {
	height: 45px;
	margin: 20px 0;
}

form .button input {
	height: 100%;
	width: 100%;
	outline: none;
	color: white;
	border: none;
	font-size: 18px;
	font-weight: 500;
	border-radius: 5px;
	letter-spacing: 1px;
	background: linear-gradient(135deg, #71b7e6, #1ddee3);
	margin-left: 150px;
	margin-top: -5px;
}

form .button input:hover {
	background: linear-gradient(135deg, #71b7e6, #1ddee3);
}

@media ( max-width :584px) {
	.container {
		max-width: 100%;
	}
	form .user-details .input-box {
		margin-bottom: 15px;
		width: 100%;
	}
	form .gender-details .category {
		width: 100%;
	}
	.container form .user-details {
		max-height: 300px;
		overflow-y: scroll;
	}
	.user-details::-webkit-scrollbar {
		width: 0;
	}
}

.rdobtn {
	margin-right: 150px;
	font-weight: 600px;
}

.main-container {
	height: 100vh;
	width: 100%;
}

.label {
	font-size: 17px;
	font-weight: 600px;
}

.arrow {
	font-size: 20px;
	color: #072222;
	margin-left: 124px;
	margin-top: -31px;
}

.input-box {
	margin-bottom: 20px;
}

.details {
	font-weight: bold;
}

.input-box input[type="radio"] {
	margin-right: 10px;
	display: inline-block;
}

.input-box label {
	font-weight: normal;
	display: inline-block;
	margin-right: 20px;
}

.lab {
	margin-top: 20px;
}

.image {
	width: 100px;
	height: 70px;
	background-color: #fff;
}
</style>
</head>
<body>

	<div class="main-container">
		<div class="container">

			<div style="display: flex;">
				<div class="title">Create Account</div>
			</div>

			<form action="addUsers" method="post">
				<div class="user-details">
					<div class="input-box">
						<span class="details">First Name</span> <input type="text"
							placeholder="First_Name" required name="firstName"
							pattern="[a-zA-Z]+">
					</div>

					<div class="input-box">
						<span class="details">Middle Name</span> <input type="text"
							placeholder="Middle_Name" required name="middleName"
							pattern="[a-zA-Z]+">
					</div>


					<div class="input-box">
						<span class="details">Last Name</span> <input type="text"
							placeholder="Last_Name" required name="lastName"
							pattern="[a-zA-Z]+">
					</div>

					<div class="input-box" style="display: flex; align-items: center;">
						<span class="details" style="margin-right: 10px;">Gender</span> <label
							style="margin-right: 10px;"> <input type="radio"
							name="gender" value="male" required style="margin-right: 5px;">
							Male
						</label> <label style="margin-right: 10px;"> <input type="radio"
							name="gender" value="female" style="margin-right: 5px;">
							Female
						</label> <label> <input type="radio" name="gender" value="other"
							style="margin-right: 5px;"> Other
						</label>
					</div>

					<!--  		<div class="input-box">
						<span class="details">Email</span> <input type="email"
							placeholder="Enter your email" required name="email"
							pattern="[a-z0-9._-]+@gmail.com">
					</div>-->
					<div class="input-box">
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
													.toLowerCase(); // Convert email to lowercase
											var emailError = document
													.getElementById('emailError');
											if (email
													&& !email
															.endsWith('@gmail.com')) {
												emailError.style.display = 'block';
											} else {
												// Check if the email contains only "@gmail.com"
												if (email === '@gmail.com') {
													emailError.style.display = 'block';
												} else {
													emailError.style.display = 'none';
												}
											}
										});
					</script>

					<!-- <div class="input-box">
						<span class="details">Phone Number</span> <input type="text"
							placeholder="Enter your number" required name="phone"
							pattern="[6-9]{1}[0-9]{9}">
					</div>-->
					<div class="input-box">
						<label for="customerNumber">Phone</label>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="far fa-user"></i></span>
							</div>
							<input type="text" id="customerNumber" class="form-control"
								placeholder="Enter Customer Number" aria-label="Customer Number"
								aria-describedby="customerNumberAddon" name="phone" required>
							<small id="customerNumberError"
								style="color: red; display: none;">Enter a ten digit
								number</small>
						</div>
					</div>
					<script>
						document
								.getElementById('customerNumber')
								.addEventListener(
										'input',
										function() {
											var customerNumber = this.value
													.replace(/\D/g, ''); // Remove non-numeric characters
											var messageElement = document
													.getElementById('customerNumberError');
											if (customerNumber.length > 10) {
												customerNumber = customerNumber
														.slice(0, 10); // Truncate to 10 digits
											}
											if (customerNumber.length !== 10) {
												messageElement.style.display = 'block';
											} else {
												messageElement.style.display = 'none';
											}
											this.value = customerNumber;
										});
					</script>


					<div class="input-box">
						<label for="alternateNumber">Alternate Phone</label>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="far fa-user"></i></span>
							</div>
							<input type="text" id="alternateNumber" class="form-control"
								placeholder="Enter Alternate Number"
								aria-label="Alternate Number"
								aria-describedby="alternateNumberAddon" name="alternate"
								required> <small id="alternateNumberError"
								style="color: red; display: none;">Enter a ten-digit
								number</small>
						</div>
					</div>
					<script>
						document
								.getElementById('alternateNumber')
								.addEventListener(
										'input',
										function() {
											var alternateNumber = this.value
													.replace(/\D/g, ''); // Remove non-numeric characters
											var messageElement = document
													.getElementById('alternateNumberError');
											if (alternateNumber.length > 10) {
												alternateNumber = alternateNumber
														.slice(0, 10); // Truncate to 10 digits
											}
											if (alternateNumber.length !== 10) {
												messageElement.style.display = 'block';
											} else {
												messageElement.style.display = 'none';
											}
											this.value = alternateNumber;
										});
					</script>


					<div class="input-box">
						<span class="details">Date Of Birth</span> <input type="date"
							placeholder="Last_Name" name="dob">
					</div>


					<div class="input-box" style="width: 700px;">
						<span class="details">Address</span> <input type="text"
							placeholder="Enter your Address" required name="address"
							pattern="[a-zA-Z]+">
					</div>

					<div class="input-box">
						<span class="details">Country</span> <input type="text"
							placeholder="Last_Name" required name="country"
							pattern="[a-zA-Z]+">
					</div>

					<div class="input-box">
						<label for="pincode">Pincode</label>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text"><i
									class="fas fa-map-marker-alt"></i></span>
							</div>
							<input type="text" id="pincode" class="form-control"
								placeholder="Enter Pincode" aria-label="Pincode"
								aria-describedby="pincodeAddon" name="pincode" required>
						</div>
						<small id="pincodeError" style="color: red; display: none;">Enter
							a valid six-digit pincode</small>
					</div>
					<script>
						document.getElementById('pincode').addEventListener(
								'input',
								function() {
									var pincode = this.value;
									var messageElement = document
											.getElementById('pincodeError');
									if (!/^\d{6}$/.test(pincode)) {
										messageElement.style.display = 'block';
									} else {
										messageElement.style.display = 'none';
									}
								});
					</script>

					<div class="input-box">
						<span class="details">Account Type</span> <br> <input
							type="radio" id="saving" name="accountType" value="saving"
							required> <label for="saving">Saving</label><br> <input
							type="radio" id="current" name="accountType" value="current">
						<label for="current">Current</label>
					</div>

					<div class="input-box">
						<label for="aadharCard">Aadhar Card</label>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="far fa-id-card"></i></span>
							</div>
							<input type="text" id="aadharCard" class="form-control"
								placeholder="Enter Aadhar Card Number"
								aria-label="Aadhar Card Number"
								aria-describedby="aadharCardAddon" name="aadharCard" required>
						</div>
						<small id="aadharCardError" style="color: red; display: none;">Enter
							a valid twelve-digit Aadhar card number</small>
					</div>
					<script>
						document.getElementById('aadharCard').addEventListener(
								'input',
								function() {
									var aadharCard = this.value;
									var messageElement = document
											.getElementById('aadharCardError');
									if (!/^\d{12}$/.test(aadharCard)) {
										messageElement.style.display = 'block';
									} else {
										messageElement.style.display = 'none';
									}
								});
					</script>


					<div style="display: flex;">
						<div class="button" style="margin-right: 50px; width: 200px;">
							<input type="reset" name="Register" value="Cancel">
						</div>
						<div class="button" style="width: 200px;">
							<a href="homePage.jsp"><input type="submit" name="Add"
								value="Create"></a>
						</div>
					</div>
				</div>
				<div class="button" style="width: 640px;">
					<a href="login.jsp"><p class="arrow" align="center">Already
							have an account ?</p> </a>
				</div>


			</form>
		</div>
	</div>
</body>
</html>
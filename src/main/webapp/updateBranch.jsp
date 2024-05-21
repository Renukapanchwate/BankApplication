<%@page import="bank_application.dto.Branch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Branch</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
}

.container {
	max-width: 500px;
	margin: 50px auto;
}

.card {
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

.form-group {
	margin-bottom: 20px;
}

.toggle-password-btn {
	cursor: pointer;
}

.success-message {
	display: none;
	margin-top: 20px;
	padding: 15px 30px;
	border-radius: 5px;
	background-color: #4CAF50;
	color: white;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>
	<div class="container">
		<div class="card">
			<h2 class="text-center mb-4">Update Branch</h2>
			<%
			Branch branch = (Branch) request.getAttribute("branch");
			String msg = (String) request.getAttribute("message");
			if (branch != null) {
			%>
			<div class="alert alert-success" role="alert">
				<%=(msg != null) ? msg : ""%>
			</div>
			<form action="updateBranch" method="post">
				<div class="form-group">
					<label for="branchId">Branch Id</label> <input type="text"
						id="branchId" name="branchId" class="form-control"
						value="<%=branch.getBranchId()%>" readonly>
				</div>
				<div class="form-group">
					<label for="branchname">Branch Name</label> <input type="text"
						id="branchname" name="branchname" class="form-control"
						value="<%=branch.getBranchName()%>" readonly>
				</div>
				<div class="form-group">
					<label for="ifsc">IFSC</label> <input type="text" id="ifsc"
						name="ifsc" class="form-control" value="<%=branch.getIFSC()%>"
						readonly>
				</div>
				<div class="form-group">
					<label for="password">Password</label>
					<div class="input-group">
						<input type="password" id="password" name="password"
							class="form-control" value="<%=branch.getPassword()%>" readonly>
						<div class="input-group-append">
							<button class="btn btn-outline-secondary toggle-password-btn"
								type="button" id="togglePassword">
								<i class="fas fa-eye"></i>
							</button>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="location">Location</label> <input type="text"
						id="location" name="location" class="form-control"
						value="<%=branch.getLocation()%>">
				</div>
				<div class="form-group">
					<label for="balance">Balance</label> <input type="text"
						id="balance" name="balance" class="form-control"
						value="<%=branch.getBalance()%>" readonly>
				</div>
				<div class="form-group">
					<label for="customerNumber">Customer Number</label> <input
						type="text" id="customerNumber" name="customerNumber"
						class="form-control" value="<%=branch.getCustomerNumber()%>">
				</div>
				
				<div class="form-group">
					<label for="email">Email</label> <input
						type="email" id="email" name="email"
						class="form-control" value="<%=branch.getEmail()%>">
				</div>
				<button type="submit" class="btn btn-primary btn-block">Save</button>
			</form>

			<script>
				document.getElementById('togglePassword').addEventListener(
						'click',
						function() {
							var passwordInput = document
									.getElementById('password');
							if (passwordInput.type === 'password') {
								passwordInput.type = 'text';
							} else {
								passwordInput.type = 'password';
							}
						});
			</script>
			<%} %>
</body>
</html>

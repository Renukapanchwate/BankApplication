<%@page import="bank_application.dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update User Details</title>
<style>
/* Define your CSS styles here */
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	margin: 0;
	padding: 0;
}

form {
	max-width: 800px;
	margin: 20px auto;
	padding: 20px;
	background-color: #fff;
	border: 2px solid #ccc;
	border-radius: 10px;
}

.input-box {
	margin-bottom: 15px;
	display: flex;
	align-items: center;
}

.details {
	width: 150px;
	font-weight: bold;
}

input[type="text"], input[type="email"], input[type="date"] {
	width: 300px;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

input[type="radio"] {
	margin-right: 10px;
}

input[type="submit"], input[type="reset"] {
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	background-color: #007bff;
	color: #fff;
	cursor: pointer;
}

input[type="submit"]:hover, input[type="reset"]:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<%
	HttpSession httpSession = request.getSession();
	User user = (User) httpSession.getAttribute("user");
	 String update = (String)request.getAttribute("update");
       if(update!=null){
    		%>	
    		<script>
    	    // Check if the msg variable is not null
    	    var msg = "<%=update%>";
    	    if (msg !== null && msg !== "") {
    	        // Display the message in a popup
    	        alert(msg);
    	    }
    	</script>
    	<%} %>
	<form action="UpdateUser" method="post">
		<label>Account Number</label> <input type="text" name="accountNumber"
			placeholder="Account Number" value="<%=user.getAccountNumber()%>"
			readonly="readonly">
		<div class="user-details">
			<div class="input-box">
				<span class="details">First Name</span> <input type="text"
					placeholder="First Name" value="<%=user.getFirstName()%>" required
					name="firstName" pattern="[a-zA-Z]+">
			</div>
			<div class="input-box">
				<span class="details">Middle Name</span> <input type="text"
					placeholder="Middle Name" value="<%=user.getMiddleName()%>"
					required name="middleName" pattern="[a-zA-Z]+">
			</div>
			<div class="input-box">
				<span class="details">Last Name</span> <input type="text"
					placeholder="Last Name" value="<%=user.getLastName()%>" required
					name="lastName" pattern="[a-zA-Z]+">
			</div>
			<div class="input-box">
				<span class="details">Gender</span> <label><input
					type="radio" name="gender" value="male"
					<%if (user.getGender().equals("male"))
	out.print("checked");%>>
					Male</label> <label><input type="radio" name="gender"
					value="female"
					<%if (user.getGender().equals("female"))
	out.print("checked");%>>
					Female</label> <label><input type="radio" name="gender"
					value="other"
					<%if (user.getGender().equals("other"))
	out.print("checked");%>>
					Other</label>
			</div>
			<div class="input-box">
				<span class="details">Email</span> <input type="email"
					value="<%=user.getEmail()%>" placeholder="Enter your email"
					required name="email" pattern="[a-z0-9._-]+@gmail.com">
			</div>
			<div class="input-box">
				<span class="details">Phone Number</span> <input type="text"
					value="<%=user.getPhone()%>" placeholder="Enter your number"
					required name="phone" pattern="[6-9]{1}[0-9]{9}">
			</div>
			<div class="input-box">
				<span class="details">Alternate Phone</span> <input type="text"
					value="<%=user.getAlternate()%>"
					placeholder="Enter your alternate number" required name="alternate"
					pattern="[6-9]{1}[0-9]{9}">
			</div>
			<div class="input-box">
				<span class="details">Date Of Birth</span> <input type="date"
					value="<%=user.getDOB()%>" placeholder="Date Of Birth" name="dob">
			</div>
			<div class="input-box">
				<span class="details">Address</span> <input type="text"
					value="<%=user.getAddress()%>" placeholder="Enter your address"
					required name="address">
			</div>
			<div class="input-box">
				<span class="details">Country</span> <input type="text"
					value="<%=user.getCountry()%>" placeholder="Country" required
					name="country" pattern="[a-zA-Z]+">
			</div>
			<div class="input-box">
				<span class="details">Pincode</span> <input type="text"
					value="<%=user.getPincode()%>" placeholder="Pincode" required
					name="pincode" pattern="[0-9]+">
			</div>
			<div class="input-box">
				<span class="details">Account Type</span> <label><input
					type="radio" name="accountType" value="saving"
					<%if (user.getAccountType().equals("saving"))
	out.print("checked");%>>
					Savings</label> <label><input type="radio" name="accountType"
					value="current"
					<%if (user.getAccountType().equals("current"))
	out.print("checked");%>>
					Current</label>
			</div>


			<div class="input-box">
				<span class="details">Aadhar Card</span> <input type="text"
					value="<%=user.getAadharCard()%>" placeholder="Aadhar Card"
					required name="aadharCard">
			</div>
		</div>
		<label>Balance</label> <input type="text" placeholder="Balance"
			value="<%=user.getBalance()%>" name="balance" readonly="readonly">
		<div style="display: flex; justify-content: center; margin-top: 20px;">
			<div class="button">
				<input type="reset" name="Register" value="CANCEL">
			</div>
			&nbsp;&nbsp;
			<div class="button">
				<input type="submit" name="Add" value="UPDATE"  >
			</div>
		</div>
	</form>
</body>
</html>
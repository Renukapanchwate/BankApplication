<%@page import="bank_application.dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% User user=(User)request.getAttribute("user"); %>
	<fieldset align="center" border="2px">
		<form action="" >
			<label>User Account Number</label> <input type="text"
				value="<%=user.getAccountNumber()%>" readonly="readonly"><br>
			<br> <label>User's Full Name</label> <input type="text"
				value="<%=user.getFirstName() + " " + user.getMiddleName() + " " + user.getLastName()%>"
				readonly="readonly"><br>
			<br> <label>User gender</label> <input type="text"
				value="<%=user.getGender()%>" readonly="readonly"><br>
			<br> <label>User Email</label> <input type="text"
				value="<%=user.getEmail()%>" readonly="readonly"><br>
			<br> <label>User Phone</label> <input type="text"
				value="<%=user.getPhone()%>" readonly="readonly"><br>
			<br> <label>User's Aadhar Card</label> <input type="text"
				value="<%=user.getAadharCard()%>" readonly="readonly"><br>
			<br> <label>User's Date of Birth</label> <input type="text"
				value="<%=user.getDOB()%>" readonly="readonly"><br>
			<br> <label>User's Address</label> <input type="text"
				value="<%=user.getAddress()%>" readonly="readonly"><br>
			<br> <label>User's Pincode</label> <input type="text"
				value="<%=user.getPincode()%>" readonly="readonly"><br>
			<br> <label>User's Account Type</label> <input type="text"
				value="<%=user.getAccountType()%>" readonly="readonly"><br>
			<br> <label>User's Balance</label> <input type="text"
				value="<%=user.getBalance()%>" readonly="readonly"><br>
			<br> <label>User's Branch IFSC</label> <input type="text"
				value="<%=user.getBranch().getIFSC()%>" readonly="readonly"><br>
			<br>
			<a href=""><button>close</button></a>
		</form>
</body>
</html>
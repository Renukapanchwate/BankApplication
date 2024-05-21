<%@page import="bank_application.dto.Bank"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Bank</title>
</head>
<body>
<%Bank bank = (Bank)session.getAttribute("bank"); %>
	<Form action="updateBank" method="post">
		<label>Bank Id :</label><br>
		<input type="number" name="bankId" value="<%=bank.getBankId() %>" readonly><br>
		<label>IFSC :</label><br>
		<input type="text" name="ifsc" value="<%=bank.getIFSC()%>" readonly><br>
		<label>Bank Name :</label><br>
		<input type="text" name="bankName" value="<%=bank.getBankName() %>"><br>
		<label>Customer Number:</label><br>
		<input type="number" name="customerNo" value="<%=bank.getCustomerNumber() %>"><br>
		<label>Bank Email :</label><br>
		<input type="text" name="email" value="<%=bank.getEmail() %>"><br>
		<label>Bank Location :</label><br>
		<input type="text" name="location" value="<%=bank.getLocation() %>" readonly><br>
		<label>Bank Password :</label><br>
		<input type="text" name="password" value="<%=bank.getPassword() %>" readonly><br>
		<label>Bank Balance :</label><br>
		<input type="number" name="balance" value="<%=bank.getBalance() %>" readonly><br>
		<button>Update</button>
	</Form>
</body>
</html>
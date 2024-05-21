<%@page import="bank_application.dto.Bank"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<% HttpSession  session1 = request.getSession() ;
		Bank bank=(Bank)session1.getAttribute("bank");
	%>

<%--<form action="UpdateBank">
		<label>Enter Bank Id</label>
		<input type="text" name="bankId">
		<button type="submit">Submit</button>
	</form> --%>
	
	<form action="UpdateBank" method="post">
		Bank Name : <input type="text" name="name" value="<%= bank.getBankName()%>">
		Bank Id : <input type="text" name="id" value="<%= bank.getBankId() %>" readonly="readonly">
		Bank Balance : <input type="text" name="balance" value="<%= bank.getBalance() %>">
		Bank Location : <input type="text" name="location" value="<%= bank.getLocation() %>" readonly="readonly">
		Bank Customer Number : <input type="text" name="cnumber" value="<%= bank.getCustomerNumber() %>">
		Bank Email : <input type="text" name="email" value="<%= bank.getEmail() %>">
		Bank Password : <input type="text" name="password" value="<%= bank.getPassword() %>">
		<button type="submit">UPDATE</button>
		<button type="submit">CANCEL</button>
	</form>
</body>
</html>
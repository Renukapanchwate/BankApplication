<%@page import="bank_application.dto.Branch"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%	Branch branch=(Branch)session.getAttribute("branch"); %>
	<% if(branch!=null){ %>
		<label>Branch Id :</label><br>
		<input type="number" name="bankId" value="<%=branch.getBranchId() %>" readonly><br>
		<label>Branch IFSC :</label><br>
		<input type="text" name="ifsc" value="<%=branch.getIFSC()%>" readonly><br>
		<label>Branch Name :</label><br>
		<input type="text" name="bankName" value="<%=branch.getBranchName() %>"><br>
		<label>Branch Customer Number:</label><br>
		<input type="number" name="customerNo" value="<%=branch.getCustomerNumber() %>"><br>
		<label>Branch Email :</label><br>
		<input type="text" name="email" value="<%=branch.getEmail() %>"><br>
		<label>Branch Location :</label><br>
		<input type="text" name="location" value="<%=branch.getLocation() %>" readonly><br>
		<label>Branch Password :</label><br>
		<input type="text" name="password" value="<%=branch.getPassword() %>" readonly><br>
		<label>Branch Balance :</label><br>
		<input type="number" name="balance" value="<%=branch.getBalance() %>" readonly><br>
		<button>Close</button>
		<% }else{ %>
		<%= "Branch not found" %>
		<% } %>
</body>
</html>
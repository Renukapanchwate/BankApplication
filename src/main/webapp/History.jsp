<%@page import="bank_application.dto.TransactionHistory"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%-- <form action="history" method="post">
		<label>Enter account number</label> <input type="text" name="account">
		<button type="submit">Submit</button>
	</form> --%>
	<% List<TransactionHistory> list=(List<TransactionHistory>) request.getAttribute("list"); %>
	<% int num=1;
	if(list!=null){ %>
		<table border=2px>
			<tr>
				<th>Sr.No.</th>
				<th>Description</th>
				<th>Created</th>
				<th>Debited</th>
				<th>Balance</th>
			</tr>
			<% for(TransactionHistory h : list){ %>
			<tr>
				<td><%= num++ %></td>
				<td><%= h.getDescription() %></td>
				<td><%= h.getCreated() %></td>
				<td><%= h.getDebited() %></td>
				<td><%= h.getBalance() %></td>
			</tr>
			<% } %>
		</table>
	<% } %>
</body>
</html>
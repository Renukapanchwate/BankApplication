<%@page import="bank_application.dto.Branch"%>
<%@page import="bank_application.dto.Bank"%>
<%@page import="bank_application.dto.User"%>
<%@page import="java.util.List"%>
<%@page import="bank_application.dao.BranchDao"%>
<%@page import="bank_application.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display Users</title>
<style>
	table {
		border-collapse: collapse;
		width: 100%;
	}
	th, td {
		border: 1px solid #ddd;
		padding: 8px;
		text-align: left;
	}
</style>
</head>
<body>
	<%
	Branch branch = (Branch) session.getAttribute("branch");
	UserDao userDao = new UserDao();
	if (branch!= null) {
		List<User> userList = userDao.findByBranch(branch);
		if (!userList.isEmpty()) {
	%>
	<button onclick="window.close()">×</button>
	<table border="1">
		<tr>
			<th>ACCOUNT NUMBER</th>
			<th>FIRST NAME</th>
			<th>MIDDLE NAME</th>
			<th>LAST NAME</th>
			<th>DATE OF BIRTH</th>
			<th>PHONE NUMBER</th>
			<th>ALTERNATE PHONE NUMBER</th>
			<th>AADHAR CARD</th>
			<th>ADDRESS</th>
			<th>ACCOUNT TYPE</th>
			<th>BALANCE</th>
			<th>COUNTRY</th>
			<th>PINCODE</th>
			<th>BRANCH ID</th>
		</tr>
		<%
			for (User user : userList) {
		%>
		<tr>
			<td><%=user.getAccountNumber()%></td>
			<td><%=user.getFirstName()%></td>
			<td><%=user.getMiddleName()%></td>
			<td><%=user.getLastName()%></td>
			<td><%=user.getDOB()%></td>
			<td><%=user.getPhone()%></td>
			<td><%=user.getAlternate()%></td>
			<td><%=user.getAadharCard()%></td>
			<td><%=user.getAddress()%></td>
			<td><%=user.getAccountType()%></td>
			<td><%=user.getBalance()%></td>
			<td><%=user.getCountry()%></td>
			<td><%=user.getPincode()%></td>
			<td><%=user.getBranch().getBranchId()%></td>
			<td><a href="DeleteUser?accountNumber=<%user.getAccountNumber();%>"><button>Delete</button></a> </td>
		</tr>
		<%
			}
		} else {
		%>
		<tr>
			<td colspan="14">No users found in the branch.</td>
		</tr>
		<%
		}
	} else {
	%>
	<tr>
		<td colspan="14">No branch selected.</td>
	</tr>
	<%
	}
	%>
</table>

</body>
</html>
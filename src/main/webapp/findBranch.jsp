<%@page import="bank_application.dto.Branch"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
/* Define your CSS styles here */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
}

form {
	width: 30%;
	margin: 40px;
	margin-left: 35%;
	padding: 20px;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

label {
	font-weight: bold;
}

input[type="text"], input[type="number"] {
	width: 100%;
	padding: 8px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

button {
	padding: 10px 20px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>

	<%
	String message = (String) request.getAttribute("message");
	if (message != null) {
	%>
	<script>
    var msg="<%=message%>
		";
		if (msg !== null && msg !== "") {
			alert(msg);
		}
	</script>

	<%
	}
	%>
	<form action="findBranch" method="post">
		Enter Branch IFSC : <input type="text" name="ifsc"><br>
		<br>

		<%
		Branch branch = (Branch) request.getAttribute("branch");
		%>
		<%
		if (branch != null) {
		%>
		<label>Branch Id :</label><br> <input type="number" name="bankId"
			value="<%=branch.getBranchId()%>" readonly><br> <label>Branch
			IFSC :</label><br> <input type="text" name="ifsc"
			value="<%=branch.getIFSC()%>" readonly><br> <label>Branch
			Name :</label><br> <input type="text" name="bankName"
			value="<%=branch.getBranchName()%>" readonly="readonly"><br>
		<label>Branch Customer Number:</label><br> <input type="number"
			name="customerNo" value="<%=branch.getCustomerNumber()%>"
			readonly="readonly"><br> <label>Branch Email :</label><br>
		<input type="text" name="email" value="<%=branch.getEmail()%>"
			readonly="readonly"><br> <label>Branch Location
			:</label><br> <input type="text" name="location"
			value="<%=branch.getLocation()%>" readonly><br> <label>Branch
			Password :</label><br> <input type="text" name="password"
			value="<%=branch.getPassword()%>" readonly><br> <label>Branch
			Balance :</label><br> <input type="number" name="balance"
			value="<%=branch.getBalance()%>" readonly><br>
		<%
		}
		%>
		<button type="submit">FIND</button>
		<a href=""><button type="submit">CLOSE</button></a>
	</form>
</body>
</html>

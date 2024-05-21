<%@page import="bank_application.dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Details</title>
<style>
/* Define your CSS styles here */
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
}

fieldset {
    width: 80%;
    margin: 20px auto;
    padding: 20px;
    border: 2px solid #ccc;
    border-radius: 10px;
    background-color: #fff;
}

h3 {
    text-align: center;
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 20px;
}

p {
    margin-bottom: 10px;
}

strong {
    font-weight: bold;
}

button {
    display: block;
    margin: 20px auto;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    background-color: #007bff;
    color: #fff;
    cursor: pointer;
}

button:hover {
    background-color: #0056b3;
}

/* Navbar Styles */
.navbar {
    overflow: hidden;
    background-color: #333;
}

.navbar ul {
    list-style-type: none;
    padding: 0;
    margin: 0;
}

.navbar li {
    float: left;
}

.navbar a {
    display: block;
    color: #f2f2f2;
    text-align: center;
    padding: 14px 20px;
    text-decoration: none;
    font-size: 17px;
}

.navbar a:hover {
    background-color: #ddd;
    color: black;
}

.dropdown {
    display: none;
    position: absolute;
    background-color: #333;
    min-width: 160px;
}

.dropdown a {
    float: none;
    color: #f2f2f2;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.has-children:hover .dropdown {
    display: block;
}

.logout-link {
    float: right;
}


@media screen and (max-width: 600px) {
	.navbar a {
		float: none;
		display: block;
		text-align: left;
	}
}
</style>
</head>
<body>
    <% HttpSession httpSession = request.getSession();
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
    <div class="navbar">
        <ul>
            <li><a href="Withdraw.jsp" class="nav-link">Withdraw</a></li>
            <li><a href="Deposit.jsp" class="nav-link">Deposit</a></li>
            <li class="has-children">
                <a href="#" class="nav-link">Transfer</a>
                <ul class="dropdown">
                    <li><a href="TransferWithinBranch.jsp" class="nav-link">In Same Branch</a></li>
                    <li><a href="TransferInDiffBranch.jsp" class="nav-link">In Different Branch</a></li>
                    <li><a href="TransferInDiffBank.jsp" class="nav-link">In Different Bank</a></li>
                </ul>
            </li>
        </ul>
        <a href="logout.jsp" class="logout-link">Logout</a>
    </div>

	<fieldset>
		<h3>User Details</h3>
		<p>
			<strong>User Account Number:</strong>
			<%=user.getAccountNumber()%></p>
		<p>
			<strong>User's Full Name:</strong>
			<%=user.getFirstName() + " " + user.getMiddleName() + " " + user.getLastName()%></p>
		<p>
			<strong>User gender:</strong>
			<%=user.getGender()%></p>
		<p>
			<strong>User Email:</strong>
			<%=user.getEmail()%></p>
		<p>
			<strong>User Phone:</strong>
			<%=user.getPhone()%></p>
		<p>
			<strong>User's Aadhar Card:</strong>
			<%=user.getAadharCard()%></p>
		<p>
			<strong>User's Date of Birth:</strong>
			<%=user.getDOB()%></p>
		<p>
			<strong>User's Address:</strong>
			<%=user.getAddress()%></p>
		<p>
			<strong>User's Pincode:</strong>
			<%=user.getPincode()%></p>
		<p>
			<strong>User's Account Type:</strong>
			<%=user.getAccountType()%></p>
		<p>
			<strong>User's Balance:</strong>
			<%=user.getBalance()%></p>
		<p>
			<strong>User's Branch IFSC:</strong>
			<%=user.getBranch().getIFSC()%></p>
		<a href="UpdateUser.jsp"><button>Update User</button></a> <a
			href="DeleteUser?accountNumber=<%=user.getAccountNumber()%>"><button>Delete
				User</button></a> <a href="history?account=<%=user.getAccountNumber()%>"><button>Get
				Account History</button></a>

	</fieldset>
</body>
</html>
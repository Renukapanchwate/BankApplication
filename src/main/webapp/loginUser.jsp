<%@page import="bank_application.dto.Branch"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form</title>
<!-- Include Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<!-- Include Font Awesome CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
<style>
    /* Custom CSS for the form */
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
    }

    .login-det {
        margin: 50px auto;
        max-width: 400px;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
    }

    .login-det label {
        font-weight: bold;
    }

    .login-det .form-row {
        margin-bottom: 15px;
    }

    .login-det .input-group-text {
        background-color: #007bff;
        color: #fff;
        border: none;
    }

    .login-det .btn-primary {
        width: 100%;
    }
</style>
</head>
<body>
<%
String msg =(String)request.getAttribute("message") ;
Branch branch =(Branch)session.getAttribute("branch") ;
if(msg!=null){
	%>	
	<script>
    // Check if the msg variable is not null
    var msg = "<%=msg%>";
    if (msg !== null && msg !== "") {
        // Display the message in a popup
        alert(msg);
    }
</script>
<%} %>
    <form action="loginUser" method="post">
        <div class="login-det">
            <div class="form-row">
                <label for="accountNumber">Account Number</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="far fa-user"></i></span>
                    </div>
                    <input type="text" class="form-control" placeholder="Enter Account Number" id="accountNumber" name="accountNumber" required>
                </div>
            </div>
            <div class="form-row">
                <label for="phoneNumber">Phone Number</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="far fa-user"></i></span>
                    </div>
                    <input type="text" class="form-control" placeholder="Enter Phone Number" id="phoneNumber" name="phone" required>
                </div>
            </div>
            <div class="form-row">
                <a href="loginUser.jsp"><button type="button" class="btn btn-secondary btn-block">Cancel</button></a>
            </div>
            <div class="form-row">
                <a href="UserHome.jsp"><button type="submit" class="btn btn-primary">Login</button></a>
            </div>
        </div>
    </form>
</body>
</html>
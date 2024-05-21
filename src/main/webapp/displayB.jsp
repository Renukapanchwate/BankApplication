<%@page import="bank_application.dto.Bank"%>
<%@page import="bank_application.dto.Branch"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Branch Details</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    margin: 0;
    padding: 0;
  }
  .container {
    width: 80%;
    margin: 20px auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }
  label {
    font-weight: bold;
  }
  .btn {
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    text-decoration: none;
  }
  .btn:hover {
    background-color: #0056b3;
  }
</style>
</head>
<body>
<div class="container">
<%
  Branch branch = (Branch)session.getAttribute("branch");
  session.setAttribute("branch", branch);
  Bank bank = branch.getBank();
%>
  <label>Branch Id :</label><%= branch.getBranchId() %><br><br>
  <label>IFSC :</label><%= branch.getIFSC() %><br><br>
  <label>Name :</label><%= branch.getBranchName() %><br><br>
  <label>Balance :</label><%= branch.getBalance() %><br><br>
  <label>Customer Number :</label><%= branch.getCustomerNumber() %><br><br>
  <label>Email :</label><%= branch.getEmail() %><br><br>
  <label>Location :</label><%= branch.getLocation() %><br><br>
  <label>Password :</label><%= branch.getPassword() %><br><br>
  <label>Bank Id :</label><%= bank.getBankId() %><br><br>
  <a href="updateBranch?id=<%=branch.getBranchId()%>"><button>Update</button></a> 
</div>
</body>
</html>

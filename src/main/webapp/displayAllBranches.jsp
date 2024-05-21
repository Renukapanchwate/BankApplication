<%@page import="bank_application.dao.BankDao"%>
<%@page import="bank_application.dto.Bank"%>
<%@page import="bank_application.dao.BranchDao"%>
<%@page import="java.util.List"%>
<%@page import="bank_application.dto.Branch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String msg=(String)request.getAttribute("message");
	if(msg!=null){
	%>
	<h2><%= msg%></h2>
	<%
	}
	%>
<table border="2px" cellspacing="0px">
	<tr>
		<th>Branch Id</th>
		<th>Branch Name</th>
		<th>IFSC</th>
		<th>Password</th>
		<th>Location</th>
		<th>Balance</th>
		<th>Customer Number</th>
		<th>Email</th>
	</tr>
	<%
	Bank bank =(Bank)session.getAttribute("bank");
	BankDao bankDao = new BankDao();
	BranchDao dao = new BranchDao() ;
	//Bank bank = new Bank() ;
	Branch branch2 = new Branch() ;
	List<Branch> list2= dao.findBranchByName(bank.getBankName()) ;
	for(Branch branch:list2){
	%>
	<tr>
		<td><%=branch.getBranchId() %></td>
		<td><%=branch.getBranchName() %></td>
		<td><%=branch.getIFSC() %></td>
		<td><%=branch.getPassword() %></td>
		<td><%=branch.getLocation() %></td>
		<td><%=branch.getBalance() %></td>
		<td><%=branch.getCustomerNumber() %></td>
		<td><%=branch.getEmail() %></td>
		<td><a href="delete?id=<%=branch.getBranchId()%>"><button>Delete</button></a> </td>
		<td><a href="updateBranch?id=<%=branch.getBranchId()%>"><button>Update</button></a> </td>
	</tr>
	<%
	}
	%>
</table>
</body>
</html>
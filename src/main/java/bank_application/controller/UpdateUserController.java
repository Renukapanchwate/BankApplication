package bank_application.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bank_application.dao.UserDao;
import bank_application.dto.User;

@WebServlet("/UpdateUser")
public class UpdateUserController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		long accountNumber=Long.parseLong(req.getParameter("accountNumber"));
		String firstName =req.getParameter("firstName") ;
		String middleName = req.getParameter("middleName") ;
		String lastName = req.getParameter("lastName") ;
		String gender = req.getParameter("gender") ;
		String email = req.getParameter("email") ;
		long phone = Long.parseLong(req.getParameter("phone")) ;
		long alternate =Long.parseLong(req.getParameter("alternate")) ;
		String address = req.getParameter("address") ;
		String DOB =req.getParameter("dob");
		String country = req.getParameter("country") ;
		int pincode=Integer.parseInt(req.getParameter("pincode")) ;
		String accountType = req.getParameter("accountType") ;
		long aadharCard = Long.parseLong(req.getParameter("aadharCard")) ;
		double balance=Double.parseDouble(req.getParameter("balance"));
		
		User user = new User() ;
		user.setAccountNumber(accountNumber);
		user.setFirstName(firstName);
		user.setMiddleName(middleName);
		user.setLastName(lastName);
		user.setGender(gender);
		user.setEmail(email) ;
		user.setPhone(phone) ;
		user.setAlternate(alternate);
		user.setAddress(address);
		user.setDOB(DOB);
		user.setCountry(country);
		user.setPincode(pincode);
		user.setAccountType(accountType);
		user.setAadharCard(aadharCard);
		user.setBalance(balance);
		
		UserDao userDao=new UserDao();
		User user1=userDao.login(accountNumber);
		user.setBranch(user1.getBranch());
		userDao.updateUser(user);
		System.out.println("user updated successfully");
	}
}


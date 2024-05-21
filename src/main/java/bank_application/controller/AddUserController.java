package bank_application.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bank_application.dao.BranchDao;
import bank_application.dao.UserDao;
import bank_application.dto.Branch;
import bank_application.dto.User;

@WebServlet("/addUsers")
public class AddUserController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		HttpSession session = req.getSession();
		Branch branch = (Branch) session.getAttribute("branch");
		 
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
		Long aadharCard = Long.parseLong(req.getParameter("aadharCard")) ;
		
		User user = new User() ;
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
		user.setBranch(branch);
		
		UserDao userDao = new UserDao();
        long lastAccountNumber = userDao.getLastAccountNumber(branch.getBranchId());
        long newAccountNumber=0;
        if (lastAccountNumber==0) {
        	newAccountNumber=100001;
			user.setAccountNumber(Long.parseLong(branch.getBranchId() + "" + newAccountNumber));
		} else {
			user.setAccountNumber(++lastAccountNumber);
		}
		userDao.CreateAccount(user);
		req.setAttribute("user", user);
		req.getRequestDispatcher("AfterAddUser.jsp").forward(req, resp);
	}
}
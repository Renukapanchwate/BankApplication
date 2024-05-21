package bank_application.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bank_application.dao.BankDao;
import bank_application.dao.BranchDao;
import bank_application.dto.Bank;
import bank_application.dto.Branch;

@WebServlet("/changePassword")
public class ChangePassword extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 	String email = req.getParameter("email");
		    String oldPassword = req.getParameter("password");
		    String newPassword = req.getParameter("newPassword");
		    String confirmPassword = req.getParameter("confirmPassword");

		    BranchDao branchDao = new BranchDao();
		    Branch branch = branchDao.findByEmail(email);
		    
		    BankDao bankDao = new BankDao();
		    Bank bank = bankDao.findByName(branch.getBranchName());
		    if(branch!=null) {
		    	if(oldPassword.equals(branch.getPassword())) {
		    		if(newPassword.equals(confirmPassword)) {
		    			if(bank!=null) {
		    				bankDao.updatePassword(branch.getBranchName(),newPassword);
		    				branchDao.updatePassword(email,newPassword);
			    			req.setAttribute("message","Password Update Successfully");
			    			req.getRequestDispatcher("homePage.jsp").forward(req, resp);
		    			}
		    			else {
		    				branchDao.updatePassword(email,newPassword);
			    			req.setAttribute("message","Password Update Successfully");
			    			req.getRequestDispatcher("branchHome.jsp").forward(req, resp);
		    			}
			    			
		    		}
		    		else {
		    			req.setAttribute("message","New password and Confirm password doesn't match!");
		    			req.getRequestDispatcher("changePassword.jsp").forward(req, resp);		    			
		    		}
		    	}
		    	else {
		    		req.setAttribute("message","Old password doesn't match!");
	    			req.getRequestDispatcher("changePassword.jsp").forward(req, resp);	
		    	}
		    }
		    else {
		    	req.setAttribute("message","Branch with given email not present");
    			req.getRequestDispatcher("changePassword.jsp").forward(req, resp);	
		    }
		    
	}

}
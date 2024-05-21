package bank_application.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bank_application.dao.BankDao;
import bank_application.dao.BranchDao;
import bank_application.dto.Bank;
import bank_application.dto.Branch;

@WebServlet("/forget")
public class ForgetPasswordController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String ifsc = req.getParameter("ifsc");
		String email = req.getParameter("email");
		String newPassword = req.getParameter("newpassword");
		String confirm = req.getParameter("confirmPassword");
		
		BranchDao branchDao = new BranchDao();
		
		Branch branch = branchDao.login(ifsc);
		
		if(branch!=null) {
			if(email.equals(branch.getEmail())) {
				if(newPassword.equals(confirm)) {
					BankDao bankDao = new BankDao();
					Bank bank = bankDao.findByName(branch.getBranchName());
					if(bank!=null) {
						bankDao.updatePassword(branch.getBranchName(), newPassword);
						branchDao.forgetPassword(newPassword,ifsc);
						req.setAttribute("forget","Password update Successfully");
						req.getRequestDispatcher("login.jsp").forward(req, resp);
					}
					else {
						branchDao.forgetPassword(newPassword,ifsc);
						req.setAttribute("forget","Password update Successfully");
						req.getRequestDispatcher("login.jsp").forward(req, resp);
					}
					
				}
				else {
					req.setAttribute("forget","Confirm Password doesn't match");
					req.getRequestDispatcher("forgetPassword.jsp").forward(req, resp);
				}
			}
			else {
				req.setAttribute("forget","Email Not matched with given IFSC");
				req.getRequestDispatcher("forgetPassword.jsp").forward(req, resp);
			}
		}
		else {
			req.setAttribute("forget","Branch with given IFSC code not present");
			req.getRequestDispatcher("forgetPassword.jsp").forward(req, resp);
		}
	}
}
package bank_application.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bank_application.dao.BankDao;
import bank_application.dao.BranchDao;
import bank_application.dao.UserDao;
import bank_application.dto.Branch;
import bank_application.dto.User;

@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    String accountNumberStr = req.getParameter("accountNumber");
	    
	    if (accountNumberStr == null || accountNumberStr.isEmpty()) {
	        req.setAttribute("message", "Account number is missing or empty.");
	        req.getRequestDispatcher("error.jsp").forward(req, resp);
	        return; 
	    }

	    long accountNumber = 0;
	    try {
	        accountNumber = Long.parseLong(accountNumberStr);
	    } catch (NumberFormatException e) {
	        req.setAttribute("message", "Invalid account number format.");
	        return;
	    }

	    UserDao dao = new UserDao();

	    try {
	        int res = dao.deleteUser(accountNumber);

	        if (res != 0) {
	            req.setAttribute("list", dao.getAllUser());
	            req.setAttribute("message", "User Deleted Successfully");
	        } else {
	            req.setAttribute("message", "User Not Found or Deletion Failed");
	        }
	    } catch (Exception e) {
	        req.setAttribute("message", "An error occurred: " + e.getMessage());
	        e.printStackTrace(); 
	    }

	    req.getRequestDispatcher("DisplayAllUser.jsp").forward(req, resp);
	}


}


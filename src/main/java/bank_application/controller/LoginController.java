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
import bank_application.dto.Bank;
import bank_application.dto.Branch;

@WebServlet("/login")
public class LoginController extends HttpServlet{
	
	private int bankId;

//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//	    String ifsc = req.getParameter("ifsc");
//	    String password = req.getParameter("password");
//
//	    BranchDao branchDao = new BranchDao();
//	    Branch branch = branchDao.login(ifsc);
//
//	    if (branch != null) {
//	        if (branch.getPassword().equals(password)) {
//	            HttpSession session = req.getSession();
//	            session.setAttribute("branch", branch);
//	            Bank bank = branch.getBank();
//
//	            BranchDao bankBranchDao = new BranchDao();
//	            int lastBranchId = bankBranchDao.getLastBranchId(bank.getBankName());
//
//	            if (branch.getBranchId() == lastBranchId) {
//	                bankId = bank.getBankId(); 
//	            } else {
//	                bankId = branch.getBranchId(); 
//	            }
//	            session.setAttribute("bank", bank);
//
//	            if (branch.getBranchId() == bankId) {
//	                req.getRequestDispatcher("homePage.jsp").forward(req, resp);
//	            } else {
//	                req.getRequestDispatcher("branchHome.jsp").forward(req, resp);
//	            }
//	        } else {
//	            req.setAttribute("message", "Invalid Password");
//	            req.getRequestDispatcher("login.jsp").forward(req, resp);
//	        }
//	    } else {
//	        req.setAttribute("message", "Branch not present. Please add.");
//	        req.getRequestDispatcher("addBranch.jsp").forward(req, resp);
//	    }
//	}
//}
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    String ifsc = req.getParameter("ifsc");
	    String password = req.getParameter("password");

	    BranchDao branchDao = new BranchDao();
	    Branch branch = branchDao.login(ifsc);

	    if (branch != null) {
	        if (branch.getPassword().equals(password)) {
	            HttpSession session = req.getSession();
	            session.setAttribute("branch", branch);
	            Bank bank = branch.getBank();

	            BranchDao bankBranchDao = new BranchDao();
	            int lastBranchId = bankBranchDao.getLastBranchId(bank.getBankName());

	            if (branch.getBranchId() == lastBranchId) {
	                bankId = bank.getBankId(); 
	            } else {
	                bankId = branch.getBranchId(); 
	            }
	            session.setAttribute("bank", bank);

	            if (branch.getBranchId() == bankId) {
	                req.getRequestDispatcher("homePage.jsp").forward(req, resp);
	            } else {
	            	req.setAttribute("message", "Login Successfully");
	            	 session.setAttribute("branch", branch);
	                req.getRequestDispatcher("branchHome.jsp").forward(req, resp);
	            }
	        } else {
	            req.setAttribute("message", "Invalid Password");
	            req.getRequestDispatcher("login.jsp").forward(req, resp);
	        }
	    } else {
	        req.setAttribute("message", "Branch not present. Please add.");
	        req.getRequestDispatcher("addBranch.jsp").forward(req, resp);
	    }
	}
}
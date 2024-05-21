package bank_application.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bank_application.dao.BankDao;
import bank_application.dao.BranchDao;
import bank_application.dao.UserDao;
import bank_application.dto.Bank;
import bank_application.dto.Branch;
import bank_application.dto.User;

@WebServlet("/addBranch")
public class AddBranchController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		Bank bank = (Bank) session.getAttribute("bank");
		String branchName = bank.getBankName();

		String location = req.getParameter("location");
		long customerNumber = Long.parseLong(req.getParameter("customerNumber"));
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String confirmPassword = req.getParameter("confirmPassword");
		
		BranchDao branchDao = new BranchDao();
		
		UserDao userDao = new UserDao();
	    User userByPhoneNumber = userDao.findByPhoneNumber(customerNumber);
	    if (userByPhoneNumber != null) {
	        req.setAttribute("message", "Customer Number is already registered as Phone Number");
	        req.getRequestDispatcher("addBranch.jsp").forward(req, resp);
	        return;
	    }
	    User userByAlternateNumber = userDao.findByAlternateNumber(customerNumber);
	    if (userByAlternateNumber != null) {
	        req.setAttribute("message", "Customer Number is already registered as Alternate Number");
	        req.getRequestDispatcher("addBranch.jsp").forward(req, resp);
	        return;
	    }
		
		
		
		Branch dbCustomerNumber = branchDao.findByCustomerNumber(customerNumber);
        if (dbCustomerNumber != null) {
            req.setAttribute("message", "Customer Number is already registered");
            req.getRequestDispatcher("addBranch.jsp").forward(req, resp);
            return;
        }
        Branch dbEmail = branchDao.findByEmail(email);
	    if (dbEmail!=null) {
	        req.setAttribute("message", "Email ID is already registered");
	        req.getRequestDispatcher("addBranch.jsp").forward(req, resp);
	        return; 
	    }

		Branch branch = new Branch();
		branch.setBranchName(bank.getBankName());
		branch.setLocation(location);
		branch.setEmail(email);
		branch.setPassword(password);
		branch.setCustomerNumber(customerNumber);

		
		
		
		
		String bankName = bank.getBankName();
		int lastBranchId = branchDao.getLastBranchId(bankName);
		BankDao bankDao=new BankDao();
		Bank bank2=bankDao.findBank(lastBranchId);
		if (bank2!=null) {
			int newId = (lastBranchId == 0|| lastBranchId<=1000 ) ? 1000 : lastBranchId + 1001;
			branch.setBranchId(newId);
		} else {
			int newId = (lastBranchId == 0|| lastBranchId<=1000 ) ? 1000 : lastBranchId + 1;
			branch.setBranchId(newId);
		}

		String Ifsc = "";
		Ifsc += bank.getBankName().charAt(0);
		for (int i = 1; i < bank.getBankName().length(); i++) {
			char ch = bank.getBankName().charAt(i);
			if (ch == ' ') {
				Ifsc += bank.getBankName().charAt(i + 1);
			}
		}
		Ifsc += branch.getBranchId();
		branch.setIFSC(Ifsc.toUpperCase());
		branch.setBank(bank);

		Branch dbBranch = branchDao.addBranch(branch);

		if (dbBranch != null) {
			if (password.equals(confirmPassword)) {
				session.setAttribute("bank", bank);
				System.out.println("Branch Created");
				req.setAttribute("branchAdd", "Branch Added ");
				req.getRequestDispatcher("homePage.jsp").forward(req, resp);
			} else {
				session.setAttribute("bank", bank);
				System.out.println("Failed to add branch: Passwords do not match");
				req.setAttribute("message", "Fail to Add, Passwords do not match");
				req.getRequestDispatcher("addBranch.jsp").forward(req, resp);
			}
		} else {
			session.setAttribute("bank", bank);
			req.setAttribute("message", "Can't Able to Add");
			System.out.println("Failed to add branch: Only main branch can add new branch");
			req.getRequestDispatcher("homePage.jsp").forward(req, resp);
		}
    }
}





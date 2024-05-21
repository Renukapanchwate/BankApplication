package bank_application.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bank_application.dao.BankDao;
import bank_application.dao.BranchDao;
import bank_application.dao.TransactionDao;
import bank_application.dao.UserDao;
import bank_application.dto.Bank;
import bank_application.dto.Branch;
import bank_application.dto.TransactionHistory;
import bank_application.dto.User;

@WebServlet("/Withdraw")
public class WithdrawController extends HttpServlet{

	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        
	        long accountNumber = Long.parseLong(req.getParameter("account"));
	        double amount = Double.parseDouble(req.getParameter("amount"));
	        
	        if (amount < 0) {
	            req.setAttribute("account", "Amount must be greater than 0");
	            req.getRequestDispatcher("Withdraw.jsp").forward(req, resp);
	            return; // Stop processing further
	        }
	        
	        UserDao userDao = new UserDao();
	        TransactionDao transactionDao = new TransactionDao();
	        BankDao bankDao = new BankDao();
	        BranchDao branchDao = new BranchDao();
	        User user = userDao.getUser(accountNumber);
	        
	        if (user != null) { 
	            TransactionHistory history = new TransactionHistory();
	            history.setDebited(amount);
	            history.setDescription("Amount "+amount+" debited at "+transactionDao.description());
	            
	            double balance = user.getBalance();
	            if (balance > amount) {
	                history.setBalance(balance - amount);
	                Branch branch = user.getBranch();
	                branch.setBalance(branch.getBalance() - amount);
	                Bank bank = bankDao.findBank(branch.getBranchId());
	                if (bank != null) {
	                    bank.setBalance(bank.getBalance() - amount);
	                    branch.setBank(bank);
	                    bankDao.updateBalance(bank);
	                }
	                user.setBalance(balance - amount);
	                user.setBranch(branch);
	                history.setUser(user);
	                
	                transactionDao.saveHistroy(history);
	                userDao.updateBalance(user);
	                branchDao.updateBalance(branch);
	                System.out.println("Withdraw success");
	                req.setAttribute("account","Amount Withdraw Successfully");
	                req.getRequestDispatcher("History.jsp").forward(req, resp);
	            } else {
	            	req.setAttribute("account","Insufficient Balance");
	                req.getRequestDispatcher("Withdraw.jsp").forward(req, resp);
	            }
	        } else {
	            req.setAttribute("account", "Account Number Not present");
	            req.getRequestDispatcher("Withdraw.jsp").forward(req, resp);
	            
	        }
	    }
	}
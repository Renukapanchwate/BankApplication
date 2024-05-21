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

@WebServlet("/deposit")
public class DepositController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		long accountNumber=Long.parseLong(req.getParameter("account"));
		double amount=Double.parseDouble(req.getParameter("amount"));
		
		UserDao userDao=new UserDao();
		TransactionDao transactionDao=new TransactionDao();
		BranchDao branchDao=new BranchDao();
		BankDao bankDao=new BankDao();
		User user=userDao.getUser(accountNumber);
		
		TransactionHistory history=new TransactionHistory();
		history.setCreated(amount);
		history.setDescription("amount "+amount+" is created at "+transactionDao.description());
		double balance=user.getBalance();
		history.setBalance(balance+amount);
		user.setBalance(balance+amount);
		
		Branch branch=user.getBranch();
		branch.setBalance(branch.getBalance()+amount);
		
		Bank bank=bankDao.findBank(branch.getBranchId());
		if (bank!=null) {
			bank.setBalance(bank.getBalance()+amount);
			branch.setBank(bank);
			bankDao.updateBalance(bank) ;
		}
		user.setBranch(branch);
		history.setUser(user);
		
		transactionDao.saveHistroy(history);
		userDao.updateBalance(user);
		branchDao.updateBalance(branch);
		;
		System.out.println("deposit success");
	}
}


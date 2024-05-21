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

@WebServlet("/withinbranch")
public class TransferWithinBranch extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		long accountNumber = Long.parseLong(req.getParameter("account1"));
		long accountNumber2 = Long.parseLong(req.getParameter("account2"));
		double amount = Double.parseDouble(req.getParameter("amount"));

		BankDao bankDao = new BankDao();
		BranchDao branchDao = new BranchDao();
		UserDao userDao = new UserDao();
		User user = userDao.getUser(accountNumber);
		if (user != null) {
			TransactionDao transactionDao = new TransactionDao();
			double balance = user.getBalance();
			if (balance > amount && amount>0) {
				TransactionHistory history = new TransactionHistory();
				history.setDebited(amount);
				history.setDescription("amount " + amount + " is transfered to " + accountNumber2 + " at "
						+ transactionDao.description());
				history.setBalance(balance - amount);

				Branch branch = user.getBranch();
//				branch.setBalance(branch.getBalance() - amount);
				branch.setBalance(branch.getBalance());
				Bank bank = bankDao.findBank(branch.getBranchId());
				if (bank != null) {
//					bank.setBalance(bank.getBalance() - amount);
					bank.setBalance(bank.getBalance()) ;
					branch.setBank(bank);
				}
				user.setBalance(balance - amount);
				user.setBranch(branch);
				history.setUser(user);

				transactionDao.saveHistroy(history);
				userDao.updateBalance(user);
				branchDao.updateBalance(branch);

				User user1 = userDao.getUser(accountNumber2);
				if (user1 != null) {
					TransactionHistory history1 = new TransactionHistory();
					history1.setCreated(amount);
					history1.setDescription("amount " + amount + " is received from " + accountNumber + " at "
							+ transactionDao.description());
					history1.setBalance(amount);

					Branch branch1 = user1.getBranch();
//					branch1.setBalance(branch1.getBalance() - amount);
					branch1.setBalance(branch1.getBalance());
					Bank bank1 = bankDao.findBank(branch1.getBranchId());
					if (bank1 != null) {
//						bank1.setBalance(bank1.getBalance() - amount);
						bank1.setBalance(bank1.getBalance());
						branch1.setBank(bank1);
					}
					user1.setBalance(user1.getBalance() + amount);
					user1.setBranch(branch1);
					history1.setUser(user1);

					transactionDao.saveHistroy(history1);
					userDao.updateBalance(user1);
					branchDao.updateBalance(branch1);
					System.out.println("Transfer success");
					req.setAttribute("transfer","Transfer success");
					req.getRequestDispatcher("TransferWithinBranch.jsp").forward(req, resp);
				} else {
					System.out.println("receiver not found");
					req.setAttribute("transfer","Receiver not found");
					req.getRequestDispatcher("TransferWithinBranch.jsp").forward(req, resp);
				}
			} else {
				System.out.println("Insufficient balance");
				req.setAttribute("transfer","Insufficient balance");
				req.getRequestDispatcher("TransferWithinBranch.jsp").forward(req, resp);

			}
		} else {
			System.out.println("Sender account does not exist");
			req.setAttribute("transfer","Sender account does not exist");
			req.getRequestDispatcher("TransferWithinBranch.jsp").forward(req, resp);

		}
	}
}
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

@WebServlet("/addBank")
public class AddBankController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String bankName = req.getParameter("bankName");
		String location = req.getParameter("location");
		long customerNumber = Long.parseLong(req.getParameter("customerNumber"));
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String confirmPassword = req.getParameter("confirmPassword");

		Bank bank = new Bank();
		bank.setBankName(bankName);
		bank.setLocation(location);
		bank.setCustomerNumber(customerNumber);
		bank.setEmail(email);
		bank.setPassword(password);

		BankDao bankDao = new BankDao();
		int lastBankId = bankDao.getLastBankId();

		int newId = (lastBankId == 0) ? 100000 : lastBankId + 100000;
		bank.setBankId(newId);
		String Ifsc = "";
		Ifsc += bankName.charAt(0);
		for (int i = 1; i < bankName.length(); i++) {

			char ch = bankName.charAt(i);
			if (ch == ' ') {
				Ifsc += bankName.charAt(i + 1);
			}
		}
		Ifsc += newId;
		bank.setIFSC(Ifsc.toUpperCase());

		Branch branch = new Branch();
		branch.setBranchName(bankName);
		branch.setLocation(location);
		branch.setEmail(email);
		branch.setPassword(password);
		branch.setCustomerNumber(customerNumber);

		branch.setBranchId(bank.getBankId());
		branch.setIFSC(bank.getIFSC());
		branch.setBank(bank);

		BranchDao branchDao = new BranchDao();

		bankDao.addBank(bank);
		branchDao.addBranch(branch);

		if (password.equals(confirmPassword)) {
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		} else {
			req.getRequestDispatcher("addBank.jsp").forward(req, resp);
		}
	}


}

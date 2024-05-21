package bank_application.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bank_application.dao.BankDao;
import bank_application.dao.BranchDao;
import bank_application.dto.Bank;
import bank_application.dto.Branch;

@WebServlet("/UpdateBank")
public class UpdateBankController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name=req.getParameter("name");
		int id=Integer.parseInt(req.getParameter("id"));
		double balance=Double.parseDouble(req.getParameter("balance"));
		String location=req.getParameter("location");
		long cNumber=Long.parseLong(req.getParameter("cnumber"));
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		Bank bank=new Bank();
		bank.setBankId(id);
		bank.setBankName(name);
		bank.setCustomerNumber(cNumber);
		bank.setEmail(email);
		bank.setLocation(location);
		bank.setBalance(balance);
		bank.setPassword(password);
		String ifsc="";
		ifsc+=name.charAt(0);
		for (int i = 1; i < name.length(); i++) {
			char ch=name.charAt(i);
			if (ch==' ') {
				ifsc+=name.charAt(i+1);
			}
		}
		bank.setIFSC((ifsc+=id).toUpperCase());
		
		BankDao bankDao=new BankDao();
		bankDao.updateBank(id, bank);
		
		BranchDao branchDao=new BranchDao();
		List<Branch> list=branchDao.getBranches(id);
		for (Branch branch : list) {
			branch.setBranchName(name);
			branch.setIFSC(ifsc);
			branch.setBank(bank);
			branchDao.updateBranchByBank(branch);
		}
		System.out.println("success");
//		HttpSession session=req.getSession();
//		session.setAttribute(name, session);
//		req.getRequestDispatcher("BankUpdate.jsp").forward(req, resp);
	}
}

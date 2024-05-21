package bank_application.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
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

@WebServlet("/displayBranches")
public class DisplayController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		int bankId = Integer.parseInt(req.getParameter("bankId"));

		BankDao dao = new BankDao();
		BranchDao branchDao=new BranchDao();
		
//		List<Branch> list = dao.getAllBranches();

		HttpSession httpSession=req.getSession();
		Bank bank=(Bank) httpSession.getAttribute("bank");
		
		List<Branch> list=branchDao.getBranchesByBankId(bank.getBankId());
		if (list!=null) {
			req.setAttribute("list", list);
			req.getRequestDispatcher("displayAllBranches.jsp").forward(req, resp);
		} else {
			req.setAttribute("message", "No branches found");
			req.setAttribute("list", list);
			req.getRequestDispatcher("displayAllBranches.jsp").forward(req, resp);
		}
	}

}
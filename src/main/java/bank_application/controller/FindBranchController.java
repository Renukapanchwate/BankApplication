package bank_application.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bank_application.dao.BranchDao;
import bank_application.dto.Bank;
import bank_application.dto.Branch;

@WebServlet("/findBranch")
public class FindBranchController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String ifsc=req.getParameter("ifsc");
		
		HttpSession session=req.getSession();
		
		Bank bank=((Bank) session.getAttribute("bank"));
		int id=bank.getBankId();
		
		Branch branch=new BranchDao().findBranchOfParticularBank(ifsc, id);
		
		if(branch != null) {

			session.setAttribute("branch", branch);
			System.out.println("branch found successfully");
			req.getRequestDispatcher("displayOneBranch.jsp").forward(req, resp);
			
		}else {
			req.setAttribute("message", "Branch Not Found");
			System.out.println("branch  not found");
			req.getRequestDispatcher("findBranch.jsp").forward(req, resp);
			
		}
	}
}
	
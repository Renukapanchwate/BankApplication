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

@WebServlet("/delete")
public class DeleteBranchController extends HttpServlet{
	
	private BranchDao branchDao;
    private BankDao bankDao;

    @Override
    public void init() throws ServletException {
        super.init();
        branchDao = new BranchDao();
        bankDao = new BankDao();
    }
     
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	 int id = Integer.parseInt(req.getParameter("id"));

    	    HttpSession httpSession = req.getSession();
    	    Bank bank = (Bank) httpSession.getAttribute("bank");

    	    try {
    	        branchDao.deleteBranchUsers(id);
    	        
    	        branchDao.deleteBranch(id);
    	        
    	        List<Branch> list = bankDao.getAllBranches();
    	        if (!list.isEmpty()) {
    	            req.setAttribute("list", list);
    	            req.getRequestDispatcher("displayAllBranches.jsp").forward(req, resp);
    	        } else {
    	            req.setAttribute("message", "No branches found");
    	            req.setAttribute("list", list);
    	            req.getRequestDispatcher("displayAllBranches.jsp").forward(req, resp);
    	        }
    	    } catch (Exception e) {
    	        req.setAttribute("message", "Something went wrong!");
    	        req.getRequestDispatcher("displayAllBranches.jsp").forward(req, resp);
    	    }
    }
}

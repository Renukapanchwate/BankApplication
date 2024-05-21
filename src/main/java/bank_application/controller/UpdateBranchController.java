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

@WebServlet("/updateBranch")
public class UpdateBranchController extends HttpServlet {
    BranchDao dao = new BranchDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int branchId = Integer.parseInt(req.getParameter("id"));
        try {
            Branch branch = dao.findBranchById(branchId);
            if (branch == null) {
                req.setAttribute("message", "Branch not found");
                req.getRequestDispatcher("displayAllBranches.jsp").forward(req, resp);
            }
            req.setAttribute("branch", branch);
            RequestDispatcher dispatcher = req.getRequestDispatcher("updateBranch.jsp");
            dispatcher.forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int branchId = Integer.parseInt(req.getParameter("branchId"));
        String branchName = req.getParameter("branchname");
        String ifsc = req.getParameter("ifsc");
        String location = req.getParameter("location");
        double balance = Double.parseDouble(req.getParameter("balance"));
        long customerNumber = Long.parseLong(req.getParameter("customerNumber"));
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        Branch branch = new Branch();
        branch.setBranchId(branchId); // Set the ID of the branch to identify which branch to update
        branch.setBranchName(branchName);
        branch.setIFSC(ifsc);
        branch.setLocation(location);
        branch.setBalance(balance);
        branch.setCustomerNumber(customerNumber);
        branch.setEmail(email);
        branch.setPassword(password);

        try {
            int result = dao.updateBranch(branch);
            if (result != 0) {
                req.setAttribute("message", "Branch updated successfully");
            } else {
                req.setAttribute("message", "Failed to update branch");
            }
            RequestDispatcher dispatcher = req.getRequestDispatcher("displayAllBranches.jsp");
            dispatcher.forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("message", "An error occurred: " + e.getMessage());
            RequestDispatcher dispatcher = req.getRequestDispatcher("displayAllBranches.jsp");
            dispatcher.forward(req, resp);
        }
    }
}

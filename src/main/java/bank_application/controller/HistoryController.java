package bank_application.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bank_application.dao.TransactionDao;
import bank_application.dto.TransactionHistory;

@WebServlet("/history")
public class HistoryController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		long accountNumber=Long.parseLong(req.getParameter("account"));
		
		TransactionDao dao=new TransactionDao();
		List<TransactionHistory> list=dao.getHistory(accountNumber);
		
		req.setAttribute("list", list);
		req.getRequestDispatcher("History.jsp").forward(req, resp);
	}
}
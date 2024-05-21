package bank_application.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;

import bank_application.dao.BranchDao;
import bank_application.dao.UserDao;
import bank_application.dto.Bank;
import bank_application.dto.Branch;
import bank_application.dto.User;

@WebServlet("/loginUser")
public class UserLoginController extends HttpServlet {

//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		long accountNumber = Long.parseLong(req.getParameter("accountNumber")) ;
//		long phone = Long.parseLong(req.getParameter("phone")) ;
//		
//		UserDao dao = new UserDao() ;
//		User user =dao.login(accountNumber) ;
//		
//		
//		
//		if(user!=null) {
//			if(phone==user.getPhone()) {
//				HttpSession httpSession =req.getSession() ;
//				httpSession.setAttribute("user", user);
//				System.out.println("User login successfull");
//				req.getRequestDispatcher("UserHome.jsp").forward(req, resp);
//			}else {
//				System.out.println("phone not found");
//				req.getRequestDispatcher("loginUser.jsp").forward(req, resp);
//			}
//		}else {
//			System.out.println("User not found");
//			req.getRequestDispatcher("loginUser.jsp").forward(req, resp);
//		}
//	
//	}
//
//}

	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		long accountNumber = Long.parseLong(req.getParameter("accountNumber"));
		long phone = Long.parseLong(req.getParameter("phone"));
		
		HttpSession session = req.getSession() ;
		Branch branch=(Branch)session.getAttribute("branch") ;

		BranchDao branchDao = new BranchDao();
//		User user = new User();

		UserDao dao = new UserDao();
		User user = dao.login(accountNumber);
		
		if (user != null) {
			if (user.getBranch().getBranchId() != branch.getBranchId()) {
				System.out.println("Renuuuu");
				req.setAttribute("message","User not Presnet");
				req.getRequestDispatcher("loginUser.jsp").forward(req, resp);
				return ;
			}
				if (phone == user.getPhone()) {
					HttpSession httpSession = req.getSession();
					httpSession.setAttribute("user", user);
					System.out.println("User login successfull");
					req.getRequestDispatcher("UserHome.jsp").forward(req, resp);
				} else {
					req.setAttribute("message","Phone not found");
					System.out.println("phone not found");
					req.getRequestDispatcher("loginUser.jsp").forward(req, resp);
				}
			} 
		 else {
			 req.setAttribute("message","User not found");
			System.out.println("User Not Found");
			req.getRequestDispatcher("loginUser.jsp").forward(req, resp);
		}

	}

}
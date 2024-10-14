package com.ebook.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ebook.daoImpl.UserDAOImpl;
import com.ebook.model.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public RegisterServlet() {
        super();
    }
    
    private UserDAOImpl userDAO;

    public void init() {
        userDAO = new UserDAOImpl();
    }

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession s = req.getSession();
		
		try {
			String fname = req.getParameter("fname");
			String password = req.getParameter("password");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String check = req.getParameter("check");

			User u = new User();
			u.setName(fname);
			u.setPassword(password);
			u.setEmail(email);
			u.setPhNumber(phone);
			
			if(check!=null) {
				boolean checkUser = userDAO.checkUser(email);
				
				if(checkUser) {
					boolean f = userDAO.addUser(u);
					
					if(f) {
						s.setAttribute("successMsg", "Registration Successfully..");
						resp.sendRedirect("register.jsp");
					}else {
						s.setAttribute("failedMsg", "Server down Please try again later..");
						 resp.sendRedirect("register.jsp?fname=" + fname + "&email=" + email + "&phone=" + phone);
					}
				}else {
					s.setAttribute("failedMsg", "Email Id Already Exits");
					resp.sendRedirect("register.jsp");
				}
			}else {
				s.setAttribute("failedMsg", "Please check Agree Terms & condition");
				 resp.sendRedirect("register.jsp?fname=" + fname + "&email=" + email + "&phone=" + phone);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}

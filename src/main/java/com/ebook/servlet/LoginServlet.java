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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }
    
    private UserDAOImpl userDAO;

    public void init() {
        userDAO = new UserDAOImpl();
    }
    
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		try {
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			User user = userDAO.getUserByEmail(email);
			
//			System.out.println(user);

			if("admin@gmail.com".equals(email)  && "admin".equals(password)) {
				User u = new User();
				u.setName("Admin");
				session.setAttribute("user", u);
				
				resp.sendRedirect("admin/home.jsp");
			}
			else if (user != null && password.equals(user.getPassword())) {
	        	session.setAttribute("user", user);
	    		
	            resp.sendRedirect("index.jsp");
	        } 
			else {
				session.setAttribute("failedMsg", "Email & Password Invalid");
	            resp.sendRedirect("login.jsp?error=true");
	        }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

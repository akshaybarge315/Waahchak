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

@WebServlet("/editProfile")
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	UserDAOImpl dao = new UserDAOImpl();
       
    public EditProfileServlet() {
        super();
    }

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User u = (User)session.getAttribute("user");
		
		int id = Integer.parseInt(req.getParameter("uid"));
		String fname = req.getParameter("fname");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String password = req.getParameter("password");
		
		String uPassword = u.getPassword();
		
		User user = new User();
		user.setId(id);
		user.setName(fname);
		user.setEmail(email);
		user.setPhNumber(phone);
		
		if(password.equals(uPassword)) {
			boolean r = dao.updateUser(user);
			
			if(r) {
				session.setAttribute("successMsg", "Data Updated Successfully");
				resp.sendRedirect("editProfile.jsp");
			}else {
				session.setAttribute("failedMsg", "Email or Phone Already exits");
				resp.sendRedirect("editProfile.jsp");
				
			}
			
		}else {
			session.setAttribute("failedMsg", "Incorrect Password");
			resp.sendRedirect("editProfile.jsp");
		}
		
	}

}

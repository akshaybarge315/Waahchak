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

@WebServlet("/addAddress")
public class EditAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	UserDAOImpl dao = new UserDAOImpl();

	public EditAddressServlet() {
        super();
    }

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		int id = Integer.parseInt(req.getParameter("uid"));
		String address = req.getParameter("address");
		String landmark = req.getParameter("landmark");
		String city = req.getParameter("city");
		String state = req.getParameter("state");
		String zip = req.getParameter("zip");
		
		User user = new User();
		user.setId(id);
		user.setAddress(address);
		user.setLandmark(landmark);
		user.setCity(city);
		user.setState(state);
		user.setPincode(zip);
		
		boolean r = dao.addUserAddress(user);
		
		if(r) {
			session.setAttribute("successMsg", "Address added Successfully");
			resp.sendRedirect("editAddress.jsp");
		}else {
			session.setAttribute("failedMsg", "Please try again later");
			resp.sendRedirect("editAddress.jsp");
			
		}
	}

}

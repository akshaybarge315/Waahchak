package com.ebook.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ebook.daoImpl.CartDAOImpl;

@WebServlet("/removeBook")
public class RemoveCartBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RemoveCartBook() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		int cart_id = Integer.parseInt(req.getParameter("cid"));
		
		CartDAOImpl dao = new CartDAOImpl();
		boolean r = dao.deleteBook(cart_id);
		
		if(r) {
			session.setAttribute("successMsg", "Book Removed from cart");
			resp.sendRedirect("cart.jsp");
		}else {
			session.setAttribute("failed", "Please try again later");
			resp.sendRedirect("cart.jsp");
		}
	}

}

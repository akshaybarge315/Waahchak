package com.ebook.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ebook.daoImpl.BookDAOImpl;
import com.ebook.daoImpl.CartDAOImpl;
import com.ebook.model.BookDetails;
import com.ebook.model.Cart;

@WebServlet("/cart")
public class CardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CardServlet() {   }

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		int book_id = Integer.parseInt(req.getParameter("bid"));
		int user_id = Integer.parseInt(req.getParameter("uid"));
		
		BookDAOImpl bdao = new BookDAOImpl();
		BookDetails b = bdao.getBookById(book_id);
		
		Cart cart = new Cart();
		cart.setBookid(book_id);
		cart.setBname(b.getBookName());
		cart.setAuthor(b.getAuthorName());
		cart.setUserid(user_id);
		cart.setPrice(b.getPrice());
		cart.setTotal_price(b.getPrice());
		
		CartDAOImpl cdao = new CartDAOImpl();
		boolean r = cdao.addCart(cart);
		
		if(r) {
			session.setAttribute("addCart", "Book Added to cart");
			resp.sendRedirect("all_new_book.jsp");
		}else {
			session.setAttribute("failed", "Please try again later");
			resp.sendRedirect("all_new_book.jsp");
		}
	}

}

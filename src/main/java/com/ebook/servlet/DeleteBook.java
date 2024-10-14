package com.ebook.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ebook.daoImpl.BookDAOImpl;

@WebServlet("/deleteOldBook")
public class DeleteBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	BookDAOImpl bookDAO = new BookDAOImpl();

	public DeleteBook() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		int id = Integer.parseInt(req.getParameter("id"));
		
		boolean b = bookDAO.deleteBook(id);
		
		if(b) {
			session.setAttribute("successMsg", "Book deleted Successfully");
			resp.sendRedirect("edit_old_book.jsp");
		}else {
			session.setAttribute("failedMsg", "Book not deleted");
			resp.sendRedirect("edit_old_book.jsp");
			
		}
	}

}

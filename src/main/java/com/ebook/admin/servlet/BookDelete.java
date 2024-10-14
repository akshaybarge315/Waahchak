package com.ebook.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ebook.daoImpl.BookDAOImpl;

@WebServlet("/deleteBook")
public class BookDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	BookDAOImpl bookDAO = new BookDAOImpl();
	
    public BookDelete() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		int id = Integer.parseInt(req.getParameter("id"));
		
		boolean b = bookDAO.deleteBook(id);
		
		if(b) {
			session.setAttribute("successMsg", "Book deleted Successfully");
			resp.sendRedirect("admin/all_books.jsp");
		}else {
			session.setAttribute("failedMsg", "Book not deleted");
			resp.sendRedirect("admin/all_books.jsp");
			
		}
	}

}

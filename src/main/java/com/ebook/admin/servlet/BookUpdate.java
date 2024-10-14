package com.ebook.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ebook.daoImpl.BookDAOImpl;
import com.ebook.model.BookDetails;

@WebServlet("/updateBook")
public class BookUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	BookDAOImpl bookDAO = new BookDAOImpl();
	
    public BookUpdate() {
        super();
    }

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		int id = Integer.parseInt(req.getParameter("id"));
		String bname = req.getParameter("bname");
		String author = req.getParameter("author");
		int price = Integer.parseInt(req.getParameter("price"));
		String status = req.getParameter("status");
		
		BookDetails bd = new BookDetails();
		bd.setBookId(id);
		bd.setBookName(bname);
		bd.setAuthorName(author);
		bd.setPrice(price);
		bd.setStatus(status);
		
		boolean b = bookDAO.updateBook(bd);
		
		if(b) {
			session.setAttribute("successMsg", "Book Update Successfully");
			resp.sendRedirect("admin/all_books.jsp");
		}else {
			session.setAttribute("failedMsg", "Please enter all details correctly");
			resp.sendRedirect("admin/all_books.jsp");
			
		}
	}

}

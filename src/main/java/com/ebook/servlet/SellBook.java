package com.ebook.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.ebook.daoImpl.BookDAOImpl;
import com.ebook.model.BookDetails;

@WebServlet("/sellBook")
@MultipartConfig
public class SellBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	BookDAOImpl bookDAO = new BookDAOImpl();
       
    public SellBook() {
        super();
    }

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		String bname = req.getParameter("bname");
		String author = req.getParameter("author");
		int price = Integer.parseInt(req.getParameter("price"));
		String category = req.getParameter("category");
		String status = req.getParameter("status");
		String user_email = req.getParameter("uemail");
		Part part = req.getPart("bookImg");
		String fileName = part.getSubmittedFileName();
		
		BookDetails bd = new BookDetails();
		bd.setBookName(bname);
		bd.setAuthorName(author);
		bd.setPrice(price);
		bd.setbCategeory(category);
		bd.setStatus(status);
		bd.setPhoto(fileName);
		bd.setUser_email(user_email);
		
		boolean book = bookDAO.addBooks(bd);
		
		if(book) {
			
			String path = getServletContext().getRealPath("")+"assets\\book";
			File file = new File(path);
			part.write(path + File.separator + fileName);
			System.out.println(path);
			
			session.setAttribute("successMsg", "Book Added Successfully");
			resp.sendRedirect("sell_book.jsp");
		}else {
			session.setAttribute("failedMsg", "Please enter all details");
			resp.sendRedirect("sell_book.jsp");
		}
	}

}

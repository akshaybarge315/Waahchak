package com.ebook.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ebook.daoImpl.CartDAOImpl;
import com.ebook.daoImpl.OrderDAOImpl;
import com.ebook.model.Cart;
import com.ebook.model.Order;

@WebServlet("/confirmOrder")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderServlet() {
        super();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	HttpSession session = req.getSession();
    	
    	int userId = Integer.parseInt(req.getParameter("userId"));
    	String name = req.getParameter("name");
    	String email = req.getParameter("email");
    	String mobile = req.getParameter("mobile");
    	String address = req.getParameter("address");
    	String landmark = req.getParameter("landmark");
    	String city = req.getParameter("city");
    	String state = req.getParameter("state");
    	String zip = req.getParameter("zip");
    	String payment = req.getParameter("payment");
    	String full_address = String.join(", ", address, landmark, city, state, zip);
    	
    	CartDAOImpl cartDAO = new CartDAOImpl();
    	OrderDAOImpl orderDAO = new OrderDAOImpl();
    	
    	List<Cart> cartByUser = cartDAO.getCartByUser(userId);
    	
    	if(cartByUser.isEmpty()) {
    		session.setAttribute("failed", "Please Add books in your cart");
    		resp.sendRedirect("cart.jsp");
    	}else {
    		Order order = null;
        	List<Order> orderList = new ArrayList<>();
        	
        	Random rd = new Random();
        	
        	for(Cart c:cartByUser) {
        		order = new Order();
        		order.setOrderId("ORDER-0" + rd.nextInt(1000));
        		order.setUserName(name);
        		order.setEmail(email);
        		order.setPhone(mobile);
        		order.setAddress(full_address);
        		order.setBook_name(c.getBname());
        		order.setAuthor(c.getAuthor());
        		order.setPrice(c.getPrice());
        		order.setPaymentMode(payment);
        		orderList.add(order);
        	}
        	
        	if("noSelect".equals(payment)) {
        		session.setAttribute("failed", "Choose Payment Method");
        		resp.sendRedirect("cart.jsp");
        	}else {
        		boolean r = orderDAO.addOrder(orderList);
        		
        		if(r) {
        			resp.sendRedirect("order_confirmation.jsp");
        		}else {
        			session.setAttribute("failed", "Your Order Failed");
            		resp.sendRedirect("cart.jsp");
        		}
        	}
    	}
    	
    }

}

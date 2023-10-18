package com.user.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class changePassword
 */
@WebServlet("/changePassword")
public class changePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
        
        // Assuming you have retrieved user details during login and stored them in the session
        String user_id = (String) session.getAttribute("id");
        
        // Set user details in request attributes to be used in the JSP
        request.setAttribute("uid", user_id);
        
        // Forward the request to updateProfile.jsp
        request.getRequestDispatcher("changePassword.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String newPassword = request.getParameter("password");
	    
	    HttpSession session = request.getSession();
	    // Retrieve the user_id from the hidden input field
	    int userId = Integer.parseInt(request.getParameter("id"));
	
	    RequestDispatcher dispatcher = null;
		Connection con = null;
			
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_profile?useSSL=false","root","Linkin2053#");
		
		PreparedStatement pst = con.prepareStatement("UPDATE users SET password=? WHERE id=?");
		pst.setString(1, newPassword); // Updated First Name
	    pst.setInt(2, userId);
		
		int rowCount = pst.executeUpdate();
		// Update session attributes with the new data
		dispatcher = request.getRequestDispatcher("changePassword.jsp");
		if(rowCount > 0) {
			request.setAttribute("status", "success");
			session.setAttribute("password", newPassword);
			
		} else {
			request.setAttribute("status", "failed");
		}
		dispatcher.forward(request, response);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}

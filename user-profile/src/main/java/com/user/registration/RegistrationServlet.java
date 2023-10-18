package com.user.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String phone = request.getParameter("contact");
		String dob = request.getParameter("dob");
		RequestDispatcher dispatcher = null;
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_profile?useSSL=false","root","Linkin2053#");
			
			if(isEmailTaken(con, email)) {
				dispatcher = request.getRequestDispatcher("registration.jsp");
				request.setAttribute("status", "failed");
				request.setAttribute("email_taken_error", "Email is already taken");	
			}
			else if(isPhoneTaken(con, phone)) {
				dispatcher = request.getRequestDispatcher("registration.jsp");
				request.setAttribute("status", "failed");
				request.setAttribute("phone_taken_error", "This phone number is already in use.");	
			}
			else {
			PreparedStatement pst = con.prepareStatement("Insert into users(first_name,last_name, email, password, phone,dob) values (?,?,?,?,?,?)");
			pst.setString(1, first_name);
			pst.setString(2, last_name);
			pst.setString(3, email);
			pst.setString(4, password);
			pst.setString(5, phone);
			pst.setString(6, dob);
			
			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("registration.jsp");
			if(rowCount > 0) {
				request.setAttribute("status", "success");
			} else {
				request.setAttribute("status", "failed");
			}
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
	   private boolean isEmailTaken(Connection con, String email) throws SQLException {
	        PreparedStatement pst = con.prepareStatement("SELECT COUNT(*) FROM users WHERE email = ?");
	        pst.setString(1, email);

	        try (ResultSet rs = pst.executeQuery()) {
	            if (rs.next()) {
	                int count = rs.getInt(1);
	                // If count is greater than 0, the email is already taken
	                return count > 0;
	            }
	        }
	        return false;
	    }
	   
	   private boolean isPhoneTaken(Connection con, String phone) throws SQLException {
	        PreparedStatement pst = con.prepareStatement("SELECT COUNT(*) FROM users WHERE phone = ?");
	        pst.setString(1,phone);

	        try (ResultSet rs = pst.executeQuery()) {
	            if (rs.next()) {
	                int count = rs.getInt(1);
	                // If count is greater than 0, the email is already taken
	                return count > 0;
	            }
	        }
	        return false;
	    }
}

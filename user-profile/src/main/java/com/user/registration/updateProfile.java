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
 * Servlet implementation class updateProfile
 */
@WebServlet("/updateProfile")
public class updateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        
        // Assuming you have retrieved user details during login and stored them in the session
        String user_id = (String) session.getAttribute("id");
        String firstName = (String) session.getAttribute("first_name");
        String email = (String) session.getAttribute("email");
        String lastName = (String) session.getAttribute("last_name");
        String phone_num = (String) session.getAttribute("phone");
        String date_of_birth = (String) session.getAttribute("dob");
        
        // Set user details in request attributes to be used in the JSP
        request.setAttribute("uid", user_id);
        request.setAttribute("name", firstName);
        request.setAttribute("email", email);
        request.setAttribute("l_name", lastName);
        request.setAttribute("ph", phone_num);
        request.setAttribute("date", date_of_birth);
        
        // Forward the request to updateProfile.jsp
        request.getRequestDispatcher("updateProfile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Retrieve the updated values from the form
	    String newFirstName = request.getParameter("firstName");
	    String newLastName = request.getParameter("lastName");
	    String newEmail = request.getParameter("email");
	    String newPhoneNumber = request.getParameter("phone");
	    String newDateOfBirth = request.getParameter("dob");
	    HttpSession session = request.getSession();
	    // Retrieve the user_id from the hidden input field
	    int userId = Integer.parseInt(request.getParameter("id"));
		RequestDispatcher dispatcher = null;
		Connection con = null;
			
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_profile?useSSL=false","root","Linkin2053#");
		
		PreparedStatement pst = con.prepareStatement("UPDATE users SET first_name=?, last_name=?, email=?, phone=?, dob=? WHERE id=?");
		pst.setString(1, newFirstName); // Updated First Name
	    pst.setString(2, newLastName);  // Updated Last Name
	    pst.setString(3, newEmail);     // Updated Email
	    pst.setString(4, newPhoneNumber); // Updated Phone Number
	    pst.setString(5, newDateOfBirth); // Updated Date of Birth
	    pst.setInt(6, userId);
		
		int rowCount = pst.executeUpdate();
		// Update session attributes with the new data
		
		if(rowCount > 0) {
			request.setAttribute("status", "success");
			session.setAttribute("name", newFirstName);
			session.setAttribute("l_name", newLastName);
			session.setAttribute("email", newEmail);
			session.setAttribute("ph	", newPhoneNumber);
			session.setAttribute("dob", newDateOfBirth);
			dispatcher = request.getRequestDispatcher("updateProfile.jsp");
		} else {
			request.setAttribute("status", "failed");
			dispatcher = request.getRequestDispatcher("updateProfile.jsp");
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

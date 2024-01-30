package com.jsp.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.dao.UserDao;
import com.jsp.dto.UserDto;

import user_exceptions.UserNotFoundException;

@WebServlet("/loginServlet")
public class LoginController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Got the url  /loginServlet");
		HttpSession httpSession = req.getSession();
		UserDao dao = new UserDao();
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String role = req.getParameter("role");
		UserDto dto = null;
		System.out.println("UN: " + username + "\nPwd: " + password + "\nRole: " + role);

		if (role.equals("user")) {
			try {
				dto = dao.getUserByUsername(username);
			} catch (SQLException e) { 
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (UserNotFoundException e) {
				e.printStackTrace();
			}

			if (dto != null) {
				if (username.equals(dto.getUsername()) && password.equals(dto.getPassword())) {
					System.out.println("Checked OK");
					httpSession.setAttribute("SetUsername", username);
					System.out.println(httpSession.getAttribute("SetUsername")+ " is Set in Session");
					httpSession.setMaxInactiveInterval(1000);
					req.getRequestDispatcher("Home.jsp").forward(req, resp);
				}
				else {
					req.setAttribute("wrongCred", "You have entered Wrong Credentials");
					req.getRequestDispatcher("Login.jsp").include(req, resp);
				}
			} 
			else {
				req.setAttribute("notFound", "User Not Found Try with another Credentials!!!");
				req.getRequestDispatcher("Login.jsp").include(req, resp);
				return; 
			}

		} 
		
		//if login as Dealer...........
		else if(role.equals("dealer")) {
			try {
				//get Record from DB
				dto = dao.getUserByUsername(username);
				System.out.println(dto);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (UserNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//Doing validation..........
			if(dto != null) {
				if(username.equals(dto.getUsername()) && password.equals(dto.getPassword()))
				{
					System.out.println("Verified....");
					httpSession.setAttribute("setDealer", username);
					req.getRequestDispatcher("DealerPage.jsp").forward(req, resp);
					
				} else {
					System.out.println("Invalid Dealer..........");
					req.setAttribute("invalid_Dealer", "You have entered Wrong Dealer Credentials");
					resp.sendRedirect("Login.jsp");
				}
			}else {
				System.out.println("Dealer Not Found..........");
				req.setAttribute("no_dealer_found", "Dealer Not Found with this Credentials");
				resp.sendRedirect("Login.jsp");
			}
			
		}
		// Admin Login
		else {
			if (role.equals("admin")) {
				if (username.equals("Mkasyap") && password.equals("Mkasyap@12")) {
					httpSession.setAttribute("adminName", username);
					req.getRequestDispatcher("AdminPage.jsp").forward(req, resp);
				} else {
					req.setAttribute("checkAdmin", "Invalid admin Credentials");
					req.getRequestDispatcher("Login.jsp").include(req, resp);
				}
			}
		}

		System.out.println("Login Controller Excecuted.....");
	}
}

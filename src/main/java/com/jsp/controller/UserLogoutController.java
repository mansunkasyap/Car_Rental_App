package com.jsp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logoutController")
public class UserLogoutController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("got logout url......");
		HttpSession httpSession = req.getSession();
		String activeUsr = (String)httpSession.getAttribute("SetUsername");
		System.out.println(activeUsr);
//		if( activeUsr == null) {
			System.out.println("Invalidating the Session_____________________");
			httpSession.invalidate();
			req.getRequestDispatcher("Login.jsp").forward(req, resp);
//		}else {
//			httpSession.setAttribute("Session_TimeOut", "Logout Session Timeout!!!");
//		}
	}
}

package com.jsp.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.jsp.dao.UserDao;

@WebServlet("/userReg")
@MultipartConfig
public class UserRegistrationController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("got user reg url...................");
		resp.setContentType("text/html");
		String username = req.getParameter("username");
		System.out.println("username:  "+username);
		String password = req.getParameter("password");
		String gender   = req.getParameter("gender");
		Long   mobile   = Long.parseLong(req.getParameter("mob"));
		System.out.println(mobile);
		String address  = req.getParameter("address");
		String reg_as   = req.getParameter("reg-as");
		
		
		System.out.println( "User Reg Controll:"+  username + password+gender+mobile+address+reg_as);
		
		
		Part filePart = req.getPart("profile-pic");
		InputStream fileContent = filePart.getInputStream();
		UserDao dao = new UserDao();
		 
		try {	
			dao.insertUserData(username, password, gender, mobile, address, fileContent, reg_as);
			
			req.setAttribute("RegMSg", "Registration Success");
			System.out.println("Message :      "+(String)req.getAttribute("RegMSg"));
			req.getRequestDispatcher("Login.jsp").forward(req, resp);
		} catch (SQLException e) {
			e.printStackTrace(); 
		}
		System.out.println("Un: "+username+"\nPwd:"+password+"\nGen: "+gender+"\nmob: "+mobile+"\nAdd: "+address+"\nPic: "+reg_as);
		
	}
}
package com.jsp.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.google.protobuf.TextFormat.ParseException;
import com.jsp.dao.CarDao;

import connection.Configuration;

@WebServlet("/CarAddServlet")
@MultipartConfig
public class AddCarController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		CarDao dao = new CarDao();
		// Get form data
		Long carId = Long.parseLong(request.getParameter("carId"));
		String brand = request.getParameter("brand");
		double price = Double.parseDouble(request.getParameter("price"));
		
		// Retrieve the file part (car image)
		Part filePart = request.getPart("carImg");
		InputStream fileContent = filePart.getInputStream();

		// Adding attribute
		
		// adding into db
		dao.addCar(carId, brand, price, fileContent);
//		carSession.setAttribute("carId", carId);
		request.getRequestDispatcher("AdminPage.jsp").include(request, response);
		}
}

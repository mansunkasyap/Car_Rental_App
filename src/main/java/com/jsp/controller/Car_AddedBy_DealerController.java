package com.jsp.controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.jsp.dao.CarDao;
import com.jsp.dto.Dealer_Car;

@WebServlet("/AddCarServlet")
@MultipartConfig
public class Car_AddedBy_DealerController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Enter-------------------------");
		resp.setContentType("text/html");
		
		String make = req.getParameter("make");
		String model = req.getParameter("model");
		int year = Integer.parseInt(req.getParameter("year"));
		double rentalPrice = Double.parseDouble(req.getParameter("rentalPrice"));
		//Make Image Ready 
		Part filePart = req.getPart("cimg");
		InputStream inp_cimg = filePart.getInputStream();
		
//		Dealer_Car car = new Dealer_Car(make, model, year, rentalPrice, inp_cimg);
		CarDao dao = new CarDao();
		Dealer_Car dto = new Dealer_Car();
		 int cardId = dto.getCarId();
		dao.addCar(cardId,make, model, year, rentalPrice, inp_cimg);

		resp.sendRedirect(req.getContextPath() + "/addCar.jsp");
		System.out.println("Exit---------------------------------");
	}

}

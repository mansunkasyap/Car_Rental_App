package com.jsp.dto;

import java.util.UUID;

import javax.annotation.Generated;

import com.mysql.cj.jdbc.Blob;

public class Dealer_Car {
	private int carId;
    private String make;
    private String model;
    public int getCarId() {
		return carId;
	}

	public void setCarId(int carId) {
		this.carId = carId;
	}

	private int year;
    private double rentalPrice;
    Blob img;

    // Constructors, getters, and setters



	// Example default constructor
    public Dealer_Car() {
    }

    // Example parameterized constructor
    public Dealer_Car(String make, String model, int year, double rentalPrice) {
    	this.carId = Integer.parseInt(generateUniqueId());
        this.make = make;
        this.model = model;
        this.year = year;
        this.rentalPrice = rentalPrice;
    }
    
    
    
    // Getters and setters
	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public double getRentalPrice() {
		return rentalPrice;
	}

	public void setRentalPrice(double rentalPrice) {
		this.rentalPrice = rentalPrice;
	}
    public Blob getImg() {
		return img;
	}

	public void setImg(Blob img) {
		this.img = img;
	}
    
	 private String generateUniqueId() {
	        return UUID.randomUUID().toString();
	    }
}

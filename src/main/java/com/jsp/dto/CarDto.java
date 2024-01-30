package com.jsp.dto;
//import com.mysql.cj.jdbc.Blob;
import java.sql.Blob;

public class CarDto {
	long carId;
	String brand;
	double price;
	Blob carImg;
	
	public Blob getCarImg() {
		return carImg;
	}
	public void setCarImg(Blob carImg) {
		this.carImg = carImg;
	}
	
	@Override
	public String toString() {
		return "CarDto [carId=" + carId + ", brand=" + brand + ", price=" + price+ "]";
	}
	public long getCarId() {
		return carId;
	}
	public void setCarId(long carId) {
		this.carId = carId;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
}

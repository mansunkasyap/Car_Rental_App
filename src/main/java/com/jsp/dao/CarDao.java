package com.jsp.dao;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.ForEach;

import com.jsp.dto.CarDto;
import com.jsp.dto.Dealer_Car;
import com.mysql.cj.x.protobuf.MysqlxPrepare.Prepare;

import connection.Configuration;

public class CarDao {
	private static List<CarDto> carList = new ArrayList<>();

	public ResultSet search(String brand) {
		Connection connection = Configuration.getCarConnection();
		String query = "select * from car where brand=?";
		try {
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, brand);
			ResultSet res = ps.executeQuery();
			return res;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}

	public void addCar(long carId, String brand, double price, InputStream fileContent) {
		try (Connection connection = Configuration.getCarConnection()) {
			// Prepare SQL statement for inserting data into the database
			String sql = "INSERT INTO car (carid, brand, price, carImg) VALUES (?, ?, ?, ?)";
			
			try (PreparedStatement statement = connection.prepareStatement(sql)) {
				// Set parameters for the SQL statement
				statement.setLong(1, carId);
				statement.setString(2, brand);
				statement.setDouble(3, price);
				statement.setBlob(4, fileContent);

				// Execute the SQL statement
				int rowsAffected = statement.executeUpdate();
				System.out.println("Car added Sucessfully.............");
			} catch (Exception e) {
				// TODO: handle exception
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

	public void addCar(int carId, String make, String model, int year, double price, InputStream fileContent) {
		try (Connection connection = Configuration.getCarConnection()) {
			
			// Prepare SQL statement for inserting data into the database
			String sql = "INSERT INTO dealer_car (carid, make, model, year, price, carImg) VALUES (?, ?, ?, ?, ?, ?)";
			try (PreparedStatement statement = connection.prepareStatement(sql)) {
				// Set parameters for the SQL statement
				statement.setLong(1, carId);
				statement.setString(2, make);
				statement.setString(3, model);
				statement.setInt(4, year);
				statement.setDouble(5, price);
				statement.setBlob(6, fileContent);

				// Execute the SQL statement
				int rowsAffected = statement.executeUpdate();
				System.out.println("Car added Sucessfully.............");
			} catch (Exception e) {
				// TODO: handle exception
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

	
	public double getPrice(int carId) {
		Connection connection = Configuration.getCarConnection();
		String query = "select price from car where carid=?";
		PreparedStatement ps = null;
		try {
			ps = connection.prepareStatement(query);
			ps.setLong(1, carId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getDouble("price");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public ResultSet getAllCars() {
		// Add logic to retrieve all cars from the database
		Connection connection = Configuration.getCarConnection();
		String query = "select * from car";
		PreparedStatement ps;
		try {
			ps = connection.prepareStatement(query);
			ResultSet rsSet = ps.executeQuery();
			return rsSet;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	
    public static byte[] getImageData(Long carid) {
        byte[] imageData = null;

        try (Connection connection = Configuration.getCarConnection()) {
            String sqlQuery = "SELECT image FROM car WHERE username = ?";
            
            try (PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery)) {
                preparedStatement.setLong(1, carid);

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        // Retrieve the image data from the Blob
                        InputStream inputStream = resultSet.getBinaryStream("carImg");
                        imageData = readFully(inputStream);
                    }
                }
            }
        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }

        return imageData;
    }

    private static byte[] readFully(InputStream inputStream) throws IOException {
        try (ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[4096];
            int bytesRead;

            while ((bytesRead = inputStream.read(buffer)) != -1) {
                byteArrayOutputStream.write(buffer, 0, bytesRead);
            }
            
            return byteArrayOutputStream.toByteArray();
        }
    }
}
	
	
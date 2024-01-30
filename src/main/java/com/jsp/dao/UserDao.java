package com.jsp.dao;

import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import com.jsp.dto.UserDto;

import connection.Configuration;
import user_exceptions.UserNotFoundException;

public class UserDao {

	public void insertUserData(String usrname, String pwd, String gender, long mob, String addr, InputStream pic,
			String reg_as) throws SQLException {
		System.out.println(reg_as+ "Massage from userDao..............");
		Connection connection = Configuration.getCarConnection();
		String query = "insert into user_data values(?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement prepared = connection.prepareStatement(query);
		prepared.setString(1, usrname);
		prepared.setString(2, pwd);
		prepared.setString(3, gender);
		prepared.setLong(4, mob);
		prepared.setString(5, addr);
		prepared.setBlob(6, pic);
		prepared.setString(7, reg_as);
		prepared.execute();
		System.out.println("Data inserted successfully......");
	}

	
	public UserDto getUserByUsername(String username) throws SQLException, UserNotFoundException {
		Connection connection = Configuration.getCarConnection();
		UserDto dto = new UserDto();
		String query = "select * from user_data where username=?";
		PreparedStatement ps = connection.prepareStatement(query);
		ps.setString(1, username);
		System.out.println("After Prep>>>>>....");
		ResultSet rs = ps.executeQuery();
		boolean flag = false;
		while (rs.next()) {
			System.out.println("Entered while......");
			dto.setUsername(rs.getString("username"));
			dto.setPassword(rs.getString("password"));
			dto.setGender(rs.getString("gender"));
			dto.setMobile(rs.getLong("mobile"));
			dto.setAddress(rs.getString("address"));
			dto.setPic(rs.getBlob("image"));
			dto.setReg_as(rs.getString("reg_as"));
			return dto;
		}
		if (flag == false) {
			throw new UserNotFoundException("UserNotFound");
		}
		return null;
	}

	public OutputStream getUserImage(String username, HttpServletResponse response) {
		
		Connection connection = Configuration.getCarConnection();
		UserDto dto = new UserDto();
		String query = "select image from user_data where username=?";
		try(PreparedStatement ps = connection.prepareStatement(query)){
			ps.setString(1, username);
			ResultSet resultSet = ps.executeQuery();
			if(resultSet.next()) {
				InputStream inputStream = resultSet.getBinaryStream("image");
				response.setContentType("image/jpeg");
				response.setContentLengthLong(resultSet.getLong("image.length()"));
				try (OutputStream outputStream = response.getOutputStream()) 
				{
		                            byte[] buffer = new byte[4096];
		                            int bytesRead;
		                            while ((bytesRead = inputStream.read(buffer)) != -1)
		                            {
		                                outputStream.write(buffer, 0, bytesRead);
		                            }
		                            
		                           return outputStream;
			}
				catch (Exception e) 
				{
				// TODO: handle exception
				}
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return null;

}
			
}


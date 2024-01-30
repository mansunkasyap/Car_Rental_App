package com.jsp.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.Configuration;

@WebServlet("/allCarImg")
public class DispAllController extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("--------------------------------------------------------------------");
        String username = req.getParameter("carid");
        
        System.out.println(username);
        Connection connection = Configuration.getCarConnection();
        String query = "select image from car where carid=?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            System.out.println("Setting user'''''''''''''");
//            ps.setString(1, carid);
            ResultSet resultSet = ps.executeQuery();
            System.out.println(resultSet);
            if (resultSet.next()) {
                InputStream inputStream = resultSet.getBinaryStream("image");
                resp.setContentType("image/png");
                resp.setContentLengthLong(getBlobLength(resultSet, "image"));
                try (OutputStream outputStream = resp.getOutputStream()) {
//                    System.out.println("CREATINGff.....");
                    byte[] buffer = new byte[4096];
                    int bytesRead;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private long getBlobLength(ResultSet resultSet, String columnName) {
        try {
            return resultSet.getBinaryStream(columnName).available();
        } catch (IOException | SQLException e) {
            e.printStackTrace();
            return 0;
        } 
    }
}

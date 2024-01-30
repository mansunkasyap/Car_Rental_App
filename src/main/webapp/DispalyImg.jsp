<%@page import="connection.Configuration"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Image Display from Database</title>
</head>
<body>

    <h1>Displaying Image from Database</h1>

    <% 
        try {
            Connection connection = Configuration.getCarConnection();

            // Replace "your_table" with your actual table name and "your_id" with the specific record ID
            int recordId = 1; // Change this ID to the specific record you want to retrieve
            String query = "SELECT image FROM user_data WHERE username = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, recordId);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                // Retrieve the image data from the database
                Blob imageBlob = resultSet.getBlob("image");
                byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                // Display the image on the page
                response.setContentType("image/jpeg"); // Change content type based on your image type
                OutputStream outputStream = response.getOutputStream();
                outputStream.write(imageBytes);
                outputStream.close();
            }
            
            // Close resources
            resultSet.close();
            preparedStatement.close();
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
<% 

%>



</body>
</html>

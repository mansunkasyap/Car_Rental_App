<%@page import="com.jsp.dto.CarDto"%>
<%@page import="com.jsp.dao.CarDao"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Car - Admin Panel</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            background-image: url('images/NewCar.png');
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 20px;
            box-sizing: border-box;
        }

        form {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            padding: 20px;
            max-width: 400px;
            margin: 50px auto;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
            border-top: none;
            border-left: none;
            border-right: none;
            border-bottom: 2px solid maroon;
            border-radius: 4px;
            outline: none;
            cursor: pointer;
        }
       

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            width: 10em;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        
        h1{
			height: 60px;
        	max-width: 400px;
        	margin: 10px auto;
        	color: white;
        }
        
    </style>
</head>
<body>

<jsp:include page="AdminNav.jsp"></jsp:include>

<% String getCarId = (String) request.getAttribute("carId"); 
 CarDto dto = new CarDto();
 out.print(getCarId);
%>
<% if(getCarId != null){ %>
<div class="confirmation">
		<div class="check-icon">
			<i class="fas fa-check-circle"></i>
		</div>
		<div class="success-message">
			Car is Added into database
		</div>
</div>

<% } %>


    <h1>Admin Panel - Add Car</h1>

    <form action="CarAddServlet" method="post" enctype="multipart/form-data">
        <label for="carId">Car ID:</label>
        <input type="text" id="carId" name="carId"  required>

        <label for="brand">Brand:</label>
        <input type="text" id="brand" name="brand" required>

        <label for="price">Price:</label>
        <input type="text" id="price" name="price" required>
	
		<label for="car-image">Upload Car Image:</label>
        <input type="file" id="car-image" name="carImg">
        <button type="submit">Add Car</button>
    </form>

</body>
</html>

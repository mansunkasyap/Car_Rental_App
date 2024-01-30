<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Car - Car Rental App</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        h2 {
            color: #333;
        }

        form {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
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
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        h2, p {
            margin-bottom: 16px;
        }
    </style>
</head>
<body>
    <h2>Add Car</h2>
    <form action="AddCarServlet" method="post" enctype="multipart/form-data">
        <label for="make">Make:</label>
        <input type="text" id="make" name="make" required>

        <label for="model">Model:</label>
        <input type="text" id="model" name="model" required>

        <label for="year">Year:</label>
        <input type="number" id="year" name="year" required>

        <label for="rentalPrice">Rental Price per Day:</label>
        <input type="number" id="rentalPrice" name="rentalPrice" step="0.01" required>

		<label for="img">Upload Image of Car:</label>
		<input type="file" id="img" name="cimg" required>
        <button type="submit">Add Car</button>
    </form>

    <h2>All Cars</h2>
    <c:forEach var="car" items="${carList}">
        <p>${car.make} ${car.model} (${car.year}), Rental Price: $${car.rentalPrice}</p>
    </c:forEach>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Booking</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            box-sizing: border-box;
            text-align: center;
            background-image: url("images/booking_bg.jpg");
        }

        .booking-form {
            background-color: #fff;
            border-radius: 8px;
            /* box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); */
            padding: 20px;
            max-width: 400px;
            margin: 50px auto;
            background: transparent;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-size: 20px;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
            border-radius: 5px;
            border-left: none;
            border-right: none;
            border-top: none;
            border-bottom: 2px solid rgb(42, 121, 238);
            outline: none;
            cursor: pointer;
            color: teal;
            font-size: 20px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        a{
        	text-decoration: none;
        	color: white;
        	font-size: 1.1em;
        }
    </style>
</head>
<body>



<%  
	long carid = Long.parseLong(request.getParameter("carid"));
	double price = Double.parseDouble(request.getParameter("price"));
%>


    <div class="booking-form">
        <h1>Car Booking</h1>
        
        <form action="Payment" method="post">
            <label for="carId">Car ID:</label>
            <input type="text" id="carId" name="carId" value="<%= carid %>">

            <label for="price">Price:</label>
            <input type="text" id="price" name="price" value="<%= price %>">

            <label for="hours">Number of Hours:</label>
            <input type="text" id="hours" name="hours" required>

            <label for="totalPrice">Total Price:</label>
            <input type="text" id="totalPrice" name="totalPrice" readonly>

            <button type="submit"><a>Book Now</a></button>
        </form>
    </div>

    <script>
        // Calculate total price based on price and number of hours
        	document.getElementById('hours').addEventListener('input', function() {
            var price = parseFloat(document.getElementById('price').value);
            var hours = parseFloat(this.value);
            var totalPrice = isNaN(price) || isNaN(hours) ? 0 : price * hours;
            document.getElementById('totalPrice').value = totalPrice.toFixed(2);
        });
    </script>

</body>
</html>

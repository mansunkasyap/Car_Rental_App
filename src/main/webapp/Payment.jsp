<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            /* padding: 20px; */
            box-sizing: border-box;
            text-align: center;
            background-image: url('logo.jpg');
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
        }

        .payment-form {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            margin: 30px auto;
            /* background-image: url('NewCar.png');
            background-position: center; */
            background: transparent;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-size: 20px;
            color: white;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-bottom: 10px;
            width: 100%;
            font-size: 1.02em;
        }
        
        
        
    </style>
</head>
<body>

    <div class="payment-form">
        <h1 style="color: orange;">Payment Details</h1>
        
        <form action="ProcessPaymentServlet" method="post">
            <label for="cardNumber">Card Number:</label>
            <input type="text" id="cardNumber" name="cardNumber" required>

            <label for="expirationDate">Expiration Date:</label>
            <input type="text" id="expirationDate" name="expirationDate" placeholder="MM/YYYY" required>

            <label for="cvv">CVV:</label>
            <input type="password" id="cvv" name="cvv" required>

            <button type="submit">Pay Now</button>
        </form>
        
       
        <h1 style="color: teal;">Other Payment Options</h1>
        <!-- Add buttons for other payment options -->
        <button>Pay with Google Pay</button>
        <button>Pay with PhonePe</button>
        <button>Pay with Paytm</button>
		
    </div>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Page</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	background: #ffffff url('images/login_bg.png') no-repeat right top;
	background-size: cover;
	margin: 0;
	padding: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
}

form {
	background-color: #092635;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 300px;
	text-align: center;
	resize: both;
	overflow: auto;
	
}

label {
	display: block;
	font-size: 18px;
	color: #fff;
	margin-bottom: 8px;
}

input {
	width: 100%;
	padding: 8px;
	border-radius: 4px;
	margin-bottom: 16px;
	box-sizing: border-box;
}

select {
	width: 100%;
	padding: 8px;
	margin-bottom: 16px;
	box-sizing: border-box;
	border-radius: 4px;
}

button {
	background-color: #4CAF50;
	color: white;
	width: 6em;
	padding: 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.error-container {
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 10px;
	max-width: 450px;
	position: absolute;
	top: 4%;
}

#acc-reg{
	color:silver; 
}

.error-message {
	font-size: 1.2em;
	margin-bottom: 20px;
	color: #FF3333;
}

.retry-link {
	text-decoration: none;
	color: #4CAF50;
	font-weight: bold;
}


.confirmation {
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
	max-height:70px;
	max-width: 470px;
	cursor: pointer;
	position: absolute;
	top: 2%;
	
}

.success-message {
	color: #4CAF50;
	font-size: 1.2em;
	margin-bottom: 10px;
}

.check-icon {
	color: #4CAF50;
	font-size: 2em;
	margin-bottom: 6px;
}

</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
	<%
	String wrongCred = (String) request.getAttribute("wrongCred");
	String checkAdmin = (String) request.getAttribute("checkAdmin");
	String RegMsg = (String) request.getAttribute("RegMSg");
	String timeOut = (String)request.getAttribute("Session_TimeOut");
	String notFound = (String)request.getAttribute("notFound");
	%>

	<%
	if (wrongCred != null) {
	%>
	<div class="error-container">
		<div class="error-message">Oops! Entered wrong credentials.
			Please try again.</div>
	</div>

	<%
	}
	%>

	<%
	if (checkAdmin != null) {
	%>
	<div class="error-container">
		<div class="error-message">Entered wrong admin credentials.
			Please try again.</div>
	</div>

	<%
	}
	%>

	<%
	if (timeOut != null) {
	%>
	<div class="error-container">
		<div class="error-message"><%= timeOut %></div>
	</div>
	<%
	}
	%>
	
	<%
	if (notFound != null) {
	%>
	<div class="error-container">
		<div class="error-message"><%= notFound %></div>
	</div>
	<%
	}
	%>


	<%
	if (RegMsg != null) {
	%>

	<div class="confirmation">
		<div class="check-icon">
			<i class="fas fa-check-circle"></i>
		</div>
		<div class="success-message">Registration Successful! Thank you
			for registering.</div>
	</div>

	<%
	}
	%>



	<form action="loginServlet" method="post">
		<label for="username">Username</label> <input type="text"
			id="username" name="username" required> <label for="password">Password</label>
		<input type="password" id="password" name="password" required>

		<label for="role">Login as</label> 
		<select id="role" name="role" required>
			<option value="admin">Login as Admin</option>
			<option value="user">Login as User</option>
			<option value="dealer">Login as Dealer</option>
		</select>

		<button type="submit">Login</button>
		<br> <br> 
		<a href="Registration.jsp" id="acc-reg">Don't have Account?Register here</a>

	</form>

</body>
</html>

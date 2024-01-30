<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Registration</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	background-image: url('images/logo.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
	margin: 0;
	padding: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
}

form {
	background-color: #2C3E50;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 350px;
	resize: both;
	overflow: auto;
}

label {
	display: block;
	margin-bottom: 8px;
	font-size: 16px;
	color: #fff;
}

input {
	width: 100%;
	padding: 8px;
	margin-bottom: 16px;
	box-sizing: border-box;
	outline: none;
	border-radius: 4px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 2px solid silver;
}

select {
	width: 100%;
	padding: 8px;
	margin-bottom: 16px;
	box-sizing: border-box;
	border-radius: 4px;
}

button {
	background-color: #228B22;
	color: white;
	padding: 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-left: 38%;
}


</style>

</head>
<body>


	<form action="userReg" method="post" enctype="multipart/form-data">
	
		<label for="username">Username</label> 
		<input type="text" id="username" name="username" required>
	
		<label for="password">Password</label>
		<input type="password" id="password" name="password" required>

		<label for="gender">Gender</label>
		<select id="gender" name="gender"
			required>
			<option value="male">Male</option>
			<option value="female">Female</option>
			<option value="other">Other</option>
		</select> 
		
		<label for="mobile">Mobile</label> 
		<input type="tel" id="mobile" name="mob" pattern="[0-9]{10}" required> 
		<small>Format: 10 digits without spaces or dashes</small>
			
		<label for="address">Address:</label>
		<input type="text" id="address" name="address" required>
		
		<label for="reg-as">Register as</label>
		<select id="reg-as" name="reg-as" required="required">
			<option>User</option>
			<option>Dealer</option>
		</select>
		
		<!-- User Image -->
		<label for="profile-pic">Upload Your Picture</label> 
		<input type="file" id="profile-pic" name="profile-pic">

		<button type="submit">Register</button>
	</form>

</body>
</html>

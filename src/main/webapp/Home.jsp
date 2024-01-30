<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.jsp.dto.CarDto"%>
<%@page import="java.util.List"%>
<%@page import="com.jsp.dao.CarDao"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Car Rental App</title>
<link rel="stylesheet" href="home.css">
</head>
<body>


	<%
	CarDao dao = new CarDao();
	ResultSet cars = dao.getAllCars();
	List<CarDto> list = new ArrayList<CarDto>();
	CarDto dto = new CarDto();
	%>
	


	<!-- Adding into list -->
	<%-- <%
		while(cars.next()){
	%>
		<%
			dto.setCarId(cars.getLong("carid"));
			dto.setBrand(cars.getString("brand"));
			dto.setPrice(cars.getDouble("price"));
			dto.setCarImg(cars.getBlob("carImg"));
			list.add(dto);
		%>
		
	<% 
	} 
	%> --%>

	<jsp:include page="Navbar.jsp"></jsp:include>
	<!-- Search Bar Component -->
	<div class="search-navbar">
		<div class="search-bar">
			<input type="text" class="search-input"
				placeholder="Search your Car Here" name="car-search">
			<button class="search-button">
				<a href="search_car">Search</a>
			</button>
		</div>
	</div>
	<!-- Cars Section -->
	<section class="car-section">

		<%
		while (cars.next()) {
		%>
		<div class="card">
			<img src="images/car1.jpeg" alt="Car 1">
			<div class="card-content">
				<div class="cont1">
					<div class="cars_id"><%=cars.getLong("carid")%></div>
					<div class="cars_price cars_id">Rs. &nbsp;<%=cars.getDouble("price")%></div>
				</div>
				<div class="card-title"><%=cars.getString("brand")%></div>
				<div class="card-description">
					<ul>
						<li>Manual</li>
						<li>Petrol</li>
						<li>7 Seats</li>
					</ul>
				</div>
			</div>
			<div>
				<button type="submit" class="book-btn">
					<a href="CarBooking.jsp?carid=<%= cars.getLong("carid") %>&price=<%= cars.getDouble("price") %> ">Book Now</a>
				</button>
			</div>
		</div>



		<%
		}
		%>

	</section>


	<section class="section_2"></section>

	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.jsp.dao.CarDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
CarDao dao = new CarDao();
HttpSession session2 = request.getSession();
String brand= (String)session2.getAttribute("car_brand");
ResultSet rs = dao.search(brand);
%>


<table class="car-table" id="searchResultsTable">
        <thead>
            <tr>
                <th>Car ID</th>
                <th>Brand</th>
                <th>Price</th>
            </tr>
        </thead>
        <tbody>
            
              <% while(rs.next()) {%>
              		<tr>
                    <td>${car.id}</td>
                    <td>${car.brand}</td>
                    <td>${car.price}</td>
                </tr>
              <% } %>
            
        </tbody>
    </table>
</body>
</html>
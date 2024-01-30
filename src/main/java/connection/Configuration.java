package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Configuration{
	public static Connection getCarConnection()  {
		String url = "jdbc:mysql://localhost:3306/car_rental_app_db";
		String user="root";
		String pwd="root";
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection(url, user, pwd);
			return connection;
		}catch(ClassNotFoundException e1) {
			e1.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	} 
}
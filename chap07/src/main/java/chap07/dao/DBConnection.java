package chap07.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


// -- 19-5 --
public class DBConnection {

	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:XE", "hr", "1234");
//				"jdbc:oracle:thin:@localhost:1521:XE", "hr", "1234");
	}
}

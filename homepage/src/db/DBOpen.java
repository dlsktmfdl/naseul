package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBOpen {
	public static Connection open() {//connection이 리턴형
		Connection con=null;
		
		try {
			Class.forName(Constant.driver);
			con=DriverManager.getConnection(Constant.url, Constant.user, Constant.password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}
}
package bgcsdl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.microsoft.sqlserver.*;

public class TruyXuatDuLieu {
	private static Connection con = null;
	private static String url;
	private static String user;
	private static String pass;
	static {
		url = "jdbc:sqlserver://localhost:1433;databaseName=JAVA";
		user = "sa";
		pass = "thanggieng";
	}

	public static void main(String args[]) throws SQLException {
		DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
		con = DriverManager.getConnection(url, user, pass);
		//read = execute query
		String query ="";
		//create + update + delete = execute non-query
//		query = "insert into SanPham(Ma,Ten,Gia) values (?,?,?)";
//		PreparedStatement lenh = con.prepareStatement(query);
//		lenh.setObject(1, 3);//ma
//		lenh.setObject(2, "mat hang moi");//ten
//		lenh.setObject(3, 300);//gia
//		int temp = lenh.executeUpdate();
//		System.out.println("row(s) effected: "+temp);
		
		query = "select * from SanPham";
		ResultSet kq = con.prepareStatement(query).executeQuery();
		while (kq.next()) {
			System.out.println(kq.getString(2));
		}
		con.close();
	}
}



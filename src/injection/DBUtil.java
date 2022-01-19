package injection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



public class DBUtil {
	public static Connection getMYSQLConnection() {
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/members?useSSL=false";
			String user="root";
			String password="pass";
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("MySQL ����̹��� �����ϴ�/ <br/>");
		
		} catch (SQLException e) {
			System.out.println("����� ���� �Ǵ� ���ȣ�� ��ġ���� �ʽ��ϴ�.<br/>");
		}
		return conn;
	}
	public static void close(Connection conn) {
		try {if(conn != null) {conn.close();} } catch(Exception e) {e.printStackTrace();}
	}
	public static void close(Statement stmt) {
		try {if(stmt != null) {stmt.close();} } catch(Exception e) {e.printStackTrace();}
	}
	public static void close(PreparedStatement pstmt) {
		try {if(pstmt != null) {pstmt.close();} } catch(Exception e) {e.printStackTrace();}
	}
	public static void close(ResultSet rs) {
		try {if(rs != null) {rs.close();} } catch(Exception e) {e.printStackTrace();}
	}

}

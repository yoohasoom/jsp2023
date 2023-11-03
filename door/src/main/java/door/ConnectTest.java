package door;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConnectTest {

	public static void main(String[] args) {
		try {
			Connection connection = getConnection();
			
			// SQL 보내기
			String sql = "select * from users";
			PreparedStatement ps = connection.prepareStatement(sql);
			
			// 결과셋 가져오기
			ResultSet resultSet = ps.executeQuery();
			while(resultSet.next()) {
				System.out.println(resultSet.getString("username"));
			}
			
			resultSet.close();
			ps.close();
			connection.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		// 드라이버 로딩
		Class.forName("org.mariadb.jdbc.Driver");
		// 커넥션 맺기
		Connection connection = DriverManager.getConnection("jdbc:mariadb://localhost:3307/devdb", "devuser", "devpass");
		return connection;
	}

}

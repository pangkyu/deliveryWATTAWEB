package customer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import utility.Hashing;

// DAO : 데이터베이스 접근 클래스 
public class CustomerDB {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 생성자
	public CustomerDB() {
		try {
			String database = "jdbc:mysql://localhost:3306/deliverywatta";
			String username = "root";
			String password = "onlyroot";
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(database, username, password);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 로그인 메소드  (loginAction.jsp)
	public int login(String cusID, String cusPW) {
		String sql = "select cusPW from customer where cusID = ?";
		String enPw = Hashing.encoding(cusPW);
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cusID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(enPw)) {
					return 1; // 로그인 성공 
				}
				else {
					return 0; // 비밀번호 불일치
				}
			}
			return -1; // 아이디 없음 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류 
	}
	
	// 회원가입 메소드 (joinAction.jsp)
	public int join(Customer customer) {
		String sql = "insert into customer values (?, ?, ?, ?, ?)";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, customer.getCusID());
			pstmt.setString(2, Hashing.encoding(customer.getCusPW()));
			pstmt.setString(3, customer.getCusName());
			pstmt.setString(4, customer.getCusAddress());
			pstmt.setString(5, customer.getCusNumber());
			
			return pstmt.executeUpdate(); // insert문은 반드시 0 이상의 숫자가 나오기 때문에 양수가 아니면 실패한 것
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;  // 데이터베이스 오류 
	}
	
	// 기존 비밀번호 -> 암호화 비밀번호 (changePwAction.jsp)
	public int changePW(String cusID, String cusPW) {
		String sql = "update customer set cuspw=? where cusid=?;";
		String enPw = Hashing.encoding(cusPW);
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, enPw);
			pstmt.setString(2, cusID);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
}
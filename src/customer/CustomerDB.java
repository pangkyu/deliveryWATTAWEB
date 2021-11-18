package customer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import utility.Hashing;

// DAO : �����ͺ��̽� ���� Ŭ���� 
public class CustomerDB {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// ������
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
	
	// �α��� �޼ҵ�  (loginAction.jsp)
	public int login(String cusID, String cusPW) {
		String sql = "select cusPW from customer where cusID = ?";
		String enPw = Hashing.encoding(cusPW);
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cusID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(enPw)) {
					return 1; // �α��� ���� 
				}
				else {
					return 0; // ��й�ȣ ����ġ
				}
			}
			return -1; // ���̵� ���� 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // �����ͺ��̽� ���� 
	}
	
	// ȸ������ �޼ҵ� (joinAction.jsp)
	public int join(Customer customer) {
		String sql = "insert into customer values (?, ?, ?, ?, ?)";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, customer.getCusID());
			pstmt.setString(2, Hashing.encoding(customer.getCusPW()));
			pstmt.setString(3, customer.getCusName());
			pstmt.setString(4, customer.getCusAddress());
			pstmt.setString(5, customer.getCusNumber());
			
			return pstmt.executeUpdate(); // insert���� �ݵ�� 0 �̻��� ���ڰ� ������ ������ ����� �ƴϸ� ������ ��
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;  // �����ͺ��̽� ���� 
	}
	
	// ���� ��й�ȣ -> ��ȣȭ ��й�ȣ (changePwAction.jsp)
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
		return -1; // �����ͺ��̽� ����
	}
}
package cancel;

import java.sql.*;

public class CancelDB{
	private Connection con;
	private PreparedStatement pstmt;
	
	// ������
	public CancelDB() {
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
	
	// �ֹ���Ҹ� �ϸ� Demand table orderStatus�� '�ֹ����'�� ���� (cancelAction.jsp)
	public int changeOrderStatus(String cusId, String orderTime) {
		String sql = "update demand set orderstatus='�ֹ����' where cusid = ? and ordertime = ? and orderstatus='�ֹ���';";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cusId);
			pstmt.setString(2, orderTime);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	// ��һ��°� �� demand table data -> cancel table�� copy (cancelAction.jsp)
	public int cancelData(String cusId, String orderTime) {
		String sql = "insert into cancel(resID, cusID, foodID, orderTime, paymentOption, orderCnt,"
				+ "amount, orderStatus, cookStart, dc, coupon, deliveryOption, deliveryMinute)"
				+ " select resID, cusID, foodID, orderTime, paymentOption, orderCnt,"
				+ "amount, orderStatus, cookStart, dc, coupon, deliveryOption, deliveryMinute"
				+ " from demand where orderStatus='�ֹ����' and cusid=? and ordertime=?;";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cusId);
			pstmt.setString(2, orderTime);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	// cancel table�� canceltime�� reason ���� (cancelAction.jsp)
	public int cancelData2(String canceltime, String reason, String cusid, String ordertime) {
		String sql = "update cancel set cancelTime=?, reason=? where cusID=? and orderTime=?;";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, canceltime);
			pstmt.setString(2, reason);
			pstmt.setString(3, cusid);
			pstmt.setString(4, ordertime);
			
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
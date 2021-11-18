package demand;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DemandDB{
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 생성자
	public DemandDB() {
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
	
	// 결제내역 (pay_manage.jsp)
	public ArrayList<Demand> getPayList(String cusID) {
		ArrayList<Demand> payments = new ArrayList<Demand>();
		
		String sql = "select restaurant.resName, food.foodName, orderTime, orderCnt, amount, dc, coupon, paymentOption, orderStatus, cookStart, deliveryOption, deliveryMinute"
				+" from demand, restaurant, food where demand.resID = restaurant.resID and demand.foodID = food.foodID and cusID='"+cusID+"';";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Demand d = new Demand();
				
				d.setResID(rs.getString(1)); 
				d.setFoodID(rs.getString(2)); 
				d.setOrderTime(rs.getString(3));  
				d.setOrderCnt(rs.getInt(4));
				d.setAmount(rs.getInt(5));  
				d.setDc(rs.getInt(6)); 
				d.setCoupon(rs.getString(7)); 
				d.setPaymentOption(rs.getString(8)); 
				d.setOrderStatus(rs.getString(9)); 
				d.setCookStart(rs.getString(10));
				d.setDeliveryOption(rs.getString(11));
				d.setDeliveryMinute(rs.getInt(12));  
				
				payments.add(d);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return payments;
	}
	
	// '주문중' 상태(주문취소가능)인 주문내역 (order_manage.jsp)
	public ArrayList<Demand> getCancellableList(String cusID) {
		ArrayList<Demand> orders = new ArrayList<Demand>();
		
		String sql = "select restaurant.resName, food.foodName, orderTime, orderCnt, amount, dc, coupon, paymentOption, orderStatus, cookStart, deliveryOption, deliveryMinute"
				+" from demand, restaurant, food where demand.resID = restaurant.resID and demand.foodID = food.foodID and cusID='"+cusID+"' and orderStatus='주문중';";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Demand d = new Demand();
				
				d.setResID(rs.getString(1)); 
				d.setFoodID(rs.getString(2));
				d.setOrderTime(rs.getString(3)); 
				d.setOrderCnt(rs.getInt(4));
				d.setAmount(rs.getInt(5)); 
				d.setDc(rs.getInt(6)); 
				d.setCoupon(rs.getString(7)); 
				d.setPaymentOption(rs.getString(8));
				d.setOrderStatus(rs.getString(9)); 
				d.setCookStart(rs.getString(10)); 
				d.setDeliveryOption(rs.getString(11));
				d.setDeliveryMinute(rs.getInt(12)); 
				
				orders.add(d);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orders;
	}
	
	// 주문테이블에 데이터 저장 (paymentAction.jsp)
	public int addDemand(Demand demand) {
		String sql = "insert into demand values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, demand.getResID());
			pstmt.setString(2, demand.getCusID());
			pstmt.setString(3, demand.getFoodID());
			pstmt.setString(4, demand.getOrderTime());
			pstmt.setString(5, demand.getPaymentOption());
			pstmt.setInt(6, demand.getOrderCnt());
			pstmt.setInt(7, demand.getAmount());
			pstmt.setString(8, demand.getOrderStatus());
			pstmt.setString(9, demand.getCookStart());
			pstmt.setInt(10, demand.getDc());
			pstmt.setString(11, demand.getCoupon());
			pstmt.setString(12, demand.getDeliveryOption());
			pstmt.setInt(13, demand.getDeliveryMinute());
			
			return pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	// 주문내역 (review_manage.jsp)
	public ArrayList<Demand> getDemandList(String cusID) {
		ArrayList<Demand> demand = new ArrayList<Demand>();
		
		String sql = "select demand.resID, restaurant.resName, demand.cusID, demand.foodID, food.foodName, orderTime"
				+" from demand, restaurant, food where demand.resID = restaurant.resID and demand.foodID = food.foodID and cusID = '"+cusID+"';";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Demand d = new Demand();
				
				d.setResID(rs.getString(1));
				d.setResName(rs.getString(2));
				d.setCusID(rs.getString(3));
				d.setFoodID(rs.getString(4));
				d.setFoodName(rs.getString(5));
				d.setOrderTime(rs.getString(6));
				
				demand.add(d);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return demand;
	}
	
	// 주문처리상태 변경 (pay_manage.jsp)
	public int updateOrderStatus(String orderStatus, String cookStart) {
		String sql = "update demand set orderStatus= ? where cookStart = '"+cookStart+"';";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, orderStatus);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	// 배달시간 변경 (paymentAction.jsp)
	public int updateDeliveyMinute(int deliveryMinute, String cookStart) {
		String sql = "update demand set deliveryMinute = ? where cookStart = '"+cookStart+"';";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, deliveryMinute);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
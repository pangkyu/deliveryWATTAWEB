package review;

import java.sql.*;
import java.util.ArrayList;

public class ReviewDB{
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 积己磊
	public ReviewDB() {
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
	
	// current time save method
	public String getDate() {
		String sql = "select now()";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; // DB ERROR
	}
	
	// 府轰 眠啊 (reviewAction.jsp)
	public int addReview(Review review) {
		String sql = "insert into review values(?,?,?,?,now(),?,?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,  review.getResID());
			pstmt.setString(2,  review.getCusID());
			pstmt.setString(3,  review.getFoodID());
			pstmt.setString(4,  review.getOrderTime());
			pstmt.setString(5,  review.getReview());
			pstmt.setDouble(6, review.getGrade());
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	// 府轰 昏力 delete review method (reviewDeleteAction.jsp)
	public int deleteReview(String resID, String cusID, String foodID, String orderTime) {
		String sql = "delete from review where resID = '"+resID+"'and cusID ='"+cusID+"'and foodID = '"+foodID+"'and orderTime ='"+orderTime+"';";
		try {
			pstmt = con.prepareStatement(sql);
			
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	// 府轰 格废 (review_delete.jsp)
	public ArrayList<Review> getReviewList(String cusID) {
		ArrayList<Review> reviewList = new ArrayList<Review>();
	
		String sql = "select resID, cusID, foodID, orderTime, reviewTime, review, grade from review where cusID = '"+cusID+"';";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Review r = new Review();
				
				r.setResID(rs.getString(1));
				r.setCusID(rs.getString(2));
				r.setFoodID(rs.getString(3));
				r.setOrderTime(rs.getString(4));
				r.setReviewTime(rs.getString(5));
				r.setReview(rs.getString(6));
				r.setGrade(rs.getInt(7));
				
				reviewList.add(r);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reviewList;
	}
	
	//	府轰 格废(res_detail.jsp)
	public ArrayList<Review> getResReviewList(String resID) {
	ArrayList<Review> reviewList = new ArrayList<Review>();
	
	String sql = "select review.resID, cusID, food.foodName, orderTime, reviewTime, review, grade from review, food where food.foodID = review.foodID and review.resID = '"+resID+"';";
	
	try {
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Review r = new Review();
			
			r.setResID(rs.getString(1));
			r.setCusID(rs.getString(2));
			r.setFoodID(rs.getString(3));
			r.setOrderTime(rs.getString(4));
			r.setReviewTime(rs.getString(5));
			r.setReview(rs.getString(6));
			r.setGrade(rs.getInt(7));
			
			reviewList.add(r);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return reviewList;
}
	
}
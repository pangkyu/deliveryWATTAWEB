package restaurant;

import java.sql.*;
import java.util.ArrayList;
import utility.Hashing;

public class RestaurantDB {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	// 생성자
	public RestaurantDB() {
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
	public int login(String resID, String resPW) {
		String sql = "select resPW from restaurant where resID = ?";
		String enPw = Hashing.encoding(resPW);
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, resID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(enPw)) {
					return 1; //로그인 성공
				}
				else {
					return 0; //비밀번호 불일치
				}
			}
			return -1; //아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //db 오류
	}
	
	// 회원가입 메소드 (joinAction.jsp)
	public int join(Restaurant restaurant) {
		String sql = "insert into restaurant values (?, ?, ?, null, ?, ?, 0, 0, 0)";
			
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, restaurant.getResID());
			pstmt.setString(2, Hashing.encoding(restaurant.getResPW()));
			pstmt.setString(3, restaurant.getResName());
			pstmt.setString(4, restaurant.getResAddress());
			pstmt.setString(5, restaurant.getResNumber());
				
			return pstmt.executeUpdate();
				
		} catch (Exception e) {
			e.printStackTrace();
		}
			return -1; //db 오류
	}
		
	// 기존 비밀번호 -> 암호화 비밀번호 (changePwAction.jsp)
	public int changePW(String resID, String resPW) {
		String sql = "update restaurant set respw=? where resid=?;";
		String enPw = Hashing.encoding(resPW);
			
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, enPw);
			pstmt.setString(2, resID);
				
			return pstmt.executeUpdate();
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	// 음식점 정보 수정/업데이트 (resManageAction.jsp)
	public int resManage(String resID, String resNumber, String resAddress, String resCategory, int deliveryPrice) {
		String sql = "update restaurant set resNumber=?, resAddress=?, resCategory=?, deliveryPrice=? where resID=?;";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, resNumber);
			pstmt.setString(2, resAddress);
			pstmt.setString(3, resCategory);
			pstmt.setInt(4, deliveryPrice);
			pstmt.setString(5, resID);
			
			return pstmt.executeUpdate();
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
		
	// 해당 단어를 포함하는 음식점 정보 (search.jsp)
	public ArrayList<Restaurant> getSearchList(String resName) {
		ArrayList<Restaurant> searchList = new ArrayList<Restaurant>();		
		String sql = "select resName, resID, deliveryPrice from restaurant where resName like '%"+resName+"%' ;";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			System.out.println(sql);
			while(rs.next()) {
				Restaurant r = new Restaurant();
				r.setResName(rs.getString(1)); 
				r.setResName(rs.getString(1));  
				r.setResID(rs.getString(2));
				r.setDeliveryPrice(rs.getInt(3));
				searchList.add(r);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return searchList;
	}
			
	// 음식점 상세정보 (res_detail.jsp)
	public ArrayList<Restaurant> resDetail(String resID) {
		ArrayList<Restaurant> resDetail = new ArrayList<Restaurant>();
		String sql = "select resName, resNumber, resAddress, deliveryPrice from restaurant where resID = '"+resID+"';";
				
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
					
			while(rs.next()) {
				Restaurant r = new Restaurant();
				r.setResName(rs.getString(1));
				r.setResNumber(rs.getString(2));
				r.setResAddress(rs.getString(3));
				r.setDeliveryPrice(rs.getInt(4));
						
				resDetail.add(r);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resDetail;
	}

	// 카테고리별 음식점 (res_list.jsp)
	public ArrayList<Restaurant> getCategoryList(String category) {
		ArrayList<Restaurant> categoryList = new ArrayList<Restaurant>();
		String sql = "select resName, resID, deliveryPrice from restaurant where resCategory='"+category+"' ;";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			System.out.println(sql); 
			
			while(rs.next()) {
				Restaurant r = new Restaurant();
				r.setResName(rs.getString(1));  
				r.setResID(rs.getString(2));
				r.setDeliveryPrice(rs.getInt(3));
						
				categoryList.add(r);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return categoryList;
	}
	
}
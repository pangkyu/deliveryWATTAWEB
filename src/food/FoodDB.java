package food;
	
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
	
public class FoodDB {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 생성자
	public FoodDB() {
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
		
	// 음식점의 음식 정보 추가 메소드 (foodAction.jsp)
	public int foodAddManage(Food food) {
		String sql = "insert into food values (?, ?, ?, ?, ?)";
			
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, food.getResID());
			pstmt.setString(2, food.getFoodID());
			pstmt.setString(3, food.getFoodName());
			pstmt.setInt(4, food.getFoodPrice());
			pstmt.setInt(5, food.getCookMinute());
			
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
		
	// 음식점의 음식 정보 수정 메소드 (foodAction.jsp)
	public int foodUpdateManage(Food food) {
		String sql = "update food set foodName=?, foodPrice=?, cookMinute=? where foodID ='"+food.getFoodID()+"';";
			
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, food.getFoodName());
			pstmt.setInt(2, food.getFoodPrice());
			pstmt.setInt(3, food.getCookMinute());
				
			return pstmt.executeUpdate();
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
		
	// 음식ID 검색 메소드 (foodAction.jsp)
	public int foodSearch(String resID, String foodID) {
		String sql = "select foodID from food where resID = ? and foodID = ?";
			
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, resID);
			pstmt.setString(2, foodID);

			rs = pstmt.executeQuery();
				
			if (rs.next()) {
				return 1;		//  음식 정보 수정
			}
			else {
				return 0;		// 음식 정보 추가
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;				// db 오류
	}
		
	// 음식상세정보 메소드  (res_detail.jsp)
	public ArrayList<Food> getFoodList(String resID) {
		ArrayList<Food> foodList = new ArrayList<Food>();
			
		String sql = "select foodName, foodPrice, foodID, cookMinute from food where food.resID = '"+resID+"';";
			
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Food f = new Food();
				
				f.setFoodName(rs.getString(1));
				f.setFoodPrice(rs.getInt(2));
				f.setFoodID(rs.getString(3));
				f.setCookMinute(rs.getInt(4));
					
				foodList.add(f);
				}
				rs.close();
		} catch (Exception e) {
				e.printStackTrace();
		}
		return foodList;
	}
}

package food;

public class Food{
	private String resID;
	private String foodID;
	private String foodName;
	private int foodPrice;
	private int cookMinute;
	
	public Food() {
		this.resID = null;
		this.foodID = null;
		this.foodName = null;
		this.foodPrice = 0;
		this.cookMinute = 0;
	}
	
	public Food(String resID, String foodID, String foodName,
			int foodPrice, int cookMinute) {
		this.resID = resID;
		this.foodID = foodID;
		this.foodName = foodName;
		this.foodPrice = foodPrice;
		this.cookMinute = cookMinute;
	}
	
	public String getResID() {
		return resID;
	}
	public void setResID(String resID) {
		this.resID = resID;
	}
	public String getFoodID() {
		return foodID;
	}
	public void setFoodID(String foodID) {
		this.foodID = foodID;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public int getFoodPrice() {
		return foodPrice;
	}
	public void setFoodPrice(int foodPrice) {
		this.foodPrice = foodPrice;
	}
	public int getCookMinute() {
		return cookMinute;
	}
	public void setCookMinute(int cookMinute) {
		this.cookMinute = cookMinute;
	}
}

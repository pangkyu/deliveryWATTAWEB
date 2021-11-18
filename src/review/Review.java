package review;

public class Review{
	private String resID;
	private String cusID;
	private String foodID;
	private String orderTime;
	private String reviewTime;
	private String review;
	private double grade;
	
	public Review() {
		this.resID = null;
		this.cusID = null;
		this.foodID = null;
		this.orderTime = null;
		this.reviewTime = null;
		this.review = null;
		this.grade = 0.0;
	}
	
	public Review(String resID, String cusID, String foodID, String orderTime,
			String reviewTime, String review, double grade) {
		this.resID = resID;
		this.cusID = cusID;
		this.foodID = foodID;
		this.orderTime = orderTime;
		this.reviewTime = reviewTime;
		this.review = review;
		this.grade = grade;
	}
	
	public String getResID() {
		return resID;
	}
	public void setResID(String resID) {
		this.resID = resID;
	}
	public String getCusID() {
		return cusID;
	}
	public void setCusID(String cusID) {
		this.cusID = cusID;
	}
	public String getFoodID() {
		return foodID;
	}
	public void setFoodID(String foodID) {
		this.foodID = foodID;
	}
	public String getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}
	public String getReviewTime() {
		return reviewTime;
	}
	public void setReviewTime(String reviewTime) {
		this.reviewTime = reviewTime;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public double getGrade() {
		return grade;
	}
	public void setGrade(double grade) {
		this.grade = grade;
	}
}
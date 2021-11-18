package restaurant;

public class Restaurant {
	private String resID;
	private String resPW;
	private String resName;
	private String resCategory;
	private String resAddress;
	private String resNumber;
	private int deliveryPrice;
	private int reviewCnt;
	private double gradeAvg;
	
	public Restaurant() {
		this.resID = null;
		this.resPW = null;
		this.resName = null;
		this.resCategory = null;
		this.resAddress = null;
		this.resNumber = null;
		this.deliveryPrice = 0;
		this.reviewCnt = 0;
		this.gradeAvg = 0.0;
	}
	
	public Restaurant(String resID, String resPW, String resName, String resAddress, String resNumber) {
		this.resID = resID;
		this.resPW = resPW;
		this.resName = resName;
		this.resCategory = null;
		this.resAddress = resAddress;
		this.resNumber = resNumber;
		this.deliveryPrice = 0;
		this.reviewCnt = 0;
		this.gradeAvg = 0.0;
	}
	
	public String getResID() {
		return resID;
	}
	public void setResID(String resID) {
		this.resID = resID;
	}
	public String getResPW() {
		return resPW;
	}
	public void setResPW(String resPW) {
		this.resPW = resPW;
	}
	public String getResName() {
		return resName;
	}
	public void setResName(String resName) {
		this.resName = resName;
	}
	public String getResCategory() {
		return resCategory;
	}
	public void setResCategory(String resCategory) {
		this.resCategory = resCategory;
	}
	public String getResAddress() {
		return resAddress;
	}
	public void setResAddress(String resAddress) {
		this.resAddress = resAddress;
	}
	public String getResNumber() {
		return resNumber;
	}
	public void setResNumber(String resNumber) {
		this.resNumber = resNumber;
	}
	public int getDeliveryPrice() {
		return deliveryPrice;
	}
	public void setDeliveryPrice(int deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}
	public int getReviewCnt() {
		return reviewCnt;
	}
	public void setReviewCnt(int reviewCnt) {
		this.reviewCnt = reviewCnt;
	}
	public double getGradeAvg() {
		return gradeAvg;
	}
	public void setGradeAvg(double gradeAvg) {
		this.gradeAvg = gradeAvg;
	}
	
	
}

package demand;

public class Demand {
	private String resID;
	private String cusID;
	private String foodID;
	private String orderTime;
	private String paymentOption;
	private int orderCnt;
	private int amount;
	private String orderStatus;
	private String cookStart;
	private int dc;
	private String coupon;
	private String deliveryOption;
	private int deliveryMinute;
	
	//review_manage.jsp
	private String resName;
	private String foodName;
	
	public Demand() {
		this.resID = null;
		this.cusID = null;
		this.foodID = null;
		this.orderTime = null;
		this.paymentOption = null;
		this.orderCnt = 0;
		this.amount = 0;
		this.orderStatus = null;
		this.cookStart = null;
		this.dc = 0;
		this.coupon = null;
		this.deliveryOption = null;
		this.deliveryMinute = 0;
	}
	
	public Demand(String resID, String cusID, String foodID, String orderTime, String paymentOption,
			int orderCnt, int amount, String orderStatus, String cookStart, int dc, String coupon,
			String deliveryOption, int deliveryMinute) {
		this.resID = resID;
		this.cusID = cusID;
		this.foodID = foodID;
		this.orderTime = orderTime;
		this.paymentOption = paymentOption;
		this.orderCnt = orderCnt;
		this.amount = amount;
		this.orderStatus = orderStatus;
		this.cookStart = cookStart;
		this.dc = dc;
		this.coupon = coupon;
		this.deliveryOption = deliveryOption;
		this.deliveryMinute = deliveryMinute;
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
	public String getPaymentOption() {
		return paymentOption;
	}
	public void setPaymentOption(String paymentOption) {
		this.paymentOption = paymentOption;
	}
	public int getOrderCnt() {
		return orderCnt;
	}
	public void setOrderCnt(int orderCnt) {
		this.orderCnt = orderCnt;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getCookStart() {
		return cookStart;
	}
	public void setCookStart(String cookStart) {
		this.cookStart = cookStart;
	}
	public int getDc() {
		return dc;
	}
	public void setDc(int dc) {
		this.dc = dc;
	}
	public String getCoupon() {
		return coupon;
	}
	public void setCoupon(String coupon) {
		this.coupon = coupon;
	}
	public String getDeliveryOption() {
		return deliveryOption;
	}
	public void setDeliveryOption(String deliveryOption) {
		this.deliveryOption = deliveryOption;
	}
	public int getDeliveryMinute() {
		return deliveryMinute;
	}
	public void setDeliveryMinute(int deliveryMinute) {
		this.deliveryMinute = deliveryMinute;
	}
	public String getResName() {
		return resName;
	}
	public void setResName(String resName) {
		this.resName = resName;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
}

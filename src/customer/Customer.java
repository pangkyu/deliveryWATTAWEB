package customer;

public class Customer {
	private String cusID;
	private String cusPW;
	private String cusName;
	private String cusAddress;
	private String cusNumber;
	
	public Customer() {
		this.cusID = null;
		this.cusPW = null;
		this.cusName = null;
		this.cusAddress = null;
		this.cusNumber = null;
	}
	
	public Customer(String cusID, String cusPW, String cusName, String cusAddress, String cusNumber) {
		this.cusID = cusID;
		this.cusPW = cusPW;
		this.cusName = cusName;
		this.cusAddress = cusAddress;
		this.cusNumber = cusNumber;
	}
	
	public String getCusID() {
		return cusID;
	}
	public void setCusID(String cusID) {
		this.cusID = cusID;
	}
	public String getCusPW() {
		return cusPW;
	}
	public void setCusPW(String cusPW) {
		this.cusPW = cusPW;
	}
	public String getCusName() {
		return cusName;
	}
	public void setCusName(String cusName) {
		
		this.cusName = cusName;
	}
	public String getCusAddress() {
		return cusAddress;
	}
	public void setCusAddress(String cusAddress) {
		this.cusAddress = cusAddress;
	}
	public String getCusNumber() {
		return cusNumber;
	}
	public void setCusNumber(String cusNumber) {
		this.cusNumber = cusNumber;
	}
	
}

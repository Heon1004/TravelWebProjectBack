package customer.model;

public class CustomerBean {
	private int customerNum;
	private String customerEmail;
	private String customerPw;
	private boolean availableEmail = false;
	private String regDate;
	
	public int getCustomerNum() {
		return customerNum;
	}
	public void setCustomerNum(int customerNum) {
		this.customerNum = customerNum;
	}
	public String getCustomerEmail() {
		return customerEmail;
	}
	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}
	public String getCustomerPw() {
		return customerPw;
	}
	public void setCustomerPw(String customerPw) {
		this.customerPw = customerPw;
	}
	public boolean isAvailableEmail() {
		return availableEmail;
	}
	public void setAvailableEmail(boolean availableEmail) {
		this.availableEmail = availableEmail;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	
}

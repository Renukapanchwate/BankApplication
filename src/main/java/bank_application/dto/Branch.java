package bank_application.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import lombok.Data;


@Entity
@Data
public class Branch {

	@Id
	private int branchId ;
	private String branchName;
	@Column(unique = true)
	private String IFSC ;
    private String password;
	private String location ;
	private double balance  ;
	@Column(unique = true)
	private long customerNumber ;
	@Column(unique = true)
	private String email ;
	@ManyToOne
	private Bank bank ;
	public int getBranchId() {
		return branchId;
	}
	public void setBranchId(int branchId) {
		this.branchId = branchId;
	}
	public String getBranchName() {
		return branchName;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
	public String getIFSC() {
		return IFSC;
	}
	public void setIFSC(String iFSC) {
		IFSC = iFSC;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public long getCustomerNumber() {
		return customerNumber;
	}
	public void setCustomerNumber(long customerNumber) {
		this.customerNumber = customerNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Bank getBank() {
		return bank;
	}
	public void setBank(Bank bank) {
		this.bank = bank;
	}
	
}

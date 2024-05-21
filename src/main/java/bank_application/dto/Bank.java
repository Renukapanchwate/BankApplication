package bank_application.dto;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.Data;

@Entity
@Data
public class Bank {
	
	@Id
	private int bankId ;
	@Column(unique = true)
    private String bankName;
	
	@Column(unique = true)
	private String IFSC ;
	
    private String password;
	
	private String location ;
	
	private double balance  ;
	
	@Column(unique = true)
	private long customerNumber ;
	
	@Column(unique = true)
	private String email ;
	
	@OneToMany
	private List<Branch> branches ;

	public int getBankId() {
		return bankId;
	}

	public void setBankId(int bankId) {
		this.bankId = bankId;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
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

	public List<Branch> getBranches() {
		return branches;
	}

	public void setBranches(List<Branch> branches) {
		this.branches = branches;
	}
	
	
}

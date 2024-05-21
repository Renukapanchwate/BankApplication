package bank_application.dto;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import lombok.Data;

@Entity
@Data
public class User {
	
	@Id
	private long accountNumber;
	private String firstName;
	private String middleName;
	private String lastName;
	private String gender;
	@Column(unique = true)
	private String email;
	@Column(unique = true)
	private long phone;
	private long alternate;
	private String address;
	private String DOB;
	private String country;
	private int pincode;
	private String accountType;
	@Column(unique = true)
	private long aadharCard;
	private double balance;
	@ManyToOne
	private Branch branch;
	@OneToMany(cascade = CascadeType.ALL ,fetch = FetchType.LAZY)
	private List<TransactionHistory> histroy;
	public long getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(long accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getMiddleName() {
		return middleName;
	}
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public long getPhone() {
		return phone;
	}
	public void setPhone(long phone) {
		this.phone = phone;
	}
	public long getAlternate() {
		return alternate;
	}
	public void setAlternate(long alternate) {
		this.alternate = alternate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDOB() {
		return DOB;
	}
	public void setDOB(String dOB) {
		DOB = dOB;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public int getPincode() {
		return pincode;
	}
	public void setPincode(int pincode) {
		this.pincode = pincode;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	public long getAadharCard() {
		return aadharCard;
	}
	public void setAadharCard(long aadharCard) {
		this.aadharCard = aadharCard;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public Branch getBranch() {
		return branch;
	}
	public void setBranch(Branch branch) {
		this.branch = branch;
	}
	public List<TransactionHistory> getHistroy() {
		return histroy;
	}
	public void setHistroy(List<TransactionHistory> histroy) {
		this.histroy = histroy;
	}
	
}

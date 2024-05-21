package bank_application.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import lombok.Data;

@Entity
@Data
public class TransactionHistory {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int srno;
	private String description;
	private double created;
	private double debited;
	private double balance;
	
	@ManyToOne
	private User user ;

	public int getSrno() {
		return srno;
	}

	public void setSrno(int srno) {
		this.srno = srno;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getCreated() {
		return created;
	}

	public void setCreated(double created) {
		this.created = created;
	}

	public double getDebited() {
		return debited;
	}

	public void setDebited(double debited) {
		this.debited = debited;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}

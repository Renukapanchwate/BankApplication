package bank_application.dao;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import bank_application.dto.TransactionHistory;

public class TransactionDao {
	EntityManagerFactory factory=Persistence.createEntityManagerFactory("s");
	EntityManager manager=factory.createEntityManager();
	EntityTransaction transaction=manager.getTransaction();
	
	public void saveHistroy(TransactionHistory history) {
		transaction.begin();
		manager.persist(history);
		transaction.commit();
	}
	public String description() {
		LocalDateTime currentDateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		return currentDateTime.format(formatter);
	}
	public List<TransactionHistory> getHistory(long account) {
		Query query=manager.createQuery("SELECT t FROM TransactionHistory t WHERE t.user.accountNumber=?1");
		query.setParameter(1, account);
		return (List<TransactionHistory>) query.getResultList();
	}
}

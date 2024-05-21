package bank_application.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import bank_application.dto.Bank;
import bank_application.dto.Branch;


public class BankDao {
	

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("s");
	EntityManager manager = factory.createEntityManager();
	EntityTransaction transaction = manager.getTransaction();
	
	public void addBank(Bank bank) {
		transaction.begin();
		manager.persist(bank);
		transaction.commit();
	}
	
	public Bank findBank(int id) {
		Bank bank = manager.find(Bank.class, id) ;
		if(bank!=null) {
			return bank ;
		}else {
			return null ;
		}
	}
	
	public Bank updateBank(int id,Bank bank) {
		Bank dbBank=manager.find(Bank.class, id);
		if (dbBank!=null) {
			bank.setBankId(id);
			bank.setBranches(dbBank.getBranches());
			transaction.begin();
			manager.merge(bank);
			transaction.commit();
			return bank;
		} else {
			return null;
		}
	}
	
	public List<Branch> getAllBranches() {
		String jpql ="Select b from Branch b";
		Query query=manager.createQuery(jpql);
		return query.getResultList();
		
	}
	
	public Bank login(String ifsc) {
		Query query=manager.createQuery("SELECT b FROM Bank b WHERE b.IFSC=?1");
		query.setParameter(1, ifsc);
		return (Bank) query.getSingleResult();
	}
	public void updateBalance(Bank bank) {
		transaction.begin();
		manager.merge(bank);
		transaction.commit();
	}
	
	public Bank findBank(String bankName) {
		Query query=manager.createQuery("SELECT b FROM Bank b WHERE b.bankName=?1");
		query.setParameter(1, bankName);
		return (Bank) query.getSingleResult();
	}
	
	public Bank findByName(String branchName) {
		Query query = manager.createQuery("Select b from Bank b where b.bankName=?1");
		query.setParameter(1,branchName);
		return (Bank)query.getSingleResult();
	}

	public Bank updatePassword(String branchName, String newPassword) {
		Bank bank = findByName(branchName);
	    if (bank != null) {
	       bank.setPassword(newPassword);
	       transaction.begin();
	       manager.merge(bank);
	       transaction.commit();
	       return bank;
	    }
	    else {
	    	return null;
	    }
		
	}

	public int getLastBankId() {
		int lastBankId =0 ;
		Query query = manager.createQuery("SELECT MAX(b.bankId) FROM Bank b");
		List<Integer> list =query.getResultList() ;
		if (list != null && !list.isEmpty() && list.get(0) != null) {
            lastBankId = list.get(0);
        }
		return lastBankId ;
	}

}

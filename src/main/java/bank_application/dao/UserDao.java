package bank_application.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import bank_application.dto.Branch;
import bank_application.dto.User;

public class UserDao {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("s");
	EntityManager manager = factory.createEntityManager();
	EntityTransaction transaction = manager.getTransaction();

	public User CreateAccount(User user) {
		transaction.begin();
		manager.persist(user);
		transaction.commit();
		return user;
	}

	public User getUser(long accountNumber) {
		User user = manager.find(User.class, accountNumber);
		if (user != null) {
			return user;
		} else {
			return null;
		}
	}

	public void updateBalance(User user) {
		transaction.begin();
		manager.merge(user);
		transaction.commit();
	}

	public User login(long accountNumber) {
		User user = manager.find(User.class, accountNumber);
		if (user != null) {
			return user;
		}
		return null;
	}
	
//	public String findBranchName(long accountNumber) {
//		Query query = manager.createQuery("SELECT b.bankName FROM User b WHERE b.accountNumber=?1") ;
//		query.setParameter(1, accountNumber) ;
//		return (String)query.getSingleResult() ;
//	}

	public List<User> findUsersByMatchingBranchNameAndBankName() {
		Query query = manager.createQuery(
				"SELECT u FROM User u " + "JOIN u.branch b " + "JOIN b.bank bb " + "WHERE b.branchName = bb.bankName");
		return query.getResultList();
	}

	public void updateUser(User user) {
		transaction.begin();
		manager.merge(user);
		transaction.commit();
	}

//	public int deleteUser(User user) {
//		transaction.begin();
//		manager.remove(user);
//		transaction.commit();
//		return 1 ;
//	
//	}

//	public boolean deleteUser(User user) {
//	    try {
//	        transaction.begin();
//	        manager.remove(manager.merge(user)); 
//	        transaction.commit();
//	        return true; 
//	    } catch (Exception e) {
//	        if (transaction.isActive()) {
//	            transaction.rollback(); 
//	        }
//	        e.printStackTrace();
//	        return false; 
//	    }
//	}
	
	
	public int deleteUser(long accountNumber) {
	    try {
	        User user = manager.find(User.class, accountNumber);
	        
	        if (user != null) {
	            EntityTransaction transaction = manager.getTransaction();
	            transaction.begin();
	            manager.remove(user);
	            transaction.commit();
	            return 1;
	        } else {
	            return 0;
	        }
	    } catch (Exception e) {
	        if (transaction != null && transaction.isActive()) {
	            transaction.rollback();
	        }
	        e.printStackTrace(); 
	        return -1; 
	    }
	}

	
	public long getLastAccountNumber(int id) {
		long lastAccountNumber = 0;
		Query query = manager.createQuery("SELECT MAX(b.accountNumber) FROM User b WHERE b.branch.branchId=?1");
		query.setParameter(1, id);
		List<Long> list = query.getResultList();
		if (list != null && !list.isEmpty() && list.get(0) != null) {
			lastAccountNumber = list.get(0);
		}
		return lastAccountNumber;
	}

	public List<User> getUserByBranchId(int branchId) {
		Query query = manager.createQuery("SELECT u FROM User u WHERE u.branch.branchId = 1?");
		query.setParameter(1, branchId);
		return query.getResultList();
	}

	public List<User> findByBranch(Branch branch) {
		Query query = manager.createQuery("Select u from User u where u.branch=?1");
		query.setParameter(1, branch);
		return (List<User>) query.getResultList();
	}

	public User findByPhoneNumber(long phoneNumber) {
		Query query = manager.createQuery("SELECT u FROM User u WHERE u.phone = ?1");
		query.setParameter(1, phoneNumber);

		try {
			User user = (User) query.getSingleResult();
			return user;
		} catch (Exception ex) {
			return null;
		}
	}

	public User findByAlternateNumber(long alternateNumber) {
		Query query = manager.createQuery("SELECT u FROM User u WHERE u.alternate = ?1");
		query.setParameter(1, alternateNumber);

		try {
			User user = (User) query.getSingleResult();
			return user;
		} catch (Exception ex) {
			return null;
		}
	}

	public User getUserByAccountNumber(long accountNumber) {
		User user = null;
		try {
			Query query = manager.createQuery("SELECT u FROM User WHERE accountNumber=?1");
			query.setParameter(1, accountNumber);
			user = (User) query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public User findBranchName(long accountNumber, int id) {
		Query query = manager.createQuery("SELECT b FROM User b WHERE b.accountNumber=?1 AND b.branch.branchId=?2") ;
		query.setParameter(1, accountNumber) ;
		query.setParameter(2, id) ;
		return (User)query.getSingleResult() ;
	}

	public List<User> getAllUser() {
		Query query=manager.createQuery("Select u from User u") ;
		return query.getResultList() ;
	}
}

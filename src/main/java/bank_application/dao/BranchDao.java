package bank_application.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import bank_application.dto.Bank;
import bank_application.dto.Branch;

public class BranchDao {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("s");
	EntityManager manager = factory.createEntityManager();
	EntityTransaction transaction = manager.getTransaction();

	public Branch addBranch(Branch branch) {
		transaction.begin();
		manager.persist(branch);
		transaction.commit();
		return branch;
	}

	public Branch login(String ifsc) {
		try {
	        Query query = manager.createQuery("SELECT b FROM Branch b WHERE b.IFSC = ?1");
	        query.setParameter(1, ifsc);
	        Branch dbBranch = (Branch) query.getSingleResult();
	        return dbBranch; 
	    } catch (NoResultException e) {
	        return null;
	    }
	}

	public Branch findBranch(int id) {
		Branch branch = manager.find(Branch.class, id);
		if (branch != null) {
			return branch;
		} else {
			return null;
		}
	}

	public Branch findBranchById(int id) {
		return manager.find(Branch.class, id);
	}

	public List<Branch> getBranch() {
		Query query = manager.createQuery("SELECT b FROM Branch b");

		return ((List<Branch>) query.getResultList());
	}

	public Branch getBranchById(int branchId) {

		Branch branch = null;
		try {
			Query query = manager.createQuery("SELECT b FROM Branch b WHERE b.branchId = 1?");
			query.setParameter("branchId", branchId);
			branch = (Branch) query.getSingleResult();

			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return branch;
	}

	public List<String> getIfscS() {

		Query query = manager.createQuery("SELECT b.IFSC FROM Branch b");

		return ((List<String>) query.getResultList());
	}
	
	public List<String> getEmail() {

		Query query = manager.createQuery("SELECT b.email FROM Branch b");

		return ((List<String>) query.getResultList());
	}

	public int updateBranch(Branch branch) {
		try {
			transaction.begin();

			Branch dbBranch = manager.find(Branch.class, branch.getBranchId());
			if (dbBranch != null) {
				dbBranch.setBranchName(branch.getBranchName());
				dbBranch.setIFSC(branch.getIFSC());
				dbBranch.setLocation(branch.getLocation());
				dbBranch.setBalance(branch.getBalance());
				dbBranch.setCustomerNumber(branch.getCustomerNumber());
				dbBranch.setEmail(branch.getEmail());
				dbBranch.setPassword(branch.getPassword());
				manager.merge(dbBranch);
				transaction.commit();
				return 1;
			} else {
				transaction.rollback();
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public void deleteBranch(int id) {
		try {
			Branch branch = manager.find(Branch.class, id);

			if (branch != null) {
				transaction.begin();
				manager.remove(branch);
				transaction.commit();
			}
		} catch (Exception e) {
			if (transaction.isActive()) {
				transaction.rollback();
			}

		}
	}

	public List<Branch> getBranchesByBankId(int bankId) {
		Query query = manager.createQuery("SELECT b FROM Branch b WHERE b.Bank.bankId = ?1");
		query.setParameter(1, bankId);
		return query.getResultList();
	}

	public Branch updatePassword(String email,String newPassword) {
	    Branch branch = findByEmail(email);
	    if (branch != null) {
	       branch.setPassword(newPassword);
	       transaction.begin();
	       manager.merge(branch);
	       transaction.commit();
	       return branch;
	    }
	    else {
	    	return null;
	    }
	  
	}
	
	public Branch findByEmail(String email) {
	    try {
	        Query query = manager.createQuery("SELECT b FROM Branch b WHERE b.email = ?1");
	        query.setParameter(1, email);
	        return (Branch) query.getSingleResult();
	    } catch (NoResultException e) {
	        return null;
	    }
	}

	public void deleteBranchUsers(int id) {
		EntityTransaction transaction = null;
		try {
			transaction = manager.getTransaction();
			transaction.begin();

			Query query = manager.createQuery("DELETE FROM User WHERE branch_branchId = :branchId");
			query.setParameter("branchId", id);
			query.executeUpdate();

			transaction.commit();
		} catch (Exception e) {
			if (transaction != null && transaction.isActive()) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}
	
	public void updateBalance(Branch branch) {
		transaction.begin();
		manager.merge(branch);
		transaction.commit();
	}

	public Branch findBranch(String ifsc) {
		Query query = manager.createQuery("SELECT b FROM Branch b WHERE b.IFSC=?1");
		query.setParameter(1, ifsc);
		return (Branch) query.getSingleResult();
	}
	
	public Branch forgetPassword(String password,String ifsc) {
		Query query = manager.createQuery("Select b from Branch b where b.IFSC=?1");
		query.setParameter(1,ifsc);
		Branch dbBranch = (Branch)query.getSingleResult();		
		if(dbBranch!=null) {
			dbBranch.setPassword(password);
			transaction.begin();
			manager.merge(dbBranch);
			transaction.commit();
		}
	return dbBranch;
		
	}
	
	public void updateBranchByBank(Branch branch) {
		transaction.begin();
		manager.merge(branch);
		transaction.commit();
	}

	public List<Branch> getBranches(int id) {
		Query query = manager.createQuery("SELECT b FROM Branch b WHERE b.bank.bankId = ?1");
		query.setParameter(1, id);
		return query.getResultList();
	}
	
	public int getLastBranchId(String bankName) {
		int lastBranchId =0 ;
		Query query = manager.createQuery("SELECT MAX(b.branchId) FROM Branch b WHERE b.bank.bankName = ?1");
		query.setParameter(1, bankName) ;
		List<Integer> list =query.getResultList() ;
		if (list != null && !list.isEmpty() && list.get(0) != null) {
			lastBranchId = list.get(0);
        }
		return lastBranchId ;
	}
	
	public List<Branch> findBranchByName(String name){
		Query query = manager.createQuery("SELECT b FROM Branch b WHERE b.branchName =?1");
		query.setParameter(1, name);
		return query.getResultList();
	}
	
	public Branch findByBankName(String name) {
		Query query = manager.createQuery("Select b from Bank b where b.bankName=?1");
		query.setParameter(1,name);
		return (Branch)query.getSingleResult();
	}
	
	
	public Branch findBranchByBankName(String bankName) {
        Branch branch = null;
        try {
            String hql = "FROM Branch WHERE bankName = :bankName";
            Query query = manager.createQuery(hql);
            query.setParameter("bankName", bankName);
            branch = (Branch) query.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return branch;
    }
	
	public Branch findByCustomerNumber(long customerNumber) {
        try {
            Query query = manager.createQuery("SELECT b FROM Branch b WHERE b.customerNumber = ?1");
            query.setParameter(1, customerNumber);
            Branch dbBranch = (Branch) query.getSingleResult();
            return dbBranch;
        } catch (NoResultException e) {
            return null;
        }
    }
	
	public Branch findBranchOfParticularBank(String ifsc, int bankId) {
		try {
	        Query query = manager.createQuery("SELECT b FROM Branch b WHERE b.IFSC = ?1 AND b.bank.bankId=?2");
	        query.setParameter(1, ifsc);
	        query.setParameter(2, bankId);
	        Branch dbBranch = (Branch) query.getSingleResult();
	        return dbBranch; 
	    } catch (NoResultException e) {
	        return null;
	    }catch (NullPointerException e) {
	    	System.out.println("branch not found");
	    	return null;
	    }
	}

	public Branch findBranchByAccount(long accountNumber) {
		try {
			Query query = manager.createQuery("SELECT u.branch FROM User u WHERE u.accountNumber = ?1") ;
			query.setParameter(1, accountNumber) ;
			return (Branch) query.getSingleResult() ;
		} catch (Exception e) {
			e.printStackTrace();
            return null;
		}
	}
}

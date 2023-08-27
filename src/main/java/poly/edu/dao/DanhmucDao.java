package poly.edu.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import poly.edu.model.Danhmuc;
import poly.edu.utils.JpaUtils;

public class DanhmucDao extends ConnectDao{
	
	EntityManager em = JpaUtils.getEntityManager();
	 public List<Danhmuc> findAll(){
	    	String sql = "SELECT o FROM Danhmuc o";
			TypedQuery<Danhmuc> query = em.createQuery(sql, Danhmuc.class);
			return query.getResultList();
	    }   
	    
	    public Danhmuc findByMaDM(String maDM){
	    	String sql = "SELECT o FROM Danhmuc o WHERE o.madm = ?0";
	    	TypedQuery<Danhmuc> query = em.createQuery(sql, Danhmuc.class);
	    	query.setParameter(0, maDM);
			List<Danhmuc> result = query.getResultList();
			if (result.isEmpty()) {
				return null;
			}
			return result.get(0);
	    }
}

package poly.edu.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import poly.edu.model.Sanpham;
import poly.edu.model.User;
import poly.edu.utils.JpaUtils;

public class SanPhamDao extends ConnectDao {
	EntityManager em = JpaUtils.getEntityManager();

	public List<Sanpham> findAll() {
		
		try {
			
			String sql = "SELECT o FROM Sanpham o";
			TypedQuery<Sanpham> query = em.createQuery(sql, Sanpham.class);
			return query.getResultList();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	public Sanpham findById(String masp) {
		Sanpham sanpham = null;
		try {
			sanpham = em.find(Sanpham.class, masp);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return sanpham;

	}

	public List<Sanpham> findAllByMadm(String madm) {
		String sql = "SELECT o FROM Sanpham o WHERE o.danhmuc.madm = ?0";
		TypedQuery<Sanpham> query = em.createQuery(sql, Sanpham.class);
		query.setParameter(0, madm);
		return query.getResultList();
	}

	public Sanpham findByMaSP(String maSP) {
		String sql = "SELECT o FROM Sanpham o WHERE o.masp = ?0";
		TypedQuery<Sanpham> query = em.createQuery(sql, Sanpham.class);
		query.setParameter(0, maSP);
		List<Sanpham> result = query.getResultList();
		if (result.isEmpty()) {
			return null;
		}
		return result.get(0);
	}
	
	public List<Sanpham> findPage(int page, int size) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction trans = em.getTransaction();
		try {
			String jpql = "SELECT o FROM Sanpham o";
			TypedQuery<Sanpham> query = em.createQuery(jpql, Sanpham.class);
			query.setFirstResult(page * size);
			query.setMaxResults(size);

			return query.getResultList();

		} catch (Exception e) {
			trans.rollback();
			e.printStackTrace();
			System.out.println("Find Page thất bại!");
		} finally {
			em.close();
		}
		return null;
	}

	public long countProduct() {
	    EntityManager em = JpaUtils.getEntityManager();
	    try {
	        CriteriaBuilder cb = em.getCriteriaBuilder();
	        CriteriaQuery<Long> cq = cb.createQuery(Long.class);
	        Root<Sanpham> root = cq.from(Sanpham.class);
	        cq.select(cb.count(root));
	        TypedQuery<Long> query = em.createQuery(cq);
	        return query.getSingleResult();
	    } finally {
	        em.close();
	    }
	}


}

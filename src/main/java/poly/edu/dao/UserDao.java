package poly.edu.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import poly.edu.model.User;
import poly.edu.utils.JpaUtils;

public class UserDao extends ConnectDao{
	EntityManager em = JpaUtils.getEntityManager();
	
	public User findOneUser(String username){
		EntityManager em = JpaUtils.getEntityManager();
		TypedQuery<User> query = em.createNamedQuery("User.findOneUser", User.class);
		query.setParameter("username", username);
		return query.getSingleResult();
	}

	public User findById(int id) {
		String sql = "SELECT o FROM User o WHERE o.id = ?0";
		TypedQuery<User> query = em.createQuery(sql, User.class);
    	query.setParameter(0, id);
		List<User> result = query.getResultList();
		if (result.isEmpty()) {
			return null;
		}
		return result.get(0);
	}
	
	public User findByOneByUsername(String username) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction trans = em.getTransaction();
		try {
			trans.begin();
			String jpql = "SELECT o FROM User o WHERE o.username=:username";

			TypedQuery<User> query = em.createQuery(jpql, User.class);
			query.setParameter("username", username);
			User user = query.getSingleResult();
			System.out.println("--------------Find One by Username-------------");
			System.out.println(">> Fullname: " + user.getFullname());
			System.out.println(">> Email: " + user.getEmail());
			trans.commit();
			return user;
		} catch (Exception e) {
			trans.rollback();
			System.out.println("Find one thất bại!");
			e.printStackTrace();
		} finally {
			em.close();
		}
		return null;
	}
	
	

	public void create(User user) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction trans = em.getTransaction();

		try {
//			trans.begin();
			em.persist(user);
//			trans.commit();
			System.out.println("Thêm mới thành công!");
		} catch (Exception e) {
//			trans.rollback();
			System.out.println("Thêm mới thất bại!");
			e.printStackTrace();

		} finally {
//			em.close();
		}

	}

	public void update(User user) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction trans = em.getTransaction();

		try {
			trans.begin();
			em.merge(user);
			trans.commit();
			System.out.println("Cập nhật thành công!");
		} catch (Exception e) {
			trans.rollback();
			System.out.println("Cập nhật thất bại!");
			e.printStackTrace();
		} finally {
			em.close();
		}

	}

	public void delete(String id) {
	    EntityManager em = JpaUtils.getEntityManager();
	    EntityTransaction trans = em.getTransaction();

	    try {
	        trans.begin();
	        User user = em.find(User.class, id);
	        em.remove(user);
	        trans.commit();
	        System.out.println("Xóa thành công!");
	    } catch (Exception e) {
	        trans.rollback();
	        System.out.println("Xóa thất bại!");
	        e.printStackTrace();

	    } finally {
	        em.close();
	    }
	}

	public void updatePassword(String id, String password) {
	    EntityManager em = JpaUtils.getEntityManager();
	    EntityTransaction trans = em.getTransaction();

	    try {
	        trans.begin();
	        User user = em.find(User.class, id);
	        if(user != null) {
	            user.setPassword(password);
	            em.merge(user);
	            trans.commit();
	            System.out.println("Cập nhật mật khẩu thành công!");
	        } else {
	            System.out.println("Không tìm thấy người dùng với id: " + id);
	        }
	    } catch (Exception e) {
	        trans.rollback();
	        System.out.println("Cập nhật mật khẩu thất bại!");
	        e.printStackTrace();
	    } finally {
	        em.close();
	    }
	}

	
	
	public List<User> findAll() {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction trans = em.getTransaction();
		try {
			trans.begin();
			TypedQuery<User> query = em.createQuery("SELECT o FROM User o", User.class);
			List<User> userList = query.getResultList();
			return userList;
		} catch (Exception e) {
			trans.rollback();
			System.out.println("Find all thất bại!");

		} finally {
			em.close();
		}
		return null;

	}
	
	public User findById(String id) {
		EntityManager em = JpaUtils.getEntityManager();
		User entity = em.find(User.class, id);
		return entity;
	}

	public void findByRole(int role) {
	    EntityManager em = JpaUtils.getEntityManager();
	    EntityTransaction trans = em.getTransaction();

	    try {
	        trans.begin();
	        String jpql = "SELECT o FROM User o WHERE o.admin =:role";
	        TypedQuery<User> query = em.createQuery(jpql, User.class);
	        query.setParameter("role", role);
	        List<User> userList = query.getResultList();
	        System.out.println("--------------Find by Role-------------");
	        for (User user : userList) {
	            System.out.println(">> Id: " + user.getId());
	        }

	        trans.commit();
	    } catch (Exception e) {
	        trans.rollback();
	        System.out.println("Find by Role thất bại!");
	        e.printStackTrace();

	    } finally {
	        em.close();
	    }
	}

	public void findByKeyword(String keyword) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction trans = em.getTransaction();
		try {
			trans.begin();
			String jpql = "SELECT o FROM User o WHERE o.fullname LIKE ?0";
			TypedQuery<User> query = em.createQuery(jpql, User.class);
			query.setParameter(0, keyword);
			List<User> list = query.getResultList();
			System.out.println("--------------Find By Keyword-------------");

			for (User user : list) {
				System.out.println("Id: "+user.getId());
			}

			trans.commit();
		} catch (Exception e) {
			trans.rollback();
			System.out.println("Find by Keyword thất bại!");
		} finally {
			em.close();
		}

	}

	public void findOne(String id, String pw) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction trans = em.getTransaction();
		try {
			trans.begin();
			String jpql = "SELECT o FROM User o WHERE o.id=:id AND o.password=:pw";

			TypedQuery<User> query = em.createQuery(jpql, User.class);
			query.setParameter("id", id);
			query.setParameter("pw", pw);

			User user = query.getSingleResult();

			System.out.println("--------------Find One-------------");
			System.out.println(">> Fullname: " + user.getFullname());
			System.out.println(">> Email: " + user.getEmail());

			trans.commit();
		} catch (Exception e) {
			trans.rollback();
			System.out.println("Find one thất bại!");
		} finally {
			em.close();
		}
	}

	public User findByOneByEmail(String email) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction trans = em.getTransaction();
		try {
			trans.begin();
			String jpql = "SELECT o FROM User o WHERE o.email=:email";

			TypedQuery<User> query = em.createQuery(jpql, User.class);
			query.setParameter("email", email);
			User user = query.getSingleResult();
			System.out.println("--------------Find One by Email-------------");
			System.out.println(">> Fullname: " + user.getFullname());
			System.out.println(">> Email: " + user.getEmail());
			trans.commit();
			return user;
		} catch (Exception e) {
			trans.rollback();
			System.out.println("Find one thất bại!");
		} finally {
			em.close();
		}
		return null;
	}
	
	public void findPage(int page, int size) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction trans = em.getTransaction();
		try {
			trans.begin();
			String jpql = "SELECT o FROM User o";
			TypedQuery<User> query = em.createQuery(jpql, User.class);
			query.setFirstResult(page * size);
			query.setMaxResults(size);

			List<User> list = query.getResultList();
			System.out.println("--------------Find Page-------------");

			for (User user : list) {
				System.out.println(">>Id: " + user.getId());
				System.out.println(">>Fullname: " + user.getFullname());
			}
			trans.commit();
		} catch (Exception e) {
			trans.rollback();
			System.out.println("Find Page thất bại!");
		} finally {
			em.close();
		}
	}
	
}

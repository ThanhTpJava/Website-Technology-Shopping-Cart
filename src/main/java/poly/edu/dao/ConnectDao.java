package poly.edu.dao;

import javax.persistence.EntityManager;

import poly.edu.utils.JpaUtils;

public class ConnectDao {
	public static final EntityManager entityManager = JpaUtils.getEntityManager();

	@SuppressWarnings("deprecation")
	@Override
	protected void finalize() throws Throwable {
		entityManager.close();
		super.finalize();
	}
}

package poly.edu.dao;

import java.util.List;

import poly.edu.model.Cart;
import poly.edu.model.CartDetail;
import poly.edu.model.Hoadon;
import poly.edu.model.Hoadonchitiet;

public class CartDao extends ConnectDao {
	public boolean insertCart(Hoadon hoadon, List<Hoadonchitiet> listHDCT) {
		/*
		 * Insert vao table HoaDon truoc sau do moi insert vao table HoaDonChiTiet Neu
		 * insert vao HoaDon that bai thi khong insert vao HDCT Neu insert vao HDCT that
		 * bai thi rollback data (tuc la huy data da insert vao HoaDon)
		 */
		try {
			entityManager.getTransaction().begin();
			entityManager.persist(hoadon);
			int maHDVuaInsert = hoadon.getId();
			if (maHDVuaInsert > 0) {
				// neu insert thanh cong thi insert tiep HDCT
				hoadon.setId(maHDVuaInsert);
				listHDCT.forEach(hdct -> entityManager.persist(hdct));
			} else {
				return false;
			}
			entityManager.getTransaction().commit();
			System.out.println("Create succeed");
			return true;
		} catch (Exception e) {
			entityManager.getTransaction().rollback();
			System.out.println("Cannot insert entity");
			e.printStackTrace();
			return false;
		}
	}
}

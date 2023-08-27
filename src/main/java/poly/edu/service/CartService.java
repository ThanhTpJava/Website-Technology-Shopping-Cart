package poly.edu.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import poly.edu.dao.CartDao;
import poly.edu.dao.SanPhamDao;
import poly.edu.dao.UserDao;
import poly.edu.model.Cart;
import poly.edu.model.CartDetail;
import poly.edu.model.Hoadon;
import poly.edu.model.Hoadonchitiet;
import poly.edu.model.Sanpham;
import poly.edu.model.User;

public class CartService {
	SanPhamDao SanPhamDao = new SanPhamDao();
	UserDao userDao = new UserDao();
	CartDao cartDao = new CartDao();
	
	public boolean checkBeforeInsert(Cart cart) {
		// kiem tra cart co ton tai sp hay khong, neu khong ton tai thi ko insert
		if (cart.getTongsl() == 0) {
			return false;
		}
		return insertHoaDon(cart);
	}
	
	public boolean insertHoaDon(Cart cartDto) {
		Hoadon hoadon = mappingDtoToHoadonEntity(cartDto);
		List<Hoadonchitiet> listHDCT = mappingDtoToHoadonchitietEntity(cartDto.getDetail(), hoadon);
		return cartDao.insertCart(hoadon, listHDCT);
	}
	
	public Cart updateCart(Cart cart, String masp, int soLuong, boolean isUpdate) {
		Sanpham Sanpham = SanPhamDao.findByMaSP(masp);
		
		HashMap<String, CartDetail> cartDetail = cart.getDetail();
		
		if (cartDetail.containsKey(masp)) {
			if (soLuong < 1) {
				cartDetail.remove(masp);
			} else {
				if (isUpdate) {
					cartDetail.get(masp).setSlMua(soLuong);
				} else {
					int slCu = cartDetail.get(masp).getSlMua();
					cartDetail.get(masp).setSlMua(slCu + soLuong);
				}
			}
		} else {
			CartDetail cartDetailDto = new CartDetail();
			cartDetailDto.setTensp(Sanpham.getTensp());
			cartDetailDto.setGiasp(Sanpham.getGiasp());
			cartDetailDto.setMasp(Sanpham.getMasp());
			cartDetailDto.setHinh(Sanpham.getHinh());
			cartDetailDto.setSlMua(soLuong);
			cartDetail.put(masp, cartDetailDto);
		}
		
		cart.setTongsl(this.getTongSL(cart));
		cart.setTongtien(this.getTongTien(cart));
		
		return cart;
	}
	
	public double getTongTien(Cart cart) {
		HashMap<String, CartDetail> cartDetail = cart.getDetail();
		Double tongTien = 0D;
		for (CartDetail cartDetailDto : cartDetail.values()) {
			Sanpham Sanpham = SanPhamDao.findByMaSP(cartDetailDto.getMasp());
			tongTien += Sanpham.getGiasp() * cartDetailDto.getSlMua();
		}
		return tongTien;
	}
	
	public int getTongSL(Cart cart) {
		HashMap<String, CartDetail> cartDetail = cart.getDetail();
		int tongSL = 0;
		for (CartDetail SanphamDto : cartDetail.values()) {
			tongSL += SanphamDto.getSlMua();
		}
		return tongSL;
	}
	
	private Hoadon mappingDtoToHoadonEntity(Cart cartDto) {
		Hoadon hoadon = new Hoadon();
		hoadon.setDiachi(cartDto.getDiachi());
		hoadon.setDienthoai(cartDto.getDienthoai());
		hoadon.setTongtien(cartDto.getTongtien());
		User user = userDao.findById(cartDto.getUserId());
		hoadon.setUser(user);
		return hoadon;
	}
	
	private List<Hoadonchitiet> mappingDtoToHoadonchitietEntity(HashMap<String, CartDetail> details, Hoadon hoadon) {
		List<Hoadonchitiet> result = new ArrayList<>();
		details.forEach((key, hdct) -> {
			Hoadonchitiet hoadonchitiet = new Hoadonchitiet();
			Sanpham sanpham = SanPhamDao.findByMaSP(hdct.getMasp());
			hoadonchitiet.setSanpham(sanpham);
			hoadonchitiet.setGia(hdct.getGiasp());
			hoadonchitiet.setSoluong(hdct.getSlMua());
			hoadonchitiet.setHoadon(hoadon);
			result.add(hoadonchitiet);
		});
		return result;
	}

}

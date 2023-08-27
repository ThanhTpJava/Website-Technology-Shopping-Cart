package poly.edu.model;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;


/**
 * The persistent class for the sanpham database table.
 * 
 */
@Entity
@Table(name="sanpham")
@NamedQuery(name="Sanpham.findAll", query="SELECT s FROM Sanpham s")
public class Sanpham implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String masp;

	private double giasp;

	private String hinh;

	private String mota;

	private int soluong;

	private String tensp;

	//bi-directional many-to-one association to Hoadonchitiet
	@OneToMany(mappedBy="sanpham")
	private List<Hoadonchitiet> hoadonchitiets;

	//bi-directional many-to-one association to Danhmuc
	@ManyToOne
	@JoinColumn(name="madm")
	private Danhmuc danhmuc;

	public Sanpham() {
	}

	public String getMasp() {
		return this.masp;
	}

	public void setMasp(String masp) {
		this.masp = masp;
	}

	public double getGiasp() {
		return this.giasp;
	}

	public void setGiasp(double giasp) {
		this.giasp = giasp;
	}

	public String getHinh() {
		return this.hinh;
	}

	public void setHinh(String hinh) {
		this.hinh = hinh;
	}

	public String getMota() {
		return this.mota;
	}

	public void setMota(String mota) {
		this.mota = mota;
	}

	public int getSoluong() {
		return this.soluong;
	}

	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}

	public String getTensp() {
		return this.tensp;
	}

	public void setTensp(String tensp) {
		this.tensp = tensp;
	}

	public List<Hoadonchitiet> getHoadonchitiets() {
		return this.hoadonchitiets;
	}

	public void setHoadonchitiets(List<Hoadonchitiet> hoadonchitiets) {
		this.hoadonchitiets = hoadonchitiets;
	}

	public Hoadonchitiet addHoadonchitiet(Hoadonchitiet hoadonchitiet) {
		getHoadonchitiets().add(hoadonchitiet);
		hoadonchitiet.setSanpham(this);

		return hoadonchitiet;
	}

	public Hoadonchitiet removeHoadonchitiet(Hoadonchitiet hoadonchitiet) {
		getHoadonchitiets().remove(hoadonchitiet);
		hoadonchitiet.setSanpham(null);

		return hoadonchitiet;
	}

	public Danhmuc getDanhmuc() {
		return this.danhmuc;
	}

	public void setDanhmuc(Danhmuc danhmuc) {
		this.danhmuc = danhmuc;
	}

}
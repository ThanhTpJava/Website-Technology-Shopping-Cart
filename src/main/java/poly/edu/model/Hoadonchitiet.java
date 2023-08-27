package poly.edu.model;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;


/**
 * The persistent class for the hoadonchitiet database table.
 * 
 */
@Entity
@Table(name="hoadonchitiet")
@NamedQuery(name="Hoadonchitiet.findAll", query="SELECT h FROM Hoadonchitiet h")
public class Hoadonchitiet implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private double gia;

	private int soluong;

	//bi-directional many-to-one association to Hoadon
	@ManyToOne
	@JoinColumn(name="mahd")
	private Hoadon hoadon;

	//bi-directional many-to-one association to Sanpham
	@ManyToOne
	@JoinColumn(name="masp")
	private Sanpham sanpham;

	public Hoadonchitiet() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getGia() {
		return this.gia;
	}

	public void setGia(double d) {
		this.gia = d;
	}

	public int getSoluong() {
		return this.soluong;
	}

	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}

	public Hoadon getHoadon() {
		return this.hoadon;
	}

	public void setHoadon(Hoadon hoadon) {
		this.hoadon = hoadon;
	}

	public Sanpham getSanpham() {
		return this.sanpham;
	}

	public void setSanpham(Sanpham sanpham) {
		this.sanpham = sanpham;
	}

}
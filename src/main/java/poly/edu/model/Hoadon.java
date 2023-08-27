package poly.edu.model;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;


/**
 * The persistent class for the hoadon database table.
 * 
 */
@Entity
@Table(name="hoadon")
@NamedQuery(name="Hoadon.findAll", query="SELECT h FROM Hoadon h")
public class Hoadon implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private String diachi;

	private String dienthoai;

	private double tongtien;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="userId")
	private User user;

	//bi-directional many-to-one association to Hoadonchitiet
	@OneToMany(mappedBy="hoadon")
	private List<Hoadonchitiet> hoadonchitiets;

	public Hoadon() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDiachi() {
		return this.diachi;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

	public String getDienthoai() {
		return this.dienthoai;
	}

	public void setDienthoai(String dienthoai) {
		this.dienthoai = dienthoai;
	}

	public double getTongtien() {
		return this.tongtien;
	}

	public void setTongtien(double d) {
		this.tongtien = d;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Hoadonchitiet> getHoadonchitiets() {
		return this.hoadonchitiets;
	}

	public void setHoadonchitiets(List<Hoadonchitiet> hoadonchitiets) {
		this.hoadonchitiets = hoadonchitiets;
	}

	public Hoadonchitiet addHoadonchitiet(Hoadonchitiet hoadonchitiet) {
		getHoadonchitiets().add(hoadonchitiet);
		hoadonchitiet.setHoadon(this);

		return hoadonchitiet;
	}

	public Hoadonchitiet removeHoadonchitiet(Hoadonchitiet hoadonchitiet) {
		getHoadonchitiets().remove(hoadonchitiet);
		hoadonchitiet.setHoadon(null);

		return hoadonchitiet;
	}

}
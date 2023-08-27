package poly.edu.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the danhmuc database table.
 * 
 */
@Entity
@Table(name="danhmuc")
@NamedQuery(name="Danhmuc.findAll", query="SELECT d FROM Danhmuc d")
public class Danhmuc implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String madm;

	private String ghichu;

	private String tendanhmuc;

	//bi-directional many-to-one association to Sanpham
	@OneToMany(mappedBy="danhmuc")
	private List<Sanpham> sanphams;

	public Danhmuc() {
	}

	public String getMadm() {
		return this.madm;
	}

	public void setMadm(String madm) {
		this.madm = madm;
	}

	public String getGhichu() {
		return this.ghichu;
	}

	public void setGhichu(String ghichu) {
		this.ghichu = ghichu;
	}

	public String getTendanhmuc() {
		return this.tendanhmuc;
	}

	public void setTendanhmuc(String tendanhmuc) {
		this.tendanhmuc = tendanhmuc;
	}

	public List<Sanpham> getSanphams() {
		return this.sanphams;
	}

	public void setSanphams(List<Sanpham> sanphams) {
		this.sanphams = sanphams;
	}

	public Sanpham addSanpham(Sanpham sanpham) {
		getSanphams().add(sanpham);
		sanpham.setDanhmuc(this);

		return sanpham;
	}

	public Sanpham removeSanpham(Sanpham sanpham) {
		getSanphams().remove(sanpham);
		sanpham.setDanhmuc(null);

		return sanpham;
	}

}
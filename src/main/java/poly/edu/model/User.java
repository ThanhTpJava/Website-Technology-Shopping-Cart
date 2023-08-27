package poly.edu.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the user database table.
 * 
 */
@Entity
@Table(name="[user]")
@NamedQuery(name="User.findAll", query="SELECT u FROM User u")
@NamedQuery(name="User.findOneUser", query = "SELECT u FROM User u where u.username = :username")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private String email;

	private String fullname;

	private String password;

	private String phone;

	private int role;

	private String username;

	//bi-directional many-to-one association to Hoadon
	@OneToMany(mappedBy="user")
	private List<Hoadon> hoadons;

	public User() {
	}

	
	
	public User( String username, String password, String fullname, String email,  String phone, int role) {
		super();
		this.id = id;
		this.email = email;
		this.fullname = fullname;
		this.password = password;
		this.phone = phone;
		this.role = role;
		this.username = username;
	}



	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullname() {
		return this.fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getRole() {
		return this.role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public List<Hoadon> getHoadons() {
		return this.hoadons;
	}

	public void setHoadons(List<Hoadon> hoadons) {
		this.hoadons = hoadons;
	}

	public Hoadon addHoadon(Hoadon hoadon) {
		getHoadons().add(hoadon);
		hoadon.setUser(this);

		return hoadon;
	}

	public Hoadon removeHoadon(Hoadon hoadon) {
		getHoadons().remove(hoadon);
		hoadon.setUser(null);

		return hoadon;
	}

}
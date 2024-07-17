package servlet;

public class MemberVO {
	private String name;
	private String id;
	private String email;
	private String password;
	private String phone;
	private String addr;
	private String gender;
	private int seller;
	
	// alt + s + a
	public MemberVO() {
	}
	
	public MemberVO(String name, String id, String email, String password, String phone, String addr, String gender, int seller) {
		this.name = name;
		this.id = id;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.addr = addr;
		this.gender = gender;
		this.seller = seller;
	}
	
	// alt + s + r
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getSeller() {
		return seller;
	}

	public void setSeller(int seller) {
		this.seller = seller;
	}
	
}

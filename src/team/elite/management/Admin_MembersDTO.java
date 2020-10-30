package team.elite.management;

import java.sql.Timestamp;

public class Admin_MembersDTO {
	private String admin_id;
	private String admin_name;
	private String password;
	private String email;
	private String phone;
	private String admin_pic;
	private Timestamp reg_date;
	private String auto;

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_name() {
		return admin_name;
	}

	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAdmin_pic() {
		return admin_pic;
	}

	public void setAdmin_pic(String admin_pic) {
		this.admin_pic = admin_pic;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	public String getAuto () {
		return auto;
	}
	public void setAuto (String auto) {
		this.auto = auto;
	}

}

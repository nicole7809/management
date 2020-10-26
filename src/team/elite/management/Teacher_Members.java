package team.elite.management;

import com.sun.jmx.snmp.Timestamp;

public class Teacher_Members {
	private String teacher_id;
	private String teacher_name;
	private String password;
	private String email;
	private String phone;
	private String teacher_pic;
	private Timestamp reg_date;

	public String getTeacher_id() {
		return teacher_id;
	}

	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}

	public String getTeacher_name() {
		return teacher_name;
	}

	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
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

	public String getTeacher_pic() {
		return teacher_pic;
	}

	public void setTeacher_pic(String teacher_pic) {
		this.teacher_pic = teacher_pic;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

}

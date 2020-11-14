package team.elite.management;

import java.sql.Timestamp;

public class Student_MembersDTO {
	private String student_id;
	private String student_name;
	private String password; 
	private String email;
	private String phone;
	private String student_pic;
	private Timestamp reg_date;
	private String auto;
	private String lecture_code;

	
	public String getLecture_code() {
		return lecture_code;
	}

	public void setLecture_code(String lecture_code) {
		this.lecture_code = lecture_code;
	}

	public String getStudent_id() {
		return student_id;
	}

	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}

	public String getStudent_name() {
		return student_name;
	}

	public void setStudent_name(String student_name) {
		this.student_name = student_name;
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

	public String getStudent_pic() {
		return student_pic;
	}

	public void setStudent_pic(String student_pic) {
		this.student_pic = student_pic;
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

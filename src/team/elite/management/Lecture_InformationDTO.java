package team.elite.management;

import com.sun.jmx.snmp.Timestamp;

public class Lecture_InformationDTO {
	private int info_seqno;
	private String reg_id;
	private Timestamp reg_date;
	private String lecture;

	
	public String getLecture() {
		return lecture;
	}

	public void setLecture(String lecture) {
		this.lecture = lecture;
	}

	public int getInfo_seqno() {
		return info_seqno;
	}

	public void setInfo_seqno(int info_seqno) {
		this.info_seqno = info_seqno;
	}

	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

}

package team.elite.management;

import com.sun.jmx.snmp.Timestamp;

public class NoticeDTO {
	private int notice_seqno;
	private String title;
	private String contents;
	private int read_count;
	private String reg_ip;
	private String reg_id;
	private Timestamp reg_date;

	public int getNotice_seqno() {
		return notice_seqno;
	}

	public void setNotice_seqno(int notice_seqno) {
		this.notice_seqno = notice_seqno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getRead_count() {
		return read_count;
	}

	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}

	public String getReg_ip() {
		return reg_ip;
	}

	public void setReg_ip(String reg_ip) {
		this.reg_ip = reg_ip;
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

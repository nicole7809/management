package team.elite.management;

import java.sql.Timestamp;
public class QNADTO {
	private int qna_seqno;
	private String user_id;
	private String title;
	private String contents;
	private int read_count;
	private String reg_ip;
	private String reg_id;
	private Timestamp reg_date;

	public int getQna_seqno() {
		return qna_seqno;
	}

	public void setQna_seqno(int qna_seqno) {
		this.qna_seqno = qna_seqno;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
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

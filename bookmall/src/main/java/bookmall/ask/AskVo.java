package bookmall.ask;

import java.sql.Timestamp;

import bookmall.util.CommonVo;

public class AskVo extends CommonVo {
	private int askno;
	private String subject;
	private String title;
	private String content;
	private Timestamp regdate;
	private String filename_org;
	private String filename_real;
	private int userno;
	
	
	public int getAskno() {
		return askno;
	}
	public void setAskno(int askno) {
		this.askno = askno;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getFilename_org() {
		return filename_org;
	}
	public void setFilename_org(String filename_org) {
		this.filename_org = filename_org;
	}
	public String getFilename_real() {
		return filename_real;
	}
	public void setFilename_real(String filename_real) {
		this.filename_real = filename_real;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	
}

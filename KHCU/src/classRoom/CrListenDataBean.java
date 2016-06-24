package classRoom;

import java.util.Date;

public class CrListenDataBean {
	private String num;
	private String classcode;
	private String classtitle;
	private String content;
	private String filename;
	private String filepath;
	private String referencename;
	private String referencepath;
	private Date reg_date;
	private String week;
	private String startdate;
	private String enddate;
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getReferencename() {
		return referencename;
	}
	public void setReferencename(String referencename) {
		this.referencename = referencename;
	}
	public String getReferencepath() {
		return referencepath;
	}
	public void setReferencepath(String referencepath) {
		this.referencepath = referencepath;
	}
	public String getWeek() {
		return week;
	}
	public void setWeek(String week) {
		this.week = week;
	}
	public String getClasscode() {
		return classcode;
	}
	public void setClasscode(String classcode) {
		this.classcode = classcode;
	}
	public String getClasstitle() {
		return classtitle;
	}
	public void setClasstitle(String classtitle) {
		this.classtitle = classtitle;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
}

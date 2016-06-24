package classRoom;

import java.util.Date;

public class ClassHwSubmitDataBean {
	private String classSubmitHw;
	private String classcode;
	private String studentnum;
	private String hwtype;
	private String title;
	private String submit_name;
	private String submit_path;
	private int score;
	private Date reg_date;
	

	
	public String getHwtype() {
		return hwtype;
	}
	public void setHwtype(String hwtype) {
		this.hwtype = hwtype;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getClassSubmitHw() {
		return classSubmitHw;
	}
	public void setClassSubmitHw(String classSubmitHw) {
		this.classSubmitHw = classSubmitHw;
	}
	public String getClasscode() {
		return classcode;
	}
	public void setClasscode(String classcode) {
		this.classcode = classcode;
	}
	public String getStudentnum() {
		return studentnum;
	}
	public void setStudentnum(String studentnum) {
		this.studentnum = studentnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSubmit_name() {
		return submit_name;
	}
	public void setSubmit_name(String submit_name) {
		this.submit_name = submit_name;
	}
	public String getSubmit_path() {
		return submit_path;
	}
	public void setSubmit_path(String submit_path) {
		this.submit_path = submit_path;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}


}

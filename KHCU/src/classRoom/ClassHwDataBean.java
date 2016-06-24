package classRoom;

import java.util.Date;

public class ClassHwDataBean {
	private int num;
	private String classSubmitHw;
	private String classHomework;
	private String type;
	private String classcode;
	private String title;
	private String content;
	private int end_date;
	private String reference_name;
	private String reference_path;
	private Date reg_date;
	private int readcount;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getClassSubmitHw() {
		return classSubmitHw;
	}
	public void setClassSubmitHw(String classSubmitHw) {
		this.classSubmitHw = classSubmitHw;
	}
	public String getClassHomework() {
		return classHomework;
	}
	public void setClassHomework(String classHomework) {
		this.classHomework = classHomework;
	}
	public String getClasscode() {
		return classcode;
	}
	public void setClasscode(String classcode) {
		this.classcode = classcode;
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
	public int getEnd_date() {
		return end_date;
	}
	public void setEnd_date(int end_date) {
		this.end_date = end_date;
	}
	public String getReference_name() {
		return reference_name;
	}
	public void setReference_name(String reference_name) {
		this.reference_name = reference_name;
	}
	public String getReference_path() {
		return reference_path;
	}
	public void setReference_path(String reference_path) {
		this.reference_path = reference_path;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
	
}

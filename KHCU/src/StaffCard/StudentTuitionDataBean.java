package StaffCard;

import java.sql.Timestamp;

public class StudentTuitionDataBean {
	private int num;
	private String stnum;
	private String stname;
	private int styear;
	private int stsemester;
	private String stcollege;
	private String stmajor;
	private int stgrade;
	private int stmoney;
	private String state;
	private Timestamp reg_date;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getStnum() {
		return stnum;
	}
	public void setStnum(String stnum) {
		this.stnum = stnum;
	}
	public String getStname() {
		return stname;
	}
	public void setStname(String stname) {
		this.stname = stname;
	}
	public int getStyear() {
		return styear;
	}
	public void setStyear(int styear) {
		this.styear = styear;
	}
	public int getStsemester() {
		return stsemester;
	}
	public void setStsemester(int stsemester) {
		this.stsemester = stsemester;
	}
	public String getStcollege() {
		return stcollege;
	}
	public void setStcollege(String stcollege) {
		this.stcollege = stcollege;
	}
	public String getStmajor() {
		return stmajor;
	}
	public void setStmajor(String stmajor) {
		this.stmajor = stmajor;
	}
	public int getStgrade() {
		return stgrade;
	}
	public void setStgrade(int stgrade) {
		this.stgrade = stgrade;
	}
	public int getStmoney() {
		return stmoney;
	}
	public void setStmoney(int stmoney) {
		this.stmoney = stmoney;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
}

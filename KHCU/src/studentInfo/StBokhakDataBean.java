package studentInfo;

import java.util.Date;

public class StBokhakDataBean {
	private String studentnum;
	private String permit;
	private Date reg_date;
	public String getStudentnum() {
		return studentnum;
	}
	public void setStudentnum(String studentnum) {
		this.studentnum = studentnum;
	}
	public String getPermit() {
		return permit;
	}
	public void setPermit(String permit) {
		this.permit = permit;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

}

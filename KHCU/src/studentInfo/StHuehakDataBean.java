package studentInfo;

import java.util.Date;

public class StHuehakDataBean {
	private String studentnum;
	private String type;
	private String period;
	private String reason;
	private String permit;
	private Date reg_date;
	
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getStudentnum() {
		return studentnum;
	}
	public void setStudentnum(String studentnum) {
		this.studentnum = studentnum;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getPermit() {
		return permit;
	}
	public void setPermit(String permit) {
		this.permit = permit;
	}
	
	
}
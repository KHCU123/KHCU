package AttendBook;

import java.util.Date;

public class CheckAttendDataBean {
	private String checkAttend;
	private String classcode;
	private String stnum;
	private Date entrance_date;
	private String attendcheck;
	private String end_check;
		
	
	public Date getEntrance_date() {
		return entrance_date;
	}
	public void setEntrance_date(Date entrance_date) {
		this.entrance_date = entrance_date;
	}
	public String getCheckAttend() {
		return checkAttend;
	}
	public void setCheckAttend(String checkAttend) {
		this.checkAttend = checkAttend;
	}
	public String getClasscode() {
		return classcode;
	}
	public void setClasscode(String classcode) {
		this.classcode = classcode;
	}
	public String getStnum() {
		return stnum;
	}
	public void setStnum(String stnum) {
		this.stnum = stnum;
	}
	public String getAttendcheck() {
		return attendcheck;
	}
	public void setAttendcheck(String attendcheck) {
		this.attendcheck = attendcheck;
	}
	public String getEnd_check() {
		return end_check;
	}
	public void setEnd_check(String end_check) {
		this.end_check = end_check;
	}


}

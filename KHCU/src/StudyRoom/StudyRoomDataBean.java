package StudyRoom;

import java.sql.Timestamp;

public class StudyRoomDataBean {
	private int num;
	private String roomTitle;
	private String passwd;
	private String creater;
	private Timestamp reg_date;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getRoomTitle() {
		return roomTitle;
	}
	public void setRoomTitle(String roomTitle) {
		this.roomTitle = roomTitle;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getCreater() {
		return creater;
	}
	public void setCreater(String creater) {
		this.creater = creater;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
}

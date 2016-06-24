package classRoom;

import java.util.Date;

public class ClassAttendMessageDataBean {
	private String stnum;
    private String classcode;
    private String recMessage;
    private Date rec_time;
    private int check_num;
    
    

	public int getCheck_num() {
		return check_num;
	}
	public void setCheck_num(int check_num) {
		this.check_num = check_num;
	}
	public String getStnum() {
		return stnum;
	}
	public void setStnum(String stnum) {
		this.stnum = stnum;
	}
	public String getClasscode() {
		return classcode;
	}
	public void setClasscode(String classcode) {
		this.classcode = classcode;
	}
	public String getRecMessage() {
		return recMessage;
	}
	public void setRecMessage(String recMessage) {
		this.recMessage = recMessage;
	}
	public Date getRec_time() {
		return rec_time;
	}
	public void setRec_time(Date rec_time) {
		this.rec_time = rec_time;
	} 
    
    
}

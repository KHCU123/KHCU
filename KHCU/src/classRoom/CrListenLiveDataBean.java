package classRoom;

import java.util.Date;

public class CrListenLiveDataBean {
	private String crListenRoom;
	private String classcode;
	private Date lecture_start;
	private Date lecture_end;
	private String referencename;
	private String referencepath;
	
	
	
	public String getCrListenRoom() {
		return crListenRoom;
	}
	public void setCrListenRoom(String crListenRoom) {
		this.crListenRoom = crListenRoom;
	}
	public String getClasscode() {
		return classcode;
	}
	public void setClasscode(String classcode) {
		this.classcode = classcode;
	}
	public Date getLecture_start() {
		return lecture_start;
	}
	public void setLecture_start(Date lecture_start) {
		this.lecture_start = lecture_start;
	}
	public Date getLecture_end() {
		return lecture_end;
	}
	public void setLecture_end(Date lecture_end) {
		this.lecture_end = lecture_end;
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
	
}

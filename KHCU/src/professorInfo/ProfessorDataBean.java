package professorInfo;

import java.sql.Timestamp;

public class ProfessorDataBean {
	
	private String proNum; 
	private String proPw; 
	private String proName; 
	private String proJumin1; 
	private String proJumin2; 
	private String proAddress1; 
	private String proAddress2; 
	private String proPostcode; 
	private String proPhone; 
	private String proProfileName; 
	private String proProfilePath;
	private String proCollege; 
	private String proMajor; 
	private String proState; 
	private String proEmail;	
	private Timestamp proReg_date;
	private String proFacebookId;

	
	public String getProFacebookId() {
		return proFacebookId;
	}
	public void setProFacebookId(String proFacebookId) {
		this.proFacebookId = proFacebookId;
	}
	public Timestamp getProReg_date() {
		return proReg_date;
	}
	public void setProReg_date(Timestamp proReg_date) {
		this.proReg_date = proReg_date;
	}
	public String getProNum() {
		return proNum;
	}
	public void setProNum(String proNum) {
		this.proNum = proNum;
	}
	public String getProPw() {
		return proPw;
	}
	public void setProPw(String proPw) {
		this.proPw = proPw;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getProJumin1() {
		return proJumin1;
	}
	public void setProJumin1(String proJumin1) {
		this.proJumin1 = proJumin1;
	}
	public String getProJumin2() {
		return proJumin2;
	}
	public void setProJumin2(String proJumin2) {
		this.proJumin2 = proJumin2;
	}
	public String getProAddress1() {
		return proAddress1;
	}
	public void setProAddress1(String proAddress1) {
		this.proAddress1 = proAddress1;
	}
	public String getProAddress2() {
		return proAddress2;
	}
	public void setProAddress2(String proAddress2) {
		this.proAddress2 = proAddress2;
	}
	public String getProPostcode() {
		return proPostcode;
	}
	public void setProPostcode(String proPostcode) {
		this.proPostcode = proPostcode;
	}
	public String getProPhone() {
		return proPhone;
	}
	public void setProPhone(String proPhone) {
		this.proPhone = proPhone;
	}
	public String getProProfileName() {
		return proProfileName;
	}
	public void setProProfileName(String proProfileName) {
		this.proProfileName = proProfileName;
	}
	public String getProProfilePath() {
		return proProfilePath;
	}
	public void setProProfilePath(String proProfilePath) {
		this.proProfilePath = proProfilePath;
	}
	public String getProCollege() {
		return proCollege;
	}
	public void setProCollege(String proCollege) {
		this.proCollege = proCollege;
	}
	public String getProMajor() {
		return proMajor;
	}
	public void setProMajor(String proMajor) {
		this.proMajor = proMajor;
	}
	public String getProState() {
		return proState;
	}
	public void setProState(String proState) {
		this.proState = proState;
	}
	public String getProEmail() {
		return proEmail;
	}
	public void setProEmail(String proEmail) {
		this.proEmail = proEmail;
	}
	
}

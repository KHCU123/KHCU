package studentInfo;

public class StCredit {
   private String studentnum;
   private int appliCredit; //신청 학점
   private int poAppliCredit;   // 신청가능 학점
   private int thisCompCredit;   // 이번학기 이수 학점
   private int compCredit;   // 총이수한 학점
   private int graCredit; // 졸업 가능 학점
   private int majorCredit; //총 전공이수학점
   private int libCredit; //총 교양이수학점
   
   
   public String getStudentnum() {
      return studentnum;
   }
   public void setStudentnum(String studentnum) {
      this.studentnum = studentnum;
   }
   public int getAppliCredit() {
      return appliCredit;
   }
   public void setAppliCredit(int appliCredit) {
      this.appliCredit = appliCredit;
   }
   public int getPoAppliCredit() {
      return poAppliCredit;
   }
   public void setPoAppliCredit(int poAppliCredit) {
      this.poAppliCredit = poAppliCredit;
   }
   public int getThisCompCredit() {
      return thisCompCredit;
   }
   public void setThisCompCredit(int thisCompCredit) {
      this.thisCompCredit = thisCompCredit;
   }
   public int getCompCredit() {
      return compCredit;
   }
   public void setCompCredit(int compCredit) {
      this.compCredit = compCredit;
   }
   public int getGraCredit() {
      return graCredit;
   }
   public void setGraCredit(int graCredit) {
      this.graCredit = graCredit;
   }
   public int getMajorCredit() {
      return majorCredit;
   }
   public void setMajorCredit(int majorCredit) {
      this.majorCredit = majorCredit;
   }
   public int getLibCredit() {
      return libCredit;
   }
   public void setLibCredit(int libCredit) {
      this.libCredit = libCredit;
   }
   
}
package StaffCard;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import studentInfo.StCredit;
import studentInfo.StudentDataBean;

@Controller
public class StGraduateBean {
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/GraduateConfirm.khcu")
	public String GraduateConfirm(HttpServletRequest request){
		SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy.MM.dd", Locale.KOREA );
		Date currentTime = new Date ( );
		String dTime = formatter.format ( currentTime );
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		StudentDataBean stDto = (StudentDataBean)sqlMap.queryForObject("studentCard", id);
		String ststate = stDto.getStstate();
		
		StCredit st = (StCredit)sqlMap.queryForObject("stCredit", id);
		int majorCredit = st.getMajorCredit();
		int libCredit = st.getLibCredit();
		int graCredit = st.getGraCredit();
		String check = null;
		String graduate = null;
		if(majorCredit>=120 && (libCredit+majorCredit)>=graCredit){
			check = "O";
			graduate = "신청 버튼을 누르면 졸업 신청이 완료 됩니다.";
		}else if( (libCredit+majorCredit)<graCredit){
			check = "X";
			graduate = "총 이수 학점 미달";
		}else if(majorCredit<120){
			check = "X";
			graduate = "전공 이수 학점 미달";
		}
		int graLib = graCredit - majorCredit;		
		
		String gTime = null;
		int year = currentTime.getYear();
		int month = currentTime.getMonth();
		
		String semester = null;
		if(Integer.parseInt(stDto.getStsemester()) >= 7){
			if(month <= 6){
				month = 8;
			}else{
				year++;
				month = 2;
			}
			semester = "ok";
			gTime = year+"년"+month+"월";
		}else{
			semester = "nok";
		}
		
		request.setAttribute("article", st);
		request.setAttribute("check", check);
		request.setAttribute("dTime", dTime);
		request.setAttribute("graLib", graLib);
		request.setAttribute("gTime", gTime);
		request.setAttribute("semester", semester);
		request.setAttribute("graduate", graduate);
		request.setAttribute("ststate", ststate);
		return "/StaffCard/GraduateConfirm.jsp";
	}

	@RequestMapping("/GraduateRegister.khcu")
	public String GraduateRegister(HttpServletRequest request){
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("studentnum", request.getParameter("studentnum"));
		hm.put("ststate", "졸업신청");
		sqlMap.update("graduateApply", hm);
		return "/StaffCard/GraduateRegister.jsp";
	}
	
	@RequestMapping("/GraduateRegisterAdmin.khcu")
	public String GraduateRegisterAdmin(HttpServletRequest request){
		String[] checkList = request.getParameterValues("ch");
		for(int i=0; i<checkList.length; i++){
			HashMap<String, Object> hm = new HashMap<String, Object>();
			hm.put("studentnum", checkList[i]);
			hm.put("ststate", "졸업");
			hm.put("reg_date", new Timestamp(System.currentTimeMillis()));
			sqlMap.update("graduateApplyAdmin", hm);
		}
		return "/StaffCard/GraduateRegisterAdmin.jsp";
	}
}


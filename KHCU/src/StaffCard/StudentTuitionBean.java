package StaffCard;

import java.sql.Timestamp;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import studentInfo.StudentDataBean;

@Controller
public class StudentTuitionBean {
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/StudentTuitionPay.khcu")
	public String StudentTuitionPay(HttpServletRequest request, StudentTuitionDataBean dto){
		dto.setState("吵何脚没");
		sqlMap.insert("insertStudentTuition", dto);
		return "/StaffCard/StudentTuitionPay.jsp";
	}
	
	@RequestMapping("/StudentTuitionPayOk.khcu")
	public String StudentTuitionPayOk(HttpServletRequest request){
		String[] checkList = request.getParameterValues("ch");
		for(int i=0; i<checkList.length; i++){
			HashMap<String, Object> hm = new HashMap<String, Object>();
			hm.put("stnum", checkList[i]);
			hm.put("state","吵何贸府肯丰");
			hm.put("reg_date",new Timestamp(System.currentTimeMillis()));
			sqlMap.update("updateStudentTuition", hm);
			StudentDataBean dto = (StudentDataBean)sqlMap.queryForObject("studentCard", checkList[i]);
			int grade = Integer.parseInt(dto.getStgrade());
			int semester = Integer.parseInt(dto.getStsemester());
			if(semester == 1){
				semester = 2;
			}else if(semester == 2){
				grade++;
				semester = 1;
			}
			hm.put("grade", grade);
			hm.put("semester", semester);
			sqlMap.update("updateStudentSemester", hm);
		}
		
		return "/StaffCard/StudentTuitionPayOk.jsp";
	}
}

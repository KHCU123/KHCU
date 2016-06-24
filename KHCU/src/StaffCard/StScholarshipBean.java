package StaffCard;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import studentInfo.StScholarship;
import studentInfo.StudentDataBean;

@Controller
public class StScholarshipBean {
	@Autowired
	SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/ScholarshipInputForm.khcu")
	public String ScholarshipInputForm(){
		return "/StaffCard/ScholarshipInputForm.jsp";
	}
	
	@RequestMapping("/ScholarStnumCheck.khcu")
	public String ScholarStnumCheck(HttpServletRequest request){
		String studentnum = request.getParameter("studentnum");
		int check = (Integer)sqlMap.queryForObject("checkStudentnum", studentnum);
		if(check == 1){
			StudentDataBean dto = (StudentDataBean)sqlMap.queryForObject("studentCard", studentnum);
			int semester = Integer.parseInt(dto.getStsemester());
			request.setAttribute("semester", new Integer(semester));
		}
		request.setAttribute("check", new Integer(check));
		request.setAttribute("studentnum", studentnum);
		return "/StaffCard/ScholarStnumCheck.jsp";
	}
	
	@RequestMapping("/ScholarshipInputPro.khcu")
	public String ScholarshipInputPro(HttpServletRequest request, StScholarship dto){
		dto.setYear(new Timestamp(System.currentTimeMillis()));
		sqlMap.insert("insertArticleScholar", dto);
		return "/StaffCard/ScholarshipInputPro.jsp";
	}
}

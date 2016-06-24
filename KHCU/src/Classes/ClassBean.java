package Classes;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import professorInfo.ProfessorDataBean;
import studentInfo.RegisterClassDataBean;
import studentInfo.StudentDataBean;

@Controller
public class ClassBean{
	
	@Autowired
	   private SqlMapClientTemplate sqlMap; 
	
	@RequestMapping("/classPlanner.khcu")
	public String classPlanner(HttpServletRequest request, ClassDataBean dto){

		String classCode = request.getParameter("classCode");	
		 List articleList = null;		 
		 dto.setClassCode(classCode);		
		 articleList = sqlMap.queryForList("getClassPlan", dto);
		 request.setAttribute("articleList", articleList);	
		
		return "/Classes/classPlanner.jsp";	
	}
	

	@RequestMapping("/modifyClassPlanner.khcu")
	public String modifyClassPlanner(HttpServletRequest request, ClassDataBean dto){

		String classCode = request.getParameter("classCode");
		 List articleList = null;		 
		 dto.setClassCode(classCode);		
		 articleList = sqlMap.queryForList("getClassPlan", dto);
		 request.setAttribute("articleList", articleList);	
		 
		return "/Classes/modifyClassPlanner.jsp";	
	}
	
	@RequestMapping("/modifyClassPlannerPro.khcu")
	public String modifyClassPlannerPro(HttpServletRequest request, ClassDataBean dto){

		String classCode = request.getParameter("classCode");
		 List articleList = null;		 
		 dto.setClassCode(classCode);
		 sqlMap.update("updatePlanner", dto);
		
		return "/Classes/modifyClassPlannerPro.jsp";	
	}
	
}

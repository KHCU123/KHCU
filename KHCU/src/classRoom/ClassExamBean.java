package classRoom;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import Classes.ClassDataBean;

import studentInfo.StudentDataBean;

@Controller
public class ClassExamBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("crExamMain.khcu")
	public String crExamMain(HttpServletRequest request, HttpSession session, StudentDataBean stDTO, ClassDataBean classDTO){
		List articleList = null;
		String studentnum = (String)session.getAttribute("memId");
		articleList = sqlMap.queryForList("gett", studentnum);
		stDTO=(StudentDataBean)sqlMap.queryForObject("studentCard",studentnum);
		request.setAttribute("stDTO", stDTO);
		request.setAttribute("articleList", articleList);
		return "/ClassRoom/CrExam/crExamMain.jsp";
	}
	@RequestMapping("crExamContent.khcu")
	public String crExamContent(HttpServletRequest request, HttpSession session, StudentDataBean stDTO, ClassExamInputDataBean inputDTO, ClassExamScoreDataBean scoreDTO){
		String studentnum = (String)session.getAttribute("memId");
		stDTO=(StudentDataBean)sqlMap.queryForObject("studentCard",studentnum);
		List articleList = null;
		articleList = sqlMap.queryForList("getExamContent", studentnum);
		request.setAttribute("stDTO", stDTO);
		request.setAttribute("articleList", articleList);
		
		return "/ClassRoom/CrExam/crExamContent.jsp";
	}
	@RequestMapping("crExamInputForm.khcu")
	public String crExamInputForm(HttpServletRequest request, HttpSession session, ClassDataBean classDTO){
		classDTO=(ClassDataBean)sqlMap.queryForObject("getStTimeTable", classDTO);
		System.out.println(classDTO.getClassCode());
		request.setAttribute("classDTO", classDTO);
		return "/ClassRoom/CrExam/crExamInputForm.jsp";
	}
	@RequestMapping("crExamInputPro.khcu")
	public String crExamInputPro(HttpServletRequest request, ClassDataBean classDTO, ClassExamInputDataBean inputDTO)throws Exception{
		sqlMap.insert("getExamInput", inputDTO);
		return "/ClassRoom/CrExam/crExamInputPro.jsp";
	}
	@RequestMapping("crExamForm.khcu")
	public String crExamForm(HttpServletRequest request, HttpSession session, StudentDataBean stDTO, ClassDataBean classDTO, ClassExamInputDataBean inputDTO, ClassExamScoreDataBean scoreDTO){
		String studentnum = (String)session.getAttribute("memId");
		stDTO=(StudentDataBean)sqlMap.queryForObject("studentCard",studentnum);
		inputDTO=(ClassExamInputDataBean)sqlMap.queryForObject("getExamForm", inputDTO);
		String num=request.getParameter("num");
		System.out.println(num);
		ClassExamScoreDataBean check=(ClassExamScoreDataBean)sqlMap.queryForObject("getExamScoreCheck", num);
		if(check==null){
			request.setAttribute("stDTO", stDTO);
			request.setAttribute("inputDTO", inputDTO);	
			request.setAttribute("check", check);
		}else{
			request.setAttribute("check", check);
		}
		return "/ClassRoom/CrExam/crExamForm.jsp";
	}
	@RequestMapping("crExamFormPro.khcu")
	public String crExamFormPro(HttpServletRequest request, HttpSession session, StudentDataBean stDTO, ClassDataBean classDTO, ClassExamInputDataBean inputDTO, ClassExamScoreDataBean scoreDTO)throws Exception{
		String correctAnswers = request.getParameter("correctAnswers");
	    String questions = request.getParameter("questions");
	    String studentnum = (String)session.getAttribute("memId");
		stDTO=(StudentDataBean)sqlMap.queryForObject("studentCard",studentnum);
		System.out.println(studentnum);
		inputDTO=(ClassExamInputDataBean)sqlMap.queryForObject("getExamForm", inputDTO);
		String num=request.getParameter("num");
		System.out.println(num);
		String classCode=request.getParameter("classCode");
		System.out.println(classCode);
		String examType=request.getParameter("examType");
		System.out.println(examType);
		System.out.println(correctAnswers);
		System.out.println(questions);
		
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("studentnum", studentnum);
		hm.put("num", num);
		hm.put("classCode", classCode);
		hm.put("examType", examType);
		hm.put("correctAnswers", correctAnswers);
		hm.put("questions", questions);
		sqlMap.insert("getExamScore", hm);
		
	    request.setAttribute("correctAnswers", correctAnswers);
	    request.setAttribute("questions", questions);
	    request.setAttribute("stDTO", stDTO);
	    request.setAttribute("inputDTO", inputDTO);
		    
		
		
		return "/ClassRoom/CrExam/crExamFormPro.jsp";
	}
	
}

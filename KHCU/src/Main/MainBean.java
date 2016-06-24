package Main;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import studentInfo.StudentDataBean;

@Controller
public class MainBean {
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/main.khcu")
	public String main(){

		return "/Main/main.jsp";
	}
	
	@RequestMapping("/loginPro.khcu")
	public String loginPro(HttpServletRequest request, StudentDataBean studentDTO){
		String loginNum = request.getParameter("loginNum");
		String loginPw = request.getParameter("loginPw");

		HttpSession session = request.getSession();
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("loginNum", loginNum);
		hm.put("loginPw", loginPw);
        int checkStudent = (Integer)sqlMap.queryForObject("loginCheckStudent", hm);
        int checkStaff = (Integer)sqlMap.queryForObject("loginCheckStaff", hm);
        int checkProf = (Integer)sqlMap.queryForObject("loginCheckProf", hm);
        int check = 0;
        if(checkStudent == 1){
        	session.setAttribute("memId",loginNum);
        	session.setAttribute("checkId", 3);
        	check = 1;
        }else if(checkStaff == 1){
        	session.setAttribute("memId",loginNum);
        	session.setAttribute("checkId", 1);
        	check = 1;
        }else if(checkProf == 1){
        	session.setAttribute("memId",loginNum);
        	session.setAttribute("checkId", 2);
        	check = 1;
        }        
        request.setAttribute("check", new Integer(check));
		return "/Main/loginPro.jsp";
	}
	
	@RequestMapping("/logout.khcu")
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession();	
		session.invalidate();
		return "/Main/logout.jsp";
	}
	
	@RequestMapping("/findIdForm.khcu")
	public String findIdForm(){
		return "/Main/findIdForm.jsp";
	}
	
	@RequestMapping("/findIdPro.khcu")
	public String findIdPro(HttpServletRequest request){
		String findName = request.getParameter("findName");
		String findBirth = request.getParameter("findBirth");
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("findName", findName);
		hm.put("findBirth", findBirth);
		String studentNum = (String)sqlMap.queryForObject("findIdStudent", hm);
		String staffNum = (String)sqlMap.queryForObject("findIdStaff", hm);
		String profNum = (String)sqlMap.queryForObject("findIdProf", hm);
		int check = 0;
		String findNum = null;
		if(studentNum != null){	findNum = studentNum; check = 1; }
		else if(staffNum != null){ findNum = staffNum; check = 1; }
		else if(profNum != null){ findNum = profNum; check = 1; }

		request.setAttribute("findName", findName);
		request.setAttribute("findNum", findNum);
		request.setAttribute("check", new Integer(check));
		return "/Main/findIdPro.jsp";
	}
	
	@RequestMapping("/findPwForm.khcu")
	public String findPwForm(){
		return "/Main/findPwForm.jsp";
	}
	
	@RequestMapping("/findPwPro.khcu")
	public String findPwPro(HttpServletRequest request){
		String findNum = request.getParameter("findNum");
		String findName = request.getParameter("findName");
		String findBirth = request.getParameter("findBirth");
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("findNum", findNum);
		hm.put("findName", findName);
		hm.put("findBirth", findBirth);
		String studentPw = (String)sqlMap.queryForObject("findPwStudent", hm);
		String staffPw = (String)sqlMap.queryForObject("findPwStaff", hm);
		String profPw = (String)sqlMap.queryForObject("findPwProf", hm);
		int check = 0;
		String findPw = null;
		if(studentPw != null){	findPw = studentPw; check = 1; }
		else if(staffPw != null){ findPw = staffPw; check = 1; }
		else if(profPw != null){ findPw = profPw; check = 1; }

		request.setAttribute("findName", findName);
		request.setAttribute("findPw", findPw);
		request.setAttribute("check", new Integer(check));
		return "/Main/findPwPro.jsp";
	}
	
	@RequestMapping("/classes.khcu")
	public String classes(){
		return "/Main/classes.jsp";
	}
	
	@RequestMapping("/community.khcu")
	public String community(){
		return "/Main/community.jsp";
	}
	
	@RequestMapping("/mypage.khcu")
	public String mypage(){
		return "/Main/mypage.jsp";
	}
}

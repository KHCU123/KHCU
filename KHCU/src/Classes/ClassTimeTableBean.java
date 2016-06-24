package Classes;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import studentInfo.RegisterClassDataBean;
import studentInfo.StudentDataBean;

@Controller
public class ClassTimeTableBean {
	
	@Autowired
	   private SqlMapClientTemplate sqlMap; 
	
	@RequestMapping("/stClassTime.khcu")
	public String stClassTime(HttpServletRequest request, ClassDataBean classDTO, RegisterClassDataBean reclassDTO, StudentDataBean stDTO ){
		 
		 List articleList = null;
		 //List articleList2 = null;
		 String classGrade =request.getParameter("classGrade");
		 String semester =request.getParameter("semester");
		 HttpSession session = request.getSession();
		 String studentnum = (String)session.getAttribute("memId");
		 stDTO=(StudentDataBean)sqlMap.queryForObject("studentCard", studentnum);
		 
		 System.out.println("grade="+classGrade);
		 System.out.println("ÇÐ±â="+semester);
		 
		 if(classGrade == null){classGrade = stDTO.getStgrade();}
		 if(semester == null){semester = stDTO.getStsemester();}
		 
		 if(classGrade.equals("1") && semester.equals("1")){
			 HashMap<String, Object> hm = new HashMap<String, Object>();
		     hm.put("studentnum", studentnum);
		     hm.put("classGrade", classGrade);
		     hm.put("semester", semester);				    
			 articleList=sqlMap.queryForList("getStclassAsGrade", hm);
		     request.setAttribute("articleList", articleList);
		 }else if(classGrade.equals("1") && semester.equals("2")){
			 HashMap<String, Object> hm = new HashMap<String, Object>();
		     hm.put("studentnum", studentnum);
		     hm.put("classGrade", classGrade);
		     hm.put("semester", semester);	
			 articleList=sqlMap.queryForList("getStclassAsGrade", hm);
		     request.setAttribute("articleList", articleList);
		 }else if(classGrade.equals("2") && semester.equals("1")){
			 HashMap<String, Object> hm = new HashMap<String, Object>();
		     hm.put("studentnum", studentnum);
		     hm.put("classGrade", classGrade);
		     hm.put("semester", semester);	
			 articleList=sqlMap.queryForList("getStclassAsGrade", hm);
		     request.setAttribute("articleList", articleList);
		 }else if(classGrade.equals("2") && semester.equals("2")){
			 HashMap<String, Object> hm = new HashMap<String, Object>();
		     hm.put("studentnum", studentnum);
		     hm.put("classGrade", classGrade);
		     hm.put("semester", semester);	
			 articleList=sqlMap.queryForList("getStclassAsGrade", hm);
		     request.setAttribute("articleList", articleList);
			 
		 }else if(classGrade.equals("3") && semester.equals("1")){
			 HashMap<String, Object> hm = new HashMap<String, Object>();
		     hm.put("studentnum", studentnum);
		     hm.put("classGrade", classGrade);
		     hm.put("semester", semester);	
			 articleList=sqlMap.queryForList("getStclassAsGrade", hm);
		     request.setAttribute("articleList", articleList);
			 
		 }else if(classGrade.equals("3") && semester.equals("2")){
			 HashMap<String, Object> hm = new HashMap<String, Object>();
		     hm.put("studentnum", studentnum);
		     hm.put("classGrade", classGrade);
		     hm.put("semester", semester);	
			 articleList=sqlMap.queryForList("getStclassAsGrade", hm);
		     request.setAttribute("articleList", articleList);
		 }else if(classGrade.equals("4") && semester.equals("1")){
			 HashMap<String, Object> hm = new HashMap<String, Object>();
		     hm.put("studentnum", studentnum);
		     hm.put("classGrade", classGrade);
		     hm.put("semester", semester);	
			 articleList=sqlMap.queryForList("getStclassAsGrade", hm);
		     request.setAttribute("articleList", articleList);
			 
		 }else if(classGrade.equals("4") && semester.equals("2")){
			 HashMap<String, Object> hm = new HashMap<String, Object>();
		     hm.put("studentnum", studentnum);
		     hm.put("classGrade", classGrade);
		     hm.put("semester", semester);	
			 articleList=sqlMap.queryForList("getStclassAsGrade", hm);
		     request.setAttribute("articleList", articleList);			 
		 }		
		 
		 String timelist="";
		 String classlist="";
		 String classCode ="";	
		 String[] color = {"#FF0000","#FF7012","#FFFF24","#1DDB16","#00D8FF","#FF6CFF","#A566FF","#F09661","#C3C3C3","#BDAE24"};

		 //articleList = sqlMap.queryForList("getStClassTime", studentnum);			   
			 
			 for(int i=0;i<articleList.size();i++){
				 ClassDataBean dto = (ClassDataBean)articleList.get(i);
				 timelist = dto.getClassTime();	
				 classCode = dto.getClassCode();
				 String[] words = timelist.split(",");	
				 
				 int r = 0;					 
				 r = (int)(Math.random() * 9 + 0);
				 	 
				 for(int j =0; j<words.length;j++){	
					  String time = words[j];				  
					 request.setAttribute(time, classCode);				 
					 String timea = words[j] + 'a';
					 request.setAttribute(timea, color[r]);
				 }
			 }	
	
		// System.out.println(studentnum);
		// articleList3 = sqlMap.queryForList("gett", studentnum);	
		// System.out.println(articleList3);
		
		 
		request.setAttribute("stDTO", stDTO);	
		//request.setAttribute("articleList", articleList);
		request.setAttribute("classGrade",classGrade);
		 request.setAttribute("semester",semester);
		return "/stInfo/stClassTime.jsp";	
	}	
	
	@RequestMapping("/pfclassTimeTable.khcu")
	public String pfclassTimeTable(HttpServletRequest request, ClassDataBean classDTO){

		 List articleList = null;
		 HttpSession session = request.getSession();
		 String pfNum = (String)session.getAttribute("memId");
		 
		 String timelist="";
		 String classCode ="";
		 String classGrade =request.getParameter("classGrade");
		 String semester =request.getParameter("semester");
		 
		 if(classGrade == null){classGrade = "1";}
		 if(semester == null){semester = "1";}

		 if(classGrade.equals("1") && semester.equals("1")){
			 HashMap<String, Object> hm = new HashMap<String, Object>();
		     hm.put("pfNum", pfNum);
		     hm.put("classGrade", classGrade);
		     hm.put("semester", semester);				    
			 articleList=sqlMap.queryForList("getPfclassAsGrade", hm);
		     request.setAttribute("articleList", articleList);
		 }else if(classGrade.equals("1") && semester.equals("2")){
			 HashMap<String, Object> hm = new HashMap<String, Object>();
		     hm.put("pfNum", pfNum);
		     hm.put("classGrade", classGrade);
		     hm.put("semester", semester);	
			 articleList=sqlMap.queryForList("getPfclassAsGrade", hm);
		     request.setAttribute("articleList", articleList);
		 }else if(classGrade.equals("2") && semester.equals("1")){
			 HashMap<String, Object> hm = new HashMap<String, Object>();
		     hm.put("pfNum", pfNum);
		     hm.put("classGrade", classGrade);
		     hm.put("semester", semester);	
			 articleList=sqlMap.queryForList("getPfclassAsGrade", hm);
		     request.setAttribute("articleList", articleList);
		 }else if(classGrade.equals("2") && semester.equals("2")){
			 HashMap<String, Object> hm = new HashMap<String, Object>();
		     hm.put("pfNum", pfNum);
		     hm.put("classGrade", classGrade);
		     hm.put("semester", semester);	
			 articleList=sqlMap.queryForList("getPfclassAsGrade", hm);
		     request.setAttribute("articleList", articleList);
			 
		 }else if(classGrade.equals("3") && semester.equals("1")){
			 HashMap<String, Object> hm = new HashMap<String, Object>();
		     hm.put("pfNum", pfNum);
		     hm.put("classGrade", classGrade);
		     hm.put("semester", semester);	
			 articleList=sqlMap.queryForList("getPfclassAsGrade", hm);
		     request.setAttribute("articleList", articleList);
			 
		 }else if(classGrade.equals("3") && semester.equals("2")){
			 HashMap<String, Object> hm = new HashMap<String, Object>();
		     hm.put("pfNum", pfNum);
		     hm.put("classGrade", classGrade);
		     hm.put("semester", semester);	
			 articleList=sqlMap.queryForList("getPfclassAsGrade", hm);
		     request.setAttribute("articleList", articleList);
		 }else if(classGrade.equals("4") && semester.equals("1")){
			 HashMap<String, Object> hm = new HashMap<String, Object>();
		     hm.put("pfNum", pfNum);
		     hm.put("classGrade", classGrade);
		     hm.put("semester", semester);	
			 articleList=sqlMap.queryForList("getPfclassAsGrade", hm);
		     request.setAttribute("articleList", articleList);
			 
		 }else if(classGrade.equals("4") && semester.equals("2")){
			 HashMap<String, Object> hm = new HashMap<String, Object>();
		     hm.put("pfNum", pfNum);
		     hm.put("classGrade", classGrade);
		     hm.put("semester", semester);	
			 articleList=sqlMap.queryForList("getPfclassAsGrade", hm);
		     request.setAttribute("articleList", articleList);			 
		 }
		 
		 String[] color = {"#FF0000","#FF7012","#FFFF24","#1DDB16","#00D8FF","#FF6CFF","#A566FF","#F09661","#C3C3C3","#BDAE24"};
		 //classDTO.setPfNum(pfNum);
		 //articleList = sqlMap.queryForList("getAllTimeTable", classDTO);
		 //articleList2 = sqlMap.queryForList("getAllTimeTable", classDTO);

		 for(int i=0;i<articleList.size();i++){
			 ClassDataBean dto = (ClassDataBean)articleList.get(i);
			 timelist = dto.getClassTime();	
			 classCode = dto.getClassCode();
			
			 String[] words = timelist.split(",");	
			 
			 int r = 0;					 
			 r = (int)(Math.random() * 9 + 0);
			 	 
			 for(int j =0; j<words.length;j++){	
				  String time = words[j];				  
				 request.setAttribute(time, classCode);				 
				 String timea = words[j] + 'a';
				 request.setAttribute(timea, color[r]);				 
			 }
		 }		 
		 request.setAttribute("classGrade",classGrade);
		 request.setAttribute("semester",semester);
		return "/Classes/classTimeTable.jsp";	
	}	
}

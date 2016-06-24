package Classes;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import professorInfo.ProfessorDataBean;

@Controller
public class ClassInputBean {
	
	@Autowired
	   private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/classInputForm.khcu")
	   public String classInputForm(HttpServletRequest request,ProfessorDataBean proDTO){	
		 HttpSession session = request.getSession();
		 String proNum = (String)session.getAttribute("memId");
		 proDTO.setProNum(proNum);
		 proDTO = (ProfessorDataBean)sqlMap.queryForObject("getProfessorInfo", proDTO);
		 request.setAttribute("proDTO", proDTO);	
		 
		 List colList = null;
			colList = sqlMap.queryForList("collegeCategory", null);
			
			String college="";
			if(request.getParameter("college")!=null){
				college=(String)request.getParameter("college");				
			}
			request.setAttribute("college", college);
			System.out.println(college);
			List majList = null;
			majList = sqlMap.queryForList("collegeCategory2", college);
			request.setAttribute("colList", colList);
			request.setAttribute("majList", majList); 
		 
	      return "/Classes/classInputForm.jsp";
	   }
	
	@RequestMapping("/classInputForm2.khcu")
	   public String classInputForm2(){		
	      return "/Classes/classInputForm2.jsp";
	   }
	
	 @RequestMapping("/classcreateNum.khcu")	// 학번 1차생성
		public String classcreateNum(HttpServletRequest request){
			Date year = new Date();
			String colname = request.getParameter("college");
	        String majname = request.getParameter("major");
//	        String student = request.getParameter("student"); 
	        int colcode = (Integer) sqlMap.queryForObject("classNum1", colname);
	        int majcode=0;
	        if(majname!=null){
	       	 majcode = (Integer) sqlMap.queryForObject("classNum2", majname);
	        }
	        String classCode = request.getParameter("classCode");
	        int a = (Integer)sqlMap.queryForObject("checkClassNum",classCode);
	        if(a==0){
	       	 a=101;
	        }else{
	       	 a = (Integer)sqlMap.queryForObject("checkClassNum2", classCode);
	       	 a++;
	        }
	        request.setAttribute("year", year);
	        request.setAttribute("colcode", colcode);
	        request.setAttribute("majcode", majcode);
//	        request.setAttribute("student", student);
	        request.setAttribute("majname", majname);
	        request.setAttribute("colname", colname);
	   	 request.setAttribute("classcode", a);
			return "/Classes/createNum.jsp";
		}
		
		@RequestMapping("/classNumber.khcu")	// 학번 중복 검색 후 생성
		public String classNumber(HttpServletRequest request){
	         String classCode = request.getParameter("classCode");
	         int a = (Integer)sqlMap.queryForObject("checkClassNum",classCode);
	         int b = Integer.parseInt(classCode);
	         if(a!=0){
		         while(a!=0){	        	 
		        	 b++;
		        	 a = (Integer)sqlMap.queryForObject("checkClassNum",Integer.toString(b));
		       	 }
	         }
	    	 request.setAttribute("classCode", b);
			return "/Classes/classNumber.jsp";
		}
		
	
	
	@RequestMapping("/Cselectbox2.khcu")
	   public String Cselectbox2(HttpServletRequest request){	
		
		String college="";
		System.out.println(request.getParameter("college"));
		if(request.getParameter("college")!=null){
			college=(String)request.getParameter("college");			
		}
		request.setAttribute("college", college);
		List majList = null;
		majList = sqlMap.queryForList("collegeCategory2", college);
		request.setAttribute("majList", majList);
	      return "/Classes/selectbox2.jsp";
	   }
	
	 @RequestMapping("/classInputPro.khcu")
	   public String classInputPro(ClassDataBean classDTO, HttpServletRequest request){
		 
		 //교수 코드 & 강의 시간 두개 조합으로 같은 시간이 한교수에 두개 잇을 수 없졍. 그거 여기서 체크하기
		 List articleList = null;
		 String mytimelist="";
		 int check =0;
		 HttpSession session = request.getSession();
		 String pfNum = (String)session.getAttribute("memId");
		 classDTO.setPfNum(pfNum);
		 articleList = sqlMap.queryForList("getTimeTable", classDTO);
		 
		 String classTime = request.getParameter("classTime");
		 String classCode = request.getParameter("classCode");		
		 String attendBookName ="attendBook"+ classCode;
		 String[] t = classTime.split(",");
		 
		 
		 for(int i=0;i<articleList.size();i++){
			 ClassDataBean dto = (ClassDataBean)articleList.get(i);
			 mytimelist = dto.getClassTime();	
			 String[] words = mytimelist.split(",");	
			 
			 for(int j=0; j<t.length;j++){				 
				 for(int k=0; k<words.length;k++){
					 if(words[k].equals(t[j])){
						 check ++;
					 }
				 }
			 }			 
		 }		 
		 if(check==0){
			 sqlMap.insert("classInput", classDTO);
			 sqlMap.insert("makeAttendBook", attendBookName);
			 request.setAttribute("check", check);}
		 else {request.setAttribute("check", check);}
	      return "/Classes/classInputPro.jsp";
	   }	

}

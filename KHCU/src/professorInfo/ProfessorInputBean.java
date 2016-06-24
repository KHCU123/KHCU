package professorInfo;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProfessorInputBean {
	
	@Autowired
	   private SqlMapClientTemplate sqlMap;
	
	 @RequestMapping("/professorCardInputForm.khcu")
		public String professorCardInputForm(HttpServletRequest request){
			List colList = null;
			colList = sqlMap.queryForList("pfcollegeCategory", null);
			
			String proCollege="";
			if(request.getParameter("proCollege")!=null){
				proCollege=(String)request.getParameter("proCollege");				
			}
			request.setAttribute("proCollege", proCollege);
			System.out.println(proCollege);
			List majList = null;
			majList = sqlMap.queryForList("pfcollegeCategory2", proCollege);
			request.setAttribute("colList", colList);
			request.setAttribute("majList", majList); 
		 
			return "/professorMenu/professorCardInputForm.jsp";
		}
	 
	 
	 @RequestMapping("/professorCardInputPro.khcu")
	   public String professorCardInputPro(ProfessorDataBean proDTO){
		 proDTO.setProState("재직중");
		 proDTO.setProFacebookId("x");
	      sqlMap.insert("insertArticleProCard", proDTO);
	      return "/professorMenu/professorCardInputPro.jsp";
	   }		
	 
	 @RequestMapping("/pfcreateNum.khcu")	// 학번 1차생성
		public String pfcreateNum(HttpServletRequest request){
			Date year = new Date();
			String colname = request.getParameter("proCollege");
	        String majname = request.getParameter("proMajor");
	        String student = request.getParameter("student");  //???머지
	        int colcode = (Integer) sqlMap.queryForObject("professorNum1", colname);
	        int majcode=0;
	        if(majname!=null){
	       	 majcode = (Integer) sqlMap.queryForObject("professorNum2", majname);
	        }
	        String proNum = request.getParameter("proNum");
	        int a = (Integer)sqlMap.queryForObject("checkProfessorNum",proNum);
	        if(a==0){
	       	 a=2001;
	        }else{
	       	 a = (Integer)sqlMap.queryForObject("checkProfessorNum2", proNum);
	       	 a++;
	        }
	        request.setAttribute("year", year);
	        request.setAttribute("colcode", colcode);
	        request.setAttribute("majcode", majcode);
	        request.setAttribute("student", student);
	        request.setAttribute("majname", majname);
	        request.setAttribute("colname", colname);
	   	 request.setAttribute("professorcode", a);
			return "/professorMenu/createNum.jsp";
		}
		
		@RequestMapping("/pfNumber.khcu")	// 학번 중복 검색 후 생성
		public String pfNumber(HttpServletRequest request){
	         String proNum = request.getParameter("proNum");
	         int a = (Integer)sqlMap.queryForObject("checkProfessorNum",proNum);
	         int b = Integer.parseInt(proNum);
	         if(a!=0){
		         while(a!=0){	        	 
		        	 b++;
		        	 a = (Integer)sqlMap.queryForObject("checkProfessorNum",Integer.toString(b));
		       	 }
	         }
	    	 request.setAttribute("proNum", b);
			return "/professorMenu/pfNumber.jsp";
		}
		
	 
	
	@RequestMapping("/pfselectbox2.khcu")
	public String selectbox2(HttpServletRequest request){
		String proCollege="";
		if(request.getParameter("proCollege")!=null){
			proCollege=(String)request.getParameter("proCollege");			
		}
		request.setAttribute("proCollege", proCollege);
		List majList = null;
		majList = sqlMap.queryForList("collegeCategory2", proCollege);
		request.setAttribute("majList", majList);
		return "/professorMenu/selectbox2.jsp";
	}

}

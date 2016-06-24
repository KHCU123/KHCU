package studentInfo;

import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import Classes.ClassDataBean;

@Controller
public class StudentRegisterBean {
	@Autowired
	private SqlMapClientTemplate sqlMap;
	private Date day;
	
	@RequestMapping("/stRegisterClass.khcu")
	public String stRegisterClass(HttpServletRequest request, HttpSession session, StudentDataBean dto, StCredit sc) throws Exception{
		dto=(StudentDataBean)sqlMap.queryForObject("studentCard", session.getAttribute("memId"));
		request.setAttribute("dto", dto);
		sc=(StCredit)sqlMap.queryForObject("stCredit", session.getAttribute("memId"));
		request.setAttribute("sc", sc);
		String pageNum = request.getParameter("pageNum");
		
        if (pageNum == null) {
            pageNum = "1";
        }
        int pageSize = 10;	
        int currentPage = Integer.parseInt(pageNum);
        int startRow = (currentPage - 1) * pageSize + 1;
        int endRow = currentPage * pageSize;
        int count = 0;
        int number=0;

        List articleList = null;
        	
        count = (Integer)sqlMap.queryForObject("getArticleStClassesCount",null);
        HashMap<String, Integer> hm = new HashMap<String, Integer>();
        hm.put("startRow", startRow);
        hm.put("endRow", endRow);
	    if (count > 0) {
	        articleList = sqlMap.queryForList("getArticleStClasses", hm);
	    } else {
	        articleList = Collections.EMPTY_LIST;
	    }
        number=count-(currentPage-1)*pageSize;
        request.setAttribute("currentPage", new Integer(currentPage));
        request.setAttribute("startRow", new Integer(startRow));
        request.setAttribute("endRow", new Integer(endRow));
        request.setAttribute("count", new Integer(count));
        request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("number", new Integer(number));
        request.setAttribute("articleList", articleList);
        
		return "/stInfo/stRegisterClass.jsp";
	}
	
	
	@RequestMapping("/stRegisterClassPro.khcu")
	public String stRegisterClassPro(HttpServletRequest request, HttpSession session, StudentDataBean sdb,
			ClassDataBean cdb, StudentRegister dto, StCredit sc,ClassDataBean classDTO)throws Exception
	{
		sdb=(StudentDataBean)sqlMap.queryForObject("studentCard", session.getAttribute("memId"));
		request.setAttribute("sdb", sdb);
		String studentnum = sdb.getStudentnum();
		System.out.println(studentnum);
		String classcode=request.getParameter("classcode");
		System.out.println(classcode);
		String a = classcode + sdb.getStudentnum();
		dto.setStClassCode(a);
		System.out.println(a);		
		
		sc=(StCredit)sqlMap.queryForObject("stCredit", studentnum);
		request.setAttribute("sc", sc);
		
		int credit = (Integer)sqlMap.queryForObject("classCredit", classcode);
		int applicredit = (Integer)sqlMap.queryForObject("appCredit", studentnum);
		int applicredit2 = credit +applicredit;
		int poAppliCredit = (Integer)sqlMap.queryForObject("poappCredit", studentnum);
		sc.setAppliCredit(applicredit2);
		System.out.println(credit);
		System.out.println(applicredit);
		System.out.println(applicredit2);
		System.out.println(poAppliCredit);
		
		sqlMap.update("appStCredit",sc );
		System.out.println(applicredit2);	

		 List articleList = null;
		 List stClassInfoList = null;
		 List stInfoList = null;
		 int check =0;
		
		classDTO.setClassCode(classcode);
		stClassInfoList = sqlMap.queryForList("getStTimeTable", classDTO);
		ClassDataBean cldto = (ClassDataBean)stClassInfoList.get(0);

		if (cldto.getClassType().equals("1")){	//라이브 강의일 경우에만 시간 체크
			 String mytimelist="";			
			 articleList = sqlMap.queryForList("getStClassTime", studentnum); //이미학생이 수강신청한 수업들에 대한 시간			 
			 String classTime = (String)sqlMap.queryForObject("getClassTime", classcode);	
			 String[] t = classTime.split(",");		 //지금 수강신청 하려는 수업에 대한 시간
			 
			 for(int i=0;i<articleList.size();i++){
				 ClassDataBean classdto = (ClassDataBean)articleList.get(i);
				 mytimelist = classdto.getClassTime();	
				 String[] words = mytimelist.split(",");	
				 
				 for(int j=0; j<t.length;j++){				 
					 for(int k=0; k<words.length;k++){
						 if(words[k].equals(t[j])){ check ++; }
					 }
				 }			 
			 }		 
		}
		 if(check==0){	
			if(applicredit2>poAppliCredit){
				HashMap<String, Integer> hm2  = new HashMap<String, Integer>();
				hm2.put("credit", credit);
				hm2.put("applicredit", applicredit2);
				sqlMap.update("appStCredit2", hm2);
			}else{
				HashMap<String, String> hm3 = new HashMap<String, String>();
				hm3.put("classcode", classcode);
				hm3.put("stclasscode", a);
				hm3.put("studentnum", studentnum);
				sqlMap.insert("getArticleRegisterInto", hm3);						
			}			 
		request.setAttribute("check", check);
		}else {
			request.setAttribute("check", check);}		
		return "/stInfo/stRegisterClassPro.jsp";
	}	
		
}
	

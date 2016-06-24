package studentInfo;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

@Controller
public class StudentCardBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	private Date day;
	
	@RequestMapping("/stCard.khcu")
	public String stCard(HttpServletRequest request, HttpSession session, StudentDataBean dto){
		dto=(StudentDataBean)sqlMap.queryForObject("studentCard", session.getAttribute("memId"));
		request.setAttribute("dto", dto);
		return "/stInfo/stCard.jsp";
	}
	@RequestMapping("/stCardPro.khcu")
	public String stCardPro(HttpServletRequest request, HttpSession session, StudentDataBean dto){
		String studentnum = (String)session.getAttribute("memId");
		System.out.println(studentnum);
		dto.setStudentnum(studentnum);
		sqlMap.update("studentUpdate", dto);
		return "/stInfo/stCardPro.jsp";
	}
	@RequestMapping("/stCardInputForm.khcu")	// 생성폼
	public String stInputForm(HttpServletRequest request){
		List colList = null;
		colList = sqlMap.queryForList("collegeCategory", null);
		
		String stcollege="";
		if(request.getParameter("stcollege")!=null){
			stcollege=(String)request.getParameter("stcollege");
			
		}
		

		request.setAttribute("stcollege", stcollege);

		List majList = null;
		majList = sqlMap.queryForList("collegeCategory2", stcollege);
		request.setAttribute("colList", colList);
		request.setAttribute("majList", majList);
		return "/stInfo/stCardInputForm.jsp";
	}
	@RequestMapping("/stCardInputPro.khcu")		// 생성
	public String stInputPro(MultipartHttpServletRequest request, StudentDataBean dto) throws Exception{
		MultipartFile file = request.getFile("stprofile");		/// 원본 파일
		String orgName = file.getOriginalFilename();
		String path = "C://Users//user2//workspace//.metadata//.plugins//org.eclipse.wst.server.core//tmp0//wtpwebapps//KHCU//stInfo//stProfile//";
		File copy = new File("C://Users//user2//workspace//.metadata//.plugins//org.eclipse.wst.server.core//tmp0//wtpwebapps//KHCU//stInfo//stProfile//"+orgName);			/// 복사본
		
		file.transferTo(copy);
		request.setAttribute("orgName", orgName);
		
		
		dto.setStprofilename(orgName);
		dto.setStprofilepath(path);
		dto.setReg_date(day);
		dto.getReg_date();
		sqlMap.insert("studentInput", dto);
		HashMap<String, String> hm = new HashMap<String, String>();
        hm.put("studentnum", dto.getStudentnum());
		sqlMap.insert("InsertStCredit", hm);
		return "/stInfo/stCardInputPro.jsp";
		
	}
	@RequestMapping("/createNum.khcu")	// 학번 1차생성
	public String createNum(HttpServletRequest request){
		Date year = new Date();
		String colname = request.getParameter("stcollege");
        String majname = request.getParameter("stmajor");
        String student = request.getParameter("student");
        int colcode = (Integer)sqlMap.queryForObject("studentNum1", colname);
        int majcode=0;
        if(majname!=null){
       	 majcode = (Integer)sqlMap.queryForObject("studentNum2", majname);
        }
        String studentnum = request.getParameter("studentnum");
        int a = (Integer)sqlMap.queryForObject("checkStudnetNum",studentnum);
        if(a==0){
       	 a=3001;
        }else{
       	 a = (Integer)sqlMap.queryForObject("checkStudentNum2", studentnum);
       	 a++;
        }
        request.setAttribute("year", year);
        request.setAttribute("colcode", colcode);
        request.setAttribute("majcode", majcode);
        request.setAttribute("student", student);
        request.setAttribute("majname", majname);
        request.setAttribute("colname", colname);
   	 	request.setAttribute("studentcode", a);
		return "/stInfo/createNum.jsp";
	}
	
	@RequestMapping("/stNumber.khcu")	// 학번 중복 검색 후 생성
	public String stNumber(HttpServletRequest request){
        String studentnum = request.getParameter("studentnum");
        int a = (Integer)sqlMap.queryForObject("checkStudnetNum",studentnum);
        int b = Integer.parseInt(studentnum);
        if(a!=0){
	         while(a!=0){	        	 
	        	 b++;
	        	 a = (Integer)sqlMap.queryForObject("checkStudnetNum",Integer.toString(b));
	       	 }
        }
   	 	request.setAttribute("studentnum", b);
		return "/stInfo/stNumber.jsp";
	}
	
	@RequestMapping("/selectbox2.khcu")		// 카테고리 분류
	public String selectbox2(HttpServletRequest request){
		String stcollege="";
		if(request.getParameter("stcollege")!=null){
			stcollege=(String)request.getParameter("stcollege");
			
		}

		request.setAttribute("stcollege", stcollege);
		List majList = null;
		majList = sqlMap.queryForList("collegeCategory2", stcollege);
		request.setAttribute("majList", majList);
		return "/stInfo/selectbox2.jsp";
	}
	
	@RequestMapping("/stCardUpdateForm.khcu")
	public String stUpdateForm(HttpServletRequest request, StudentDataBean dto)throws Exception{
		List colList = null;
		colList = sqlMap.queryForList("collegeCategory", null);
		
		String stcollege="";
		if(request.getParameter("stcollege")!=null){
			stcollege=(String)request.getParameter("stcollege");
			
		}

		request.setAttribute("stcollege", stcollege);
		
		
		String studentnum = request.getParameter("studentnum");
		System.out.println(studentnum);
		dto.setStudentnum(studentnum);
		
		List majList = null;
		majList = sqlMap.queryForList("collegeCategory2", stcollege);
		request.setAttribute("colList", colList);
		request.setAttribute("majList", majList);
		dto=(StudentDataBean)sqlMap.queryForObject("studentCard", studentnum);
		request.setAttribute("dto", dto);
		return "/stInfo/stCardUpdateForm.jsp";
	}
	@RequestMapping("/stCardUpdatePro.khcu")
	public String stUpdatePro(HttpServletRequest request, StudentDataBean dto) throws Exception{
		String studentnum = request.getParameter("studentnum");
		System.out.println(studentnum);
		
		MultipartFile file = ((MultipartRequest) request).getFile("stprofile");		/// 원본 파일
		String orgName = file.getOriginalFilename();
		String path = "C://Users//user2//workspace//.metadata//.plugins//org.eclipse.wst.server.core//tmp0//wtpwebapps//KHCU//stInfo//stProfile//";
		File copy = new File("C://Users//user2//workspace//.metadata//.plugins//org.eclipse.wst.server.core//tmp0//wtpwebapps//KHCU//stInfo//stProfile//"+orgName);			/// 복사본
		
		file.transferTo(copy);
		request.setAttribute("orgName", orgName);
		
		dto.setStudentnum(studentnum);
		dto.setStprofilename(orgName);
		dto.setStprofilepath(path);
		dto.setReg_date(day);
		sqlMap.update("studentAdminUpdate", dto);
		return "/stInfo/stCardUpdatePro.jsp";
	}

	@RequestMapping("/stCardDeleteForm.khcu")
	public String stDeleteForm(HttpServletRequest request, StudentDataBean dto){
		String studentnum = request.getParameter("studentnum");
		String stname = request.getParameter("stname");
        String pageNum = request.getParameter("pageNum");

        request.setAttribute("studentnum", new Integer(studentnum));
        request.setAttribute("stname", stname);
        request.setAttribute("pageNum", new Integer(pageNum));
		return "/stInfo/stCardDeleteForm.jsp";
	}
	
	@RequestMapping("/stCardDeletePro.khcu")
	public String stDeletePro(HttpServletRequest request, StudentDataBean dto){
		String studentnum = request.getParameter("studentnum");
        String pageNum = request.getParameter("pageNum");

        dto.setStudentnum(studentnum);
        sqlMap.delete("deleteArticleStuddent", dto);
        request.setAttribute("pageNum", new Integer(pageNum));
        return "/stInfo/stCardDeletePro.jsp";
	}
	
	
}

package studentInfo;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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

import College.CollegeDataBean;

@Controller
public class StudentBean {
	@Autowired
	   	private SqlMapClientTemplate sqlMap;
		private Date day;

	@RequestMapping("/stMenu")
	public String stMenu(HttpServletRequest request, HttpSession session){
		return "/stInfo/stMenu.jsp";
	}
	
	/*
	@RequestMapping("/stClassTime")
	public String stClassTime(HttpServletRequest request, HttpSession session, StudentDataBean dto){
		dto=(StudentDataBean)sqlMap.queryForObject("studentCard", session.getAttribute("memId"));
		request.setAttribute("dto", dto);
		return "/stInfo/stClassTime.jsp";
	}
	*/
	
	
	
	@RequestMapping("/stDropClass")
	public String stDropClass(HttpServletRequest request, HttpSession session, StudentDataBean dto) throws Exception{
		dto=(StudentDataBean)sqlMap.queryForObject("studentCard", "memId");
		request.setAttribute("dto", dto);
		
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
        int getSemester = 0;
        count = (Integer)sqlMap.queryForObject("getArticleCountStudentScore",dto.getStudentnum());
	    if (count > 0) {
	        articleList = sqlMap.queryForList("studentAllScore", dto.getStudentnum());	// 뒷부분에 학번을 받아오는 것을 만들어야 함!!
	        getSemester = (Integer) sqlMap.queryForObject("getSemester", dto.getStudentnum());
	    } else {
	        articleList = Collections.EMPTY_LIST;
	    }
        number=count-(currentPage-1)*pageSize;
		
        List list2 = null;
        int count2 = 0;
        count2 = (Integer)sqlMap.queryForObject("getArticleCountDropClass",dto.getStudentnum());
        if(count2 > 0){
        	list2=sqlMap.queryForList("listDropClass", dto.getStudentnum());
        }else{
        	list2=Collections.EMPTY_LIST;
        }
        
        request.setAttribute("check", "처리중");
        request.setAttribute("currentPage", new Integer(currentPage));
        request.setAttribute("startRow", new Integer(startRow));
        request.setAttribute("endRow", new Integer(endRow));
        request.setAttribute("count", new Integer(count));
        request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("number", new Integer(number));
        request.setAttribute("list", articleList);
        request.setAttribute("getSemester", getSemester);
        request.setAttribute("list2", list2);
		return "/stInfo/stDropClass.jsp";
	}
	
	@RequestMapping("/stDropClassPro.khcu")
	public String stDropClassPro(HttpServletRequest request, HttpSession session, StudentDropClassBean dto){
		dto.setState("처리중");
		sqlMap.insert("dropClass", dto);
		return "/stInfo/stDropClassPro.jsp";
	}
	
	@RequestMapping("/stScholarship.khcu")
	public String stScholarship(HttpServletRequest request){
        int count = 0;

        List articleList = null;
        count = (Integer)sqlMap.queryForObject("getArticleCountScholar","1234");
	    if (count > 0) {
	        articleList = sqlMap.queryForList("scholarshipList", "1234");	// 뒷부분에 학번을 받아오는 것을 만들어야 함!!
	    } else {
	        articleList = Collections.EMPTY_LIST;
	    }request.setAttribute("list", articleList);
        
		return "/stInfo/stScholarship.jsp";
	}


}

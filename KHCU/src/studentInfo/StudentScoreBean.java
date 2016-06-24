package studentInfo;

import java.text.SimpleDateFormat;
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

@Controller
public class StudentScoreBean {
	@Autowired
		private SqlMapClientTemplate sqlMap;
		private Date day;
		
		@RequestMapping("/stScore.khcu")
		public String stScore(HttpServletRequest request, HttpSession session, StudentDataBean dto) throws Exception{
			String stnum = (String) session.getAttribute("memId");
			dto=(StudentDataBean)sqlMap.queryForObject("studentCard", stnum);	//session으로 받아오기
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
	        Date date = new Date();
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
	        SimpleDateFormat sdf2 = new SimpleDateFormat("MM");
	        int year = new Integer(sdf.format(date));
	        int month = new Integer(sdf2.format(date));
	        
	        int semester = 0;
	        if(month<9){
	        	semester = 1;
	        }else{
	        	semester = 2;
	        }

	        List articleList = null;
	        HashMap<String, Integer> hm = new HashMap<String, Integer>();
	        hm.put("year", year);
	        hm.put("semester", semester);
	        count = (Integer)sqlMap.queryForObject("getArticleCountStudentScore", stnum);
	        int thisSemester = 0;	// 신청학점
	        int getSemester = 0;
	        int check = 0;
		    if (count > 0) {
		        articleList = sqlMap.queryForList("studentScore", hm);	// 뒷부분에 학번을 받아오는 것을 만들어야 함!!
		        check = (Integer)sqlMap.queryForObject("getTakeSemester", hm);
		        if(check!=0){
		        getSemester = (Integer) sqlMap.queryForObject("takeSemester", hm);
		        }else{
		        	getSemester=0;
		        }
		    } else {
		        articleList = Collections.EMPTY_LIST;
		    }
	        number=count-(currentPage-1)*pageSize;
	        
	        thisSemester = (Integer)sqlMap.queryForObject("getThisSemester", stnum);

	        
	        request.setAttribute("currentPage", new Integer(currentPage));
	        request.setAttribute("startRow", new Integer(startRow));
	        request.setAttribute("endRow", new Integer(endRow));
	        request.setAttribute("count", new Integer(count));
	        request.setAttribute("pageSize", new Integer(pageSize));
			request.setAttribute("number", new Integer(number));
	        request.setAttribute("list", articleList);
	        request.setAttribute("thisSemester", thisSemester);
	        request.setAttribute("getSemester", getSemester);
			return "/stInfo/stScore.jsp";
		}
		
		@RequestMapping("/stAllScore.khcu")
		public String stAllScore(HttpServletRequest request, HttpSession session, StudentDataBean dto){
			String stnum = (String) session.getAttribute("memId");
			dto=(StudentDataBean)sqlMap.queryForObject("studentCard", stnum);
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
	        int  getSemester = 0;
	        count = (Integer)sqlMap.queryForObject("getArticleCountStudentScore",stnum);
		    if (count > 0) {
		        articleList = sqlMap.queryForList("studentAllScore", stnum);	// 뒷부분에 학번을 받아오는 것을 만들어야 함!!
		        getSemester = (Integer) sqlMap.queryForObject("getSemester", stnum);
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
	        request.setAttribute("list", articleList);
	        request.setAttribute("getSemester", getSemester);
			return "/stInfo/stAllScore.jsp";
		}	
}

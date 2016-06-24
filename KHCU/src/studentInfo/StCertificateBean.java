package studentInfo;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StCertificateBean {
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/stCertificateMain.khcu")
	public String stCertificateMain(HttpServletRequest request, HttpSession session){
		return "/stInfo/stCertificateMain.jsp";
	}
	@RequestMapping("/stCertificateForm.khcu")
	public String stCertificateForm(HttpServletRequest request, HttpSession session){
		return "/stInfo/stCertificateForm.jsp";
	}
	@RequestMapping("/stCertificateInCollegeKo.khcu")
	public String stCertificateInCollegeKo(HttpServletRequest request, HttpSession session, StudentDataBean dto){
		dto=(StudentDataBean)sqlMap.queryForObject("studentCard", session.getAttribute("memId"));
		request.setAttribute("dto", dto);
		SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy.MM.dd", Locale.KOREA );
		Date currentTime = new Date ( );
		String dTime = formatter.format ( currentTime );
		System.out.println ( dTime ); 
		request.setAttribute("dTime", dTime);
		return "/stInfo/stCertificateInCollegeKo.jsp";
	}
	@RequestMapping("/stCertificateGraduationKo.khcu")
	public String stCertificateGraduationKo(HttpServletRequest request, HttpSession session, StudentDataBean dto){
		dto=(StudentDataBean)sqlMap.queryForObject("studentCard", session.getAttribute("memId"));
		request.setAttribute("dto", dto);
		SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy.MM.dd", Locale.KOREA );
		Date currentTime = new Date ( );
		String dTime = formatter.format ( currentTime );
		System.out.println ( dTime ); 
		request.setAttribute("dTime", dTime);
		return "/stInfo/stCertificateGraduationKo.jsp";
	}
	@RequestMapping("/stCertificateAbsenceKo.khcu")
	public String stCertificateAbsenceKo(HttpServletRequest request, HttpSession session, StudentDataBean dto){
		dto=(StudentDataBean)sqlMap.queryForObject("studentCard", session.getAttribute("memId"));
		request.setAttribute("dto", dto);
		SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy.MM.dd", Locale.KOREA );
		Date currentTime = new Date ( );
		String dTime = formatter.format ( currentTime );
		System.out.println ( dTime ); 
		request.setAttribute("dTime", dTime);
		return "/stInfo/stCertificateAbsenceKo.jsp";
	}
	@RequestMapping("/stCertificateScoreKo.khcu")
	public String stCertificateScoreKo(HttpServletRequest request, HttpSession session, StudentDataBean dto,StudentScore ss)throws Exception{
		String studentnum = (String)session.getAttribute("memId");
		dto=(StudentDataBean)sqlMap.queryForObject("studentCard", studentnum);
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
        count = (Integer)sqlMap.queryForObject("getArticleCountStudentScore",studentnum);
	    if (count > 0) {
	        articleList = sqlMap.queryForList("studentAllScore", studentnum);	// 뒷부분에 학번을 받아오는 것을 만들어야 함!!
	        getSemester = (Integer) sqlMap.queryForObject("getSemester", studentnum);
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
		return "/stInfo/stCertificateScoreKo.jsp";
	}
	
}

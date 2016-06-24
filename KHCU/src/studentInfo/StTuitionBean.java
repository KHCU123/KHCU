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

import Classes.ClassDataBean;

@Controller
public class StTuitionBean {
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/stTuitionList.khcu")
	public String stTuitionList(HttpServletRequest request){
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
        	
        count = (Integer)sqlMap.queryForObject("getArticleCountStTuition",null);
        HashMap<String, Integer> hm = new HashMap<String, Integer>();
        hm.put("startRow", startRow);
        hm.put("endRow", endRow);
	    if (count > 0) {
	        articleList = sqlMap.queryForList("getArticlesStTuition", hm);
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
		return "/stInfo/stTuitionList.jsp";
	}
	@RequestMapping("/stTuitionInputForm.khcu")
	public String stTuitionInputForm(HttpServletRequest request){
		
		List colList = null;
		colList = sqlMap.queryForList("collegeCategory", null);
		
		String college="";
		if(request.getParameter("college")!=null){
			college=(String)request.getParameter("college");				
		}
		request.setAttribute("college", college);

		List majList = null;
		majList = sqlMap.queryForList("collegeCategory2", college);
		request.setAttribute("colList", colList);
		request.setAttribute("majList", majList); 
		return "/stInfo/stTuitionInputForm.jsp";
	}
	@RequestMapping("/stTuitionInputPro.khcu")
	public String stTuitionInputPro(HttpServletRequest request, StTuitionDataBean dto)throws Exception{
		sqlMap.insert("stTuitionInput", dto);
		
		return "/stInfo/stTuitionInputPro.jsp";
	}
	@RequestMapping("/stTuitionUpdateForm.khcu")
	public String stTuitionUpdateForm(HttpServletRequest request,StTuitionDataBean dto)throws Exception{
		int num = dto.getNum();
		dto=(StTuitionDataBean)sqlMap.queryForObject("StTuition", num);
		String pageNum = request.getParameter("pageNum");
		
		request.setAttribute("dto", dto);
		request.setAttribute("pagenum", new Integer(pageNum));
		return "/stInfo/stTuitionUpdateForm.jsp";
	}
	@RequestMapping("/stTuitionUpdatePro.khcu")
	public String stTuitionUpdatePro(HttpServletRequest request,StTuitionDataBean dto)throws Exception{
		
		sqlMap.update("stTuitionUpdate", dto);
		return "/stInfo/stTuitionUpdatePro.jsp";
	}
	@RequestMapping("/stTuitionDeleteForm.khcu")
	public String stTuitionDeleteForm(HttpServletRequest request,StTuitionDataBean dto){
		int num = dto.getNum();
		dto=(StTuitionDataBean)sqlMap.queryForObject("StTuition", num);
		String pageNum = request.getParameter("pageNum");
		
		request.setAttribute("dto", dto);
		request.setAttribute("pagenum", new Integer(pageNum));
		return "/stInfo/stTuitionDeleteForm.jsp";
	}
	@RequestMapping("/stTuitionDeletePro.khcu")
	public String stTuitionDeletePro(HttpServletRequest request,StTuitionDataBean dto){
		
		sqlMap.delete("stTuitionDelete", dto);
		return "/stInfo/stTuitionDeletePro.jsp";
	}
	@RequestMapping("/stTuition.khcu")
	public String stTuition(HttpServletRequest request, HttpSession session, StTuitionDataBean dto, StudentDataBean sto){
		sto=(StudentDataBean)sqlMap.queryForObject("studentCard", session.getAttribute("memId"));
		request.setAttribute("sto", sto);
		
		SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy.MM.dd", Locale.KOREA );
		Date currentTime = new Date ( );
		String dTime = formatter.format ( currentTime );
		System.out.println ( dTime ); 
		request.setAttribute("dTime", dTime);
		
		HashMap<String, String> hm = new HashMap<String, String>();
        hm.put("stcollege", sto.getStcollege());
        hm.put("stmajor", sto.getStmajor());
        System.out.println(sto.getStcollege());
		dto=(StTuitionDataBean)sqlMap.queryForObject("Tuition", hm);
		System.out.println(dto.getCollege());
		request.setAttribute("dto", dto);
		
		return "/stInfo/stTuition.jsp";
	}
}

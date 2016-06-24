package studentInfo;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StHuehakBean {
	@Autowired
	private SqlMapClientTemplate sqlMap;
	private Date day;
	
	@RequestMapping("/stHuhak.khcu")
	public String stHuhak(HttpServletRequest request, HttpSession session, StudentDataBean dto){
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
        List articleList = null;
        count = (Integer)sqlMap.queryForObject("getArticleCountStHuhak",stnum);
        if(count>0){
        	articleList = sqlMap.queryForList("stHuhak", stnum);
        }else{
        	articleList = Collections.EMPTY_LIST;
        }
        
        int check=0;      
        List articleList2 = null;
        check = (Integer)sqlMap.queryForObject("checkBokhak", stnum);
        System.out.println(check);
        if(check>0){
        	articleList2 = sqlMap.queryForList("stBokhak", stnum);
        }else{
        	articleList2 = Collections.EMPTY_LIST;
        }
        
        request.setAttribute("currentPage", new Integer(currentPage));
        request.setAttribute("startRow", new Integer(startRow));
        request.setAttribute("endRow", new Integer(endRow));
        request.setAttribute("count", new Integer(count));
        request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("number", new Integer(number));
        request.setAttribute("list", articleList);
        request.setAttribute("count", count);
        request.setAttribute("check", check);
        request.setAttribute("list2", articleList2);
		return "/stInfo/stHuhak.jsp";
	}
	
	@RequestMapping("/stHuhakPro.khcu")
	public String stHuhakPro(HttpServletRequest request, StHuehakDataBean dto){
		dto.setPermit("처리중");
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
        SimpleDateFormat sdf2 = new SimpleDateFormat("MM-dd");
		if(dto.getPeriod().equals("1year")){
			dto.setPeriod(new Integer(sdf.format(date))+1+"-"+sdf2.format(date));
		}else{
			dto.setPeriod(new Integer(sdf.format(date))+2+"-"+sdf2.format(date));
		}
		int check = (Integer) sqlMap.queryForObject("getArticleCountStHuhak", dto.getStudentnum());
		if(check==0){
		sqlMap.insert("insertHuhak",dto);
		}
		
		request.setAttribute("check", check);
		return "/stInfo/stHuhakPro.jsp";
	}
	
	@RequestMapping("/stBokhak.khcu")
	public String stBokhak(HttpServletRequest request,HttpSession session ,StBokhakDataBean dto){
		String stnum = (String) session.getAttribute("memId");
		int check=0;
		check = (Integer)sqlMap.queryForObject("checkBokhak", dto.getStudentnum());
		if(check==0){
			dto.setPermit("처리중");
			dto.setStudentnum(stnum);
			sqlMap.insert("insertBokhak", dto);
		}
		request.setAttribute("check", check);
		return "/stInfo/stBokhak.jsp";
	}

}
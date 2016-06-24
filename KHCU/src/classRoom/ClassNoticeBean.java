package classRoom;

import java.sql.Timestamp;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import classRoom.ClassNoticeDataBean;

@Controller
public class ClassNoticeBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/crNoticeList.khcu")
	public String CrNoticeList(HttpSession session, HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("UTF-8");
		String pageNum = request.getParameter("pageNum");
		String memId = (String) session.getAttribute("memId");
		String id = memId.substring(4,5);
		String classCode = request.getParameter("classcode");
		String classNotice = "classNotice"+classCode;
		String search = "";
		String searchCategory = "1";
		searchCategory = request.getParameter("searchCategory");
		search = request.getParameter("search");
		
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
        	
        count = (Integer)sqlMap.queryForObject("getArticleCountCrNotice",classNotice);
        HashMap<String, Object> hm = new HashMap<String, Object>();
        hm.put("startRow", Integer.toString(startRow));
        hm.put("endRow", Integer.toString(endRow));
        hm.put("classNotice", classNotice);
	    if (count > 0) {
	        articleList = sqlMap.queryForList("getArticlesCrNotice", hm);
	    } else {
	        articleList = Collections.EMPTY_LIST;
	    }
        number=count-(currentPage-1)*pageSize;
        
        if(search!=null && searchCategory!=null){
			if(searchCategory.equals("1")){	// 제목만 검색
				hm.put("title", search);
				count = (Integer)sqlMap.queryForObject("getCountCrNoticeTitle", hm);
				if(count>0){
					articleList = sqlMap.queryForList("getArticlesCrNoticeTitle",hm);
				}else{
					articleList = Collections.EMPTY_LIST;
				}
			}else if(searchCategory.equals("2")){
				hm.put("content", search);
				count = (Integer)sqlMap.queryForObject("getCountCrNoticeContent", hm);
				if(count>0){
					articleList = sqlMap.queryForList("getArticlesCrNoticeContent", hm);
				}else{
					articleList = Collections.EMPTY_LIST;
				}
			}else if(searchCategory.equals("3")){
				hm.put("content", search);
				hm.put("title", search);
				count = (Integer)sqlMap.queryForObject("getCountCrNoticeAll", hm);
				if(count>0){
					articleList = sqlMap.queryForList("getArticlesCrNoticeAll", hm);
				}else{
					articleList = Collections.EMPTY_LIST;
				}
			}
        }
		
        request.setAttribute("search", search);
        request.setAttribute("searchCategory", searchCategory);
        request.setAttribute("currentPage", new Integer(currentPage));
        request.setAttribute("startRow", new Integer(startRow));
        request.setAttribute("endRow", new Integer(endRow));
        request.setAttribute("count", new Integer(count));
        request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("number", new Integer(number));
        request.setAttribute("articleList", articleList);
        request.setAttribute("id", id);
        request.setAttribute("classcode", classCode);
        
		return "/ClassRoom/CrNotice/crNoticeList.jsp";
	}
	
	@RequestMapping("/crNoticeContent.khcu")
	public String crNoticeContent(HttpServletRequest request, ClassNoticeDataBean dto, HttpSession session){
		String classCode = request.getParameter("classcode");
		String classNotice = "classNotice"+classCode;
		String memId = (String) session.getAttribute("memId");
		String id = memId.substring(4,5);
		dto.setClassNotice(classNotice);
		int num = Integer.parseInt(request.getParameter("num"));
        String pageNum = request.getParameter("pageNum");
        dto.setNum(num);
        sqlMap.update("getArticleUpdateCrNotice", dto);
        dto = (ClassNoticeDataBean)sqlMap.queryForObject("getArticleSelectCrNotice", dto);
        request.setAttribute("num", new Integer(num));
        request.setAttribute("pageNum",  new Integer(pageNum));
        request.setAttribute("article", dto);
        request.setAttribute("classcode", classCode);
        request.setAttribute("id", id);
		return "/ClassRoom/CrNotice/crNoticeContent.jsp";
	}
	
	@RequestMapping("/crNoticeWriteForm.khcu")
	public String crNoticeWriteForm(HttpServletRequest request){
		String classCode = request.getParameter("classcode");
		String classNotice = "classNotice"+classCode;
		int num=0;  
        if(request.getParameter("num")!=null){
	         num=Integer.parseInt(request.getParameter("num"));
	      }
		request.setAttribute("num", new Integer(num));
		request.setAttribute("classcode", classCode);
		return "/ClassRoom/CrNotice/crNoticeWriteForm.jsp";
	}
	
	@RequestMapping("/crNoticeWritePro.khcu")
	public String crNoticeWritePro(HttpServletRequest request, ClassNoticeDataBean dto){
		String classCode = request.getParameter("classcode");
		String classNotice = "classNotice"+classCode;
		dto.setClassNotice(classNotice);
		dto.setReg_date(new Timestamp(System.currentTimeMillis()));
		String numCheck = (String)sqlMap.queryForObject("numCheckCrNotice", dto);
		int number = 0;
		
		if(numCheck == null){
			number=1;
		}
		else{
			number= Integer.parseInt(numCheck)+1;
		}
		
		sqlMap.insert("insertArticleCrNotice", dto);
		request.setAttribute("classcode", classCode);
		return "/ClassRoom/CrNotice/crNoticeWritePro.jsp";
	}
	
	@RequestMapping("/crNoticeModifyForm.khcu")
	public String crNoticeModifyForm(HttpServletRequest request, ClassNoticeDataBean dto){
		String classCode = request.getParameter("classcode");
		String classNotice = "classNotice"+classCode;
		dto.setClassNotice(classNotice);
		int num = Integer.parseInt(request.getParameter("num"));
        String pageNum = request.getParameter("pageNum");
        dto.setNum(num);
        dto = (ClassNoticeDataBean)sqlMap.queryForObject("updateGetArticleCrNotice", dto);
        
        request.setAttribute("pageNum",  new Integer(pageNum));
        request.setAttribute("article", dto);
        request.setAttribute("classcode", classCode);
		return "/ClassRoom/CrNotice/crNoticeModifyForm.jsp";
	}
	
	@RequestMapping("/crNoticeModifyPro.khcu")
	public String crNoticeModifyPro(HttpServletRequest request, ClassNoticeDataBean dto){
		String classCode = request.getParameter("classcode");
		String classNotice = "classNotice"+classCode;
		dto.setClassNotice(classNotice);
		int num = Integer.parseInt(request.getParameter("num"));
        String pageNum = request.getParameter("pageNum");
        dto.setNum(num);
        sqlMap.update("updateArticleCrNotice", dto);
        
        request.setAttribute("pageNum",  new Integer(pageNum));
        request.setAttribute("classcode", classCode);
		return "/ClassRoom/CrNotice/crNoticeModifyPro.jsp";
	}
	
	@RequestMapping("/crNoticeDeleteForm.khcu")
	public String crNoticeDeleteForm(HttpServletRequest request, ClassNoticeDataBean dto){
		String classCode = request.getParameter("classcode");
		String classNotice = "classNotice"+classCode;
		dto.setClassNotice(classNotice);
		int num = Integer.parseInt(request.getParameter("num"));
        String pageNum = request.getParameter("pageNum");

        request.setAttribute("num", new Integer(num));
        request.setAttribute("pageNum",  new Integer(pageNum));
        request.setAttribute("classcode", classCode);
		return "/ClassRoom/CrNotice/crNoticeDeleteForm.jsp";
	}
	
	@RequestMapping("/crNoticeDeletePro.khcu")
	public String crNoticeDeletePro(HttpServletRequest request, ClassNoticeDataBean dto){
		String classCode = request.getParameter("classcode");
		String classNotice = "classNotice"+classCode;
		dto.setClassNotice(classNotice);
		int num = Integer.parseInt(request.getParameter("num"));
        String pageNum = request.getParameter("pageNum");
        int check = 0;
        dto.setNum(num);
        sqlMap.delete("deleteArticleCrNotice", dto);
        request.setAttribute("pageNum",  new Integer(pageNum));
        request.setAttribute("check", (Integer)check);
        request.setAttribute("classcode", classCode);
        return "/ClassRoom/CrNotice/crNoticeDeletePro.jsp";
	}
}

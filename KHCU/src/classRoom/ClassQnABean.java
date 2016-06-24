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

@Controller
public class ClassQnABean {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/crQnAList.khcu")
	public String classQnAList(HttpSession session, HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("UTF-8");
		String pageNum = request.getParameter("pageNum");
		String memId = (String) session.getAttribute("memId");
		String id = memId.substring(4,5);
		String classCode = request.getParameter("classcode");
		String classQnA = "classQnA"+classCode;
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

        count = (Integer)sqlMap.queryForObject("getArticleCounterCrQnA",classQnA);
        HashMap<String, String> hm = new HashMap<String, String>();
        hm.put("startRow", Integer.toString(startRow));
        hm.put("endRow", Integer.toString(endRow));
        hm.put("classQnA", classQnA);
       
	    if (count > 0) {
	        articleList = sqlMap.queryForList("getArticleCrQnA", hm);
	    } else {
	        articleList = Collections.EMPTY_LIST;
	    }
        number=count-(currentPage-1)*pageSize;
        
        // 검색기능
        if(search!=null && searchCategory!=null){
			if(searchCategory.equals("1")){	// 제목만 검색
				hm.put("title", search);
				count = (Integer)sqlMap.queryForObject("getCountCrQnATitle", hm);
				if(count>0){
					articleList = sqlMap.queryForList("getArticlesCrQnATitle",hm);
				}else{
					articleList = Collections.EMPTY_LIST;
				}
			}else if(searchCategory.equals("2")){	// 제목 + 내용
				hm.put("content", search);
				count = (Integer)sqlMap.queryForObject("getCountCrQnAAll", hm);
				if(count>0){
					articleList = sqlMap.queryForList("getArticlesCrQnAAll", hm);
				}else{
					articleList = Collections.EMPTY_LIST;
				}
			}else if(searchCategory.equals("3")){	// 글쓴이
				hm.put("writer", search);
				count = (Integer)sqlMap.queryForObject("getCountCrQnAWriter", hm);
				if(count>0){
					articleList = sqlMap.queryForList("getArticlesCrQnAWriter", hm);
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
        
		return "/ClassRoom/CrQnA/crQnAList.jsp";
	}
	
	@RequestMapping("/crQnAWriteForm.khcu")
	public String classQnAWriteForm(HttpSession session, HttpServletRequest request){
		String classCode = request.getParameter("classcode");
		int num=0,ref=1,re_step=0,re_level=0;
			if(request.getParameter("num")!=null){
				num=Integer.parseInt(request.getParameter("num"));
				ref=Integer.parseInt(request.getParameter("ref"));
				re_step=Integer.parseInt(request.getParameter("re_step"));
				re_level=Integer.parseInt(request.getParameter("re_level"));
			}
		request.setAttribute("classcode", classCode);
		request.setAttribute("num", num);
		request.setAttribute("ref", ref);
		request.setAttribute("re_step", re_step);
		request.setAttribute("re_level", re_level);
		return "/ClassRoom/CrQnA/crQnAWriteForm.jsp";
	}
	
	@RequestMapping("/crQnAWritePro.khcu")
	public String classQnAWritePro(ClassQnADataBean dto, HttpSession session, HttpServletRequest request){
		int num= new Integer(request.getParameter("num"));
		int ref= Integer.parseInt(request.getParameter("ref"));
		int re_step=Integer.parseInt(request.getParameter("re_step"));
		int re_level=Integer.parseInt(request.getParameter("re_level"));
		int number=0;
		String classCode = request.getParameter("classcode");
		String classQnA = "classQnA" + classCode;
		
		
		String check = (String) sqlMap.queryForObject("numCheckCrQnA", classQnA);
		if(check!=null){
			number = new Integer(check) + 1;
		}else{
			number = 1;
		}
		if(num!=0){
			HashMap<String, String> hm = new HashMap<String, String>();
			hm.put("classQnA", classQnA);
			hm.put("class", Integer.toString(ref));
			hm.put("re_step", Integer.toString(re_step));
			sqlMap.update("updateRefCrQnA", hm);
			dto.setRe_step(re_step+1);
			dto.setRe_level(re_level+1);
		}else {
			dto.setRef(number);
			dto.setRe_step(0);
			dto.setRe_level(0);
		}
		dto.setWriter((String)session.getAttribute("memId"));
		dto.setReg_date(new Timestamp(System.currentTimeMillis()));
		dto.setClassQnA(classQnA);
		sqlMap.insert("insertArticleCrQnA", dto);
		request.setAttribute("classcode", classCode);
		return "/ClassRoom/CrQnA/crQnAWritePro.jsp";
	}
	
	@RequestMapping("/crQnAContent.khcu")
	public String crQnAContent(ClassQnADataBean dto, HttpSession session, HttpServletRequest request){
		String classCode = request.getParameter("classcode");
		String classQnA = "classQnA" + classCode;
		String memId = (String)session.getAttribute("memId");
		String id = memId.substring(4,5);
		int pageNum = new Integer(request.getParameter("pageNum"));
		dto.setClassQnA(classQnA);
		sqlMap.update("getArticleUpdateCrQnA", dto);
		dto = (ClassQnADataBean) sqlMap.queryForObject("getArticleSelectCrQnA", dto);
		request.setAttribute("article", dto);
		request.setAttribute("memId", memId);
		request.setAttribute("id", id);
		request.setAttribute("classcode", classCode);
		request.setAttribute("pageNum", pageNum);
		return "/ClassRoom/CrQnA/crQnAContent.jsp";
	}
	
	@RequestMapping("/crQnACheckPw.khcu")
	public String crQnACheckPw(HttpServletRequest request){
		String classCode = request.getParameter("classcode");
		int num = new Integer(request.getParameter("num"));
		int pageNum = new Integer(request.getParameter("pageNum")); 
		request.setAttribute("classcode", classCode);
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		return "/ClassRoom/CrQnA/crQnACheckPw.jsp"; 
	}
	
	@RequestMapping("/crQnACheckPwPro.khcu")
	public String crQnACheckPwPro(HttpServletRequest request, HttpSession session, ClassQnADataBean dto){
		String classCode = request.getParameter("classcode");
		String classQnA = "classQnA" + classCode;
		int num = new Integer(request.getParameter("num"));
		String passwd = request.getParameter("passwd");
		int pageNum = new Integer(request.getParameter("pageNum")); 
		dto.setNum(num);
		dto.setClassQnA(classQnA);
		String pw = (String) sqlMap.queryForObject("checkPwCrQnA", dto);
		int check = 0;
		if(pw.equals(passwd)){
			check = 1;
		}
		request.setAttribute("check", new Integer(check));
		request.setAttribute("classcode", classCode);
		request.setAttribute("num",num);
		request.setAttribute("pageNum", pageNum);
		return "/ClassRoom/CrQnA/crQnACheckPwPro.jsp";
	}
	
	@RequestMapping("crQnADeleteForm.khcu")
	public String crQnADeleteForm(HttpServletRequest request){
		String classCode = request.getParameter("classcode");
		int num = new Integer(request.getParameter("num"));
		int pageNum = new Integer(request.getParameter("pageNum")); 
		request.setAttribute("classcode", classCode);
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		return "/ClassRoom/CrQnA/crQnADeleteForm.jsp";
	}
	
	@RequestMapping("/crQnADeletePro.khcu")
	public String crQnADeletePro(HttpServletRequest request, HttpSession session, ClassQnADataBean dto){
		String classCode = request.getParameter("classcode");
		String classQnA = "classQnA" + classCode;
		int num = new Integer(request.getParameter("num"));
		String passwd = request.getParameter("passwd");
		int pageNum = new Integer(request.getParameter("pageNum")); 
		dto.setNum(num);
		dto.setClassQnA(classQnA);
		String pw = (String) sqlMap.queryForObject("checkPwCrQnA", dto);
		int check = 0;
		if(pw.equals(passwd)){
			check = 1;
			sqlMap.delete("deleteCrQnA", dto);
		}
		request.setAttribute("check", new Integer(check));
		request.setAttribute("classcode", classCode);
		request.setAttribute("num",num);
		request.setAttribute("pageNum", pageNum);
		return "/ClassRoom/CrQnA/crQnADeletePro.jsp";
	}
	
	@RequestMapping("/crQnAModifyForm.khcu")
	public String crQnAModifyForm(HttpServletRequest request, HttpSession session, ClassQnADataBean dto){
		String classCode = request.getParameter("classcode");
		String classQnA = "classQnA" + classCode;
		int num = new Integer(request.getParameter("num"));
		int pageNum = new Integer(request.getParameter("pageNum")); 		
		dto.setClassQnA(classQnA);
		dto.setNum(num);
		dto = (ClassQnADataBean) sqlMap.queryForObject("getArticleSelectCrQnA", dto);
		request.setAttribute("classcode", classCode);
		request.setAttribute("article", dto);
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		return "/ClassRoom/CrQnA/crQnAModifyForm.jsp";
	}
	
	@RequestMapping("/crQnAModifyPro.khcu")
	public String crQnAModifyPro(HttpServletRequest request, HttpSession session, ClassQnADataBean dto){
		String classCode = request.getParameter("classcode");
		String classQnA = "classQnA" + classCode;
		int pageNum = new Integer(request.getParameter("pageNum")); 
		String passwd = request.getParameter("passwd");
		dto.setClassQnA(classQnA);
		dto.setPasswd(passwd);
		String pw = (String) sqlMap.queryForObject("checkPwCrQnA", dto);
		int check = 0;
		if(pw.equals(passwd)){
			check = 1;
			sqlMap.update("updateArticleCrQnA", dto);
		}
		request.setAttribute("classcode", classCode);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("check", check);
		return "/ClassRoom/CrQnA/crQnAModifyPro.jsp";
	}
}

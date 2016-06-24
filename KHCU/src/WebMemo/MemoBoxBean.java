package WebMemo;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import Community.ComNotice.ComNoticeDataBean;

@Controller
public class MemoBoxBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/memoBox.khcu")
	public String memoBox(HttpServletRequest request){
		String pageNum = request.getParameter("pageNum");
		 HttpSession session = request.getSession();
		String addressee = (String)session.getAttribute("memId");
		

      if (pageNum == null) {
          pageNum = "1";
      }
      int pageSize = 10;	
      int currentPage = Integer.parseInt(pageNum);
      int startRow = (currentPage - 1) * pageSize + 1;
      int endRow = currentPage * pageSize;
      int count = 0;
      int number=0;

      List articleList1 = null;  // 쪽지 리스트
      //List articleList2 = null;  
      
      HashMap<String, Object> hm = new HashMap<String, Object>(); 
      hm.put("addressee", addressee);
     	
      count = (Integer)sqlMap.queryForObject("getMyMemoCount",hm);  //나한테 온 쪽지 전체 목록

      HashMap<String, Object> hm1 = new HashMap<String, Object>(); //쪽지 리스트
      hm1.put("startRow", startRow);
      hm1.put("endRow", endRow);
      hm1.put("addressee", addressee);
      
     // HashMap<String, Object> hm2 = new HashMap<String, Object>(); //쪽지시험 리스트
     // hm2.put("startRow", startRow);
     // hm2.put("endRow", endRow);
     // hm2.put("addressee", addressee);
     // hm2.put("memoType", "exam");
      
	    if (count > 0) {
	        articleList1 = sqlMap.queryForList("getArticleMyMemo", hm1);
	        //articleList2 = sqlMap.queryForList("getArticleMyMemo", hm2);
	    } else {
	        articleList1 = Collections.EMPTY_LIST;
	        //articleList2 = Collections.EMPTY_LIST;
	    }
      number=count-(currentPage-1)*pageSize;
      		
      request.setAttribute("currentPage", new Integer(currentPage));
      request.setAttribute("startRow", new Integer(startRow));
      request.setAttribute("endRow", new Integer(endRow));
      request.setAttribute("count", new Integer(count));
      request.setAttribute("pageSize", new Integer(pageSize));
	   request.setAttribute("number", new Integer(number));
      request.setAttribute("articleList1", articleList1);
      //request.setAttribute("articleList2", articleList2);     

		return "/webMemo/memoBox.jsp";
	}
	
	@RequestMapping("/memoContent.khcu")
	public String memoContent(HttpServletRequest request,MemoDataBean dto){
		int num = Integer.parseInt(request.getParameter("num"));
        dto.setNum(num);
        sqlMap.update("memoReadCountUpdate", dto);
        dto = (MemoDataBean)sqlMap.queryForObject("getMemoContent", dto);
        request.setAttribute("num", new Integer(num));
        request.setAttribute("article", dto);
		return "/webMemo/memoContent.jsp";
	}

}

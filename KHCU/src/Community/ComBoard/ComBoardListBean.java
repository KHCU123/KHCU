package Community.ComBoard;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ComBoardListBean {
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/comBoardList.khcu")
	public String comBoardList(HttpServletRequest request){
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
        	
        count = (Integer)sqlMap.queryForObject("getArticleCountComBoard",null);
        HashMap<String, Integer> hm = new HashMap<String, Integer>();
        hm.put("startRow", startRow);
        hm.put("endRow", endRow);
	    if (count > 0) {
	        articleList = sqlMap.queryForList("getArticlesComBoard", hm);
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
        
		return "/ComBoard/comBoardList.jsp";
	}
}

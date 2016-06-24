package AttendBook;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AttendBookListBean {
	
	@Autowired
	   private SqlMapClientTemplate sqlMap; 
	
	
	@RequestMapping("/attendBookForm.khcu")
	public String attendBookForm(HttpServletRequest request){
		String pageNum = request.getParameter("pageNum");
		String classCode = request.getParameter("classCode");
		String attendBookName = "attendBookName" + classCode;
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
        	
        count = (Integer)sqlMap.queryForObject("getArticleAttendBookCount",attendBookName);

        HashMap<String, Object> hm = new HashMap<String, Object>();
        hm.put("startRow", startRow);
        hm.put("endRow", endRow);
        hm.put("attendBookName", attendBookName);
	    if (count > 0) {
	        articleList = sqlMap.queryForList("getArticleAttendBook", hm);
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
        request.setAttribute("classCode", classCode);
		return "/professorMenu/attendBookForm.jsp";	
	}
	
	
	@RequestMapping("/attendBookUpdatePro.khcu")
	public String attendBookUpdatePro(HttpServletRequest request, AttendBookDataBean abDTO){
		 
		//무조건 넘어오는값
		String classCode = request.getParameter("classCode");
		String attendBookName = "attendBook"+classCode;
		String stNum = request.getParameter("stNum");		
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("attendBookName", attendBookName);
		hm.put("stNum", stNum);		
		
		//넘어올수도 아닐수도있는 값(주별 출석체크)
		String week = "";
		for(int i = 1; i<17; i++){
			week = "w"+i;
			String ww = request.getParameter(week);
			if(ww.equals("o")){
				hm.put("week", week);
				hm.put("weekAttend", ww);
				sqlMap.update("updateWeekAttend",hm);	
				System.out.println("출석부업뎃완료");
			}
		}
		
		//넘어올수도 아닐수도있는 값(시험 점수)		
		int midEx = Integer.parseInt(request.getParameter("midEx"));
		if(midEx != 0){
			hm.put("midEx", midEx);
			sqlMap.update("updateMidEx",hm);			
		}
		int finalEx = Integer.parseInt(request.getParameter("finalEx"));
		if(finalEx != 0){
			hm.put("finalEx", finalEx);
			sqlMap.update("updateFinalEx",hm);			
		}
		int hw = Integer.parseInt(request.getParameter("hw"));
		if(hw != 0){
			hm.put("hw", hw);
			sqlMap.update("updateHw",hm);			
		}
		int quiz = Integer.parseInt(request.getParameter("quiz"));
		if(quiz != 0){
			hm.put("quiz", quiz);
			sqlMap.update("updateQuiz",hm);			
		}
		int score = Integer.parseInt(request.getParameter("score"));
		if(score != 0){
			hm.put("score", score);
			sqlMap.update("updateScore",hm);			
		}		
		
		request.setAttribute("classCode", classCode);
		return "/professorMenu/attendBookUpdatePro.jsp";	
	}
	


}

package Classes;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ClassListBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/classList.khcu")
	public String classList(HttpServletRequest request){
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
        	
        count = (Integer)sqlMap.queryForObject("getArticleClassesCount",null);

        HashMap<String, Integer> hm = new HashMap<String, Integer>();
        hm.put("startRow", startRow);
        hm.put("endRow", endRow);
	    if (count > 0) {
	        articleList = sqlMap.queryForList("getArticleClasses", hm);
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
        
		return "/Classes/classList.jsp";
	}
	
	@RequestMapping("/classStateUpdatePro.khcu")
	public String classStateUpdatePro(HttpServletRequest request, ClassDataBean dto){

		String state = request.getParameter("state");
		String classCode = request.getParameter("classCode");	

		 dto.setState(state);
		 dto.setClassCode(classCode);
		 sqlMap.update("updateClassState", dto);
		 String classTime = request.getParameter("classTime");	
		 String attendBookName ="attendBook"+ classCode;
		 String classRoom = "classRoom" + classCode;
		 String classListenRoom = "classListenRoom" + classCode;
		 String classHomework = "classHomework" + classCode;
		 String classSubmitHomework = "classSubmitHw" + classCode;
		 String classQnA = "classQnA"+classCode;
		 
		 // 강의실 생성
		 sqlMap.insert("makeClassRoom", classRoom);				// 강의실
		 String classtype = (String) sqlMap.queryForObject("getClassTimeMake", classCode);
		 if(classtype.equals(2)){
			 sqlMap.insert("makeClassListenRoom", classListenRoom);	// 한번더 조건문: 녹화강의 일때
		 }
		 sqlMap.insert("makeClassHomework", classHomework);		// 과제
		 sqlMap.insert("makeClassHomeworkSEQ", classHomework);
		 sqlMap.insert("makeClassHomeworkSubmit", classSubmitHomework);		// 과제 제출
		 sqlMap.insert("makeClassQnA", classQnA);	//질문 답변
		 sqlMap.insert("makeClassQnASEQ", classQnA);
		return "/Classes/classStateUpdatePro.jsp";	
	}
}
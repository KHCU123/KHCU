package WebMemo;

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
public class MemoBean {
	
	@Autowired
	   private SqlMapClientTemplate sqlMap; 
	
	@RequestMapping("/memoForm.khcu")
	public String memoForm(HttpServletRequest request){
		String sender = request.getParameter("sender");
		String addressee = request.getParameter("addressee");	
		
		if (addressee != null){
			request.setAttribute("addressee",addressee);	
		}
		String ref = request.getParameter("ref");
		if (ref != null){
			request.setAttribute("ref",Integer.parseInt(ref));				
		} else{
			request.setAttribute("ref",0);
		}
		request.setAttribute("sender", sender);	
		
		return "/webMemo/memoForm.jsp";
	}
	
	@RequestMapping("/memoPro.khcu")
	public String memoPro(HttpServletRequest request){
		String sender = request.getParameter("sender");
		String addressee = request.getParameter("addressee");
		String message = request.getParameter("message");
		String memoType = request.getParameter("memoType");
		int num = 0;
		String numCheck = (String)sqlMap.queryForObject("numCheckMemo", null);		
		if(numCheck == null){
			num=1;
		}
		else{
			num= Integer.parseInt(numCheck)+1;
		}		
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
	     hm.put("sender", sender);
	     hm.put("addressee", addressee);
	     hm.put("message", message);
	     hm.put("memoType", memoType);
	     hm.put("num", num);	    
		
		int ref = Integer.parseInt(request.getParameter("ref"));
		if(ref == 0){
			 hm.put("ref", num);
		} else{
			hm.put("ref", ref);
		}
	     
	     sqlMap.insert("insertMemo", hm);		
		return "/webMemo/memoPro.jsp";
	}
	
	
	@RequestMapping("/newMemo.khcu")
	public String newMemo(HttpServletRequest request){		
		String sender = request.getParameter("sender");
		request.setAttribute("sender", sender);		
		return "/webMemo/newMemo.jsp";
	}
	
	@RequestMapping("/index.khcu")
	public String index(HttpServletRequest request){

		 HttpSession session = request.getSession();
		 String addressee = (String)session.getAttribute("memId");

		 int newMemoCheck;
		 List articleList = null;
		 
		 HashMap<String,Object> hm = new HashMap<String, Object>();
	     hm.put("addressee", addressee);
	     hm.put("memoType", "exam");
		 												
	     newMemoCheck = (Integer)sqlMap.queryForObject("newMemoSearchCount",hm);
	     request.setAttribute("newMemoCheck",new Integer(newMemoCheck));    
	     
	     if(newMemoCheck !=  0){	     
	    	 articleList = sqlMap.queryForList("newMemoSearch", hm);
	    	 request.setAttribute("articleList", articleList);		    	 
	     }
	    
		return "/webMemo/index.jsp";
	}
	
	@RequestMapping("/a.khcu")
	public String a(HttpServletRequest request){
		String pageNum = request.getParameter("pageNum");
		 HttpSession session = request.getSession();
		String addressee = (String)session.getAttribute("memId");
		String mt = request.getParameter("mt");

       if (pageNum == null) {
           pageNum = "1";
       }
       int pageSize = 10;	
       int currentPage = Integer.parseInt(pageNum);
       int startRow = (currentPage - 1) * pageSize + 1;
       int endRow = currentPage * pageSize;
       int count = 0;
       int number=0;

       List articleList1 = null;       
       HashMap<String, Object> hm = new HashMap<String, Object>(); 
       hm.put("addressee", addressee);
      	
       count = (Integer)sqlMap.queryForObject("getMyMemoCount",hm);  //나한테 온 쪽지 전체 목록

       HashMap<String, Object> hm1 = new HashMap<String, Object>(); //쪽지 리스트
       hm1.put("startRow", startRow);
       hm1.put("endRow", endRow);
       hm1.put("addressee", addressee);
       
	    if (count > 0) {
	        articleList1 = sqlMap.queryForList("getArticleMyMemo", hm1);
	    } else {
	        articleList1 = Collections.EMPTY_LIST;
	    }
       number=count-(currentPage-1)*pageSize;
       		
       request.setAttribute("currentPage", new Integer(currentPage));
       request.setAttribute("startRow", new Integer(startRow));
       request.setAttribute("endRow", new Integer(endRow));
       request.setAttribute("count", new Integer(count));
       request.setAttribute("pageSize", new Integer(pageSize));
	   request.setAttribute("number", new Integer(number));
       request.setAttribute("articleList1", articleList1);
       request.setAttribute("mt", mt);


		return "/webMemo/a.jsp";
	}
	
	@RequestMapping("/memoExamAnswerForm.khcu")
	public String memoExamAnswerForm(HttpServletRequest request){
		System.out.println("memoExamAnswerForm.khcu입니다");
		String sender = request.getParameter("sender");
		String addressee = request.getParameter("addressee");
		String question = request.getParameter("question");
		
		if (addressee != null){
			request.setAttribute("addressee",addressee);	
		}
		String ref = request.getParameter("ref");
		if (ref != null){
			request.setAttribute("ref",Integer.parseInt(ref));	
			
		} else{
			request.setAttribute("ref",0);
			
		}
		request.setAttribute("sender", sender);	
		request.setAttribute("question",question);
		return "/webMemo/memoExamAnswerForm.jsp";
	}
	
	@RequestMapping("/memoExamAnswerPro.khcu")
	public String memoExamAnswerPro(HttpServletRequest request){
		System.out.println("memoExamAnswerPro.khcu입니다");
		String sender = request.getParameter("sender");
		String addressee = request.getParameter("addressee");
		String message = request.getParameter("message");

		if(message == null){			
			message = "nothing";
		}
		System.out.println(message);
		String memoType = request.getParameter("memoType");
		int num = 0;
		String numCheck = (String)sqlMap.queryForObject("numCheckMemo", null);		
		if(numCheck == null){
			num=1;
		}
		else{
			num= Integer.parseInt(numCheck)+1;
		}		
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
	     hm.put("sender", sender);
	     hm.put("addressee", addressee);
	     hm.put("message", message);
	     hm.put("memoType", memoType);
	     hm.put("num", num);	    
		
		int ref = Integer.parseInt(request.getParameter("ref"));
		if(ref == 0){
			 hm.put("ref", num);
		} else{
			hm.put("ref", ref);
		} 
	     
	     sqlMap.insert("insertMemo", hm);		
		return "/webMemo/memoExamAnswerPro.jsp";
	}

}
   
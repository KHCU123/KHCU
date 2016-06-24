package StudyRoom;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class StudyRoomBean {
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/createStudyRoom.khcu")
	public String createStudyRoom(HttpServletRequest request){
		int num=0;  
        if(request.getParameter("num")!=null){
	         num=Integer.parseInt(request.getParameter("num"));
	      }
		request.setAttribute("num", new Integer(num));
		return "/StudyRoom/createStudyRoom.jsp";
	}
	
	@RequestMapping("/createStudyRoomPro.khcu")
	public String createStudyRoomPro(HttpServletRequest request, StudyRoomDataBean dto){
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		dto.setCreater(id);
		dto.setReg_date(new Timestamp(System.currentTimeMillis()));
		
		String numCheck = (String)sqlMap.queryForObject("numCheckStudyRoom", null);
		System.out.println(numCheck);
		int number = 0;
		
		if(numCheck == null){
			number=1;
		}
		else{
			number= Integer.parseInt(numCheck)+1;
		}
		
		sqlMap.insert("insertArticleStudyRoom", dto);
		
		request.setAttribute("num", new Integer(number));
		return "/StudyRoom/createStudyRoomPro.jsp";
	}
	
	@RequestMapping("/passwdCheck.khcu")
	public String passwdCheck(HttpServletRequest request){
		String num = request.getParameter("num");
		request.setAttribute("num", num);
		return "/StudyRoom/passwdCheck.jsp";
	}
	
	@RequestMapping("/passwdCheckPro.khcu")
	public String passwdCheckPro(HttpServletRequest request){
		int num = Integer.parseInt(request.getParameter("num"));
		String passwd = request.getParameter("passwd");
		
		String dbpasswd = (String)sqlMap.queryForObject("passwdCheckStudyRoom", num);
		int check = 0;
		if(passwd.equals(dbpasswd)){
			check = 1;
		}
		request.setAttribute("num", new Integer(num));
		request.setAttribute("check", new Integer(check));
		return "/StudyRoom/passwdCheckPro.jsp";
	}
	
	@RequestMapping("/studyRoomEnter.khcu")
	public String studyRoomEnter(HttpServletRequest request, StudyRoomDataBean dto){
		int num = Integer.parseInt(request.getParameter("num"));
        dto.setNum(num);
        
        dto = (StudyRoomDataBean)sqlMap.queryForObject("getArticleSelectStudyRoom", dto);
        
        request.setAttribute("num", new Integer(num));
        request.setAttribute("article", dto);
		return "/StudyRoom/studyRoomEnter.jsp";
	}
}

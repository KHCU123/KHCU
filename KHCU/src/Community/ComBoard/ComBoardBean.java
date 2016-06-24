package Community.ComBoard;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ComBoardBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/comBoardContent.khcu")
	public String comBoardContent(HttpServletRequest request, ComBoardDataBean dto){
		int num = Integer.parseInt(request.getParameter("num"));
        String pageNum = request.getParameter("pageNum");
        dto.setNum(num);
        sqlMap.update("getArticleUpdateComBoard", dto);
        dto = (ComBoardDataBean)sqlMap.queryForObject("getArticleSelectComBoard", dto);
        request.setAttribute("num", new Integer(num));
        request.setAttribute("pageNum",  new Integer(pageNum));
        request.setAttribute("article", dto);
		return "/ComBoard/comBoardContent.jsp";
	}
	
	@RequestMapping("/comBoardWriteForm.khcu")
	public String comBoardWriteForm(HttpServletRequest request){
		int num=0;  
        if(request.getParameter("num")!=null){
	         num=Integer.parseInt(request.getParameter("num"));
	      }
		request.setAttribute("num", new Integer(num));
		return "/ComBoard/comBoardWriteForm.jsp";
	}
	
	@RequestMapping("/comBoardWritePro.khcu")
	public String comBoardWritePro(HttpServletRequest request, ComBoardDataBean dto){
		dto.setReg_date(new Timestamp(System.currentTimeMillis()));
		String numCheck = (String)sqlMap.queryForObject("numCheckComBoard", null);
		int number = 0;
		
		if(numCheck == null){
			number=1;
		}
		else{
			number= Integer.parseInt(numCheck)+1;
		}
		
		sqlMap.insert("insertArticleComBoard", dto);
		return "/ComBoard/comBoardWritePro.jsp";
	}
	
	@RequestMapping("/comBoardModifyForm.khcu")
	public String comBoardModifyForm(HttpServletRequest request, ComBoardDataBean dto){
		int num = Integer.parseInt(request.getParameter("num"));
        String pageNum = request.getParameter("pageNum");
        dto.setNum(num);
        dto = (ComBoardDataBean)sqlMap.queryForObject("updateGetArticleComBoard", dto);
        
        request.setAttribute("pageNum",  new Integer(pageNum));
        request.setAttribute("article", dto);
		return "/ComBoard/comBoardModifyForm.jsp";
	}
	
	@RequestMapping("/comBoardModifyPro.khcu")
	public String comBoardModifyPro(HttpServletRequest request, ComBoardDataBean dto){
		int num = Integer.parseInt(request.getParameter("num"));
        String pageNum = request.getParameter("pageNum");
        dto.setNum(num);
        sqlMap.update("updateArticleComBoard", dto);
        
        request.setAttribute("pageNum",  new Integer(pageNum));
		return "/ComBoard/comBoardModifyPro.jsp";
	}
	
	@RequestMapping("/comBoardDeleteForm.khcu")
	public String comBoardDeleteForm(HttpServletRequest request, ComBoardDataBean dto){
		int num = Integer.parseInt(request.getParameter("num"));
        String pageNum = request.getParameter("pageNum");

        request.setAttribute("num", new Integer(num));
        request.setAttribute("pageNum",  new Integer(pageNum));
		return "/ComBoard/comBoardDeleteForm.jsp";
	}
	
	@RequestMapping("/comBoardDeletePro.khcu")
	public String comBoardDeletePro(HttpServletRequest request, ComBoardDataBean dto){
		int num = Integer.parseInt(request.getParameter("num"));
        String pageNum = request.getParameter("pageNum");
        int check = 0;
        dto.setNum(num);
        sqlMap.delete("deleteArticleComBoard", dto);
        request.setAttribute("pageNum",  new Integer(pageNum));
        request.setAttribute("check", (Integer)check);
        return "/ComBoard/comBoardDeletePro.jsp";
	}
}
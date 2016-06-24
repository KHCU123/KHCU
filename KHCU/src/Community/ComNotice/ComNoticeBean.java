package Community.ComNotice;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ComNoticeBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/comNoticeContent.khcu")
	public String comNoticeContent(HttpServletRequest request, ComNoticeDataBean dto){
		int num = Integer.parseInt(request.getParameter("num"));
        String pageNum = request.getParameter("pageNum");
        dto.setNum(num);
        sqlMap.update("getArticleUpdateComNotice", dto);
        dto = (ComNoticeDataBean)sqlMap.queryForObject("getArticleSelectComNotice", dto);
        request.setAttribute("num", new Integer(num));
        request.setAttribute("pageNum",  new Integer(pageNum));
        request.setAttribute("article", dto);
		return "/ComNotice/comNoticeContent.jsp";
	}
	
	@RequestMapping("/comNoticeWriteForm.khcu")
	public String comNoticeWriteForm(HttpServletRequest request){
		int num=0;  
        if(request.getParameter("num")!=null){
	         num=Integer.parseInt(request.getParameter("num"));
	      }
		request.setAttribute("num", new Integer(num));
		return "/ComNotice/comNoticeWriteForm.jsp";
	}
	
	@RequestMapping("/comNoticeWritePro.khcu")
	public String comNoticeWritePro(HttpServletRequest request, ComNoticeDataBean dto){
		dto.setReg_date(new Timestamp(System.currentTimeMillis()));
		String numCheck = (String)sqlMap.queryForObject("numCheckComNotice", null);
		int number = 0;
		
		if(numCheck == null){
			number=1;
		}
		else{
			number= Integer.parseInt(numCheck)+1;
		}
		
		sqlMap.insert("insertArticleComNotice", dto);
		return "/ComNotice/comNoticeWritePro.jsp";
	}
	
	@RequestMapping("/comNoticeModifyForm.khcu")
	public String comNoticeModifyForm(HttpServletRequest request, ComNoticeDataBean dto){
		int num = Integer.parseInt(request.getParameter("num"));
        String pageNum = request.getParameter("pageNum");
        dto.setNum(num);
        dto = (ComNoticeDataBean)sqlMap.queryForObject("updateGetArticleComNotice", dto);
        
        request.setAttribute("pageNum",  new Integer(pageNum));
        request.setAttribute("article", dto);
		return "/ComNotice/comNoticeModifyForm.jsp";
	}
	
	@RequestMapping("/comNoticeModifyPro.khcu")
	public String comNoticeModifyPro(HttpServletRequest request, ComNoticeDataBean dto){
		int num = Integer.parseInt(request.getParameter("num"));
        String pageNum = request.getParameter("pageNum");
        dto.setNum(num);
        sqlMap.update("updateArticleComNotice", dto);
        
        request.setAttribute("pageNum",  new Integer(pageNum));
		return "/ComNotice/comNoticeModifyPro.jsp";
	}
	
	@RequestMapping("/comNoticeDeleteForm.khcu")
	public String comNoticeDeleteForm(HttpServletRequest request, ComNoticeDataBean dto){
		int num = Integer.parseInt(request.getParameter("num"));
        String pageNum = request.getParameter("pageNum");

        request.setAttribute("num", new Integer(num));
        request.setAttribute("pageNum",  new Integer(pageNum));
		return "/ComNotice/comNoticeDeleteForm.jsp";
	}
	
	@RequestMapping("/comNoticeDeletePro.khcu")
	public String comNoticeDeletePro(HttpServletRequest request, ComNoticeDataBean dto){
		int num = Integer.parseInt(request.getParameter("num"));
        String pageNum = request.getParameter("pageNum");
        int check = 0;
        dto.setNum(num);
        sqlMap.delete("deleteArticleComNotice", dto);
        request.setAttribute("pageNum",  new Integer(pageNum));
        request.setAttribute("check", (Integer)check);
        return "/ComNotice/comNoticeDeletePro.jsp";
	}
}
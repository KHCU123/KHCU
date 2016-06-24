package Community.ComJob;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import Community.ComJob.ComJobDataBean;

@Controller
public class ComJobBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/comJobContent.khcu")
	public String comJobContent(HttpServletRequest request, ComJobDataBean dto){
		int num = Integer.parseInt(request.getParameter("num"));
        String pageNum = request.getParameter("pageNum");
        dto.setNum(num);
        sqlMap.update("getArticleUpdateComJob", dto);
        dto = (ComJobDataBean)sqlMap.queryForObject("getArticleSelectComJob", dto);
        request.setAttribute("num", new Integer(num));
        request.setAttribute("pageNum",  new Integer(pageNum));
        request.setAttribute("article", dto);
		return "/ComJob/comJobContent.jsp";
	}
	
	@RequestMapping("/comJobWriteForm.khcu")
	public String comJobWriteForm(HttpServletRequest request){
		int num=0;  
        if(request.getParameter("num")!=null){
	         num=Integer.parseInt(request.getParameter("num"));
	      }
		request.setAttribute("num", new Integer(num));
		return "/ComJob/comJobWriteForm.jsp";
	}
	
	@RequestMapping("/comJobWritePro.khcu")
	public String comJobWritePro(HttpServletRequest request, ComJobDataBean dto){
		dto.setReg_date(new Timestamp(System.currentTimeMillis()));
		String numCheck = (String)sqlMap.queryForObject("numCheckComJob", null);
		int number = 0;
		
		if(numCheck == null){
			number=1;
		}
		else{
			number= Integer.parseInt(numCheck)+1;
		}
		
		sqlMap.insert("insertArticleComJob", dto);
		return "/ComJob/comJobWritePro.jsp";
	}
	
	@RequestMapping("/comJobModifyForm.khcu")
	public String comJobModifyForm(HttpServletRequest request, ComJobDataBean dto){
		int num = Integer.parseInt(request.getParameter("num"));
        String pageNum = request.getParameter("pageNum");
        dto.setNum(num);
        dto = (ComJobDataBean)sqlMap.queryForObject("updateGetArticleComJob", dto);
        
        request.setAttribute("pageNum",  new Integer(pageNum));
        request.setAttribute("article", dto);
		return "/ComJob/comJobModifyForm.jsp";
	}
	
	@RequestMapping("/comJobModifyPro.khcu")
	public String comJobModifyPro(HttpServletRequest request, ComJobDataBean dto){
		int num = Integer.parseInt(request.getParameter("num"));
        String pageNum = request.getParameter("pageNum");
        dto.setNum(num);
        sqlMap.update("updateArticleComJob", dto);
        
        request.setAttribute("pageNum",  new Integer(pageNum));
		return "/ComJob/comJobModifyPro.jsp";
	}
	
	@RequestMapping("/comJobDeleteForm.khcu")
	public String comJobDeleteForm(HttpServletRequest request, ComJobDataBean dto){
		int num = Integer.parseInt(request.getParameter("num"));
        String pageNum = request.getParameter("pageNum");

        request.setAttribute("num", new Integer(num));
        request.setAttribute("pageNum",  new Integer(pageNum));
		return "/ComJob/comJobDeleteForm.jsp";
	}
	
	@RequestMapping("/comJobDeletePro.khcu")
	public String comJobDeletePro(HttpServletRequest request, ComJobDataBean dto){
		int num = Integer.parseInt(request.getParameter("num"));
        String pageNum = request.getParameter("pageNum");
        int check = 0;
        dto.setNum(num);
        sqlMap.delete("deleteArticleComJob", dto);
        request.setAttribute("pageNum",  new Integer(pageNum));
        request.setAttribute("check", (Integer)check);
        return "/ComJob/comJobDeletePro.jsp";
	}
}

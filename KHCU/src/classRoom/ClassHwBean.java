package classRoom;

import java.io.File;
import java.sql.Timestamp;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import classRoom.ClassHwDataBean;

@Controller
public class ClassHwBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/crHwList.khcu")
	public String crHwList(HttpSession session, HttpServletRequest request){
		String memId = (String) session.getAttribute("memId");
		String id = memId.substring(4, 5);
		String pageNum = request.getParameter("pageNum");
		String join = (String)session.getAttribute("joinUser");
		System.out.println(join);
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
        
        String classCode = request.getParameter("classcode");
        String classHomework = "classHomework" + classCode;
       
        count = (Integer)sqlMap.queryForObject("getArticleCounterHomeWork",classHomework);
        HashMap<String, String> hm = new HashMap<String, String>();
        hm.put("startRow", Integer.toString(startRow));
        hm.put("endRow", Integer.toString(endRow));
        hm.put("classHomework",classHomework);
	    if (count > 0) {
	        articleList = sqlMap.queryForList("getArticlesHomeWork", hm);
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
        request.setAttribute("classcode", classCode);
        request.setAttribute("id", id);
        
		return "/ClassRoom/CrHw/crHwList.jsp";
	}
	
	
	
	// 여기부터 고치면 돼
	@RequestMapping("/crHwContent.khcu")
	public String crHwContent(HttpSession session, HttpServletRequest request, ClassHwDataBean dto){
		String memId = (String) session.getAttribute("memId");
		String id = memId.substring(4, 5);
		int num = Integer.parseInt(request.getParameter("num"));
        String pageNum = request.getParameter("pageNum");
        String classCode = request.getParameter("classcode");
        String classHomework = "classHomework" + classCode;
        dto.setClassHomework(classHomework);
        dto.setNum(num);
        sqlMap.update("getArticleUpdateHomework", dto);
        dto = (ClassHwDataBean)sqlMap.queryForObject("getArticleSelectHomeWork", dto);
        request.setAttribute("num", new Integer(num));
        request.setAttribute("pageNum",  new Integer(pageNum));
        request.setAttribute("article", dto);
        request.setAttribute("classcode",classCode);
        request.setAttribute("id", id);
		return "/ClassRoom/CrHw/crHwContent.jsp";
	}
	
	
	
	@RequestMapping("/crHwContentDown.khcu")
	public ModelAndView crHwContentDown(String reference_name) throws Exception{
		File down = new File("C://Users//user2//workspace//.metadata//.plugins//org.eclipse.wst.server.core//tmp0//wtpwebapps//KHCU//ClassRoom//CrHw//referenceFile//"+reference_name);
		ModelAndView mv = new ModelAndView("download","downloadFile",down);
		return mv;
	}
	
	@RequestMapping("/crHwWriteForm.khcu")
	public String crHomeWorkWriteForm(HttpServletRequest request){
		String classcode =request.getParameter("classcode");
		int num=0;  
        if(request.getParameter("num")!=null){
	         num=Integer.parseInt(request.getParameter("num"));
	      }
		request.setAttribute("num", new Integer(num));
		request.setAttribute("classcode", classcode);
		return "/ClassRoom/CrHw/crHwWriteForm.jsp";
	}
	
	@RequestMapping("/crHwWritePro.khcu")
	public String crHomeWorkWritePro(MultipartHttpServletRequest request, ClassHwDataBean dto) throws Exception{
        String classCode = request.getParameter("classcode");
        String classHomework = "classHomework" + classCode;
		MultipartFile file = request.getFile("reference");
		String orgName = file.getOriginalFilename();
		String path = "C://Users//user2//workspace//.metadata//.plugins//org.eclipse.wst.server.core//tmp0//wtpwebapps//KHCU//ClassRoom//CrHw//referenceFile//";
		File copy = new File("C://Users//user2//workspace//.metadata//.plugins//org.eclipse.wst.server.core//tmp0//wtpwebapps//KHCU//ClassRoom//CrHw//referenceFile//"+orgName);			/// 복사본
		file.transferTo(copy);
		request.setAttribute("orgName", orgName);
		dto.setReference_name(orgName);
		dto.setReference_path(path);
		
		dto.setClassHomework(classHomework);
		dto.setReg_date(new Timestamp(System.currentTimeMillis()));
		String numCheck = (String)sqlMap.queryForObject("numCheckHomework", classHomework);
		int number = 0;
		
		if(numCheck == null){
			number=1;
		}
		else{
			number= Integer.parseInt(numCheck)+1;
		}
		
		sqlMap.insert("insertArticleHomeWork", dto);
		request.setAttribute("classcode", classCode);
		return "/ClassRoom/CrHw/crHwWritePro.jsp";
	}
	
	@RequestMapping("/crHwModifyForm.khcu")
	public String crHomeWorkModifyForm(HttpServletRequest request, ClassHwDataBean dto){
		int num = Integer.parseInt(request.getParameter("num"));
        String pageNum = request.getParameter("pageNum");
        String classCode = request.getParameter("classcode");
        String classHomework = "classHomework"+classCode;
        dto.setClassHomework(classHomework);
        dto.setNum(num);
        dto = (ClassHwDataBean)sqlMap.queryForObject("getArticleSelectHomeWork", dto);
        
        request.setAttribute("classcode", classCode);
        request.setAttribute("num", num);
        request.setAttribute("pageNum",  new Integer(pageNum));
        request.setAttribute("article", dto);
		return "/ClassRoom/CrHw/crHwModifyForm.jsp";
	}
	
	@RequestMapping("/crHwModifyPro.khcu")
	public String crHomeWorkModifyPro(MultipartHttpServletRequest request, ClassHwDataBean dto, ClassHwDataBean dto2) throws Exception{
        String classCode = request.getParameter("classcode");
        String classHomework = "classHomework"+classCode;
		int num = Integer.parseInt(request.getParameter("num"));
        dto2.setClassHomework(classHomework);
        dto2.setNum(num);

        dto2 = (ClassHwDataBean)sqlMap.queryForObject("getArticleSelectHomeWork", dto2);
        
        String pageNum = request.getParameter("pageNum");
        MultipartFile file = request.getFile("reference");
		String orgName = file.getOriginalFilename();
		if(orgName.equals("")){
			dto.setReference_name(dto2.getReference_name());
			dto.setReference_path(dto2.getReference_path());
		}else{
			String path = "C://Users//user2//workspace//.metadata//.plugins//org.eclipse.wst.server.core//tmp0//wtpwebapps//KHCU//ClassRoom//CrHw//referenceFile//";
			File copy = new File("C://Users//user2//workspace//.metadata//.plugins//org.eclipse.wst.server.core//tmp0//wtpwebapps//KHCU//ClassRoom//CrHw//referenceFile//"+orgName);			/// 복사본
			file.transferTo(copy);
			request.setAttribute("orgName", orgName);
		dto.setReference_name(orgName);
		dto.setReference_path(path);
		}
        System.out.println(dto.getTitle());
        
        dto.setClassHomework(classHomework);
        dto.setNum(num);
        sqlMap.update("updateArticleHomeWork", dto);
        
        request.setAttribute("classcode", classCode);
		return "/ClassRoom/CrHw/crHwModifyPro.jsp";
	}
	
	
	@RequestMapping("/crHwDeletePro.khcu")
	public String crHomeWorkDeletePro(HttpServletRequest request, ClassHwDataBean dto,  ClassHwSubmitDataBean dto2){
		int num = Integer.parseInt(request.getParameter("num"));
        String pageNum = request.getParameter("pageNum");
        String classCode = request.getParameter("classcode");
        String classHomework = "classHomework"+classCode;
        String classSubmitHw = "classSubmitHw"+classCode;
        int check = 0;
        dto.setClassHomework(classHomework);
        dto.setNum(num);
        dto2.setHwtype(dto.getType());
        dto2.setClassSubmitHw(classSubmitHw);
        sqlMap.delete("deleteArticleHomeWork", dto);
        sqlMap.delete("deleteSubmitHomeWork", dto2);
        request.setAttribute("pageNum",  new Integer(pageNum));
        request.setAttribute("check", (Integer)check);
        request.setAttribute("classcode", classCode);
        return "/ClassRoom/CrHw/crHwDeletePro.jsp";
	}
	

}

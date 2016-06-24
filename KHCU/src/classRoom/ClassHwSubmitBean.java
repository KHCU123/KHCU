package classRoom;

import java.io.File;
import java.sql.Timestamp;
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

@Controller
public class ClassHwSubmitBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/crHwSubmitForm.khcu")
	public String crHwSubmitForm(HttpServletRequest request){
		String classcode = request.getParameter("classcode");
		String classHomeWork = "classHomeWork" + classcode;
		String num = request.getParameter("num");
		HashMap <String, Object> hm = new HashMap<String, Object>();
		hm.put("classHomework", classHomeWork);
		hm.put("num", num);
		String type = (String) sqlMap.queryForObject("getHomeWorkType", hm);
		request.setAttribute("type", type);
		request.setAttribute("num", num);
		request.setAttribute("classcode", classcode);

		return "/ClassRoom/CrHw/crHwSubmitForm.jsp";
	}
	
	@RequestMapping("/crHwSubmitPro.khcu")
	public String crHwSubmitPro(HttpSession session, MultipartHttpServletRequest request, ClassHwSubmitDataBean dto) throws Exception{
		String studentnum = (String) session.getAttribute("memId");
        String classCode = request.getParameter("classcode");
        String classSubmitHw = "classSubmitHw" + classCode;
        String title = request.getParameter("title");
        String type = request.getParameter("type");
        int num = new Integer(request.getParameter("num"));
		MultipartFile file = request.getFile("submitfile");
		String orgName = file.getOriginalFilename();
		String path = "C://Users//user2//workspace//.metadata//.plugins//org.eclipse.wst.server.core//tmp0//wtpwebapps//KHCU//ClassRoom//CrHw//submitFile//";
		File copy = new File("C://Users//user2//workspace//.metadata//.plugins//org.eclipse.wst.server.core//tmp0//wtpwebapps//KHCU//ClassRoom//CrHw//submitFile//"+orgName);			/// 복사본
		file.transferTo(copy);
		
		dto.setClassSubmitHw(classSubmitHw);
		dto.setClasscode(classCode);
		dto.setTitle(title);
		dto.setSubmit_name(orgName);
		dto.setSubmit_path(path);
		dto.setHwtype(type);
		dto.setStudentnum(studentnum);
		dto.setReg_date(new Timestamp(System.currentTimeMillis()));
		
		sqlMap.insert("submitHomework",dto);
		return "/ClassRoom/CrHw/crHwSubmitPro.jsp";
	}
	
	@RequestMapping("/crHwSubmitList.khcu")
	public String crHwSubmitList(HttpServletRequest request){
		String classCode = request.getParameter("classcode");
		String attendBookName = "attendBookName" + classCode;
		String classSubmitHw = "classSubmitHw" + classCode;
		List list = null;
		HashMap <String, Object> hm = new HashMap<String, Object>();
		hm.put("attendBookName", attendBookName);
		hm.put("classSubmitHw", classSubmitHw);
		list = sqlMap.queryForList("getJoinAttSubmit", hm);
		int attCount = 0;
		int subCount = 0;
		attCount = (int)sqlMap.queryForObject("countAttendBookSt", attendBookName);
		subCount = (int)sqlMap.queryForObject("countSubmitHomeWork", classSubmitHw);
		int nonsubmit = attCount - subCount;
		request.setAttribute("articleList", list);
		request.setAttribute("subCount", subCount);
		request.setAttribute("nonsubmit", nonsubmit);
		request.setAttribute("classCode", classCode);
		return "/ClassRoom/CrHw/crHwSubmitList.jsp";
	}
	
	@RequestMapping("/crHwSubmitDown.khcu")
	public ModelAndView crHwSubmitDown(String submit_name) throws Exception{
		File down = new File("C://Users//user2//workspace//.metadata//.plugins//org.eclipse.wst.server.core//tmp0//wtpwebapps//KHCU//ClassRoom//CrHw//submitFile//"+submit_name);
		ModelAndView mv = new ModelAndView("download","downloadFile",down);
		return mv;
	}
	
	@RequestMapping("/crHwSubmitListUpdatePro.khcu")
	public String crHwSubmitListUpdatePro(HttpServletRequest request){
		String classCode = request.getParameter("classCode");
		String [] stNum = request.getParameterValues("stNum");
		String [] hwscore = request.getParameterValues("hwscore");
		String [] type = request.getParameterValues("type");
		String classSubmitHw = "classSubmitHw" + classCode;
		String attendBookName = "attendBookName" + classCode; 
		int i = 0;
		for(i=0; i<hwscore.length; i++){
			HashMap <String, Object> hm = new HashMap<String, Object>();
			hm.put("classSubmitHw", classSubmitHw);
			hm.put("stnum", stNum[i]);
			hm.put("hwscore", hwscore[i]);
			hm.put("type", type[i]);
			sqlMap.update("updateSubmitHwScore", hm);
			hm.put("attendBookName", attendBookName);
			sqlMap.update("updateAttendHwScore", hm);
		};
		request.setAttribute("classcode", classCode);
		return "/ClassRoom/CrHw/crHwSubmitListUpdatePro.jsp";
	}
	
	// 과제제출테이블
}

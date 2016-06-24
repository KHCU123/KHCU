package professorInfo;

import java.io.File;


import java.sql.Timestamp;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Controller
public class ProfessorBean {
	
	@Autowired
	   private SqlMapClientTemplate sqlMap;	
	

	@RequestMapping("/proMenu")
	public String proMenu(HttpServletRequest request, HttpSession session){
		return "/professorMenu/proMenu.jsp";
	}


	 @RequestMapping("/pftestDeleteForm.khcu")
		public String testDeleteForm(HttpServletRequest request, ProfessorDataBean dto){
			String proNum = request.getParameter("proNum");
	        String pageNum = request.getParameter("pageNum");
	        request.setAttribute("proNum", proNum);
	        request.setAttribute("pageNum", new Integer(pageNum));
			return "/professorMenu/testDeleteForm.jsp";
		}
		
		
		@RequestMapping("/pftestDeletePro.khcu")
		public String testDeletePro(HttpServletRequest request, ProfessorDataBean dto){
			String proNum = request.getParameter("proNum");
	        String pageNum = request.getParameter("pageNum");

	        dto.setProNum(proNum);
	        sqlMap.delete("deleteArticleProCard", dto);
	        request.setAttribute("pageNum", new Integer(pageNum));
	        return "/professorMenu/testDeletePro.jsp";
		}

		@RequestMapping("/professorCardModifyForm.khcu")
		public String professorCardModifyForm(HttpServletRequest request, ProfessorDataBean dto) throws Exception{
			String proNum = request.getParameter("proNum");
			
	        String pageNum = request.getParameter("pageNum");
	        dto.setProNum(proNum);
	        dto = (ProfessorDataBean)sqlMap.queryForObject("updateGetArticleProCard", dto);
	        
	        request.setAttribute("proNum", proNum);
			request.setAttribute("pageNum",  new Integer(pageNum));
	        request.setAttribute("article", dto);
			return "/professorMenu/professorCardModifyForm.jsp";
		}

		@RequestMapping("/professorCardModifyPro.khcu")
		public String professorCardModifyPro(MultipartHttpServletRequest request, ProfessorDataBean dto) throws Exception{
			String proNum = request.getParameter("proNum");
			String fbid = request.getParameter("fbid");

			MultipartFile file = request.getFile("professorfProfile"); // 원본
			String proProfileName = file.getOriginalFilename(); // 업로드할 파일의 이름
			File copy = new File("F://1조//KHCU//WebContent//professorMenu//photo//"+proProfileName); // 복사 위치
			
			file.transferTo(copy); // 업로드
			
			dto.setProNum(proNum);
			dto.setProFacebookId(fbid);
			dto.setProProfileName(proProfileName);
			dto.setProProfilePath("F://1조//KHCU//WebContent//professorMenu//photo//");
			
			sqlMap.update("updateArticleProCard", dto);
			
			return "/professorMenu/professorCardModifyPro.jsp";
		}
		
		@RequestMapping("/facebookIdPro.khcu")
		public String facebookIdPro(HttpServletRequest request, ProfessorDataBean dto) throws Exception{
			 HttpSession session = request.getSession();
			 String proNum = (String)session.getAttribute("memId");

			String fbid = request.getParameter("fbid");

			System.out.println(fbid);
			System.out.println(proNum);
			dto.setProFacebookId(fbid);
			dto.setProNum(proNum);
			
			
			sqlMap.update("updateProfbid", dto);
			request.setAttribute("fbid", fbid);
			return "/professorMenu/facebookIdPro.jsp";
		}
		
		
		@RequestMapping("/professorCardStateUpdatePro.khcu")
		public String professorCardStateUpdatePro(HttpServletRequest request, ProfessorDataBean dto) throws Exception{
			String proNum = request.getParameter("proNum");
			dto.setProState("퇴사");
			dto.setProReg_date(new Timestamp(System.currentTimeMillis()));
			dto.setProNum(proNum);
			
			sqlMap.update("updateStateProCard", dto);
			
			return "/professorMenu/professorCardStateUpdatePro.jsp";
		}
}

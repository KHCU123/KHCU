package StaffCard;

import java.io.File;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import Community.ComNotice.ComNoticeDataBean;


@Controller
public class StaffCardBean {
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/staffMenu")
	public String staffMenu(HttpServletRequest request, HttpSession session){
		return "/StaffCard/staffMenu.jsp";
	}
	
	@RequestMapping("/testDeleteForm.khcu")
	public String testDeleteForm(HttpServletRequest request, StaffCardDataBean dto){
		String staffNum = request.getParameter("staffNum");
        String pageNum = request.getParameter("pageNum");

        request.setAttribute("staffNum", staffNum);
        request.setAttribute("pageNum", new Integer(pageNum));
		return "/StaffCard/testDeleteForm.jsp";
	}
	
	@RequestMapping("/testDeletePro.khcu")
	public String testDeletePro(HttpServletRequest request, StaffCardDataBean dto){
		String staffNum = request.getParameter("staffNum");
        String pageNum = request.getParameter("pageNum");

        dto.setStaffNum(staffNum);
        sqlMap.delete("deleteArticleStaffCard", dto);
        request.setAttribute("pageNum", new Integer(pageNum));
        return "/StaffCard/testDeletePro.jsp";
	}
	
	@RequestMapping("/staffCardModifyForm.khcu")
	public String staffCardModifyForm(HttpServletRequest request, StaffCardDataBean dto) throws Exception{
		String staffNum = request.getParameter("staffNum");
        String pageNum = request.getParameter("pageNum");
        dto.setStaffNum(staffNum);
        dto = (StaffCardDataBean)sqlMap.queryForObject("updateGetArticleStaffCard", dto);
        
        request.setAttribute("staffNum", staffNum);
		request.setAttribute("pageNum",  new Integer(pageNum));
        request.setAttribute("article", dto);
		return "/StaffCard/staffCardModifyForm.jsp";
	}

	@RequestMapping("/staffCardModifyPro.khcu")
	public String staffCardModifyPro(MultipartHttpServletRequest request, StaffCardDataBean dto) throws Exception{
		String staffNum = request.getParameter("staffNum");
		dto.setStaffNum(staffNum);
		
		StaffCardDataBean staffDTO = (StaffCardDataBean)sqlMap.queryForObject("getArticleStaffCard",dto);
		if(staffDTO.getStaffProfileName().equals(request.getFileNames())){
			dto.setStaffProfileName(staffDTO.getStaffProfileName());
			dto.setStaffProfilePath(staffDTO.getStaffProfilePath());
		}else{
			MultipartFile file = request.getFile("staffProfile"); // 원본
			String staffProfileName = file.getOriginalFilename(); // 업로드할 파일의 이름
			File copy = new File("C://Users//user2//Desktop//오후1조//KHCU//WebContent//StaffCard//photo//"+staffProfileName); // 복사 위치
			
			file.transferTo(copy); // 업로드
			dto.setStaffProfileName(staffProfileName);
			dto.setStaffProfilePath("C://Users//user2//Desktop//오후1조//KHCU//WebContent//StaffCard//photo//");
		}			
		sqlMap.update("updateArticleStaffCard", dto);
		
		return "/StaffCard/staffCardModifyPro.jsp";
	}
	
	@RequestMapping("/staffCardStateUpdatePro.khcu")
	public String staffCardStateUpdatePro(HttpServletRequest request, StaffCardDataBean dto) throws Exception{
		String staffNum = request.getParameter("staffNum");
		dto.setStaffState("퇴사");
		dto.setStaffReg_date(new Timestamp(System.currentTimeMillis()));
		dto.setStaffNum(staffNum);
		
		sqlMap.update("updateStateStaffCard", dto);
		
		return "/StaffCard/staffCardStateUpdatePro.jsp";
	}
}

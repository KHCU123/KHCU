package College;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class CollegeBean {
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("collegeInputForm.khcu")
	public String collegeInputForm(){
		return "/College/collegeInputForm.jsp";
	}
	
	@RequestMapping("/collegeInputPro.khcu")
	public String collegeInputPro(HttpServletRequest request, CollegeDataBean dto){
		String colName = request.getParameter("colName");
		int check = 1;
		int majNameCheck = (Integer)sqlMap.queryForObject("majNameCheckCollege", dto);
		if(majNameCheck == 1){
			check = 1;
		}else if(majNameCheck == 0){
			int colCode = 1;
			if(colName.equals("공과대학")){ colCode = 1; }
			else if(colName.equals("법과대학")){ colCode = 2; }
			else if(colName.equals("사회과학대학")){ colCode = 3; }
			else if(colName.equals("예술대학")){ colCode = 4; }
			else if(colName.equals("인문대학")){ colCode = 5; }
			else if(colName.equals("자연과학대학")){ colCode = 6; }
			dto.setColCode(colCode);
		
			String majCodeCheck = (String)sqlMap.queryForObject("majCodeCheckCollege", dto);
			int majCode = 1;
			if(majCodeCheck == null){ majCode = 1; }
			else{ majCode = Integer.parseInt(majCodeCheck)+1; }
			dto.setMajCode(majCode);
			
			sqlMap.insert("insertArticleCollege", dto);
			check = 0;
		}
		request.setAttribute("check", new Integer(check));
		return "/College/collegeInputPro.jsp";
	}
	
	@RequestMapping("/testCollegeDeleteForm.khcu")
	public String testDeleteForm(HttpServletRequest request, CollegeDataBean dto){
		String majCode = request.getParameter("majCode");
		String majName = request.getParameter("majName");
        String pageNum = request.getParameter("pageNum");

        request.setAttribute("majCode", new Integer(majCode));
        request.setAttribute("majName", majName);
        request.setAttribute("pageNum", new Integer(pageNum));
		return "/College/testDeleteForm.jsp";
	}
	
	@RequestMapping("/testCollegeDeletePro.khcu")
	public String testDeletePro(HttpServletRequest request, CollegeDataBean dto){
		int majCode = Integer.parseInt(request.getParameter("majCode"));
        String pageNum = request.getParameter("pageNum");

        dto.setMajCode(majCode);
        sqlMap.delete("deleteArticleCollege", dto);
        request.setAttribute("pageNum", new Integer(pageNum));
        return "/College/testDeletePro.jsp";
	}
}

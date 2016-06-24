package StaffCard;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StaffCardInputBean {
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/staffCardInputForm.khcu")
	public String staffCardInputForm(){
		return "/StaffCard/staffCardInputForm.jsp";
	}
	
	@RequestMapping("/staffCardInputPro.khcu")
	public String staffCardInputPro(HttpServletRequest request, StaffCardDataBean dto){
		String staffProfileName = request.getParameter("staffProfileName");
		String staffProfilePath = request.getParameter("staffProfilePath");
		
		if(staffProfileName == null || staffProfilePath == null){
			staffProfileName = "emty.PNG";
			staffProfilePath = "emty.PNG";
		}
		
		String staffDep = request.getParameter("staffDep");
		/*if(staffDep.equals("인사팀")){  = 1; }
		else if(staffDep.equals("시설팀")){  = 2; }
		else if(staffDep.equals("장학팀")){  = 3; }*/
		
		dto.setStaffProfileName(staffProfileName);
		dto.setStaffProfilePath(staffProfilePath);
		dto.setStaffPw(request.getParameter("staffJumin1"));
		dto.setStaffState("입사");
		sqlMap.insert("insertArticleStaffCard", dto);
		return "/StaffCard/staffCardInputPro.jsp";
	}
	
	 @RequestMapping("/staffcreateNum.khcu")	// 학번 1차생성
		public String staffcreateNum(HttpServletRequest request){
			Date year = new Date();
			String staffDep = request.getParameter("staffDep");
			int staffDepNum = 0;
			if(staffDep.equals("인사팀")){ staffDepNum = 1; }
			else if(staffDep.equals("시설팀")){ staffDepNum = 2; }
			else if(staffDep.equals("장학팀")){ staffDepNum = 3; }
			
	        String staffNum = request.getParameter("staffNum");
	        int a = (Integer)sqlMap.queryForObject("checkStaffNum",staffNum);
	        if(a==0){
	       	 a=1001;
	        }else{
	       	 a = (Integer)sqlMap.queryForObject("checkStaffNum2", staffNum);
	       	 a++;
	        }
	        request.setAttribute("year", year);
	        request.setAttribute("staffDep", staffDepNum);
	   	 request.setAttribute("staffcode", a);
			return "/StaffCard/createNum.jsp";
		}
		
		@RequestMapping("/staffNumber.khcu")	// 학번 중복 검색 후 생성
		public String staffNumber(HttpServletRequest request){
	         String staffNum = request.getParameter("staffNum");
	         int a = (Integer)sqlMap.queryForObject("checkStaffNum",staffNum);
	         int b = Integer.parseInt(staffNum);
	         if(a!=0){
		         while(a!=0){	        	 
		        	 b++;
		        	 a = (Integer)sqlMap.queryForObject("checkStaffNum",Integer.toString(b));
		       	 }
	         }
	    	 request.setAttribute("staffNum", b);
			return "/StaffCard/staffNumber.jsp";
		}
}

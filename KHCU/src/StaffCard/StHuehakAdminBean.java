package StaffCard;

import java.sql.Timestamp;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import studentInfo.StudentDataBean;

@Controller
public class StHuehakAdminBean {
	@Autowired
	SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/studentHuhakRegPro.khcu")
	public String studentHuhakRegPro(HttpServletRequest request){
		String[] checkList = request.getParameterValues("ch");
		for(int i=0; i<checkList.length; i++){
			HashMap<String, Object> hm = new HashMap<String, Object>();
			hm.put("studentnum", checkList[i]);
			hm.put("permit", "처리완료");
			hm.put("reg_date", new Timestamp(System.currentTimeMillis()));
			sqlMap.update("stHuhakUpdatePermit", hm);
			StudentDataBean dto = (StudentDataBean)sqlMap.queryForObject("studentCard", checkList[i]);
			dto.setStstate("휴학");
			sqlMap.update("studentCardUpdatePermit", dto);
		}
		return "/StaffCard/studentHuhakRegPro.jsp";
	}
}

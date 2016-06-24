package AttendBook;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import Classes.ClassDataBean;

@Controller
public class AttendBookBean {
	
	@Autowired
	   private SqlMapClientTemplate sqlMap; 
	
	
}

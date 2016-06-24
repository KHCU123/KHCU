package classRoom;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import AttendBook.CheckAttendDataBean;
import Classes.ClassDataBean;

@Controller
public class ClassRoomBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/CrMain.khcu")
	public String CrMain(){
		return "/ClassRoom/CrMain.jsp";
	}
	
	@RequestMapping("/crInputForm")
	public String crInputForm(HttpServletRequest request){
		String classcode=request.getParameter("classcode");
		String week = request.getParameter("week");
		request.setAttribute("week", week);
		request.setAttribute("classcode", classcode);
		return "/ClassRoom/CrListen/crInputForm.jsp";
	}
	
	@RequestMapping("/crInputPro")
	public String crInputPro(CrListenDataBean dto, MultipartHttpServletRequest request) throws Exception{
		// 강의 동영상
		MultipartFile file = request.getFile("CrVideo");
		String orgName = file.getOriginalFilename();
		String path = "C://Users//user2//workspace//.metadata//.plugins//org.eclipse.wst.server.core//tmp0//wtpwebapps//KHCU//ClassRoom//CrListen//Video//";
		File copy = new File("C://Users//user2//workspace//.metadata//.plugins//org.eclipse.wst.server.core//tmp0//wtpwebapps//KHCU//ClassRoom//CrListen//Video//"+orgName);			/// 복사본
		file.transferTo(copy);
		request.setAttribute("orgName", orgName);
		dto.setFilename(orgName);
		dto.setFilepath(path);
		
		// 수업자료
		MultipartFile file2 = request.getFile("CrReference");		
		String orgName2 = file2.getOriginalFilename();
		if(orgName2!=null){
		String path2 = "C://Users//user2//workspace//.metadata//.plugins//org.eclipse.wst.server.core//tmp0//wtpwebapps//KHCU//ClassRoom//CrListen//Reference//";
		File copy2 = new File("C://Users//user2//workspace//.metadata//.plugins//org.eclipse.wst.server.core//tmp0//wtpwebapps//KHCU//ClassRoom//CrListen//Reference//"+orgName2);
		file2.transferTo(copy2);
		request.setAttribute("crReference", orgName2);
		dto.setReferencename(orgName2);
		dto.setReferencepath(path2);
		}else{
			dto.setReferencename("0");
			dto.setReferencepath("0");
		}
		
		String num = dto.getClasscode() + dto.getWeek();
		dto.setNum(num);
		dto.setReg_date(new Timestamp(System.currentTimeMillis()));
		String numCheck = (String)sqlMap.queryForObject("numCheckCrVideo", null);
		int number = 0;		
		if(numCheck == null){
			number=1;
		}
		else{
			number= Integer.parseInt(numCheck)+1;
		}
		
		sqlMap.insert("insertCrVideo", dto);
		return "/ClassRoom/CrListen/crInputPro.jsp";
	}

	@RequestMapping("/crModifyForm.khcu")
	public String crModifyForm(HttpServletRequest request, CrListenDataBean dto){
		String classcode = request.getParameter("classcode");
		String week = request.getParameter("week");
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("classcode", classcode);
		hm.put("week",week);
		dto = (CrListenDataBean) sqlMap.queryForObject("getClassContent", hm);
		request.setAttribute("dto", dto);
		return "/ClassRoom/CrListen/crModifyForm.jsp";
	}
	
	@RequestMapping("/crModifyPro.khcu")
	public String crModifyPro(MultipartHttpServletRequest request, CrListenDataBean dto, CrListenDataBean dto2) throws Exception{
		MultipartFile file = request.getFile("CrVideo");
		String orgName = file.getOriginalFilename();
		MultipartFile file2 = request.getFile("CrReference");
		String orgName2 = file2.getOriginalFilename();
		System.out.println(orgName);
		String classcode = request.getParameter("classcode");
		String week = request.getParameter("week");
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("classcode", classcode);
		hm.put("week",week);
		dto2 = (CrListenDataBean) sqlMap.queryForObject("getClassContent", hm);
		if(orgName.equals("")){
			dto.setFilename(dto2.getFilename());
			dto.setFilepath(dto2.getFilepath());
		}else{
			
			String path = "C://Users//user2//workspace//.metadata//.plugins//org.eclipse.wst.server.core//tmp0//wtpwebapps//KHCU//ClassRoom//CrListen//Video//";
			File copy = new File("C://Users//user2//workspace//.metadata//.plugins//org.eclipse.wst.server.core//tmp0//wtpwebapps//KHCU//ClassRoom//CrListen//Video//"+orgName);			/// 복사본
			file.transferTo(copy);
			request.setAttribute("orgName", orgName);
			dto.setFilename(orgName);
			dto.setFilepath(path);
		}
		if(orgName2.equals("")){
			dto.setReferencename(dto2.getReferencename());
			dto.setReferencepath(dto2.getReferencepath());
		}else{			
			String path2 = "C://Users//user2//workspace//.metadata//.plugins//org.eclipse.wst.server.core//tmp0//wtpwebapps//KHCU//ClassRoom//CrListen//Reference//";
			File copy2 = new File("C://Users//user2//workspace//.metadata//.plugins//org.eclipse.wst.server.core//tmp0//wtpwebapps//KHCU//ClassRoom//CrListen//Reference//"+orgName2);
			file2.transferTo(copy2);
			request.setAttribute("crReference", orgName2);
			dto.setReferencename(orgName2);
			dto.setReferencepath(path2);
		}
		dto.setNum(dto2.getNum());
		dto.setReg_date(new Timestamp(System.currentTimeMillis()));
		sqlMap.update("updateCrListen", dto);
		return "/ClassRoom/CrListen/crModifyPro.jsp";
	}
	
	@RequestMapping("/crListenList.khcu")
	public String crListenList(ClassDataBean dto, HttpServletRequest request){
		String classcode="1611101";
		//String classcode= request.getParameter("classcode");
		dto = (ClassDataBean) sqlMap.queryForObject("getClassInfo", classcode);
		request.setAttribute("dto", dto);
		return "/ClassRoom/CrListen/crListenList.jsp";
	}
	
	@RequestMapping("/crListenContentPro.khcu")
	public String crListenContentPro(HttpSession session, HttpServletRequest request, CrListenDataBean dto){
		String memId = (String) session.getAttribute("memId");
		String id = memId.substring(4, 5);
		String classcode = request.getParameter("classcode");
		String week = request.getParameter("week");
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("classcode", classcode);
		hm.put("week",week);
		int check=0;
		dto = (CrListenDataBean) sqlMap.queryForObject("getClassContent", hm);
		if(dto!=null){
		int startdate = new Integer(dto.getStartdate());
		int enddate = new Integer(dto.getEnddate());
		Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        int sysdate = new Integer(sdf.format(date));
        if(sysdate>=startdate){
        	if(sysdate<=enddate){
        		check = 1;
        	}else if(sysdate>enddate){
        		check = 2;
        	}
        }else{
        	check = 0;
        }
		}else{
			check = 0;
		}
		request.setAttribute("id", id);
        request.setAttribute("classcode", classcode);
        request.setAttribute("week", week);
		request.setAttribute("check", check);
		return "/ClassRoom/CrListen/crListenContentPro.jsp";
	}
	
	@RequestMapping("/crListenContent.khcu")
	public String crListenContent(HttpSession session, CrListenDataBean dto, HttpServletRequest request){
		String classcode=request.getParameter("classcode");
		String week = request.getParameter("week");
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("classcode", classcode);
		hm.put("week", week);
		dto = (CrListenDataBean) sqlMap.queryForObject("getClassContent", hm);
		String memId = (String) session.getAttribute("memId");
		String id = memId.substring(4, 5);
		request.setAttribute("id", id);
		request.setAttribute("dto", dto);
		request.setAttribute("classcode",classcode);
		request.setAttribute("week", week);

		return "/ClassRoom/CrListen/crListenContent.jsp";
	}
	
	@RequestMapping("/crListenContentDown.khcu")
	public ModelAndView crListenContentDown(String referencename) throws Exception{
		File down = new File("C://Users//user2//workspace//.metadata//.plugins//org.eclipse.wst.server.core//tmp0//wtpwebapps//KHCU//ClassRoom//CrListen//Reference//"+referencename);
		ModelAndView mv = new ModelAndView("download","downloadFile",down);
		return mv;
	}
	
	@RequestMapping("/crListenRoom.khcu")
	public String crListenRoom(HttpSession session, HttpServletRequest request){
		String classcode = request.getParameter("classcode");
		String memId = (String) session.getAttribute("memId");
		String id = "";
		if(memId!=null){
			id = memId.substring(4, 5);
		}
		String attendBookName = "attendBookName" + classcode;
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("attendBookName", attendBookName);
		hm.put("stnum", memId);
		hm.put("sysday", new Timestamp(System.currentTimeMillis()));
		int checkStNum = (int) sqlMap.queryForObject("checkAttendBookStnum", hm);
		int check = 0;
		if(checkStNum!=0){
			check = 1;
		}
		String classname = (String) sqlMap.queryForObject("getClassName", classcode);
		//String name = (String) sqlMap.queryForObject("getStudentName", memId);
		//request.setAttribute("Name", name);
		request.setAttribute("classname", classname);
		request.setAttribute("id", id);
		request.setAttribute("classcode", classcode);
		request.setAttribute("memId", memId);
		request.setAttribute("check", new Integer(check));
		return "/ClassRoom/CrListen/crListenRoom.jsp";
	}
	
	// 강의방 입장시
	@RequestMapping("/crListenRoomPro.khcu")
	public String crListenRoomPro(HttpServletRequest request, CheckAttendDataBean dto){
		String classcode = request.getParameter("classcode");
		String stnum = request.getParameter("studentnum");
		String checkAttend = "attendCheck" + classcode;
		String attendBookName = "attendBookName" + classcode;
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        int today = new Integer(sdf.format(date));
        
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("attendBookName", attendBookName);
		hm.put("stnum", stnum);
		hm.put("attendCheck", checkAttend);
		hm.put("today", Integer.toString(today));
		hm.put("nextday", Integer.toString(today+1));
		int checkStNum = (int) sqlMap.queryForObject("checkAttendBookStnum", hm);
		int checkTodaySt = (int) sqlMap.queryForObject("checkAttendCheckStnum", hm);
		if(checkStNum!=0){
			if(checkTodaySt==0){
				dto.setCheckAttend(checkAttend);
				dto.setStnum(stnum);
				dto.setClasscode(classcode);
				dto.setEntrance_date(new Timestamp(System.currentTimeMillis()));
				dto.setAttendcheck("O");
				dto.setEnd_check("X");
				sqlMap.insert("insertAttend", dto);
			}
		}
		request.setAttribute("classcode", classcode);
		return "/ClassRoom/CrListen/crListenRoomPro.jsp";
	}
	
	
	@RequestMapping("/crListenRoomStartPro.khcu")
	public String crListenRoomStartPro(HttpServletRequest request, CrListenLiveDataBean dto){
		String classCode = request.getParameter("classcode");
		String crListenRoom = "classListenRoom" + classCode;
		dto.setCrListenRoom(crListenRoom);
		dto.setLecture_start(new Timestamp(System.currentTimeMillis()));
		dto.setLecture_end(new Timestamp(System.currentTimeMillis()));
		sqlMap.insert("insertLectureStart", dto);
		return "/ClassRoom/CrListen/crListenRoomStartPro.jsp";
	}
	
	// 출석체크 고쳐야함
	@RequestMapping("/crListenRoomManualCheck.khcu")
	public String crListenRoomManualCheck(HttpServletRequest request, CheckAttendDataBean dto, HttpSession session){
		String classCode = request.getParameter("classcode");
		String attendCheck = "attendCheck" + classCode;
		String classListenRoom = "classListenRoom" + classCode;
		String attendMessage = "attendMessage" + classCode;
		
		int check = 0;
		Date lecture_start = (Date) sqlMap.queryForObject("getLectureStart", classListenRoom);
		HashMap <String, Object> hm = new HashMap <String, Object>();
		hm.put("attendCheck",attendCheck);
		hm.put("today", lecture_start);
		hm.put("sysday", new Timestamp(System.currentTimeMillis()));
		check = (int) sqlMap.queryForObject("getCountAttendCheckToday", hm);
		Date date = new Date();
		hm.put("stnum", session.getAttribute("memId"));	// 교수만 할 수있으니까
		hm.put("classcode",classCode);
		hm.put("recMessage", "출석 체크");
		hm.put("rec_time", date);
		hm.put("attendMessage", attendMessage);
		hm.put("check_num", "0");
		sqlMap.insert("insertAttendMessage", hm);	// 교수 번호로 몇 번 보냈는지를 검색함
		
		List list = null;
		if(check > 0 ){
			list = sqlMap.queryForList("getAttendCheckToday", hm);
			Iterator iter = list.iterator();
			while(iter.hasNext()){
				dto = (CheckAttendDataBean) iter.next();
				hm.put("stnum", dto.getStnum());
				hm.put("classcode",dto.getClasscode());
				hm.put("recMessage", "출석 체크");
				hm.put("rec_time", new Timestamp(System.currentTimeMillis()));
				hm.put("attendMessage", attendMessage);
				hm.put("check_num", "0");
				sqlMap.insert("insertAttendMessage", hm);
			}
		}
		return "/ClassRoom/CrListen/AttendCheck/crListenRoomManualCheck.jsp";
	}
	
	//2016-06-22
	@RequestMapping("/crListenRoomReceive.khcu")
	public String crListenRoomReceive(HttpSession session, HttpServletRequest request){
		String sessionId = (String)session.getAttribute("memId");
		String classCode = request.getParameter("classcode");
		String attendMessage = "attendMessage" + classCode;
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        int today = new Integer(sdf.format(date));
		HashMap <String, Object> hm = new HashMap <String, Object>();
		hm.put("attendMessage", attendMessage);
		hm.put("stnum", sessionId);	// 확인용 아이디
		hm.put("today", Integer.toString(today));
		hm.put("sysday", Integer.toString(today+1));
		int todayMessage = 0;
		todayMessage = (int) sqlMap.queryForObject("getCountMessage", hm);
		
		Date MessageDate = new Date();
		MessageDate = (Date) sqlMap.queryForObject("getRecentlyMessage", hm);	// 가장 최근 메시지 검색
		if(MessageDate != null){
		SimpleDateFormat sdf2 = new SimpleDateFormat("HHmm");
		
		int rectime = new Integer(sdf2.format(MessageDate));
		int time = new Integer(sdf2.format(date));
		int checkTime = time-rectime;
		// 이부분 수정 가장 최근 시간대의 check_num이 0이면 ... todayMessage 는 1
		int countCheck_num = 0;
		countCheck_num = (int) sqlMap.queryForObject("getCountMessage2",hm);
		int check_num = 0;
			if(countCheck_num !=0){
				check_num = (int) sqlMap.queryForObject("getRecenltyMessage2", hm);
			}
		if(checkTime<15 && check_num==0){
				todayMessage = 1;
		}else{
			todayMessage = 0;
		}
		}
		request.setAttribute("todayMessage", todayMessage);
		request.setAttribute("classcode", classCode);
		return "/ClassRoom/CrListen/AttendCheck/crListenRoomReceive.jsp";
	}
	
	@RequestMapping("/crMessageCheck.khcu")
	public String crMessageCheck(HttpServletRequest request, HttpSession session){
		String classCode = request.getParameter("classcode");
		String attendMessage = "attendMessage" + classCode;
		String stnum = (String) session.getAttribute("memId");
		HashMap <String, Object> hm = new HashMap <String, Object> ();
		hm.put("attendMessage", attendMessage);
		hm.put("stnum", stnum);
		sqlMap.update("checkAttMessage", hm);
		return "/ClassRoom/CrListen/AttendCheck/crMessageCheck.jsp";
	}
	
	
	// 강의 종료 하면서 체크
	@RequestMapping("/crListenRoomCheckPro.khcu")
	public String crListenRoomCheckPro(HttpSession session, HttpServletRequest request, CheckAttendDataBean dto){
		String classCode = request.getParameter("classcode");
		String crListenRoom = "classListenRoom" + classCode;
		String attendCheck = "attendCheck" + classCode;
		String attendBookName = "attendBookName" + classCode;
		Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String today = sdf.format(date);
        HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("lecture_start", today);
		hm.put("crListenRoom", crListenRoom);
		hm.put("sysday", new Timestamp(System.currentTimeMillis()));
		// 오늘날짜 강의 검색, 종료 일자 업데이트
		String today_lecture = (String) sqlMap.queryForObject("getLecture_time", hm);
		System.out.println(today_lecture);
		hm.put("today", today_lecture);
		hm.put("attendCheck", attendCheck);
		hm.put("entrance_date", today);
		hm.put("checkAttend", attendCheck);
		
		sqlMap.update("updateLectureEnd", hm);
		
		dto.setCheckAttend(attendCheck);
		List list = null;
		list = sqlMap.queryForList("checkAttendBookSt", hm);	// 리스트에 checkAttendBookSt 를 넣는다.
		
		// 이 부분을 고쳐야함
		int week = new Integer(request.getParameter("week"));
		
		// 출석부 업데이트
		Iterator iter = list.iterator();
		while(iter.hasNext()){
			dto=(CheckAttendDataBean)iter.next();
			String studentNum = dto.getStnum();
			String end_check = dto.getEnd_check();
			String attendcheck = dto.getAttendcheck();
			HashMap<String, Object> hm2 = new HashMap<String, Object>();
			hm2.put("stnum", studentNum);
			if(end_check.equals("o")){
				hm2.put("end_check", "o");
			}else{
				hm2.put("end_check", "x");
			}
			hm2.put("week", week);
			hm2.put("attendBookName", attendBookName);
			sqlMap.update("updateCrAttendBook", hm2);
		}
		
		return "/ClassRoom/CrListen/crListenRoomCheckPro.jsp";
	}
	
	@RequestMapping("/crAttendCheck.khcu")
	public String crAttendCheck(HttpServletRequest request, CheckAttendDataBean dto, HttpSession session){
		String classCode = request.getParameter("classcode");
		String attendCheck = "attendCheck" + classCode;
		String attendBookName = "attendBookName" + classCode;
		String attendMessage = "attendMessage" + classCode;
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("attendBookName", attendBookName);
		int countAllStudent = 0;
		countAllStudent = (int) sqlMap.queryForObject("getCountAttendBookSt", hm);
		
		Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String today = sdf.format(date);
		
        hm.put("attendCheck", attendCheck);
        hm.put("today", today);
        hm.put("sysday", new Timestamp(System.currentTimeMillis()));
        
        int countTodayStudent = 0;
		countTodayStudent = (int) sqlMap.queryForObject("getCountAttendCheckToday", hm);
	
		List articleList = null;
		articleList = sqlMap.queryForList("getAttendCheckToday", hm);
		
		// 연속으로 못보내게 하기
		String professorNum = (String) session.getAttribute("memId");
		
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMdd");
        int today2 = new Integer(sdf2.format(date));
		hm.put("attendMessage", attendMessage);
		hm.put("today", Integer.toString(today2));
		hm.put("sysdate", Integer.toString(today2+1));
		hm.put("stnum", professorNum);
		Date MessageTime = (Date) sqlMap.queryForObject("getRecentlyMessage", hm);
		int checkTime = 0;
		if(MessageTime != null){
		SimpleDateFormat sdf3 = new SimpleDateFormat("HHmmss");
		int rectime = new Integer(sdf3.format(MessageTime));
		int time = new Integer(sdf3.format(date));
		checkTime = time-rectime;
		}
		System.out.println(checkTime);
		request.setAttribute("checkTime", checkTime);
		request.setAttribute("articleList", articleList);
		request.setAttribute("countAllStudent", countAllStudent);
		request.setAttribute("countTodayStudent", countTodayStudent);
		request.setAttribute("classcode", classCode);
		return "/ClassRoom/CrListen/AttendCheck/crAttendCheck.jsp";
	}
	
	@RequestMapping("crListenRoomFinalCheck.khcu")
	public String crListenRoomFinalCheck(HttpServletRequest request, HttpSession session, CheckAttendDataBean dto){
		String classCode = request.getParameter("classcode");
		String attendCheck = "attendCheck" + classCode;
		String attendMessage = "attendMessage" + classCode;
		String proNum = (String) session.getAttribute("memId");
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        int today = new Integer(sdf.format(date));
		HashMap <String, Object> hm = new HashMap<String, Object>();
		hm.put("attendMessage", attendMessage);
		hm.put("stnum", proNum);
		hm.put("today", Integer.toString(today));
		hm.put("sysday", Integer.toString(today+1));
		int countTodayMessage = 0;
		countTodayMessage = (int) sqlMap.queryForObject("getCountMessage", hm);
		
		hm.put("checkAttend", attendCheck);
		hm.put("entrance_date", Integer.toString(today));
		List list = null;
		list = sqlMap.queryForList("checkAttendBookSt", hm);
		int countTodayStnumCheck = 0;
		
		Iterator iter = list.iterator();
		while(iter.hasNext()){
			dto = (CheckAttendDataBean) iter.next();
			hm.put("stnum", dto.getStnum());
			countTodayStnumCheck = (int)sqlMap.queryForObject("getCountTodayStnum", hm);
			String end_check = "";
			if(countTodayMessage == countTodayStnumCheck){
				end_check = "o";
			}else{
				end_check = "x";
			}
			hm.put("end_check", end_check);
			sqlMap.update("updateEndCheck", hm);
		}
		
		return "/ClassRoom/CrListen/AttendCheck/crListenRoomFinalCheck.jsp";
	}
}

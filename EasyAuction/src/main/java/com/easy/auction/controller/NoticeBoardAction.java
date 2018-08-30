package com.easy.auction.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.easy.auction.dao.NoticeBoardService;
import com.easy.auction.model.Notice;

@Controller
public class NoticeBoardAction {

	@Autowired
	private NoticeBoardService noticeService;

//	private String saveFolder = 
//	"C:/Program Files/Apache Software Foundation/Tomcat 8.5/webapps/EasyAuction/resources/upload";

	private String saveFolder = "D:\\sts\\EasyAuction\\EasyAuction\\src\\main\\webapp\\resources\\upload";

//	private String saveFolder = "/Users/shane/eclipseworkspace/EasyAuction/src/main/webapp/resources/upload";
	
	// notice 리스트뽑아오기
	@RequestMapping(value ="/notice_list.nhn")
	public ModelAndView notice_list(
			@RequestParam(value="page", defaultValue="1") int page,
			HttpServletRequest request ) throws Exception {// command 객체
		System.out.println("page : " + page);
		
		List<Notice> boardlist = new ArrayList<Notice>();
		
		int limit = 10;
		
		HttpSession session = request.getSession();
		if(session.getAttribute("limit") != null) {
			limit = Integer.parseInt(session.getAttribute("limit").toString());
		}
		
		if(request.getParameter("limit") != null) {
			limit = Integer.parseInt(request.getParameter("limit"));
			session.setAttribute("limit", limit);
			System.out.println("limit=" + limit);
		}
			
		int listcount = noticeService.getNoticeListCount(); //총 리스트 수를 받아옴
		System.out.println("listcount ="+listcount);
		//총 페이지수
		int maxpage = (listcount+limit-1)/limit;
		
		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등 ...);
		int startpage = ((page-1)/limit)+1;
		System.out.println("현재 페이지에 보여줄 시작 페이지 수 = " + startpage);
		
		//현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등 ...);
		int endpage=startpage+limit-1;
		System.out.println("현재 페이지에 보여줄 마지막 페이지 수 = " + endpage);
		
		if(endpage>maxpage) {
			endpage=maxpage;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("limit", limit);
		
		boardlist = noticeService.getNoticeList(map);

		//////////////    Notice end     //////////////////	
	
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/notice/notice_list");
		
		mv.addObject("limit", limit);
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("boardlist", boardlist);
		
		return mv;
	}

	// notice 입력폼
	@RequestMapping(value = "/notice_write.nhn")
	public String notice_write() {
		return "notice/notice_write"; // board 폴더의 board_write.jsp 뷰 페이지가 실행
	}

	// notice 입력
	@RequestMapping(value = "/notice_write_ok.nhn", 
			method = RequestMethod.POST)
	public String notice_write_ok(Notice notice) throws Exception {
		MultipartFile uploadfile = notice.getUploadfile();
		if(!uploadfile.isEmpty()) {
			//원래 파일명 구해오기
			String fileName = uploadfile.getOriginalFilename();
			System.out.println(fileName);
			//원래 파일명 저장
			notice.setEn_original(fileName);
			
			//생성할 폴더 이름 : 오늘 년 + 월 + 일
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR);
			int month = c.get(Calendar.MONTH) + 1;
			int date = c.get(Calendar.DATE);
			String homedir = saveFolder + "/" + year + "-" + month + "-" + date;
			
			//파일 객체를 생성합니다.
			File path1 = new File(homedir);
			
			//폴더가 존재하는지 확인합니다.
			if(!(path1.exists())) {
				System.out.println("폴더 만들어요");
				path1.mkdirs();	//새로운 폴더를 생성
				
			}
			
			//난수를 구합니다.
			Random r = new Random();
			int random = r.nextInt(100000000);
			
			/***확장자 구하기 시작***/
			int index = fileName.lastIndexOf(".");
			/*
			 * 문자열에서 특정 문자열의 위치 값(index)를 반환한다.
			 * indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면,
			 * lastIndexOf는 마지막으로 발견되는 문자열의 index를 반환합니다.
			 * (파일명에 점이 여러개 있을 경우 맨 마지막에 발견되는 문자열의 위치를 리턴합니다.)
			 */
			System.out.println("index = " + index);
			
			String fileExtension = fileName.substring(index + 1);
			System.out.println("fileExtension = " + fileExtension);
			/***확장자 구하기 끝***/
			
			//새로운 파일명을 저장
			String refileName = "notice" + year + month + date + random + "."
					+ fileExtension;
			System.out.println("refileName = " + refileName);
			
			//오라클 디비에 저장될 레코드 값
			String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
			System.out.println("fileDBName = " + fileDBName);
			
			//transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder + fileDBName));
			//바뀐 파일명으로 저장
			notice.setEn_file(fileDBName);
		}
		
		this.noticeService.noticeInsert(notice);	//저장메서드 호출
		return "redirect:/notice_list.nhn";
	}

	// notice 상세보기
	@RequestMapping(value = "/notice_cont.nhn")
	public ModelAndView notice_cont(
			@RequestParam(value="en_num") int en_num,
			@RequestParam(value="page") int page,
			@RequestParam(value="state") String state) throws Exception{
		
		if(state.equals("cont")) { //내용보기 일때만
			noticeService.noticeHit(en_num);
		}
		Notice notice = noticeService.getNoticeCont(en_num);
		ModelAndView mv = new ModelAndView();
		
		if(state.equals("cont")) {
			mv.setViewName("notice/notice_cont");
			/*
			String notice_cont = notice.getEn_cont().replace("\n", "<br/>");
			mv.addObject("notice_cont:", notice_cont);*/
			
		}  else if(state.equals("edit")) {
			mv.setViewName("notice/notice_edit");
			
		}
		mv.addObject("bcont", notice);
		mv.addObject("page", page);
		return mv;
	}
			
	// 첨부파일 다운로드
	@RequestMapping(value ="/download.file", method= {RequestMethod.GET})
	public void downloadFile(HttpServletResponse response,
			@RequestParam(value="path") String storedFileName,
			@RequestParam(value="original") String originalFileName,
			HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("original = " + originalFileName);
		
		byte fileByte[] =
				FileUtils.readFileToByteArray(
						new File(saveFolder + storedFileName));
		
		response.setContentType("applicaation/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\""
				+ URLEncoder.encode(originalFileName, "UTF-8") + "\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}
	
	// notice 수정하기
	@RequestMapping(value = "/notice_edit_ok.nhn", method = RequestMethod.POST)
	public String notice_edit_ok(Notice notice,
			@RequestParam(value="en_num") int en_num,
			@RequestParam(value="page") int page,
			HttpServletResponse response) throws Exception {// command 객체
		
		response.setContentType("text/html;charset=utf-8");
		
		// 번호를 기준으로 DB 내용을 가져옵니다.
		Notice board = noticeService.getNoticeCont(notice.getEn_num());
		
		MultipartFile uploadfile = notice.getUploadfile();
		if(!uploadfile.isEmpty()) {
			File delFile = new File(saveFolder + board.getEn_file());
			if(delFile.exists()) {
				delFile.delete();
			}
			//워래 파일명 구해오기
			String fileName = uploadfile.getOriginalFilename();
			System.out.println(fileName);
			
			//원래 파일명 저장
			notice.setEn_original(fileName);
			
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR);
			int month = c.get(Calendar.MONTH) + 1;
			int date = c.get(Calendar.DATE);
			String homedir = saveFolder + "/" + year + "-" + month + "-" + date;
			
			//파일 객체를 생성합니다.
			File path1 = new File(homedir);
			
			//폴더가 존재하는 지 확인합니다.
			if(!(path1.exists())) {
				System.out.println("폴더 만들어요");
				path1.mkdirs();
			}
			
			Random r = new Random();
			int random = r.nextInt(100000000);
			
			int index = fileName.lastIndexOf(".");
			/*
			 * 문자열에서 특정 문자열의 위치 값(index)를 반환한다.
			 * indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면,
			 * lastIndexOf는 마지막으로 발견되는 문자열의 index를 반환합니다.
			 * (파일명에 점이 여러개 있을 경우 맨 마지막에 발견되는 문자열의 위치를 리턴합니다.)
			 */
			System.out.println("index = " + index);
			
			String fileExtension = fileName.substring(index + 1);
			System.out.println("fileExtension = " + fileExtension);
			
			//새로운 파일명을 저장
			String refileName = "notice" + year + month + date + random + "."
					+ fileExtension;
			System.out.println("refileName=" + refileName);
			
			//오라클 디비에 저장될 레코드 값
			String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
			System.out.println("fileDBName = " + fileDBName);
			
			//transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder + fileDBName));
			
			//바뀐 파일명으로 저장
			notice.setEn_file(fileDBName);
		}
		
		noticeService.editNotice(notice);
		
		return "redirect:/notice_cont.nhn?en_num="
				+ notice.getEn_num()+ "&page=" + page +"&state=cont";
	}
	
	// notice 삭제
	@RequestMapping(value = "/notice_del_ok.nhn", method = {RequestMethod.POST, RequestMethod.GET})
	public String notice_delete(Notice notice,
			@RequestParam(value="en_num") int en_num,
			HttpServletResponse response) 
					throws Exception {// command 객체
		response.setContentType("text/html;charset=utf-8");
		
		//기존 파일명 가져옵니다.
		String fname = notice.getEn_file();
				
		if(fname != null) {//기존 이진파일이 존재한다면
			File file = new File(saveFolder + fname);
			file.delete();	//서버 폴더로 부터 기존 이진파일 삭제합나다.
		}
		noticeService.deleteNotice(notice.getEn_num());
		
		System.out.println("notice.getEn_num()====="+notice.toString());
		return "redirect:/notice_list.nhn";
	}

	// notice 검색하기
	@RequestMapping(value = "/notice_find_ok.nhn", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView notice_find_ok(
			Notice notice,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam("find_name") String find_name,
			@RequestParam("find_field") String find_field ) throws Exception {// command 객체
		
		int limit = 10;
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("limit") != null) {
			limit = (Integer) session.getAttribute("limit");
		}
		
		if(request.getParameter("limit") != null) {
			limit = Integer.parseInt(request.getParameter("limit"));
			session.setAttribute("limit", limit);
		}
		
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("limit", limit);
		m.put("page", page);
		m.put("find_field", find_field);
		m.put("find_name", "%" + find_name + "%");
		
		int listcount = this.noticeService.getNoticeListCount2(m);
		//총 페이지 수
		int maxpage = (listcount + limit - 1)/limit;

		int startpage = ((page - 1) / limit)+ 1;
		System.out.println("현재 페이지에 보여줄 시작 페이지 수 = " + startpage);

		int endpage = startpage + limit - 1;
		System.out.println("현재 페이지에 보여줄 마지막 페이지 수 = " + endpage);

		if (endpage > maxpage) {
			endpage = maxpage;
		}
		List<Notice> boardlist = noticeService.getNoticeList2(m);
		ModelAndView mv = new ModelAndView("/notice/notice_list");
		
		mv.addObject("find_name", find_name);
		mv.addObject("find_field", find_field);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("maxpage", maxpage);
		mv.addObject("page", page);
		mv.addObject("limit", limit);
		mv.addObject("listcount", listcount);
		mv.addObject("boardlist", boardlist);
		
		return mv;
	}
}

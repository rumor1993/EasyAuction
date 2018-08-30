package com.easy.auction.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.easy.auction.dao.FAQBoardService;
import com.easy.auction.model.FAQ;

@Controller
public class FAQBoardAction {
	
	@Autowired
	private FAQBoardService faqService;
	
//	private String saveFolder = 
//	"C:/Program Files/Apache Software Foundation/Tomcat 8.5/webapps/EasyAuction/resources/upload";

	private String saveFolder = "D:\\sts\\EasyAuction\\EasyAuction\\src\\main\\webapp\\resources\\upload";

//	private String saveFolder = "/Users/shane/eclipseworkspace/EasyAuction/src/main/webapp/resources/upload";
	
	//faq 리스트
	@RequestMapping(value="/faq_list.nhn")
	public ModelAndView faq_list(
		@RequestParam(value="page2", defaultValue="1") int page2,
		HttpServletRequest request2 ) throws Exception{
		
		List<FAQ> boardlist2 = new ArrayList<FAQ>();
		
		int limit2=10;
		
		HttpSession session2 = request2.getSession();
		if(session2.getAttribute("limit2") != null) {
			limit2 = Integer.parseInt(session2.getAttribute("limit2").toString());
		}
		
		if(request2.getParameter("limit2") != null) {
			limit2 = Integer.parseInt(request2.getParameter("limit2"));
			session2.setAttribute("limit2", limit2);
			System.out.println("limit2=" + limit2);
		}
		
		int listcount2= faqService.getFAQListCount();
		
		System.out.println("listcount2 ="+listcount2);
		//총 페이지수
		int maxpage2 = (listcount2+limit2-1)/limit2;
		
		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등 ...);
		int startpage2 = ((page2-1)/limit2)+1;
		System.out.println("현재 페이지에 보여줄 시작 페이지 수 = " + startpage2);
		
		//현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등 ...);
		int endpage2 = startpage2+limit2-1;
		System.out.println("현재 페이지에 보여줄 마지막 페이지 수 = " + endpage2);
		
		if(endpage2>maxpage2) {
			endpage2=maxpage2;
		}
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("page2", page2);
		map2.put("limit2", limit2);
		
		boardlist2= faqService.getFAQList(map2);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/faq/faq_list");
		
		mv.addObject("limit2", limit2);
		mv.addObject("page2", page2);
		mv.addObject("maxpage2", maxpage2);
		mv.addObject("startpage2", startpage2);
		mv.addObject("endpage2", endpage2);
		mv.addObject("listcount2", listcount2);
		mv.addObject("boardlist2", boardlist2);
		
		System.out.println("boardlist2= " +boardlist2);
		return mv;
	}
	
	//faq 입력폼
	@RequestMapping(value="/faq_write.nhn")
	public String faq_write() {
		return "faq/faq_write"; //board 폴더의 board_write.jsp 뷰 페이지가 실행
	}
	
	// faq 입력
	@RequestMapping(value="/faq_write_ok.nhn",
			method=RequestMethod.POST)
	public String faq_write_ok(FAQ faq) throws Exception{
		
		String ef_cate=faq.getEf_cate();
		
		faq.setEf_cate(ef_cate);
		
		MultipartFile uploadfile = faq.getUploadfile();
		if(!uploadfile.isEmpty()) {
			//원래 파일명 구해오기
			String fileName = uploadfile.getOriginalFilename();
			System.out.println(fileName);
			//원래 파일명 저장
			faq.setEf_original(fileName);
			
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
			String refileName = "faq" + year + month + date + random + "."
					+ fileExtension;
			System.out.println("refileName = " + refileName);
			
			//오라클 디비에 저장될 레코드 값
			String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
			System.out.println("fileDBName = " + fileDBName);
			
			//transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder + fileDBName));
			//바뀐 파일명으로 저장
			faq.setEf_file(fileDBName);
		}
		
		this.faqService.FAQInsert(faq);	//저장메서드 호출
		return "redirect:/faq_list.nhn";
	}
	
	// faq 수정
	@RequestMapping(value="/faq_edit.nhn")
	public ModelAndView faq_edit(
			@RequestParam(value="ef_num") int ef_num,
			@RequestParam(value="page2") int page2,
			HttpServletRequest request ) throws Exception {
		FAQ faq = faqService.getFAQCont(ef_num);
		ModelAndView mv = new ModelAndView("faq/faq_edit");
		mv.addObject("faq", faq);
		mv.addObject("page2", page2);
		return mv;
	}
	
	// faq 수정확인
	@RequestMapping(value="/faq_edit_ok.nhn", method=RequestMethod.POST)
	public String faq_edit_ok(FAQ faq, 
			@RequestParam(value="ef_num") int ef_num,
			@RequestParam(value="page2") int page2,
			HttpServletResponse response) throws Exception{
		
		response.setContentType("text/html;charset=utf-8");
		
		FAQ board = faqService.getFAQCont(faq.getEf_num());
		
		MultipartFile uploadfile = faq.getUploadfile();
		if(!uploadfile.isEmpty()) {
			File delFile = new File(saveFolder + board.getEf_file());
			if(delFile.exists()) {
				delFile.delete();
			}
			//워래 파일명 구해오기
			String fileName = uploadfile.getOriginalFilename();
			System.out.println(fileName);
			
			//원래 파일명 저장
			faq.setEf_original(fileName);
			
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
			String refileName = "faq" + year + month + date + random + "."
					+ fileExtension;
			System.out.println("refileName=" + refileName);
			
			//오라클 디비에 저장될 레코드 값
			String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
			System.out.println("fileDBName = " + fileDBName);
			
			//transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder + fileDBName));
			
			//바뀐 파일명으로 저장
			faq.setEf_file(fileDBName);
		}
		
		faqService.editFAQ(faq);
		return "redirect:/faq_list.nhn?page2="+page2;
		
	}
	// faq 삭제
	@RequestMapping(value= "/faq_del_ok.nhn", method = {RequestMethod.POST, RequestMethod.GET})
	public String faq_delete(FAQ faq,
			HttpServletResponse response)
			throws Exception {// command 객체
		response.setContentType("text/html;charset=utf-8");
		// 기존 파일명 가져옵니다.
		String fname = faq.getEf_file();
		
		if (fname != null) {// 기존 이진파일이 존재한다면
			File file = new File(saveFolder + fname);
			file.delete(); // 서버 폴더로 부터 기존 이진파일 삭제합나다.
		}
		faqService.deleteFAQ(faq.getEf_num());
		
		
		return "redirect:/faq_list.nhn";
	}
	
	//글 검색
	@RequestMapping(value="/faq_find_ok.nhn", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView faq_find_ok(
			FAQ faq,
			HttpServletResponse response2,
			HttpServletRequest request2,
			@RequestParam(value="page2", defaultValue="1") int page2,
			@RequestParam(value="condition") String condition) throws Exception{
		
		int limit2=10;
		
		HttpSession session2 = request2.getSession();
		
		if(session2.getAttribute("limit2") != null) {
			limit2 = (Integer) session2.getAttribute("limit2");
		}
		
		if(request2.getParameter("limit2") != null) {
			limit2 = Integer.parseInt(request2.getParameter("limit2"));
			session2.setAttribute("limit2", limit2);
		}
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("limit2", limit2);
		map2.put("page2", page2);
		map2.put("condition", "%"+condition+"%");
		
		int listcount2= this.faqService.getFAQListCount2(map2);
		
		//총 페이지수
		int maxpage2 = (listcount2+limit2-1)/limit2;
		
		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등 ...);
		int startpage2 = ((page2-1)/limit2)+1;
		System.out.println("현재 페이지에 보여줄 시작 페이지 수 = " + startpage2);
		
		//현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등 ...);
		int endpage2 = startpage2+limit2-1;
		System.out.println("현재 페이지에 보여줄 마지막 페이지 수 = " + endpage2);
		
		if(endpage2>maxpage2) {
			endpage2=maxpage2;
		}
		
		List<FAQ> boardlist2 = faqService.getFAQList2(map2);	
		
		ModelAndView mv = new ModelAndView("/faq/faq_list");
		
		mv.addObject("condition", condition);
		mv.addObject("startpage2", startpage2);
		mv.addObject("endpage2", endpage2);
		mv.addObject("maxpage2", maxpage2);
		mv.addObject("page2", page2);
		mv.addObject("limit2", limit2);
		mv.addObject("listcount2", listcount2);
		mv.addObject("boardlist2", boardlist2);
		
		return mv;
	}
}

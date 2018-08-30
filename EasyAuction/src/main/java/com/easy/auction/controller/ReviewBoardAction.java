package com.easy.auction.controller;


import java.io.File;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.easy.auction.dao.ReviewBoardService;
import com.easy.auction.model.Review;


@Controller
public class ReviewBoardAction {
	
	@Autowired
	private ReviewBoardService ReviewBoardService;
	
//	private String saveFolder = 
//		"C:/Program Files/Apache Software Foundation/Tomcat 8.5/webapps/EasyAuction/resources/upload";
	
	private String saveFolder = "D:\\sts\\EasyAuction\\EasyAuction\\src\\main\\webapp\\resources\\upload";
	
//	private String saveFolder = "/Users/shane/eclipseworkspace/EasyAuction/src/main/webapp/resources/upload";
	
	@RequestMapping(value="/review_write.nhn")
	public ModelAndView review_write(Review review) {
		
		ModelAndView mv = new ModelAndView("review/review_write");
		mv.addObject("review", review);
		return mv;
	}
	
	@RequestMapping(value="/review_write_ok.nhn", method=RequestMethod.POST)
	public String review_write_ok(Review review) throws Exception {
		
		MultipartFile uploadfile = review.getUploadfile();
		
		
		if(!uploadfile.isEmpty()) {
			//원래 파일명 구해오기
			String fileName = uploadfile.getOriginalFilename();
			System.out.println("fileName = " + fileName);
			
			//원래 파일명 저장
			review.setEr_original(fileName);
			
			//생성할 폴더 이름 : 오늘 년+월+일
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR);
			int month = c.get(Calendar.MONTH)+1;
			int date = c.get(Calendar.DATE);
			String homedir = saveFolder+"/"+year+"-"+month+"-"+date;
			
			//파일 객체 생성합니다.
			File path1=new File(homedir);
			
			//폴더가 존재하는지 확인합니다.
			if(!(path1.exists())) {
				System.out.println("폴더 만들어요");
				path1.mkdir();
			}
			
			//난수를 구합니다.
			Random r = new Random();
			int random=r.nextInt(100000000);
			
			/*** 확장자 구하기 시작 ***/
			int index = fileName.lastIndexOf(".");
			//문자열에서 특정 문자열의 위치 값(index)를 반환한다.
			//indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면,
			//lastIndexOf는 마지막으로 발경되는 문자열을 index를 반환합니다.
			//(파일명에 점에 여러개가 있을 경우 맨 마지막에 발견되는 문자열의 위치를 리턴합니다.)
			System.out.println("index = " + index);
			
			String fileExtension = fileName.substring(index+1);
			System.out.println("fileExtension = " + fileExtension);
			/*** 확장자 구하기 끝 ***/
			
			//새로운 파일명을 저장
			String refileName = "review"+year+month+date+random+"."+fileExtension;
			System.out.println("refileName = "+ refileName);
			
			//오라클 디비에 저장될 레코드 값
			String fileDBName = "/"+year+"-"+month+"-"+date+"/"+refileName;
			System.out.println("fileDBName = " + fileDBName);
			
			//tranforTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder + fileDBName));
			//바뀐 파일명으로 저장
			review.setEr_file(fileDBName);
		}
		
		this.ReviewBoardService.reviewInsert(review); //저장 메서드 호출
		
		
		return "redirect:/review_list.nhn";
	}
	

	@RequestMapping(value="/review_list.nhn")
	public ModelAndView review_list( 
		@RequestParam(value="page", defaultValue="1")int page,
		@RequestParam(value="limit", required=false)Integer limit,
		@RequestParam(value="state", defaultValue="no")String state,
		HttpServletRequest request
		) throws Exception{//command 객체
	

	
	HttpSession session = request.getSession();
	
	if(limit != null) {
		session.setAttribute("limit", limit);
	} else {
		limit = 12;
	}
	if(session.getAttribute("limit")!=null) {
		limit=Integer.parseInt(session.getAttribute("limit").toString());
	}
	
	List<Review> reviewlist = new ArrayList<Review>();
	
	//총 리스트 수를 받아옵니다.
	int listcount=ReviewBoardService.getReviewListCount();
	reviewlist = ReviewBoardService.getReviewList(page,limit);
	
	int maxpage = (listcount+limit-1)/limit;
	int startpage = ((page-1) / 10) * 10 + 1 ;
	int endpage = startpage + 10 -1;
	if(endpage>maxpage) {
		endpage = maxpage;
	}
	
	ModelAndView mv;
	
	if(state.equals("ajax")) {
		mv = new ModelAndView("/review/review_list");
	} else {
		mv = new ModelAndView("/review/review_list");
	}
	
	/*if(session.getAttribute("id")==null) {
		mv = new ModelAndView("/member/loginForm");
	}*/
	mv.addObject("page", page);	//현재 페이지 수
	mv.addObject("maxpage", maxpage);	//최대 페이지 수
	mv.addObject("startpage", startpage);
	mv.addObject("endpage", endpage);
	mv.addObject("listcount", listcount);	//총 글의 수
	mv.addObject("reviewlist", reviewlist);
	mv.addObject("limit", limit);
	
	return mv;
}

	
	
	
	@RequestMapping(value="/review_cont.nhn")
	public ModelAndView review_cont(int num, int page, String state, HttpServletRequest request) 
			throws Exception{//command 媛앹껜
		
		HttpSession session = request.getSession();
		System.out.println("page : " + page);
		System.out.println("num = " + num);
		if(state.equals("cont")) {//내용 보기일때만
			ReviewBoardService.reviewHit(num);
		}
			Review review = ReviewBoardService.getReviewCont(num);
			ModelAndView mv = new ModelAndView();
			mv.addObject("reviewdata", review);
			mv.addObject("page", page);
			
		    if(state.equals("cont")) {//내용보기일때
		    	mv.setViewName("review/review_cont");//내용보기 페이지 설정
		    }else if(state.equals("edit")) {//수정폼
		          mv.setViewName("review/review_edit");
		    }else if(state.equals("del")) {//삭제폼
		          mv.setViewName("review/review_del");
		    }
		    
		    /*if(session.getAttribute("id")==null) {
				mv = new ModelAndView("/member/loginForm");
			}*/
		          return mv;
		    }
	
	
	
	//泥⑤��뙆�씪 �떎�슫濡쒕뱶
	@RequestMapping(value="/review_filedown.nhn")
	public void review_filedown_action(String filename, 
			@RequestParam("original") String originalFileName,
			HttpServletRequest request, HttpServletResponse response)throws Exception{
		
		request.setCharacterEncoding("utf-8");
		
		byte fileByte[] = FileUtils.readFileToByteArray(
				new File(saveFolder + filename));
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\""
				+ URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();

 }
	
     

	//由щ럭 �궘�젣
	@RequestMapping(value="/review_del.nhn", method=RequestMethod.POST)
	public String review_del(Review review, int page,
			HttpServletResponse response)
			throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String passcheck = ReviewBoardService.getReviewCont(review.getEr_num()).getEr_pass();
		
		if(passcheck.equals(review.getEr_pass())) {
			ReviewBoardService.deleteReview(review.getEr_num());
			out.println("<script>");
			out.println("alert('삭제가 완료되었습니다.')");
			out.println("location.href='./review_list.nhn?&page="+page+"';");
			out.println("</script>");
		} else{
			
			out.println("<script>");
			out.println("alert('비밀번호가 틀렸습니다.')");
			out.println("history.back();");
			out.println("</script>");
		}
		return null;
	}
	
	
	@RequestMapping(value="/review_edit_ok.nhn", method=RequestMethod.POST)
	public String review_edit_ok(HttpServletRequest request,Review review, int page,HttpServletResponse response) throws Exception{//command 객체
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		Review bcont = ReviewBoardService.getReviewCont(review.getEr_num());
		String passcheck = ReviewBoardService.getReviewCont(review.getEr_num()).getEr_pass();
		
		if(passcheck.equals(review.getEr_pass())) {
			MultipartFile uploadfile = review.getUploadfile();
			
		
			if(!uploadfile.isEmpty()) {
				
				File DelFile= new File(saveFolder+bcont.getEr_file());
				if(DelFile.exists()) {
					DelFile.delete();//기존 이진파일을 삭제
				}
				String fileName = uploadfile.getOriginalFilename();
				review.setEr_original(fileName);
				
				Calendar c = Calendar.getInstance();
				int year = c.get(Calendar.YEAR);
				int month = c.get(Calendar.MONTH);
				int date = c.get(Calendar.DATE);
				String homedir = saveFolder+"/"+year+"-"+month+"-"+date;
				
				//파일 객체 생성합니다.
				File path1=new File(homedir);
				
				//폴더가 존재하는지 확인합니다.
				if(!(path1.exists())) {
					System.out.println("폴더 만들어요");
					path1.mkdir();
				}
				Random r = new Random();
				int random=r.nextInt(100000000);
				
				int index = fileName.lastIndexOf(".");
				
				String fileExtension = fileName.substring(index+1);
				String refileName = "review"+year+month+date+random+"."+fileExtension;
				String fileDBName = "/"+year+"-"+month+"-"+date+"/"+refileName;
				System.out.println("fileDBName = " + fileDBName);
				System.out.println("review.geter_original()="+review.getEr_original());
				uploadfile.transferTo(new File(saveFolder + fileDBName));
				review.setEr_file(fileDBName);
			}
			ReviewBoardService.editReview(review);
			out.println("<script>");
			out.println("alert('수정이 완료되었습니다.')");
			out.println("location.href='./review_cont.nhn?num="+review.getEr_num()+
					"&page="+page+"&state=cont';");
			out.println("</script>");
			
			
		} else{

			out.println("<script>");
			out.println("alert('비밀번호가 틀렸습니다.')");
			out.println("history.back();");
			out.print("</script>");
		}
		return null;
	}
	//게시물 검색하기
		@RequestMapping(value="/review_find_ok.nhn")
		public ModelAndView review_search(
				@RequestParam(value="find_name", required=false)String find_name,
				@RequestParam(value="find_field", required=false)String find_field,
				@RequestParam(value="page", defaultValue="1")int page,
				@RequestParam(value="limit", required=false)Integer limit,
				@RequestParam(value="state", defaultValue="no")String state,
				HttpServletRequest request
				) throws Exception{//command 객체
			
			HttpSession session = request.getSession();
			if(limit != null) {
				session.setAttribute("limit", limit);
			} else {
				limit = 10;
			}
			if(session.getAttribute("limit")!=null) {
				limit=Integer.parseInt(session.getAttribute("limit").toString());
			}
			
			if(find_name != null) {
				session.setAttribute("find_name", find_name);
			}
			
			if(session.getAttribute("find_name")!=null) {
				find_name=session.getAttribute("find_name").toString();
			}
			if(find_field != null) {
				session.setAttribute("find_field", find_field);
			}
			
			if(session.getAttribute("find_field")!=null) {
				find_field=session.getAttribute("find_field").toString();
			}
			
			
			
			Map m = new HashMap();
			m.put("page", page);
			m.put("limit", limit);
			m.put("find_field", find_field);
			m.put("find_name", find_name);
			
			List<Review> reviewlist = new ArrayList<Review>();
			
			//총 리스트 수를 받아옵니다.
			int listcount=ReviewBoardService.getReviewListCount2(m);
			reviewlist = ReviewBoardService.getReviewList2(m);

			int maxpage = (listcount+limit-1)/limit;
			int startpage = ((page-1) / 10) * 10 + 1 ;
			int endpage = startpage + 10 -1;
			if(endpage>maxpage) {
				endpage = maxpage;
			}
			
			ModelAndView mv =  new ModelAndView("/review/review_find");
			
			if(state.equals("ajax")) {
				mv = new ModelAndView("/review/review_find");
			} else {
				mv = new ModelAndView("/review/review_find");
			}
			
			System.out.println("limit = " + limit);
			System.out.println("page = " + page);
			mv.addObject("find_field", find_field);
			mv.addObject("find_name", find_name);
			mv.addObject("page", page);	//현재 페이지 수
			mv.addObject("maxpage", maxpage);	//최대 페이지 수
			mv.addObject("startpage", startpage);
			mv.addObject("endpage", endpage);
			mv.addObject("listcount", listcount);	//총 글의 수
			mv.addObject("reviewlist", reviewlist);
			mv.addObject("limit", limit);

			return mv;
		}
	
	
	
	
	
}

package com.easy.auction.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.easy.auction.dao.SpecialBoardService;
import com.easy.auction.model.Attent;
import com.easy.auction.model.BoardBean;
import com.easy.auction.model.Category;
import com.easy.auction.model.SHouseList;

@Controller
public class SpecialBoardAction {
	
	@Autowired
	private SpecialBoardService specialService;
	
//	private String saveFolder = 
//	"C:/Program Files/Apache Software Foundation/Tomcat 8.5/webapps/EasyAuction/resources/upload";

	private String saveFolder = "D:\\sts\\EasyAuction\\EasyAuction\\src\\main\\webapp\\resources\\upload";

//	private String saveFolder = "/Users/shane/eclipseworkspace/EasyAuction/src/main/webapp/resources/upload";
	
	//상품 입력폼
	@RequestMapping(value="/special_product_write.nhn")
	public ModelAndView special_product_write(HttpServletRequest request) throws Exception {
		String id = (String)request.getSession().getAttribute("id");
		
		ModelAndView mv = new ModelAndView("special/special_product_write");
		List<Category> bigct = specialService.getBigCategory();
		mv.addObject("id", id);
		mv.addObject("bigct",bigct);
		return mv; //board 폴더의 board_write.jsp 뷰 페이지가 실행
	}
	 // 다중파일업로드
    @RequestMapping(value = "/file_uploader_html51.nhn",method = RequestMethod.POST)
    @ResponseBody
    public String multiplePhotoUpload(HttpServletRequest request) {
        // 파일정보
        StringBuffer sb = new StringBuffer();
        try {
            // 파일명을 받는다 - 일반 원본파일명
            String oldName = request.getHeader("file-name");
            // 파일 기본경로 _ 상세경로
            String filePath = "D:\\sts\\EasyAuction\\EasyAuction\\src\\main\\webapp\\resources\\photoUpload";
//            String filePath = "/Users/shane/eclipseworkspace/EasyAuction/src/main/webapp/resources/photoUpload";
            String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss")
                          .format(System.currentTimeMillis()))
                          .append(UUID.randomUUID().toString())
                          .append(oldName.substring(oldName.lastIndexOf("."))).toString();
            System.out.println(saveName);
            InputStream is = request.getInputStream();
            OutputStream os = new FileOutputStream(filePath +"/"+ saveName);
            
            int numRead;
            byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
            while ((numRead = is.read(b, 0, b.length)) != -1) {
                os.write(b, 0, numRead);
            }
            os.flush();
            os.close();
            // 정보 출력
            sb = new StringBuffer();
            sb.append("&bNewLine=true")
              .append("&sFileName=").append(oldName)
              .append("&sFileURL=").append("http://localhost:8088/auction/resources/photoUpload/")
        .append(saveName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb.toString();
    }
	
	//상품 입력
	@RequestMapping(value="/special_product_write_ok.nhn", method=RequestMethod.POST)
	public String special_product_write_ok(BoardBean board, String start_hour,
			String start_minute, Category ct) throws Exception {
		
		int ey_categorynum = specialService.get_category_num(ct);
		board.setEb_choicedate(board.getEb_choicedate()+" " + start_hour+":"+start_minute);
		
		MultipartFile uploadfile = board.getUploadfile();
		if(!uploadfile.isEmpty()) {
			String fileName = uploadfile.getOriginalFilename();
			System.out.println("fileName = " + fileName);
			board.setEb_original(fileName);
			
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR);
			int month = c.get(Calendar.MONTH)+1;
			int date = c.get(Calendar.DATE);
			String homedir = saveFolder+"/"+year+"-"+month+"-"+date;
			
			File path1=new File(homedir);
			
			if(!(path1.exists())) {
				path1.mkdir();
			}
			
			Random r = new Random();
			int random=r.nextInt(100000000);
			
			int index = fileName.lastIndexOf(".");
			
			String fileExtension = fileName.substring(index+1);
			
			String refileName = "board"+year+month+date+random+"."+fileExtension;
			
			String fileDBName = "/"+year+"-"+month+"-"+date+"/"+refileName;
			uploadfile.transferTo(new File(saveFolder + fileDBName));
			board.setEb_file(fileDBName);
		}
		
		
		Calendar c = Calendar.getInstance();
		String year = String.valueOf(c.get(Calendar.YEAR));
		String month = String.valueOf(c.get(Calendar.MONTH) + 1);
		String date = String.valueOf(c.get(Calendar.DATE));
		
		year = year.substring(2, 4);
		if( month.length() == 1) {
			month = "0" + month;
		}
		
		if(date.length() == 1 ) {
			date = "0" + date;
		}
		int ran = specialService.itemnum_increase();
		String increase = "";
		if(ran < 10) {
			increase = "0" + ran;
		}else {
			increase = Integer.toString(ran);
		}
		
		System.out.println("increase = " + increase);
		
		String itemnum = "SP"+year+month+date+increase;
		
		
		board.setEb_itemnum(itemnum);
		board.setEy_categorynum(ey_categorynum);
		this.specialService.insertBoard(board); 
		
		return "redirect:/special_product_list.nhn?eb_state=wait";
	}
	
	// 대기/검증중/완료 리스트
	@RequestMapping(value="/special_product_list.nhn")
	public ModelAndView special_product_list(
				@RequestParam(value="page", defaultValue="1")int page,
				@RequestParam(value="limit", required=false)Integer limit,
				@RequestParam(value="state", defaultValue="no")String state,
				@RequestParam(value="eb_state", required=false, defaultValue="wait")String eb_state, 
				HttpServletRequest request
				) throws Exception{
			
		
			HttpSession session = request.getSession();
			
			if(limit != null) {
				session.setAttribute("limit", limit);
			} else {
				limit = 10;
			}
			if(session.getAttribute("limit")!=null) {
				limit=Integer.parseInt(session.getAttribute("limit").toString());
			}
			
			List<BoardBean> boardlist = new ArrayList<BoardBean>();
			
			
			int listcount=specialService.getListCount(eb_state);
			boardlist = specialService.getBoardList(page,limit,eb_state);

			int maxpage = (listcount+limit-1)/limit;
			int startpage = ((page-1) / 10) * 10 + 1 ;
			int endpage = startpage + 10 -1;
			if(endpage>maxpage) {
				endpage = maxpage;
			}
			
			ModelAndView mv = new ModelAndView("/special/special_product_list");
			
			
			if(session.getAttribute("id")==null) {
				mv = new ModelAndView("/member/member_login");
			}
			mv.addObject("page", page);	
			mv.addObject("maxpage", maxpage);
			mv.addObject("startpage", startpage);
			mv.addObject("endpage", endpage);
			mv.addObject("listcount", listcount);	
			mv.addObject("list", boardlist);
			mv.addObject("limit", limit);
			mv.addObject("eb_state", eb_state);

			return mv;
		}
	
	// 상품 상세보기
	@RequestMapping(value="/special_product_cont.nhn")
	public ModelAndView board_cont(String eb_itemnum, int page, String state,HttpServletRequest request
			)
			throws Exception{
		HttpSession session = request.getSession();
		
		if(state.equals("cont")) {
			specialService.boardHit(eb_itemnum);
		}
		
		BoardBean board = specialService.auction_info(eb_itemnum);
		ModelAndView mv = new ModelAndView();
		mv.addObject("boarddata", board);
		mv.addObject("page", page);
		
	    if(state.equals("cont")) {
	    	mv.setViewName("special/special_product_cont");
	    }else if(state.equals("edit")) {
	          mv.setViewName("special/special_product_edit");
	    }else if(state.equals("del")) {
	          mv.setViewName("special/special_product_del");
	          
	    }else if(state.equals("wait")) {
	          mv.setViewName("special/special_product_wait");
	    }
	    if(session.getAttribute("id")==null) {
			mv = new ModelAndView("/member/loginForm");
		}
		return mv;
	}
	//첨부파일 다운로드
	@RequestMapping(value="/special_filedown.nhn")
	public void board_filedown_action(String filename, 
			@RequestParam("original") String originalFileName,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception{
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
	
	//게시물 삭제
	@RequestMapping(value="/special_product_del.nhn", method=RequestMethod.POST)
	public String board_delete(BoardBean board, int page,
			HttpServletResponse response,
			HttpServletRequest request)
			throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int passcheck = specialService.auction_info(board.getEb_itemnum()).getEb_pass();
		
		if(passcheck==board.getEb_pass()) {
			specialService.deleteBoard(board.getEb_itemnum());
			out.println("<script>");
			out.println("alert('게시물 삭제됨.')");
			out.println("location.href='./special_product_list.nhn?&page="+page+"';");
			out.println("</script>");
		} else{
			
			out.println("<script>");
			out.println("alert('삭제안됨.')");
			out.println("history.back();");
			out.println("</script>");
		}
		return null;
	}
	
	//게시물 수정하기
	@RequestMapping(value="/special_product_edit_ok.nhn", method=RequestMethod.POST)
	public String boardUpdateAction(BoardBean board, int page,HttpServletResponse response,
			HttpServletRequest request) throws Exception{//command ��ü
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		BoardBean bcont = specialService.auction_info(board.getEb_itemnum());
		int passcheck = specialService.auction_info(board.getEb_itemnum()).getEb_pass();
		
		if(passcheck == board.getEb_pass()) {
			MultipartFile uploadfile = board.getUploadfile();
			
			if(!uploadfile.isEmpty()) {
				File DelFile= new File(saveFolder+bcont.getEb_file());
				if(DelFile.exists()) {
					DelFile.delete();//���� ���������� ����
				}
				String fileName = uploadfile.getOriginalFilename();
				board.setEb_original(fileName);
				
				Calendar c = Calendar.getInstance();
				int year = c.get(Calendar.YEAR);
				int month = c.get(Calendar.MONTH);
				int date = c.get(Calendar.DATE);
				String homedir = saveFolder+"/"+year+"-"+month+"-"+date;
				
				File path1=new File(homedir);
				
				if(!(path1.exists())) {
					path1.mkdir();
				}
				Random r = new Random();
				int random=r.nextInt(100000000);
				
				int index = fileName.lastIndexOf(".");
				
				String fileExtension = fileName.substring(index+1);
				String refileName = "board"+year+month+date+random+"."+fileExtension;
				String fileDBName = "/"+year+"-"+month+"-"+date+"/"+refileName;
				System.out.println("fileDBName = " + fileDBName);
				System.out.println("board.getBoard_original()="+board.getEb_original());
				uploadfile.transferTo(new File(saveFolder + fileDBName));
				board.setEb_file(fileDBName);
			}
			specialService.editBoard(board);
			out.println("<script>");
			out.println("alert('수정됨.')");
			out.println("location.href='./special_product_cont.nhn?eb_itemnum="+board.getEb_itemnum()+
					"&page="+page+"&state=cont';");
			out.println("</script>");
			
			
		} else{

			out.println("<script>");
			out.println("alert('수정안됨.')");
			out.println("history.back();");
			out.print("</script>");
		}
		return null;
	}
	
	// 검증중으로 변경
	@RequestMapping(value="/special_product_wait.nhn")
	@ResponseBody
	public String price_renewal(BoardBean board, String page, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		specialService.request_State(board);
		
		out.println("<script>");
		out.println("location.href='special_product_cont.nhn?eb_itemnum="+board.getEb_itemnum()+"&page="+page+"&state=cont'");
		out.print("</script>");
		return null;
	}
	
	
	
	//감정끝난 특별 경매 입력폼이동
	@RequestMapping(value="/special_product_open_ready.nhn")
	public ModelAndView special_auction_write(String eb_itemnum) throws Exception {
		
		BoardBean board = specialService.auction_info(eb_itemnum);
		List<SHouseList> list = specialService.get_SHouseList();
		
		ModelAndView mv = new ModelAndView("special/special_product_open_ready");
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHH");
		
		for(int i=0; i<list.size(); i++) {
			System.out.println("dfd : " + list.get(i).getEsl_date());
			//현재시간 계산해서 현재시간 이후인 경매장은 설정해주고
			if(Integer.parseInt(list.get(i).getEsl_date().replace("-","").replace(" ", "").substring(0,10)) > Integer.parseInt(sdf.format(date))) {
				System.out.println("hh: " + list.get(i).getEsl_date());
				String a =  Integer.toString(Integer.parseInt(list.get(i).getEsl_date().substring(5, 7)));
				String b =  Integer.toString(Integer.parseInt(list.get(i).getEsl_date().substring(8, 10)));
				list.get(i).setEsl_date(a+b);
				System.out.println(list.get(i).getEsl_date());
				//현재 시간 이전인 경매장은 0으로 값처리해서 값 연결안되서 달력에 안나오도록 설정
			} else {
				list.get(i).setEsl_date("0");
				System.out.println(list.get(i).getEsl_date());
			}

		}
		mv.addObject("list",list);
		mv.addObject("board",board);
		return mv;
	}
	
	//감정끝난 특별 경매 입력
	@RequestMapping(value="/special_product_open_ready_ok.nhn", method=RequestMethod.POST)
	public String special_auction_write_ok(
			BoardBean board,
			@RequestParam(value="audate_text", required=false)String audate_text,
			@RequestParam(value="audate_time_text", required=false)String audate_time_text,
			SHouseList shl) throws Exception {
		board.setEb_audate(audate_text+" " + audate_time_text);
		System.out.println("board.getEb_audate() = " +board.getEb_audate());
		System.out.println("eb_itemnum : " + shl.getEb_itemnum());
		System.out.println("eb_itemname : " + shl.getEb_itemname());
		System.out.println("eb_stprice : " + shl.getEb_stprice());
		specialService.specialStateUpdate(board);
		shl.setEsl_date(audate_text+" " + audate_time_text);
		specialService.SHouse_update(shl);
		return "redirect:/special_auction_list.nhn";
	}

	//상품 리스트뽑아오기
	@RequestMapping(value="/special_auction_list.nhn")
	public ModelAndView special_auction_list(
			@RequestParam(value="ey_bigcategory", required=false, defaultValue="")String ey_bigcategory,
			@RequestParam(value="ey_smallcategory", required=false, defaultValue="")String ey_smallcategory,
			@RequestParam(value="range", required=false, defaultValue="fastopen")String range) throws Exception{//command 객체
		
		
		if(ey_bigcategory.equals("")) {
			ey_bigcategory = null;
		}
		if(ey_smallcategory.equals("")) {
			ey_smallcategory = null;
		}
		
		List<Category> bigct = specialService.getBigCategory();
		
		HashMap hm = new HashMap();
		hm.put("big", ey_bigcategory);
		hm.put("small", ey_smallcategory);
		hm.put("range", range);
		
		List<BoardBean> list  = specialService.getAuctionList();
		List<BoardBean> ready_list  = specialService.category_auction_ready_list(hm);
		
		
		ModelAndView mv = new ModelAndView("special/auction_list");
		mv.addObject("list", list);
		mv.addObject("ready_list", ready_list);
		mv.addObject("bigct", bigct);
		mv.addObject("ey_bigcategory", ey_bigcategory);
		mv.addObject("ey_smallcategory", ey_smallcategory);
		mv.addObject("range", range);
		return mv;
	}

	
	//카테고리 뽑아오기
	@RequestMapping(value="/special_product_category.nhn", method=RequestMethod.POST)
	public String special_product_category() throws Exception {
		return "redirect:/board_list.nhn";
	}	
	
	// 상품 찜하기
	@RequestMapping(value="/special_product_basket.nhn")
	@ResponseBody
	public int special_product_basket(Attent at, HttpServletRequest request) throws Exception{
		
		String id = (String)request.getSession().getAttribute("id");
		at.setEa_kind("특별");
		at.setEa_user(id);

		Attent at2 = specialService.basket_check(at);
		
		if(at2 == null) {
			specialService.special_product_basket(at);
			specialService.basket_increase(at.getEb_itemnum());
			
		} else {
			specialService.special_product_basket_cancel(at);
			specialService.basket_decrease(at.getEb_itemnum());
		}
		
		BoardBean board = specialService.auction_info(at.getEb_itemnum());
		System.out.println("board.getEb_attcount(); = " + board.getEb_attcount());
		return board.getEb_attcount();
	}

	
	/*특수경매 금일오픈으로 변경*/
	@RequestMapping(value="/special_today_open.nhn")
	public String special_today_open(String itemnum, HttpServletResponse response,
			@RequestParam(value="ey_bigcategory", required=false)String ey_bigcategory,
			@RequestParam(value="ey_smallcategory", required=false)String ey_smallcategory,
			@RequestParam(value="range", required=false, defaultValue="fastopen")String range) throws Exception {
		specialService.today_open(itemnum);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("location.href='special_auction_list.nhn?ey_smallcategory="+ey_smallcategory+"&ey_bigcategory="+ey_bigcategory+"&range="+range+"'");
		out.println("</script>");
		
		return null;
	}
	
	/*특수경매 오픈*/
	@RequestMapping(value="/special_open.nhn")
	public String special_open(String itemnum, HttpServletResponse response,
			@RequestParam(value="ey_bigcategory", required=false)String ey_bigcategory,
			@RequestParam(value="ey_smallcategory", required=false)String ey_smallcategory,
			@RequestParam(value="range", required=false, defaultValue="fastopen")String range) throws Exception {
		specialService.realOpen(itemnum);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("location.href='special_auction_list.nhn?&ey_smallcategory="+ey_smallcategory+"&ey_bigcategory="+ey_bigcategory+"&range="+range+"'");
		out.println("</script>");
		
		return null;
	}
	
	/*인포에서 오픈할 경우*/
	@RequestMapping(value="/special_auction_info_open.nhn")
	public String special_auction_info_open(String itemnum, HttpServletResponse response,
			@RequestParam(value="ey_bigcategory", required=false)String ey_bigcategory,
			@RequestParam(value="ey_smallcategory", required=false)String ey_smallcategory,
			@RequestParam(value="range", required=false, defaultValue="fastopen")String range) throws Exception {
		specialService.realOpen(itemnum);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("location.href='special_auction_info.nhn?itemnum="+itemnum+"&ey_smallcategory="+ey_smallcategory+"&ey_bigcategory="+ey_bigcategory+"&range="+range+"'");
		out.println("</script>");
		
		return null;
	}
	
	/*특수경매 물품정보*/
	@RequestMapping(value="/special_auction_info.nhn")
	public ModelAndView special_auction_info(String itemnum,
			@RequestParam(value="ey_bigcategory", required=false)String ey_bigcategory,
			@RequestParam(value="ey_smallcategory", required=false)String ey_smallcategory,
			@RequestParam(value="range", required=false, defaultValue="fastopen")String range,
			HttpServletRequest request) throws Exception {
		
		BoardBean board = specialService.auction_info(itemnum);
		specialService.boardHit(itemnum);
		String id = (String)request.getSession().getAttribute("id");
		
		System.out.println("board.getEb_state() = " +board.getEb_state());
		Attent at = new Attent();
		at.setEa_user(id);
		at.setEb_itemnum(itemnum);
		
		Attent at2 = specialService.basket_check(at);
		String basket_check ="";
		if(at2 == null) {
			basket_check = "no";
		} else {
			basket_check = "yes";
		}
		
		ModelAndView mv = new ModelAndView("special/auction_info");
		
		
		
		mv.addObject("board", board);
		mv.addObject("ey_bigcategory", ey_bigcategory);
		mv.addObject("ey_smallcategory", ey_smallcategory);
		mv.addObject("range", range);
		mv.addObject("basket_check", basket_check);
		return mv;
	}
	
	/*소분류 카테고리 출력*/
	@RequestMapping(value="/get_small_category.nhn")
	public ModelAndView get_small_category(String category) throws Exception {
		ModelAndView mv = new ModelAndView("special/auction_small_category");
		List<Category> small = specialService.get_small_category(category);
		mv.addObject("small", small);
		return mv;
	}
	
	/* 소분류 카테고리 select박스*/
	@RequestMapping(value="/special_small_category.nhn")
	public ModelAndView specail_small_category(String category) throws Exception{
		ModelAndView mv = new ModelAndView("special/special_small_category");
		System.out.println("category = "+ category);
		List<Category> small = specialService.get_small_category(category);
		mv.addObject("small",small);
		return mv;
	}
	
	/* 재검증요청*/
	@RequestMapping(value="/special_reverify.nhn")
	public String special_reverify(String itemnum) throws Exception{
		specialService.reverify(itemnum);
		return "redirect:/special_auction_list.nhn";
	}
	
	/* 날짜지나서 경매종료*/
	@RequestMapping(value="/special_finish.nhn")
	public String special_finish(String itemnum, HttpServletResponse response,
			@RequestParam(value="ey_bigcategory", required=false)String ey_bigcategory,
			@RequestParam(value="ey_smallcategory", required=false)String ey_smallcategory,
			@RequestParam(value="range", required=false, defaultValue="fastopen")String range) throws Exception {
		specialService.special_finish(itemnum);
		
		System.out.println("itemnum = " + itemnum);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("location.href='special_auction_list.nhn?&ey_smallcategory="+ey_smallcategory+"&ey_bigcategory="+ey_bigcategory+"&range="+range+"'");
		out.println("</script>");
		
		return null;
	}
	
	/*인포에서 종료할 경우*/
	@RequestMapping(value="/special_auction_info_finish.nhn")
	public String special_auction_info_finish(String itemnum, HttpServletResponse response,
			@RequestParam(value="ey_bigcategory", required=false)String ey_bigcategory,
			@RequestParam(value="ey_smallcategory", required=false)String ey_smallcategory,
			@RequestParam(value="range", required=false, defaultValue="fastopen")String range) throws Exception {
		specialService.special_finish(itemnum);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('물품번호 "+itemnum+"의 경매가 종료되었습니다.')");
		out.println("location.href='special_auction_list.nhn?&ey_smallcategory="+ey_smallcategory+"&ey_bigcategory="+ey_bigcategory+"&range="+range+"'");
		out.println("</script>");
		return null;
	}	
	
}

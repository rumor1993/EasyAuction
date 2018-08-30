package com.easy.auction.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.easy.auction.dao.CommonBoardService;
import com.easy.auction.model.Attent;
import com.easy.auction.model.BoardBean;
import com.easy.auction.model.Category;
import com.easy.auction.model.GHouse;
import com.easy.auction.model.PList;
import com.easy.auction.model.SList;

@Controller
public class CommonBoardAction {

	@Autowired
	private CommonBoardService commonService;

//   private String saveFolder = 
//   "C:/Program Files/Apache Software Foundation/Tomcat 8.5/webapps/EasyAuction/resources/upload";

//   private String saveFolder = "/Users/shane/eclipseworkspace/EasyAuction/src/main/webapp/resources/upload";

	private String saveFolder = "D:\\sts\\EasyAuction\\EasyAuction\\src\\main\\webapp\\resources\\upload";

	// 상품 입력
	@RequestMapping(value = "/common_product_write.nhn")
	@ResponseBody
	public Object common_product_write(@RequestParam(value = "categoryname", defaultValue = "") String categoryname,
			@RequestParam(value = "state", defaultValue = "") String state) throws Exception {

		// 카테고리 불러오기
		List<Category> category = this.commonService.getCategory(categoryname);

		ModelAndView mv = new ModelAndView("common/common_product_write");
		mv.addObject("category", category);

		if (state.equals("ajax")) {
			return category;
		}

		return mv; // board 폴더의 board_write.jsp 뷰 페이지가 실행
	}

	// 상품 입력
	@RequestMapping(value = "/common_product_write_ok.nhn", method = RequestMethod.POST)
	public String common_product_write_ok(BoardBean board, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		MultipartFile uploadfile = board.getUploadfile();
		System.out.println(board.getEb_cont());
		board.setEb_cont(board.getEb_cont().toString());
		System.out.println(board.getEy_categorynum() + "으으으으으응");
		board.setEy_categorynum(board.getEy_categorynum());
		board.setEb_state("대기");

		// 생성할 폴더 이름 : 오늘 년+월+일
		Calendar c = Calendar.getInstance();
		String year = String.valueOf(c.get(Calendar.YEAR)); // 오늘 년도를 구합니다.
		String month = String.valueOf(c.get(Calendar.MONTH) + 1); // 오늘 월을 구합니다.
		String date = String.valueOf(c.get(Calendar.DATE)); // 오늘 일을 구합니다.

		Random r = new Random();
		int random = r.nextInt(100000000);

		if (!uploadfile.isEmpty()) {
			// 원래 파일명 구해오기
			String fileName = uploadfile.getOriginalFilename();

			// 원래 파일명 저장
			board.setEb_original(fileName);

			String homedir = saveFolder + "/" + year + "-" + month + "-" + date;

			// 파일 객체를 생성합니다.
			File path1 = new File(homedir);

			// 폴더가 존재하는지 확인합니다.
			if (!(path1.exists())) {
				path1.mkdirs();
			}
			// 확장자 구하기 시작
			int index = fileName.lastIndexOf(".");
			// 문자열에서 특정 문자열의 위치 값(index)를 반환합니다.
			// indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면,
			// lastIndexOf는 마지막으로 발견되는 문자열의 index를 반환합니다.
			// (파일명에 점이 여러개 있을 경우 맨 마지막에 발견디는 문자열의 위치를 리턴합니다.)

			String fileExtension = fileName.substring(index + 1);

			// 새로운 파일명을 저장
			String refileName = "common" + year + month + date + random + "." + fileExtension;

			// 오라클 디비에 저장될 값
			String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;

			// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder + fileDBName));

			// 바뀐 파일명 저장
			board.setEb_file(fileDBName);
		}

		// 물품명 일반물품(CommonProduct) CP + 년월일 + 랜덤 4자리
		random = r.nextInt(99);
		String RandomVal = "";
		if (month.length() == 1) {
			month = "0" + month;
		}
		if (date.length() == 1) {
			date = "0" + date;
		}
		if (random < 10) {
			RandomVal = "0" + random;
		} else {
			RandomVal = String.valueOf(random);
		}

		// 물품명 넣기 (중복제거하기)
		boolean check_itemnum = true;
		while (check_itemnum) {
			board.setEb_itemnum("CP" + year.substring(2) + month + date + RandomVal);
			String board_itemnumConfir = this.commonService.Check_itemnum(board.getEb_itemnum());
			if (board_itemnumConfir == null) { // 값이없다면 중복이 아니므로 while문 종료
				check_itemnum = false;
			} else {
				check_itemnum = true;
			}
		}

		// 판매자 ID 넣기
		board.setEm_id(id);

		// 일반상품 구분
		board.setEb_kind("일반");

		// 상품값 DB에 넣기
		this.commonService.commonInsert(board);

		return "redirect:/common_product_list_img.nhn";
	}

	// 카테고리 뽑아오기
	@RequestMapping(value = "/common_product_category.nhn", method = RequestMethod.POST)
	public String common_product_category() throws Exception {
		return "redirect:/board_list.nhn";
	}

	// 상품 리스트뽑아오기
	@RequestMapping(value = "/common_product_list_img.nhn")
	@ResponseBody
	public ModelAndView common_product_list_img(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "start", defaultValue = "0") int start,
			@RequestParam(value = "state", defaultValue = "empty") String state,
			@RequestParam(value = "orderby", defaultValue = "") String orderby,
			@RequestParam(value = "end", defaultValue = "7") int end,
			@RequestParam(value = "find_name", defaultValue = "") String find_name,
			@RequestParam(value = "find_field", defaultValue = "") String find_field,
			@RequestParam(value = "bigcategory", defaultValue = "") String bigcategory,
			@RequestParam(value = "smallcategory", defaultValue = "") String smallcategory) throws Exception {// command
																												// 객체

		ModelAndView mv = new ModelAndView("common/common_board_img_list");

		System.out.println("bigcategory : " + bigcategory);
		System.out.println("smallcategory : " + smallcategory);

		System.out.println(orderby);
		Map m = new HashMap();
		m.put("page", page);
		m.put("orderby", orderby);
		m.put("page", page);
		m.put("find_field", find_field);
		m.put("find_name", "%" + find_name + "%");/*
													 * m.put("bigcategory", "%"+bigcategory+"%"); m.put("smallcategory",
													 * "%"+smallcategory+"%");
													 */

		// 검색 기준이 들어간 리스트 카운트

		int listcount = this.commonService.getListCount3(m);

		// 검색기준으로 찾은 보드리스트
		List<BoardBean> boardlist = this.commonService.getBoardList3(m);

		mv.addObject("listcount", listcount);
		mv.addObject("boardlist", boardlist);
		mv.addObject("page", page);
		mv.addObject("end", end);
		mv.addObject("start", start);
		mv.addObject("state", orderby);
		mv.addObject("find_field", find_field);
		mv.addObject("find_name", find_name);
		mv.addObject("complete", "성공");

		if (!state.equals("complete")) {
			listcount = this.commonService.salesCompleteListConut(m);

			boardlist = this.commonService.getsalesCompleteList3(m);

			mv.addObject("listcount", listcount);
			mv.addObject("boardlist", boardlist);
			mv.addObject("page", page);
			mv.addObject("end", end);
			mv.addObject("start", start);
			mv.addObject("state", orderby);
			mv.addObject("find_field", find_field);
			mv.addObject("find_name", find_name);
			mv.addObject("complete", "실패");
		}
		// 무한스크롤 버튼

		if (state.equals("complete2")) {
			listcount = this.commonService.salesCompleteListConut(m);

			boardlist = this.commonService.getsalesCompleteList3(m);

			mv.addObject("listcount", listcount);
			mv.addObject("boardlist", boardlist);
			mv.addObject("page", page);
			mv.addObject("end", end);
			mv.addObject("start", start);
			mv.addObject("state", orderby);
			mv.addObject("find_field", find_field);
			mv.addObject("find_name", find_name);
			mv.addObject("complete", "성공");
		}

		if (request.getParameter("addclick") != null) {
			System.out.println("start : " + start);
			System.out.println("end : " + end);
			mv.setViewName("common/common_board_img_list_ajax");
		}

		return mv;

	}

	// 상품 리스트뽑아오기
	@RequestMapping(value = "/common_product_list.nhn")
	@ResponseBody
	public ModelAndView common_product_list(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "orderby", defaultValue = "empty") String orderby,
			@RequestParam(value = "page", defaultValue = "1") int page) throws Exception {// command 객체
		ModelAndView mv = new ModelAndView("common/common_board_list");

		int limit = 10;

		if (!orderby.equals("empty")) {

			Map m = new HashMap();
			m.put("page", page);
			m.put("orderby", orderby);
			m.put("limit", limit);
			m.put("state", "order");

			// 검색 기준이 들어간 리스트 카운트
			int listcount = this.commonService.getListCount3(m);

			// 검색기준으로 찾은 보드리스트
			List<BoardBean> boardlist = this.commonService.getBoardList3(m);
		} else {

			// 리스트의 수를 구하는 메서드
			int listcount = this.commonService.getListCount();

			// 페이징 처리 부분
			int maxpage = (listcount + limit - 1) / limit; // 총페이지 수
			int startpage = ((page - 1) / limit) * limit + 1; // 현재 페이지에 표시할 시작페이지
			int endpage = startpage + limit - 1; // 현재 페이지에 표시할 마지막 페이지 수

			if (endpage > maxpage)
				endpage = maxpage;
			if (endpage < page)
				page = endpage;

			// 보여줄 게시글 수
			int end = 7;
			// 한 페이지에 보여줄 리스트 수
			List<BoardBean> boardlist = this.commonService.getBoardList(page, limit);

			// 무한스크롤 버튼

			if (request.getParameter("addclick") != null) {
				end = end + 5;
				mv.setViewName("common/common_board_img_list_ajax");
			}

			mv.addObject("startpage", startpage);
			mv.addObject("endpage", endpage);
			mv.addObject("listcount", listcount);
			mv.addObject("page", page);
			mv.addObject("end", end);
			mv.addObject("maxpage", maxpage);
			mv.addObject("boardlist", boardlist);
		}
		return mv;

	}

	// 상품 상세보기
	@RequestMapping(value = "common_product_cont.nhn")
	public ModelAndView common_product_cont(BoardBean board, @RequestParam(value = "eb_itemnum") String eb_itemnum,
			HttpServletRequest request) throws Exception {// command 객체
		ModelAndView mv = new ModelAndView("/common/common_product_cont");

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		System.out.println(eb_itemnum);
		// 선택한 상품에 대한 상세보기
		BoardBean boardcont = this.commonService.getBoardCont(eb_itemnum);

		// 선택한 글에 대해서 조회수 올리기
		this.commonService.boardHit(boardcont.getEb_boardnum());

		// 최고 입찰자 아이디 구하기
		List<GHouse> ghouse = this.commonService.getGhouse(eb_itemnum);
		String buyer = "입찰자가 없습니다";

		if (ghouse.size() != 0) {
			buyer = ghouse.get(0).getGh_buyer();
		}

		// 찜한 상태 체크
		int Check = this.commonService.attentCheck(id, eb_itemnum);

		mv.addObject("boardcont", boardcont);
		mv.addObject("buyer", buyer);
		mv.addObject("Check", Check);

		return mv;
	}

	// 첨부파일 다운로드
	@RequestMapping(value = "/common_filedown.nhn")
	public void board_filedown_action(BoardBean board) throws Exception {
	}

	// 게시물 삭제
	@RequestMapping(value = "/common_product.nhn", method = RequestMethod.POST)
	public String common_product(BoardBean board) throws Exception {// command 객체
		return null;
	}

	// 게시물 수정하기
	@RequestMapping(value = "/common_product_edit_ok.nhn", method = RequestMethod.POST)
	public String common_product_edit_ok(BoardBean board) throws Exception {// command 객체

		return null;
	}

	// 게시물 검색하기
	@RequestMapping(value = "/common_product_find_ok.nhn")
	public ModelAndView common_product_find_ok(BoardBean board, HttpServletRequest request,
			HttpServletResponse response, @RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam("find_name") String find_name, @RequestParam("find_field") String find_field)
			throws Exception {// command 객체
		ModelAndView mv = new ModelAndView("/common/common_board_find");

		int limit = 10;

		Map m = new HashMap();
		m.put("page", page);
		m.put("find_field", find_field);
		m.put("find_name", "%" + find_name + "%");
		m.put("limit", limit);

		// 검색 기준이 들어간 리스트 카운트
		int listcount = this.commonService.getListCount3(m);

		// 총 페이지 수
		int maxpage = (listcount + limit - 1) / limit;

		int startpage = ((page - 1) / limit - 1) * limit + 1;
		int endpage = startpage + limit - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		// 검색기준으로 찾은 보드리스트
		List<BoardBean> boardlist = this.commonService.getBoardList3(m);

		mv.addObject("find_field", find_field);
		mv.addObject("find_name", find_name);
		mv.addObject("boardlist", boardlist);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);

		if (request.getParameter("list") != null) {
			mv.setViewName("/common/common_board_list");
		}
		return mv;
	}

	// 검색 정렬 방식
	@RequestMapping(value = "/common_product_orderby.nhn")
	public ModelAndView common_product_orderby(BoardBean board,
			@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "orderby") String orderby)
			throws Exception {

		int limit = 10;
		ModelAndView mv = new ModelAndView("/common/common_product_list_img");

		Map m = new HashMap();
		m.put("page", page);
		m.put("orderby", orderby);
		m.put("limit", limit);

		// 검색 기준이 들어간 리스트 카운트
		int listcount = this.commonService.getListCount3(m);

		// 총 페이지 수
		int maxpage = (listcount + limit - 1) / limit;

		int startpage = ((page - 1) / limit - 1) * limit + 1;
		int endpage = startpage + limit - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		// 검색기준으로 찾은 보드리스트
		List<BoardBean> boardlist = this.commonService.getBoardList3(m);

		mv.addObject("boardlist", boardlist);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		return mv;
	}

	// 카테고리 뽑아오기
	@RequestMapping(value = "/common_product_category.nhn")
	public String product_category(BoardBean board) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	// 상품 즉시구매
	@RequestMapping(value = "/common_product_purchase.nhn")
	public String common_product_purchase(PList plist, SList slist, HttpServletResponse response) throws Exception {// command
																													// 객체

		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=utf-8");
		int point = this.commonService.getUserPoint(plist.getEp_user());
		System.out.println("유저의 point : " + point);
		System.out.println("물건의 가격 : " + plist.getEp_price());

		if (point > plist.getEp_price()) {
			// 즉시구매 구매자 테이블에 값넣기
			plist.setEp_result("미확정");
			this.commonService.fastPurchaseBuyer(plist);

			// 포인트 차감
			this.commonService.BuyerPointDecrease(plist.getEp_user(), plist.getEp_price());

			// 즉시구매 판매자내역 테이블에 값넣기
			slist.setEs_kind("일반");
			slist.setEs_user(plist.getEp_seller());
			slist.setEs_buyer(plist.getEp_user());
			slist.setEb_boardnum(plist.getEb_boardnum());
			slist.setEb_itemnum(plist.getEb_itemnum());
			slist.setEb_itemname(plist.getEb_itemname());
			slist.setEb_file(plist.getEb_file());
			slist.setEs_price(plist.getEp_price());
			this.commonService.fastPurchaseSeller(slist);

			// 경매 종료시키기
			this.commonService.fastPurchaseBuyEnd(plist.getEb_itemnum());
			out.println("<script>");
			out.println("alert('즉시 입찰에 성공했습니다.')");
			out.println("location.href='common_product_cont.nhn?eb_itemnum=" + plist.getEb_itemnum() + "'");
			out.println("</script>");

			return null;
		} else {

			out.println("<script>");
			out.println("alert('포인트가 부족합니다')");
			out.println("history.back()");
			out.println("</script>");

			return null;
		}

	}

	// 상품 입찰하기
	@RequestMapping(value = "/common_product_bid.nhn")
	@ResponseBody
	public Object common_product_bid(GHouse gh, HttpServletRequest request) throws Exception {// command 객체

		// 마감 1분안에 입찰한 경우 시간연장
		double bidtimeadd = Double.parseDouble(request.getParameter("bidTimeAdd"));
		System.out.println(bidtimeadd);
		if (bidtimeadd <= 60 && bidtimeadd > 0) {
			this.commonService.boardLadateUpdate(gh.getEb_itemnum());
		}

		// 현재 자신이 가진 포인트

		// 입찰하기
		this.commonService.insertGhouse(gh);

		// 해당물품에 대한 입찰자 리스트
		List<GHouse> ghouse = this.commonService.getGhouse(gh.getEb_itemnum());

		// 입찰 수 올리기
		this.commonService.boardBidHit(gh.getEb_itemnum());

		// 최고 입찰자
		String buyer = ghouse.get(0).getGh_buyer();

		// 최고 입찰가
		int bidprice = ghouse.get(0).getGh_bidprice();

		// 입찰수
		int bidcount = ghouse.size();

		// 경매 물품 최신화해주기
		this.commonService.boardUpdate(bidprice, gh.getEb_itemnum());

		// board 구하기
		BoardBean board = this.commonService.getBoardCont(gh.getEb_itemnum());

		Map m = new HashMap<>();
		m.put("buyer", buyer);
		m.put("bidprice", bidprice);
		m.put("bidcount", bidcount);
		m.put("BidAddLadate", board.getEb_ladate());
		m.put("BidAddAadate", board.getEb_audate());

		return m;
	}

	// 상품 찜하기
	@RequestMapping(value = "/common_product_basket.nhn")
	@ResponseBody
	public Object common_product_basket(Attent attent, HttpServletResponse response) throws Exception {// command 객체
		String message = "";

		// 찜하기 중복체크
		int Check = this.commonService.attentCheck(attent.getEa_user(), attent.getEb_itemnum());

		// 중복이 아닐때
		if (Check == 0) {
			// 찜하기 테이블에 넣기
			this.commonService.attentInsert(attent);

			// board에 관심수 올려주기
			this.commonService.boardAttentHit(attent.getEb_itemnum());
			message = "찜하기취소";
			// 중복인 경우 찜하기를 취소하는 경우
		} else {
			// 찜하기 테이블에서 삭제
			this.commonService.attentDelete(attent.getEa_user(), attent.getEb_itemnum());

			// board에 관심수 내려주기
			this.commonService.boardAttentHitDown(attent.getEb_itemnum());
			message = "찜하기";
		}

		// 관심수 뽑아오기
		BoardBean board = this.commonService.getBoardCont(attent.getEb_itemnum());
		int attcount = board.getEb_attcount();

		Map m = new HashMap<>();
		m.put("message", message);
		m.put("attcount", attcount);

		return m;
	}

	// 입찰취소하기
	@RequestMapping(value = "/common_bid_cancel.nhn")
	public void bid_cancel(BoardBean board, GHouse gh) throws Exception {
		// TODO Auto-generated method stub

	}

	// 다중파일업로드
	@RequestMapping(value = "/file_uploader_html5.nhn", method = RequestMethod.POST)
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
			String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss").format(System.currentTimeMillis()))
					.append(UUID.randomUUID().toString()).append(oldName.substring(oldName.lastIndexOf(".")))
					.toString();
			System.out.println(saveName);
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(filePath + "/" + saveName);

			int numRead;
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			while ((numRead = is.read(b, 0, b.length)) != -1) {
				os.write(b, 0, numRead);
			}
			os.flush();
			os.close();
			// 정보 출력
			sb = new StringBuffer();
			sb.append("&bNewLine=true").append("&sFileName=").append(oldName).append("&sFileURL=")
					.append("http://localhost:8088/auction/resources/photoUpload/").append(saveName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sb.toString();
	}

	// 카테고리 불러오기
	@RequestMapping(value = "/get_small_category1.nhn")
	@ResponseBody
	public ModelAndView get_small_category(HttpServletRequest request) throws Exception {
		String category = request.getParameter("category");
		List<Category> smallcategory = this.commonService.getSmallCategory(category);
		ModelAndView mv = new ModelAndView("common/common_board_category_ajax");

		mv.addObject("category", smallcategory);

		return mv;
	}

	@RequestMapping(value = "/get_category_list1.nhn")
	@ResponseBody
	public ModelAndView get_category_list(HttpServletRequest request,
			@RequestParam(value = "bigcategory", defaultValue = "empty") String bigcategory,
			@RequestParam(value = "smallcategory", defaultValue = "empty") String smallcategory) throws Exception {

		System.out.println("bigcategory : " + bigcategory);
		System.out.println("smallcategory : " + smallcategory);

		Map m = new HashMap<>();
		m.put("bigcategory", bigcategory);
		m.put("smallcategory", smallcategory);

		List<BoardBean> boardlist = this.commonService.get_category_list(m);

		ModelAndView mv = new ModelAndView("common/common_board_img_list");

		mv.addObject("boardlist", boardlist);

		return mv;
	}

}
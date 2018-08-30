package com.easy.auction.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.easy.auction.dao.MypageService;
import com.easy.auction.model.Attent;
import com.easy.auction.model.BoardBean;
import com.easy.auction.model.MemberBean;
import com.easy.auction.model.PList;
import com.easy.auction.model.Point;
import com.easy.auction.model.Review;
import com.easy.auction.model.SList;

@Controller
public class MypageAction {
   @Autowired
   private MypageService mypageService;

   // 주문조회
   @RequestMapping(value = "/mypage_order.nhn")
   public ModelAndView mypage(@RequestParam(value = "page", defaultValue = "1") int page, HttpServletRequest request)
         throws Exception {
      HttpSession session = request.getSession();
      String id = (String) session.getAttribute("id");
      int point = 0;
      point = mypageService.getPoint(id);

      int limit = 4;
      if (request.getParameter("page") != null) {
         page = Integer.parseInt(request.getParameter("page"));
      }

      if (session.getAttribute("limit") != null) {
         limit = (Integer) session.getAttribute("limit");
      }

      if (request.getParameter("limit") != null) {
         limit = Integer.parseInt(request.getParameter("limit"));
         session.setAttribute("limit", limit);
      }
      System.out.println("limit = " + limit);
      System.out.println("page = " + page);
      int listcount = mypageService.getOrderListCount(id);// 총 리스트 수를 받아옴
      // 총 페이지 수
      int maxpage = (listcount + limit - 1) / limit;
      int startpage = ((page - 1) / limit) * limit + 1;
      int endpage = startpage + limit - 1;
      if (endpage > maxpage)
         endpage = maxpage;
      if (endpage < page)
         page = endpage;

      Map m = new HashMap();
      m.put("page", page);
      m.put("limit", limit);
      m.put("id", id);

      Map map = new HashMap<>();

      map.put("경동택배", "1");
      map.put("대한항공", "2");
      map.put("동부택배", "3");
      map.put("로젠택배", "4");
      map.put("범한판토스", "5");
      map.put("우체국택배", "6");
      map.put("일양로지스택배", "7");
      map.put("천일택배", "8");
      map.put("한덱스택배", "9");
      map.put("한의사랑택배", "10");
      map.put("한진택배", "11");
      map.put("현대택배", "12");
      map.put("CJ 대한통운택배", "13");
      map.put("CVSnet편의점택배", "14");
      map.put("DHL택배", "15");
      map.put("FedEx택배", "16");
      map.put("GTX로지스택배", "17");
      map.put("KG옐로우캡택배", "18");
      map.put("KGB택배", "19");
      map.put("OCS택배", "20");
      map.put("TNT Express", "21");
      map.put("UPS택배", "22");

      List<PList> orderlist = mypageService.getOrderlist(m);
      String company;
      for (int i = 0; i < orderlist.size(); i++) {
         company = orderlist.get(i).getEd_company();
         company = (String) map.get(company);
         orderlist.get(i).setEd_company(company);

      }

      ModelAndView OrderView = new ModelAndView("mypage/mypage_order");
      OrderView.addObject("page", page);
      OrderView.addObject("maxpage", maxpage);
      OrderView.addObject("startpage", startpage);
      OrderView.addObject("endpage", endpage);
      OrderView.addObject("listcount", listcount);
      OrderView.addObject("orderlist", orderlist);
      OrderView.addObject("point", point);

      OrderView.addObject("point", point);

      return OrderView;
   }

   // 마이페이지 찜목록 이동
   @RequestMapping(value = "/mypage_like.nhn")
   public ModelAndView mypage_like(@RequestParam(value = "page", defaultValue = "1") int page,
         HttpServletRequest request) throws Exception {
      HttpSession session = request.getSession();
      String id = (String) session.getAttribute("id");
      int point = 0;
      point = mypageService.getPoint(id);

      int limit = 4;
      if (request.getParameter("page") != null) {
         page = Integer.parseInt(request.getParameter("page"));
      }

      if (session.getAttribute("limit") != null) {
         limit = (Integer) session.getAttribute("limit");
      }

      if (request.getParameter("limit") != null) {
         limit = Integer.parseInt(request.getParameter("limit"));
         session.setAttribute("limit", limit);
      }
      System.out.println("limit = " + limit);
      System.out.println("page = " + page);
      int listcount = mypageService.getLikeListCount(id);// 총 리스트 수를 받아옴
      // 총 페이지 수
      int maxpage = (listcount + limit - 1) / limit;
      int startpage = ((page - 1) / 4) * 4 + 1;
      int endpage = startpage + 4 - 1;
      if (endpage > maxpage)
         endpage = maxpage;
      if (endpage < page)
         page = endpage;

      Map m = new HashMap();
      m.put("page", page);
      m.put("limit", limit);
      m.put("id", id);

      List<Attent> likelist = mypageService.getLikelist(m);

      ModelAndView view = new ModelAndView("mypage/mypage_like");
      view.addObject("point", point);
      view.addObject("likelist", likelist);
      view.addObject("page", page);
      view.addObject("maxpage", maxpage);
      view.addObject("startpage", startpage);
      view.addObject("endpage", endpage);
      view.addObject("listcount", listcount);
      return view;
   }

   // 포인트 내역
   @RequestMapping(value = "/mypage_pointlist.nhn")
   public ModelAndView mypage_pointlist(@RequestParam(value = "page", defaultValue = "1") int page,
         HttpServletRequest request) throws Exception {
      int limit = 10;
      HttpSession session = request.getSession();
      String id = (String) session.getAttribute("id");
      if (request.getParameter("page") != null) {
         page = Integer.parseInt(request.getParameter("page"));
      }

      if (session.getAttribute("limit") != null) {
         limit = (Integer) session.getAttribute("limit");
      }

      if (request.getParameter("limit") != null) {
         limit = Integer.parseInt(request.getParameter("limit"));
         session.setAttribute("limit", limit);
      }
      System.out.println("limit = " + limit);
      System.out.println("page = " + page);
      int listcount = mypageService.getListCount(id);// 총 리스트 수를 받아옴
      // 총 페이지 수
      int maxpage = (listcount + limit - 1) / limit;
      // 현재 페이지에 보여줄 시작 페이지 수(1,11,21등...)
      int startpage = ((page - 1) / 10) * 10 + 1;
      // 현재 페이지에 보여줄 마지막 페이지 수(10,20,30등...)
      int endpage = startpage + 10 - 1;
      if (endpage > maxpage)
         endpage = maxpage;
      if (endpage < page)
         page = endpage;

      Map m = new HashMap();
      m.put("page", page);
      m.put("limit", limit);
      m.put("id", id);

      int point = 0;
      point = mypageService.getPoint(id);
      ModelAndView view = new ModelAndView("mypage/mypage_point");

      // 리스트를 받아옴.
      List<Point> pointlist = mypageService.getLookuplist(m);

      ModelAndView PointView = new ModelAndView("mypage/mypage_pointlist");
      PointView.addObject("page", page);
      PointView.addObject("maxpage", maxpage);
      PointView.addObject("startpage", startpage);
      PointView.addObject("endpage", endpage);
      PointView.addObject("listcount", listcount);
      PointView.addObject("pointlist", pointlist);
      PointView.addObject("point", point);
      return PointView;
   }

   // 마이페이지 판매내역
   @RequestMapping(value = "/mypage_sale.nhn")
   public ModelAndView mypage_sale(@RequestParam(value = "page", defaultValue = "1") int page,
         HttpServletRequest request) throws Exception {
      HttpSession session = request.getSession();
      String id = (String) session.getAttribute("id");
      int limit = 10;

      if (request.getParameter("page") != null) {
         page = Integer.parseInt(request.getParameter("page"));
      }

      if (session.getAttribute("limit") != null) {
         limit = (Integer) session.getAttribute("limit");
      }

      if (request.getParameter("limit") != null) {
         limit = Integer.parseInt(request.getParameter("limit"));
         session.setAttribute("limit", limit);
      }
      System.out.println("limit = " + limit);
      System.out.println("page = " + page);
      int listcount = mypageService.getListCount_sale(id);// 총 리스트 수를 받아옴
      // 총 페이지 수
      int maxpage = (listcount + limit - 1) / limit;
      // 현재 페이지에 보여줄 시작 페이지 수(1,11,21등...)
      int startpage = ((page - 1) / 10) * 10 + 1;
      // 현재 페이지에 보여줄 마지막 페이지 수(10,20,30등...)
      int endpage = startpage + 10 - 1;
      if (endpage > maxpage)
         endpage = maxpage;
      if (endpage < page)
         page = endpage;

      Map m = new HashMap();
      m.put("page", page);
      m.put("limit", limit);
      m.put("id", id);

      // 리스트를 받아옴.
      List<SList> salelist = mypageService.getsalelist(m);

      String item = null;
      for (int i = 0; i < salelist.size(); i++) {

         item = salelist.get(i).getEb_itemnum();
      }

      ModelAndView boardListM = new ModelAndView("mypage/mypage_sale");
      boardListM.addObject("page", page);
      boardListM.addObject("maxpage", maxpage);
      boardListM.addObject("startpage", startpage);
      boardListM.addObject("endpage", endpage);
      boardListM.addObject("listcount", listcount);
      boardListM.addObject("salelist", salelist);

      int point = 0;
      point = mypageService.getPoint(id);
      boardListM.addObject("point", point);
      return boardListM;
   }

   // 포인트 조회 주소
   @RequestMapping(value = "/mypage_point.nhn")
   public ModelAndView mypage_point(HttpServletRequest request) throws Exception {
      HttpSession session = request.getSession();
      String id = (String) session.getAttribute("id");
      int point = 0;
      point = mypageService.getPoint(id);
      ModelAndView view = new ModelAndView("mypage/mypage_point");
      view.addObject("point", point);

      return view;
   }

   // 포인트 반환 주소
   @RequestMapping(value = "/mypage_return.nhn")
   public ModelAndView mypage_return(HttpServletRequest request) throws Exception {
      HttpSession session = request.getSession();
      String id = (String) session.getAttribute("id");
      int point = 0;
      point = mypageService.getPoint(id);
      ModelAndView view = new ModelAndView("mypage/mypage_return");
      view.addObject("point", point);
      return view;
   }

   // 포인트 요청 정보 저장
   @RequestMapping(value = "/mypage_point_ok.nhn")
   public String mypage_pointListOK(HttpServletRequest request, Point point) throws Exception {

      HttpSession session = request.getSession();

      String id = (String) session.getAttribute("id");
      String name = (String) session.getAttribute("em_name");
      System.out.println("name : " + name);
      int eg_orgcoin = Integer.parseInt(request.getParameter("eg_orgcoin"));
      int eg_recoin = Integer.parseInt(request.getParameter("eg_recoin"));
      String eg_state = "대기";
      String apply = "충전";
      point.setEg_id(id);
      point.setEg_name(name);
      point.setEg_orgcoin(eg_orgcoin);
      point.setEg_recoin(eg_recoin);
      point.setEg_state(eg_state);
      point.setEg_apply(apply);
      mypageService.requestPoint(point);

      return "mypage/mypage_pointlist";

   }

   // 포인트 반환 정보 저장
   @RequestMapping(value = "/mypage_return_ok.nhn")
   public String mypage_pointReturn(HttpServletRequest request, Point point) throws Exception {

      HttpSession session = request.getSession();

      String id = (String) session.getAttribute("id");
      String name = (String) session.getAttribute("em_name");

      int eg_orgcoin = Integer.parseInt(request.getParameter("eg_orgcoin"));
      int eg_recoin = Integer.parseInt(request.getParameter("eg_recoin"));
      String eg_state = "대기";
      String apply = "반환";
      point.setEg_id(id);
      point.setEg_name(name);
      point.setEg_orgcoin(eg_orgcoin);
      point.setEg_recoin(eg_recoin);
      point.setEg_state(eg_state);
      point.setEg_apply(apply);
      mypageService.requestPoint(point);

      return "mypage/mypage_pointlist";

   }

   // 개인정보
   @RequestMapping(value = "/mypage_info.nhn")
   public ModelAndView mypage_info(HttpServletRequest request) throws Exception {
      HttpSession session = request.getSession();

      String id = (String) session.getAttribute("id");
      MemberBean memberinfo = mypageService.member_info(id);
      String phone1 = memberinfo.getEm_phone().split("-")[0];
      String phone2 = memberinfo.getEm_phone().split("-")[1];
      String phone3 = memberinfo.getEm_phone().split("-")[2];

      memberinfo.setEm_phone1(phone1);
      memberinfo.setEm_phone2(phone2);
      memberinfo.setEm_phone3(phone3);

      ModelAndView view = new ModelAndView("mypage/mypage_info");
      view.addObject("memberinfo", memberinfo);
      int point = mypageService.getPoint(id);
      view.addObject("point", point);
      return view;
   }

   // 구매 취소인 경우
   @RequestMapping(value = "/order_cancel.nhn")
   public String order_cancel(HttpServletRequest request) throws Exception {
      HttpSession session = request.getSession();
      String id = (String) session.getAttribute("id");
      int page = Integer.parseInt(request.getParameter("page"));
      String reason = request.getParameter("reason");
      String detail = request.getParameter("detail");
      String itemnum = request.getParameter("itemnum");
      Map m = new HashMap();
      m.put("id", id);
      m.put("reason", reason);
      m.put("detail", detail);
      m.put("itemnum", itemnum);

      mypageService.reasonAdd(m);
      reason = reason.trim();
      if (reason.equals("단순변심")) {
         // 취소카운트 + 1
         mypageService.orderCancel(id);
         m.put("result", "취소완료");
         mypageService.result_ok(m);
         BoardBean board = mypageService.selectBoardfileInfo(itemnum);
         mypageService.updateBoardfileDate(board);
      } else {
         m.put("result", "취소대기");
         mypageService.result_ok(m);
      }

      return "mypage/mypage_order";
   }

   // 확정하기
   @RequestMapping(value = "/result_ok.nhn")
   public String result_ok(HttpServletRequest request, HttpServletResponse response) throws Exception {
      HttpSession session = request.getSession();
      String id = (String) session.getAttribute("id");
      String itemnum = request.getParameter("itemnum");
      String seller = request.getParameter("seller");
      System.out.println("num+++"+itemnum);
      String state = mypageService.getstate(itemnum);
      System.out.println(state);
      if(state.equals("미확정")) {
      Map map = new HashMap();
      map.put("id", id);
      map.put("itemnum", itemnum);
      map.put("result", "확정");
      mypageService.result_ok(map);
      int price = mypageService.getItemprice(itemnum);
      Map pmap = new HashMap();
      pmap.put("id", seller);
      pmap.put("price", price);
      mypageService.point_processing(pmap);
      mypageService.point_processing2(pmap);
      PrintWriter out = response.getWriter();
      out.println("1");
      }else {
         PrintWriter out = response.getWriter();
         out.println("0");
      }
      return null;
   }

   // 구매 취소
   @RequestMapping(value = "/order_cancel_choice.nhn")
   public ModelAndView order_cancel_choice(HttpServletRequest request) throws Exception {
      HttpSession session = request.getSession();
      String id = (String) session.getAttribute("id");
      ModelAndView view = new ModelAndView("mypage/order_cancel_choice");
      String itemnum = request.getParameter("itemnum");
      String page = request.getParameter("page");
      view.addObject("page", page);
      view.addObject("itemnum", itemnum);
      return view;
   }

   // 마이페이지 메인
   @RequestMapping(value = "/mypage.nhn")
   public ModelAndView mypage(HttpServletRequest request) throws Exception {
      HttpSession session = request.getSession();
      String id = (String) session.getAttribute("id");

      // 포인트 조회
      int point = 0;
      point = mypageService.getPoint(id);
      
      // 최근 주문횟수 3건
      int orderlistcount = mypageService.getOrderListCount(id);
      List<PList> orderlist = mypageService.getListmain1(id);
      Map map = new HashMap<>();

      map.put("경동택배", "1");
      map.put("대한항공", "2");
      map.put("동부택배", "3");
      map.put("로젠택배", "4");
      map.put("범한판토스", "5");
      map.put("우체국택배", "6");
      map.put("일양로지스택배", "7");
      map.put("천일택배", "8");
      map.put("한덱스택배", "9");
      map.put("한의사랑택배", "10");
      map.put("한진택배", "11");
      map.put("현대택배", "12");
      map.put("CJ 대한통운택배", "13");
      map.put("CVSnet편의점택배", "14");
      map.put("DHL택배", "15");
      map.put("FedEx택배", "16");
      map.put("GTX로지스택배", "17");
      map.put("KG옐로우캡택배", "18");
      map.put("KGB택배", "19");
      map.put("OCS택배", "20");
      map.put("TNT Express", "21");
      map.put("UPS택배", "22");

      String company;
      for (int i = 0; i < orderlist.size(); i++) {
         company = orderlist.get(i).getEd_company();
         company = (String) map.get(company);
         orderlist.get(i).setEd_company(company);

      }

      // 최근 판매횟수 3건
      int salelistcount = mypageService.getListCount_sale(id);
      List<SList> salelist = mypageService.getListmain2(id);
      for(int m = 0; m < salelist.size(); m++) {
    	  System.out.println("hihi : " + salelist.get(m).getEb_itemname());
      }
      // 최근 올린 후기 내역 3건
      int reviewcount = mypageService.getListCount_review(id);
      List<Review> reviewlist = mypageService.getListmain3(id);

      ModelAndView view = new ModelAndView("mypage/mypage_main");
      view.addObject("point", point);
      view.addObject("orderlistcount", orderlistcount);
      view.addObject("orderlist", orderlist);
      view.addObject("salelistcount", salelistcount);
      view.addObject("salelist", salelist);
      view.addObject("reviewcount", reviewcount);
      view.addObject("reviewlist", reviewlist);
      return view;
   }

   // 회원정보 업데이트
   @RequestMapping(value = "/info_update.nhn")
   public void info_update(HttpServletRequest request, HttpServletResponse response) throws Exception {
      String em_id = request.getParameter("em_id");
      String em_pass = request.getParameter("em_pass");
      String em_phone1 = request.getParameter("em_phone1");
      String em_phone2 = request.getParameter("em_phone2");
      String em_phone3 = request.getParameter("em_phone3");
      String em_email = request.getParameter("em_email");
      String em_post = request.getParameter("em_post");
      String em_address1 = request.getParameter("em_address1");
      String em_address2 = request.getParameter("em_address2");
      String em_intro = request.getParameter("em_intro");
      String em_bank = request.getParameter("em_bank");
      String em_account = request.getParameter("em_account");
      String em_phone = em_phone1 + "-" + em_phone2 + "-" + em_phone3;
      response.setContentType("text/html;charset=UTF-8");
      String orgin_pass = mypageService.member_password(em_id);
      if (!em_pass.equals(orgin_pass)) {
         PrintWriter out = response.getWriter();
         out.println("<script>");
         out.println("alert('비밀번호를 다시 입력해 주세요.');");
         out.println("history.back();");
         out.println("</script>");
      } else {

         MemberBean member = new MemberBean();
         member.setEm_id(em_id);
         member.setEm_phone(em_phone);
         member.setEm_email(em_email);
         member.setEm_post(em_post);
         member.setEm_address1(em_address1);
         member.setEm_address2(em_address2);
         member.setEm_intro(em_intro);
         member.setEm_bank(em_bank);
         member.setEm_account(em_account);
         mypageService.member_update(member);
         PrintWriter out = response.getWriter();
         out.println("<script>");
         out.println("alert('회원 정보가 변경되었습니다.');");
         out.println("location.href='mypage_info.nhn'");
         out.println("</script>");

      }

   }

   // 리뷰 게시판 조회
   @RequestMapping(value = "/mypage_review.nhn")
   public ModelAndView mypage_review(@RequestParam(value = "page", defaultValue = "1") int page,
         HttpServletRequest request) throws Exception {

      int limit = 10;
      HttpSession session = request.getSession();
      String id = (String) session.getAttribute("id");
      if (request.getParameter("page") != null) {
         page = Integer.parseInt(request.getParameter("page"));
      }

      if (session.getAttribute("limit") != null) {
         limit = (Integer) session.getAttribute("limit");
      }

      if (request.getParameter("limit") != null) {
         limit = Integer.parseInt(request.getParameter("limit"));
         session.setAttribute("limit", limit);
      }
      System.out.println("limit = " + limit);
      System.out.println("page = " + page);
      int listcount = mypageService.getListCount_review(id);// 총 리스트 수를 받아옴
      // 총 페이지 수
      int maxpage = (listcount + limit - 1) / limit;
      // 현재 페이지에 보여줄 시작 페이지 수(1,11,21등...)
      int startpage = ((page - 1) / 10) * 10 + 1;
      // 현재 페이지에 보여줄 마지막 페이지 수(10,20,30등...)
      int endpage = startpage + 10 - 1;
      if (endpage > maxpage)
         endpage = maxpage;
      if (endpage < page)
         page = endpage;

      Map m = new HashMap();
      m.put("page", page);
      m.put("limit", limit);
      m.put("id", id);
      // 리스트를 받아옴.
      List<Review> reviewlist = mypageService.getReivewlist(m);

      System.out.println(reviewlist.size());
      ModelAndView boardListM = new ModelAndView("mypage/mypage_review");
      boardListM.addObject("page", page);
      boardListM.addObject("maxpage", maxpage);
      boardListM.addObject("startpage", startpage);
      boardListM.addObject("endpage", endpage);
      boardListM.addObject("listcount", listcount);
      boardListM.addObject("reviewlist", reviewlist);

      int point = 0;
      point = mypageService.getPoint(id);
      boardListM.addObject("point", point);
      return boardListM;
   }

   /* 배송정보 등록 */
   @RequestMapping(value = "/mypage_sale_submit.nhn")
   public String mypage_sale_submit(HttpServletRequest request) throws Exception {
      HttpSession session = request.getSession();
      String send_id = (String) session.getAttribute("id");
      String recevie_id = request.getParameter("receive_id");
      String eb_itemnum = request.getParameter("eb_itemnum");
      String ed_company = request.getParameter("ed_company");
      String ed_delinum = request.getParameter("ed_delinum");
      Map m = new HashMap();
      m.put("send_id", send_id);
      m.put("recevie_id", recevie_id);
      m.put("eb_itemnum", eb_itemnum);
      m.put("ed_company", ed_company);
      m.put("ed_delinum", ed_delinum);

      mypageService.deliveryinfo_insert(m);

      return "redirect:/mypage_sale.nhn";
   }

}
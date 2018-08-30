package com.easy.auction.controller;


import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.easy.auction.dao.AdminService;
import com.easy.auction.model.BoardBean;
import com.easy.auction.model.Cancel;
import com.easy.auction.model.MemberBean;
import com.easy.auction.model.PList;
import com.easy.auction.model.Point;
import com.easy.auction.model.Review;

@Controller
public class AdminAction {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/intro.nhn")
	public String intro() throws Exception{
		return "admin/intro";
	}
	
	//메인페이지 이동
	@RequestMapping(value="/main.nhn")
	public ModelAndView main(
		ModelAndView mv,
		HttpServletRequest request,
		HttpServletResponse response,
		@CookieValue(value="saveid", required=false)Cookie readCookie)throws Exception {
		
		response.setContentType("text/html;charset=utf-8");
		if(readCookie != null) {
			mv.addObject("saveid", readCookie.getValue());
		}
		
		List<Review> reviewLatest = adminService.listReviewLatest();
		
		List<BoardBean> specialDeadline = adminService.listSpecialDeadline();
		
		List<BoardBean> commonDeadline = adminService.listCommonDeadline();
		
		List<BoardBean> commonPopularity = adminService.listCommonPopularity();
		
		mv.setViewName("main/main");
		
		mv.addObject("reviewLatest", reviewLatest);
		mv.addObject("specialDeadline", specialDeadline);
		mv.addObject("commonDeadline", commonDeadline);
		mv.addObject("commonPopularity", commonPopularity);
	
		return mv;
	}
	
	@RequestMapping(value="/admin.nhn")
	public ModelAndView admin_member_list() throws Exception{
		
		List<MemberBean> memberList = adminService.listMemberInfo();
		
		List<Object> usageList = adminService.memberUsage();
		
		List<Object> CRegCount = adminService.boardRegCount("CP");
		List<Object> SRegCount = adminService.boardRegCount("SP");
		
		List<Object> cRegCategory = adminService.boardRegCategory("CP");
		List<Object> sRegCategory = adminService.boardRegCategory("SP");
		
		int listCount = memberList.size();
		ModelAndView mv = new ModelAndView("admin/admin");
		
		
		mv.addObject("usageList", usageList);
		
		mv.addObject("CRegCount", CRegCount);
		mv.addObject("SRegCount", SRegCount);
		
		mv.addObject("cRegCategory", cRegCategory);
		mv.addObject("sRegCategory", sRegCategory);
		
		mv.addObject("memberList", memberList);
		mv.addObject("listCount", listCount);
		return mv;
	}
	
	@RequestMapping(value="/account_message.nhn")
	public ModelAndView accountMessageView(Point point) throws Exception{
		
		List<Point> accountList = adminService.listUserAccountInfo(point.getEg_id());
		ModelAndView mv = new ModelAndView("admin/account");
		mv.addObject("accountList", accountList);
		return mv;
	}
	
	@RequestMapping(value="/account_bell_state.nhn")
	@ResponseBody
	public Object accountBellState(Point point) throws Exception{
		int count = adminService.countMessageBellState(point.getEg_id());
		return count;
	}
	
	@RequestMapping(value="/bid_message.nhn")
	public ModelAndView bidMessageView(PList plist) throws Exception{
		
		List<Cancel> bidCancelList = adminService.listPlistBidcancel(plist.getEp_user());
		ModelAndView mv = new ModelAndView("admin/bidCancel");
		mv.addObject("bidCancelList", bidCancelList);
		return mv;
	}
	
	@RequestMapping(value="/bid_cancel_state.nhn")
	@ResponseBody
	public Object bidCancelState(PList plist) throws Exception{
		return adminService.countPlistBidcancel(plist.getEp_user());
	}
	
	@RequestMapping(value="/bid_cancel_request.nhn")
	@ResponseBody
	public int bidCancelRequest(PList plist) throws Exception{
		int result = 1;
		adminService.updatePlistResult(plist);
		
		BoardBean board = adminService.selectBidcancelBoardInfo(plist.getEb_itemnum());
		adminService.updateBidcancelBoardDate(board);
		return result;
	}
	
	
	
	@RequestMapping(value="/account_transfer.nhn")
	@ResponseBody
	public Object accountTransfer(Point point) throws Exception{
		adminService.editUserAccountInfo(point);
		
		int result = 0;
		if(point.getEg_state().equals("충전")) {
			adminService.depositUserAccount(point);
			result = 1;
		} else if(point.getEg_state().equals("반환")) {
			adminService.withdrawUserAccount(point);
			result = -1;
		}
		return result;
	}
}

package com.easy.auction.controller;


import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.easy.auction.dao.SpecialAuctionService;
import com.easy.auction.model.BoardBean;
import com.easy.auction.model.MemberBean;
import com.easy.auction.model.SHouse;
import com.easy.auction.model.SHouseList;

@Controller
public class SpecialAuctionAction {
	private int num = 0;
	private boolean start = false;
	private int currentPrice = 0;
	@Autowired
	private SpecialAuctionService specialAuctionService;
	
	@RequestMapping(value="/special_auction.nhn")
	public ModelAndView special_auction_view(SHouseList shlist) throws Exception{
		
		SHouseList shouseList = specialAuctionService.selectHouseInfo(shlist.getEb_itemnum());
		shlist.setEsl_count(shouseList.getEsl_count() + 1);
		shlist.setSh_bidnum(shouseList.getSh_bidnum());
		specialAuctionService.updateHouseCount(shlist);
		
		BoardBean board = specialAuctionService.selectBoardInfo(shlist.getEb_itemnum());
		
		ModelAndView mv = new ModelAndView("special/auction_view");
		mv.addObject("shlist", shouseList);
		mv.addObject("board", board);
		return mv;
	}
	
	@RequestMapping(value="/special_auction_usercount.nhn")
	public Object special_auction_userCount(String eb_itemnum,
			HttpServletResponse response) throws Exception{
		SHouseList shouseList = specialAuctionService.selectHouseInfo(eb_itemnum);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(shouseList.getEsl_count());
		return null;
	}
	
	@RequestMapping(value="/special_auction_getout.nhn")
	@ResponseBody
	public Object special_auction_getout(String eb_itemnum) throws Exception{
		
		int result = 1;
		SHouseList shouseList = specialAuctionService.selectHouseInfo(eb_itemnum);
		shouseList.setEsl_count(shouseList.getEsl_count() - 1);
		shouseList.setSh_bidnum(shouseList.getSh_bidnum());
		specialAuctionService.updateHouseCount(shouseList);

		return result;
	}
	
//	@RequestMapping(value="/special_auction_list.nhn")
//	public String special_auction_list() throws Exception{
//		return "special/auction_list";
//	}
	
	@RequestMapping(value="/special_auction_bid.nhn", method=RequestMethod.POST)
	public String special_auction_bid(SHouse shouse) throws Exception{
		specialAuctionService.bidPriceInsert(shouse);
		
		SHouse sh = specialAuctionService.selectBidCount(shouse);
		
		shouse.setSh_bidcount(sh.getSh_bidcount() + 1);
		specialAuctionService.addBidCount(shouse);
		
		return null;
	}
	
	@RequestMapping(value="/special_auction_adcomment.nhn", method=RequestMethod.POST)
	@ResponseBody
	public Object special_auction_adcomment(SHouse shouse) throws Exception {
		adminComment(shouse);
		if(shouse.getSh_buyer() == null || shouse.getSh_buyer().equals("null")) {
			return "";
		} else {
			List<SHouse> list = new ArrayList<SHouse>();
			list = specialAuctionService.commentList(shouse);
			
			return list;
		}
		
	}
	
	@RequestMapping(value="/special_auction_price.nhn")
	@ResponseBody
	public  Object special_auction_currentPrice(SHouse shouse) throws Exception{
		SHouse sh = specialAuctionService.currentPrice(shouse);
		
		return sh;
	}
	
	@RequestMapping(value="/special_auction_compare.nhn")
	@ResponseBody
	public MemberBean comparePointPrice(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		MemberBean mbean = specialAuctionService.viewUserPoint(id);
		
		return mbean;
	}
	
	@SuppressWarnings("unused")
	public void adminComment(SHouse shouse) throws Exception {
		Calendar cal = Calendar.getInstance();
		Date date = cal.getTime();
		String today = new SimpleDateFormat("HH:mm").format(date);
		System.out.println(today);
		int[] roomNum = {1, 2, 3, 4, 5};
		String[][] allRoom = {{"11", "11:00", "11:05"}, {"13", "13:00", "13:05"}, {"15", "15:00", "15:05"}, 
								{"17", "17:00", "17:17"}, {"19", "19:00", "19:05"}};
		String sh_comment = "", sh_adkey = "";
		
		
		for(int i = 0; i < roomNum.length; i++) {
			if(shouse.getSh_bidnum() == roomNum[i]) {
				if(start) {
					num++;
				}
				
				if(adKeyType("입장", shouse).equals("")) {
					sh_adkey = "입장";
					sh_comment = "특별 물품 경매장에 입장하셨습니다.\r\n"
							+ roomNum[i] + "번방의 경매 물품은 " + shouse.getEb_itemname() + "이며,\r\n " 
							+ allRoom[i][2] + "부터 경매를 시작하겠습니다.\r\n"
							+ "입찰가가 올라갈 때마다 3분간 응찰할 수 있고, 이후로는 응찰할 수 없습니다.";
					shouse.setSh_adkey(sh_adkey);
					shouse.setSh_comment(sh_comment);
					
					specialAuctionService.addAdminComment(shouse);
				} else if(today.equals(allRoom[i][2]) && adKeyType("입찰", shouse).equals("")) {
					currentPrice = shouse.getSh_bidprice();
					System.out.println("hello : " + currentPrice);
					sh_adkey = "입찰";
					sh_comment = "지금부터 입찰을 시작하겠습니다.\r\n"
							+ "시작가는 " + currentPrice + "입니다.\r\n"
							+ "3분간 응찰할 수 있습니다.";
					shouse.setSh_adkey(sh_adkey);
					shouse.setSh_comment(sh_comment);
					shouse.setSh_bidprice(currentPrice);
					specialAuctionService.addAdminComment(shouse);
					
					start = true;
					
				} else if(num == 20 && commentInfo("미응찰", shouse) != null  && commentInfo("미응찰", shouse).getSh_bidcount() > 0) {
					sh_adkey = "중단";
					shouse.setSh_adkey(sh_adkey);
					specialAuctionService.editAdkey(shouse);
					num = 0;
				} else if(num == 20 && commentInfo("미응찰", shouse) != null && commentInfo("미응찰", shouse).getSh_bidcount() == 0) {
					SHouse shResult = specialAuctionService.currentPrice(shouse);
					sh_adkey = "종료";
					if(shResult != null) {
						sh_comment = shResult.getEb_itemname() + "의 최고가는 " + shResult.getSh_bidprice() + "원이며, "
								+ "낙찰자는 " + shResult.getSh_buyer() + "님 입니다. 축하드립니다.^^";
					} else {
						
						sh_comment = "낙찰된 사람이 없습니다.";
					}
					shouse.setSh_adkey(sh_adkey);
					shouse.setSh_comment(sh_comment);
					specialAuctionService.addAdminComment(shouse);
					
					BoardBean board = new BoardBean();
					board.setEb_laprice(shResult.getSh_bidprice());
					board.setEb_itemnum(shResult.getEb_itemnum());
					specialAuctionService.insertSpecialAuctionLaprice(board);
					
					num = 0;
				} else if(num == 20 && today.split(":")[0].equals(allRoom[i][0]) && (Integer.parseInt(today.split(":")[1]) >= 2) ) {
					System.out.println("currentPrice : " + currentPrice);
					SHouse sh = specialAuctionService.selectBidCount(shouse);
					if(sh.getSh_bidcount() > 0) {
						currentPrice = (currentPrice + currentPrice * 10 / 100) / 100 * 100;
						
						sh_adkey = "응찰";
						sh_comment = "다음은 응찰가 " + currentPrice + "원에 대해 진행하겠습니다. \r\n"
								+ "3분간 응찰할 수 있습니다.";
						shouse.setSh_adkey(sh_adkey);
						shouse.setSh_comment(sh_comment);
						shouse.setSh_bidprice(currentPrice);
						specialAuctionService.addAdminComment(shouse);
						
					} else if(sh.getSh_bidcount() == 0) {
						sh_adkey = "미응찰";
						sh_comment = "아무도 " + currentPrice + "원에 대해 응찰한 사람이 없습니다. \n"
								+ "1분간 응찰한 사람이 없을 경우 경매를 종료하겠습니다.";
						shouse.setSh_adkey(sh_adkey);
						shouse.setSh_comment(sh_comment);
						specialAuctionService.addAdminComment(shouse);
						
					}
					
					num = 0;
					
				} 
			}
		}	
	}
	
	public SHouse commentInfo(String adkey, SHouse s) throws Exception{
		return specialAuctionService.selectCommentInfo(adkey, s);
	}
	
	public String adKeyType(String type, SHouse sh) throws Exception {
		String adkey = "";
		sh.setSh_buyer("admin");
		List<SHouse> shouseInfo = specialAuctionService.currentAdkey(sh);
		for(int i = 0; i < shouseInfo.size(); i++) {
			if(shouseInfo.get(i).getSh_adkey() == null) {
				continue;
			} else if(shouseInfo.get(i).getSh_adkey().equals(type)) {
				adkey = type;
				break;
			}
		}
		return adkey;
	}
	
}

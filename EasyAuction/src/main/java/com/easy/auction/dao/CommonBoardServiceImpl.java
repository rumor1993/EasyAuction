package com.easy.auction.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.easy.auction.model.Attent;
import com.easy.auction.model.BoardBean;
import com.easy.auction.model.Category;
import com.easy.auction.model.GHouse;
import com.easy.auction.model.PList;
import com.easy.auction.model.SList;

@Service("CommonBoardService")
public class CommonBoardServiceImpl implements CommonBoardService {
	
	@Autowired
	private CommonBoardDAOImpl commonDao;


	@Override
	public int getListCount() throws Exception {
		return commonDao.getListCount();
	}

	@Override
	public List<BoardBean> getBoardList(int page, int limit) throws Exception {
		return commonDao.getBoardList(page, limit);
	}

	@Override
	public BoardBean getBoardCont(String eb_itemnum) throws Exception {
		return commonDao.getBoardCont(eb_itemnum);
	}

	@Override
	public void boardHit(int num) throws Exception {
		commonDao.boardHit(num);
	}

	@Override
	public void editBoard(BoardBean board) throws Exception {
		commonDao.boardEdit(board);
	}

	@Override
	public void deleteBoard(int board_num) throws Exception {
		commonDao.boardDelete(board_num);
	}

	@Override
	public int getListCount3(Map m) throws Exception {
		return commonDao.getListCount3(m);
	}

	@Override
	public List<BoardBean> getBoardList3(Map m) throws Exception {
		return commonDao.getBoardList3(m);
	}

	//카테고리 뽑아오기
	@Override
	public String product_category(BoardBean board) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	// 상품 즉시구매
	@Override
	public void product_purchase(BoardBean board) throws Exception {
		// TODO Auto-generated method stub
		
	}

	// 상품 찜하기
	@Override
	public void product_basket(BoardBean board, Attent at) throws Exception {
		// TODO Auto-generated method stub
		
	}

	// 입찰취소하기
	@Override
	public void bid_cancel(BoardBean board, GHouse gh) throws Exception {
		// TODO Auto-generated method stub
		
	}

	/*일반경매 등록*/
	@Override
	public void commonInsert(BoardBean board) throws Exception {
		this.commonDao.commonInsert(board);
		
	}

	// 상품 입찰하기
	@Override
	public void product_bid(BoardBean board, GHouse gh) throws Exception {
		// TODO Auto-generated method stub
		
	}

	// 물품번호 중복체크
	@Override
	public String Check_itemnum(String eb_itemnum) throws Exception {
		return this.commonDao.Check_itemnum(eb_itemnum);
	}

	// 최고입찰자 아이디 구하기
	@Override
	public String getBuyer(String eb_itemnum) throws Exception {
		return this.commonDao.getBuyer(eb_itemnum);
		
	}

	@Override
	public void attentInsert(Attent attent) throws Exception {
		this.commonDao.attentInsert(attent);
		
	}

	@Override
	public void boardAttentHit(String eb_itemnum) throws Exception {
		this.commonDao.boardAttentHit(eb_itemnum);
		
	}

	@Override
	public int attentCheck(String ea_user, String eb_itemnum) throws Exception {
		return this.commonDao.attentCheck(ea_user,eb_itemnum);
	}

	@Override
	public void attentDelete(String ea_user, String eb_itemnum) throws Exception {
		this.commonDao.attentDelete(ea_user,eb_itemnum);
		
	}

	@Override
	public void boardAttentHitDown(String eb_itemnum) throws Exception {
		this.commonDao.boardAttentHitDown(eb_itemnum);
		
	}

	@Override
	public List<GHouse> getGhouse(String eb_itemnum) throws Exception {
		return this.commonDao.getGhouse(eb_itemnum);
	}

	@Override
	public void boardBidHit(String eb_itemnum) throws Exception {
		this.commonDao.boardBidHit(eb_itemnum);		
	}

	@Override
	public void insertGhouse(GHouse gh) throws Exception {
		this.commonDao.insertGhouse(gh);
	}

	@Override
	public void boardUpdate( int bidprice,String itemnum) throws Exception {
		this.commonDao.boardUpdate(bidprice,itemnum);
	}

	@Override
	public void boardLadateUpdate(String eb_itemnum) throws Exception {
		this.commonDao.boardLadateUpdate(eb_itemnum);
		
	}

	@Override
	public List<BoardBean> getBoardList() throws Exception {
		return this.commonDao.getBoardList();
	}

	@Override
	public int getListCount3() throws Exception {
		return this.commonDao.getListCount3();
	}

	@Override
	public List<BoardBean> getBoardList3() throws Exception {
		return this.commonDao.getBoardList3();
	}

	@Override
	public List<Category> getCategory(String categoryname) throws Exception {
		return this.commonDao.getCategory(categoryname);
	}

	@Override
	public void fastPurchaseBuyer(PList plist) throws Exception {
		this.commonDao.fastPurchaseBuyer(plist);
		
	}

	@Override
	public void fastPurchaseSeller(SList slist) throws Exception {
		this.commonDao.fastPurchaseSeller(slist);
		
	}

	@Override
	public void fastPurchaseBuyEnd(String eb_itemnum) throws Exception {
		this.commonDao.fastPurchaseBuyEnd(eb_itemnum);
		
	}

	@Override
	public int getUserPoint(String ep_user) throws Exception {
	   return this.commonDao.getUserPoint(ep_user);
		
	}

	@Override
	public void BuyerPointDecrease(String ep_user, int point) throws Exception {
		this.commonDao.BuyerPointDecrease(ep_user,point);
		
	}

	@Override
	public List<Category> getSmallCategory(String category) throws Exception {
		return this.commonDao.getSmallCategory(category);
	}

	@Override
	public List<BoardBean> get_category_list(Map m) throws Exception {
		return this.commonDao.get_category_list(m);
	}

	@Override
	public int salesCompleteListConut(Map m) throws Exception {
		return this.commonDao.salesCompleteListConut(m);
	}

	@Override
	public List<BoardBean> getsalesCompleteList3(Map m) throws Exception {
		return this.commonDao.getsalesCompleteList3(m);
	}




}

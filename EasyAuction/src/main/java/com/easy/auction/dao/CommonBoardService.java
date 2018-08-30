package com.easy.auction.dao;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.easy.auction.model.Attent;
import com.easy.auction.model.BoardBean;
import com.easy.auction.model.Category;
import com.easy.auction.model.GHouse;
import com.easy.auction.model.PList;
import com.easy.auction.model.SList;

public interface CommonBoardService {
	
	/*일반경매 등록*/
	public void commonInsert(BoardBean board) throws Exception;

	/* 자료실 총 게시물 수*/
	public int getListCount() throws Exception;
	
	/* 자료실 목록과 페이징 */
	public List<BoardBean> getBoardList(int page, int limit) throws Exception ;

	/*번호를 기준으로 자료실 내용 가져오기 */
	public BoardBean getBoardCont(String eb_itemnum) throws Exception;

	/*내용보기 할때만 조회수 증가*/
	public void boardHit(int num) throws Exception;

	/*자료실 수정*/
	public void editBoard(BoardBean board) throws Exception;

	/*자료실 삭제*/
	public void deleteBoard(int board_num) throws Exception;

	/*검색된 게시물 수*/
	public int getListCount3(Map m) throws Exception;

	/*검색 결과 페이징 목록*/
	public List<BoardBean> getBoardList3(Map m) throws Exception ;
	
	//카테고리 뽑아오기
	public String product_category(BoardBean board) throws Exception;
	
	// 상품 즉시구매
	public void product_purchase(BoardBean board)throws Exception;
	
	// 상품 입찰하기
	public void product_bid(BoardBean board, GHouse gh) throws Exception;
	
	// 상품 찜하기
	public void product_basket(BoardBean board, Attent at) throws Exception;
	
	// 입찰취소하기
	public void bid_cancel(BoardBean board, GHouse gh) throws Exception;

	// 물품번호 중복체크
	public String Check_itemnum(String eb_itemnum) throws Exception;

	// 최고입찰자 아이디 구하기
	public String getBuyer(String eb_itemnum) throws Exception;

	// 상품 찜하기  DB에 넣기
	public void attentInsert(Attent attent) throws Exception;

	// 관심수 올리기
	public void boardAttentHit(String eb_itemnum) throws Exception;

	// 찜하기 중복체크
	public int attentCheck(String ea_user, String eb_itemnum) throws Exception;

	// 찜하기 취소
	public void attentDelete(String ea_user, String eb_itemnum)throws Exception;

	// 관심수 내리기
	public void boardAttentHitDown(String eb_itemnum) throws Exception;

	// 특정 물품에 대한 입찰리스트
	public List<GHouse> getGhouse(String eb_itemnum) throws Exception;

	// 입찰수 올리기
	public void boardBidHit(String eb_itemnum) throws Exception;

	// 입찰하기
	public void insertGhouse(GHouse gh) throws Exception;

	// 경매 물품 최신화 해주기
	public void boardUpdate(int bidprice,String itemnum) throws Exception;

	// 경매시간 1분연장 해주기
	public void boardLadateUpdate(String eb_itemnum) throws Exception;

	
	public List<BoardBean> getBoardList() throws Exception;

	public int getListCount3() throws Exception;

	public List<BoardBean> getBoardList3() throws Exception;

	public List<Category> getCategory(String categoryname) throws Exception;

	public void fastPurchaseBuyer(PList plist) throws Exception;

	public void fastPurchaseSeller(SList slist) throws Exception;

	public void fastPurchaseBuyEnd(String eb_itemnum)throws Exception;

	public int getUserPoint(String ep_user) throws Exception;

	public void BuyerPointDecrease(String ep_user, int point) throws Exception;

	public List<Category> getSmallCategory(String category)throws Exception;

	public List<BoardBean> get_category_list(Map m)throws Exception;

	public int salesCompleteListConut(Map m)throws Exception;

	public List<BoardBean> getsalesCompleteList3(Map m)throws Exception;
	
	



}

package com.easy.auction.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.easy.auction.model.Attent;
import com.easy.auction.model.BoardBean;
import com.easy.auction.model.Category;
import com.easy.auction.model.GHouse;
import com.easy.auction.model.PList;
import com.easy.auction.model.SList;

import oracle.net.aso.s;

@Repository
public class CommonBoardDAOImpl {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/*일반경매 등록*/
	public void commonInsert(BoardBean board) throws Exception {
			this.sqlSession.insert("CBOARD1.board_insert",board);
	}
	
	public int getListCount() {
		return sqlSession.selectOne("CBOARD1.board_count");
	}
	
	public List<BoardBean> getBoardList(int page,int limit) {
		Map m = new HashMap<>();
		m.put("page", page);
		m.put("limit", limit);
		return sqlSession.selectList("CBOARD1.board_list",m);
	}

	public BoardBean getBoardCont(String eb_itemnum) {
		return sqlSession.selectOne("CBOARD1.board_cont", eb_itemnum);
	}
	
	public void boardHit(int board_num) {
		sqlSession.update("CBOARD1.board_hit", board_num);
	}

	public void boardDelete(int board_num) {
		
		sqlSession.delete("CBOARD1.board_del", board_num);
	}

	public void boardEdit(BoardBean board) {
		sqlSession.update("CBOARD1.board_edit", board);
		
	}
	public int getListCount3(Map m) throws Exception {
		int count = sqlSession.selectOne("CBOARD1.board_search_count", m);
		return count;
	}

	public List<BoardBean> getBoardList3(Map m) throws Exception {
		return sqlSession.selectList("CBOARD1.board_search_list", m);	 
	}

	
	//카테고리 뽑아오기
	public String product_category(BoardBean board) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	// 상품 즉시구매
	public void product_purchase(BoardBean board) throws Exception {
		// TODO Auto-generated method stub
		
	}

	// 상품 찜하기
	public void product_basket(BoardBean board, Attent at) throws Exception {
		// TODO Auto-generated method stub
			
	}

	// 입찰취소하기
	public void bid_cancel(BoardBean board, GHouse gh) throws Exception {
		// TODO Auto-generated method stub
			
	}

	// 상품 입찰하기
	public void product_bid(BoardBean board, GHouse gh) throws Exception {
			// TODO Auto-generated method stub
			
	}

	// 물품번호 중복체크
	public String Check_itemnum(String eb_itemnum) {
		return this.sqlSession.selectOne("CBOARD1.check_itemnum", eb_itemnum);
	}

	// 최고입찰자 아이디 구하기
	public String getBuyer(String eb_itemnum) {
		return this.sqlSession.selectOne("GHOUSE1.getGhouse",eb_itemnum);
	}

	// 찜한 값 넣기
	public void attentInsert(Attent attent) {
		this.sqlSession.insert("ATTENT1.product_basket", attent);
		
	}

	// 관심수 올리기
	public void boardAttentHit(String eb_itemnum) {
		this.sqlSession.update("CBOARD1.AttentHit",eb_itemnum);
	
	}

	public int attentCheck(String ea_user, String eb_itemnum) {
		Map m = new HashMap<>();
		m.put("ea_user", ea_user);
		m.put("eb_itemnum", eb_itemnum);
		return this.sqlSession.selectOne("ATTENT1.attentCheck",m);
	}

	public void attentDelete(String ea_user, String eb_itemnum) {
		Map m = new HashMap<>();
		m.put("ea_user", ea_user);
		m.put("eb_itemnum", eb_itemnum);
		this.sqlSession.delete("ATTENT1.attentDelete",m);
		
	}

	public void boardAttentHitDown(String eb_itemnum) {
		this.sqlSession.update("CBOARD1.AttentHitDown",eb_itemnum);
		
	}

	public List<GHouse> getGhouse(String eb_itemnum) {
		return this.sqlSession.selectList("GHOUSE1.getGhouse",eb_itemnum);
	}

	public void boardBidHit(String eb_itemnum) {
		this.sqlSession.update("CBOARD1.bidHit",eb_itemnum);
		
	}

	public void insertGhouse(GHouse gh) {
		this.sqlSession.insert("GHOUSE1.insertGhouse",gh);
	}

	public void boardUpdate(int bidprice,String itemnum) {
		Map m = new HashMap<>();
		m.put("bidprice", bidprice);
		m.put("itemnum", itemnum);
		this.sqlSession.update("CBOARD1.boardUpdate",m);
	}

	public void boardLadateUpdate(String eb_itemnum) {
		this.sqlSession.update("CBOARD1.LadateUpdate",eb_itemnum);
		
	}

	public List<BoardBean> getBoardList() {
		return this.sqlSession.selectList("CBOARD1.boardList2");
	}

	public int getListCount3() {
		int count = sqlSession.selectOne("CBOARD1.board_search_count2");
		return count;
	}

	public List<BoardBean> getBoardList3() {
		return sqlSession.selectList("CBOARD1.board_search_list2");	 
	}

	public List<Category> getCategory(String categoryname) {
		return this.sqlSession.selectList("CATEGORY01.getCategory", categoryname);
	}

	public void fastPurchaseBuyer(PList plist) {
		this.sqlSession.insert("PLIST1.insertPlist",plist);
		
	}

	public void fastPurchaseSeller(SList slist) {
		this.sqlSession.insert("SLIST1.insertSlist",slist);
		
	}

	public void fastPurchaseBuyEnd(String eb_itemnum) {
		this.sqlSession.update("CBOARD1.fastPurchaseBuyEnd",eb_itemnum);
	}

	public int getUserPoint(String ep_user) {
		return this.sqlSession.selectOne("CBOARD1.getUserPoint",ep_user);
		
	}

	public void BuyerPointDecrease(String ep_user, int point) {
		Map m = new HashMap<>();
		m.put("user", ep_user);
		m.put("ep_price", point);
		this.sqlSession.update("PointDecrease",m);
		
	}

	public List<Category> getSmallCategory(String category) {
		return sqlSession.selectList("CATEGORY01.getSmallCategory",category);
	}

	public List<BoardBean> get_category_list(Map m) {
		return sqlSession.selectList("CBOARD1.getCategoryList",m);
	}

	public int salesCompleteListConut(Map m) {
		return sqlSession.selectOne("CBOARD1.salesCompleteListConut",m);
	}

	public List<BoardBean> getsalesCompleteList3(Map m) {
		return sqlSession.selectList("CBOARD1.getsalesCompleteList",m);
	}
}

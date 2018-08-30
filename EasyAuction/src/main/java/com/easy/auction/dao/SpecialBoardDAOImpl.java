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
import com.easy.auction.model.SHouse;
import com.easy.auction.model.SHouseList;

@Repository
public class SpecialBoardDAOImpl {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private Object specialDao;
	


	/* 게시판 저장 */
	public void insertBoard(BoardBean board) {
		System.out.println("dao의 choicedate = " + board.getEb_choicedate());
		sqlSession.insert("BOARD1.board_insert", board);
	}
	
	public int getListCount(String eb_state) {
		int count = sqlSession.selectOne("BOARD1.board_count", eb_state);
		return count;
	}
	
	//대기&검증중&완료 리스트
	public List<BoardBean> getBoardList(int page,int limit,String eb_state) {
		List<BoardBean> list = new ArrayList<BoardBean>();
		HashMap hm = new HashMap();
		hm.put("page", page);
		hm.put("limit",limit);
		hm.put("eb_state",eb_state);

		list = sqlSession.selectList("BOARD1.board_list", hm);
		return list;
	}
	
	//오픈리스트
	public List<BoardBean> getAuctionList() {
		return sqlSession.selectList("BOARD1.auction_list");
	}
	
	//의뢰상품 상태변경
	public void request_State(BoardBean board) throws Exception {
		sqlSession.update("BOARD1.board_wait", board);
	}

	// 조회수 증가
	public void boardHit(String itemnum) {
		sqlSession.update("BOARD1.board_hit", itemnum);
	}

	// 게시물삭제
	public void boardDelete(String eb_itemnum) {
		
		sqlSession.delete("BOARD1.board_del", eb_itemnum);
	}

	//게시물 수정
	public void boardEdit(BoardBean board) {
		sqlSession.update("BOARD1.board_edit", board);
		
	}

	/*특수경매 오픈등록*/
	public void specialStateUpdate(BoardBean board) throws Exception {
		sqlSession.update("BOARD1.state_update_open_ready", board);
	}
	

	
	/*특수경매 금일오픈*/
	public void today_open(String itemnum) throws Exception {
		sqlSession.update("BOARD1.today_open", itemnum);
	}
	/*특수경매 리얼오픈*/
	public void realOpen(String itemnum) throws Exception {
		sqlSession.update("BOARD1.real_open", itemnum);
	}
	
	// 상세정보보기
	public BoardBean auction_info(String itemnum) throws Exception {
		return sqlSession.selectOne("BOARD1.auction_info", itemnum);
	}
	
	// 카테고리 대분류 가져오기
	public List<Category> getBigCategory() throws Exception {
		return sqlSession.selectList("CATEGORY01.get_big_category");
	}
	
	// 소분류 카테고리 출력
	public List<Category> get_small_category(String category) throws Exception {
		return sqlSession.selectList("CATEGORY01.get_small_category", category);
	}
	
	// 카테고리별 준비중인 리스트 뽑아오기
	public List<BoardBean> category_auction_ready_list(HashMap hm) throws Exception {
		System.out.println("hm.get(\"big\") = "+ hm.get("big"));
		System.out.println("hm.get(\"small\") = "+ hm.get("small"));
		System.out.println("hm.get(\"range\") = "+ hm.get("range"));
		return sqlSession.selectList("BOARD1.category_auction_ready_list",hm);
	}
	
	// 상품 찜하기
	public void special_product_basket(Attent at) throws Exception {
		sqlSession.insert("ATTENT1.basket_insert",at);
	}
	// 상품 찜 취소하기
	public void special_product_basket_cancel(Attent at) throws Exception {
		sqlSession.delete("ATTENT1.basket_cancel",at);
	}
	// 관심수 증가
	public void basket_increase(String eb_itemnum) throws Exception {
		sqlSession.update("BOARD1.basket_increase",eb_itemnum);
	}
	
	// 관심수 감소
	public void basket_decrease(String eb_itemnum) throws Exception {
		sqlSession.update("BOARD1.basket_decrease",eb_itemnum);
	}
	
	// 관심 체크
	public Attent basket_check(Attent at) throws Exception {
		return sqlSession.selectOne("ATTENT1.basket_check",at);
	}
	
	// itemnum 증가값
	public int itemnum_increase() throws Exception {
		return sqlSession.selectOne("BOARD1.itemnum_increase");
	}
	
	// 카테고리 넘값 가져오기
	public int get_category_num(Category ct) throws Exception {
		return sqlSession.selectOne("CATEGORY01.get_category_num",ct);
	}
	
	// 남은경매장 보여주기...
	public List<SHouseList> get_SHouseList() throws Exception {
		return sqlSession.selectList("SHOUSE1.get_SHouseList");
	}
	
	// 경매장 업데이트하기
	public void SHouse_update(SHouseList shl) throws Exception {
		sqlSession.update("SHOUSE1.SHouse_update",shl);
	}
	
	// 검증된상품 재 검증하기
	public void reverify(String itemnum) throws Exception {
		sqlSession.update("BOARD1.reverify",itemnum);
		sqlSession.update("SHOUSE1.reverify",itemnum);
	}
	
	/*특수경매 종료*/
	public void special_finish(String itemnum) throws Exception {
		sqlSession.update("BOARD1.finish",itemnum);
	}
}

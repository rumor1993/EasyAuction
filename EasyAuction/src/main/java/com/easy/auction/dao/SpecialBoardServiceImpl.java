package com.easy.auction.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easy.auction.model.Attent;
import com.easy.auction.model.BoardBean;
import com.easy.auction.model.Category;
import com.easy.auction.model.SHouse;
import com.easy.auction.model.SHouseList;

@Service("SpecialBoardService")
public class SpecialBoardServiceImpl implements SpecialBoardService {

	@Autowired
	private SpecialBoardDAOImpl specialDao;
	//private BbsDAOImpl_old bbsDao;
	//private BbsDAO_jdbc bbsDao;

	/*특수경매 의뢰등록*/
	@Override
	public void insertBoard(BoardBean board) throws Exception {
		specialDao.insertBoard(board);
	}

	/* 자료실  게시물 수*/
	@Override
	public int getListCount(String eb_state) throws Exception {
		return specialDao.getListCount(eb_state);
	}
	
	/* 대기/검증중/완료 리스트 */
	@Override
	public List<BoardBean> getBoardList(int page, int limit,String eb_wait) throws Exception {
		return specialDao.getBoardList(page, limit,eb_wait);
	}

	// 오픈리스트
	@Override
	public List<BoardBean> getAuctionList() throws Exception {
		return specialDao.getAuctionList();
	}

	// 조회수증가
	@Override
	public void boardHit(String itemnum) throws Exception {
		specialDao.boardHit(itemnum);
	}

	// 수정하기
	@Override
	public void editBoard(BoardBean board) throws Exception {
		specialDao.boardEdit(board);
	}

	// 삭제하기
	@Override
	public void deleteBoard(String eb_itemnum) throws Exception {
		specialDao.boardDelete(eb_itemnum);
	}

	//의뢰상품 상태변경
	@Override
	public void request_State(BoardBean board) throws Exception {
		specialDao.request_State(board);
	}

	// 카테고리 뽑아오기
	@Override
	public String product_category(BoardBean board) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	// 상품 찜하기
	@Override
	public void special_product_basket(Attent at) throws Exception {
		specialDao.special_product_basket(at);
	}
	
	// 상품 찜 취소하기
	@Override
	public void special_product_basket_cancel(Attent at) throws Exception {
		specialDao.special_product_basket_cancel(at);
	}

	/*특수경매 오픈준비등록*/
	@Override
	public void specialStateUpdate(BoardBean board) throws Exception {
		specialDao.specialStateUpdate(board);
	}

	/*특수경매 금일오픈*/
	@Override
	public void today_open(String itemnum) throws Exception {
		specialDao.today_open(itemnum);
		
	}
	
	/*특수경매 리얼오픈*/
	@Override
	public void realOpen(String itemnum) throws Exception {
		specialDao.realOpen(itemnum);
	}

	// 상세정보보기
	@Override
	public BoardBean auction_info(String itemnum) throws Exception {
		return specialDao.auction_info(itemnum);
		
	}

	// 카테고리 대분류 가져오기
	@Override
	public List<Category> getBigCategory() throws Exception {
		return specialDao.getBigCategory();
	}

	// 소분류 카테고리 출력
	@Override
	public List<Category> get_small_category(String category) throws Exception {
		return specialDao.get_small_category(category);
	}

	// 카테고리별 준비중인 리스트 뽑아오기
	@Override
	public List<BoardBean> category_auction_ready_list(HashMap hm) throws Exception {
		return specialDao.category_auction_ready_list(hm);
	}

	// 관심수 증가
	@Override
	public void basket_increase(String eb_itemnum) throws Exception {
		specialDao.basket_increase(eb_itemnum);
	}

	// 관심 체크
	@Override
	public Attent basket_check(Attent at) throws Exception {
		return specialDao.basket_check(at);
	}

	//관심수 감소
	@Override
	public void basket_decrease(String eb_itemnum) throws Exception {
		specialDao.basket_decrease(eb_itemnum);
	}

	// itemnum 증가값
	@Override
	public int itemnum_increase() throws Exception {
		return specialDao.itemnum_increase();
	}

	// 카테고리 넘값 가져오기
	@Override
	public int get_category_num(Category ct) throws Exception {
		return specialDao.get_category_num(ct);
	}

	// 남은경매장 보여주기...
	@Override
	public List<SHouseList> get_SHouseList() throws Exception {
		return specialDao.get_SHouseList();
	}

	// 경매장 업데이트하기
	@Override
	public void SHouse_update(SHouseList shl) throws Exception {
		specialDao.SHouse_update(shl);
	}

	// 검증된상품 재 검증하기
	@Override
	public void reverify(String itemnum) throws Exception {
		specialDao.reverify(itemnum);
	}
	
	/*특수경매 종료*/
	@Override
	public void special_finish(String itemnum) throws Exception {
		specialDao.special_finish(itemnum);
	}




	




}

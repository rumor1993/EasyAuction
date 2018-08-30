package com.easy.auction.dao;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.easy.auction.model.Attent;
import com.easy.auction.model.BoardBean;
import com.easy.auction.model.Category;
import com.easy.auction.model.SHouse;
import com.easy.auction.model.SHouseList;

public interface SpecialBoardService {
	
	/*특수경매 의뢰등록*/
	public void insertBoard(BoardBean board) throws Exception;
	
	/* 대기/검증중/완료 리스트 */
	public List<BoardBean> getBoardList(int page, int limit, String eb_wait) throws Exception ;
	
	/*특수경매 오픈준비등록*/
	public void specialStateUpdate(BoardBean board) throws Exception;
	
	/*특수경매 금일오픈*/
	public void today_open(String itemnum) throws Exception;
	
	/*특수경매 리얼오픈*/
	public void realOpen(String itemnum) throws Exception;

	/* 자료실  게시물 수*/
	public int getListCount(String eb_state) throws Exception;
	
	/* 의뢰상품 상태 변경 */
	public void request_State(BoardBean board) throws Exception;
	
	/* 경매오픈 리스트 */
	public List<BoardBean> getAuctionList() throws Exception ;

	/*내용보기 할때만 조회수 증가*/
	public void boardHit(String itemnum) throws Exception;

	/*게시물 수정*/
	public void editBoard(BoardBean board) throws Exception;

	/*게시물 삭제*/
	public void deleteBoard(String eb_itemnum) throws Exception;
	
	//카테고리 뽑아오기
	public String product_category(BoardBean board) throws Exception;

	// 상품 찜하기
	public void special_product_basket(Attent at) throws Exception;
	
	// 상품 찜취소하기
	public void special_product_basket_cancel(Attent at) throws Exception;
	
	// 상세정보보기
	public BoardBean auction_info(String itemnum) throws Exception;
	
	// 카테고리 대분류 가져오기
	public List<Category> getBigCategory() throws Exception;
	
	// 소분류 카테고리 출력
	public List<Category> get_small_category(String category) throws Exception;
	
	// 대분류 카테고리 클릭
	public List<BoardBean> category_auction_ready_list(HashMap hm) throws Exception;
	
	// 관심수 증가
	public void basket_increase(String eb_itemnum) throws Exception;
	
	// 관심수 감소
	public void basket_decrease(String eb_itemnum) throws Exception;
	
	// 관심여부 확인
	public Attent basket_check(Attent at) throws Exception;
	
	// itemnum 증가값
	public int itemnum_increase() throws Exception;
	
	// 카테고리 넘값 가져오기
	public int get_category_num(Category ct) throws Exception;
	
	// 남은경매장 보여주기...
	public List<SHouseList> get_SHouseList() throws Exception;
	
	// 경매장 업데이트하기
	public void SHouse_update(SHouseList shl) throws Exception;
	
	// 검증된상품 재 검증하기
	public void reverify(String itemnum) throws Exception;
	
	/*특수경매 종료*/
	public void special_finish(String itemnum) throws Exception;
	
}

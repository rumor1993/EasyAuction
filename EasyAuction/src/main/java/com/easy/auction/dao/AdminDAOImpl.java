package com.easy.auction.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.easy.auction.model.BoardBean;
import com.easy.auction.model.Cancel;
import com.easy.auction.model.MemberBean;
import com.easy.auction.model.PList;
import com.easy.auction.model.Point;
import com.easy.auction.model.Review;

@Repository
public class AdminDAOImpl {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Review> listReviewLatest() throws Exception{
		return sqlSession.selectList("ADMIN1.list_reviewlatest");
	}
	
	public List<BoardBean> listSpecialDeadline() throws Exception{
		return sqlSession.selectList("ADMIN1.list_specialdeadline");
	}
	
	public List<BoardBean> listCommonDeadline() throws Exception{
		return sqlSession.selectList("ADMIN1.list_commondeadline");
	}
	
	public List<BoardBean> listCommonPopularity() throws Exception{
		return sqlSession.selectList("ADMIN1.list_commonpopularity");
	}
	
	public List<MemberBean> listMemberInfo() throws Exception{
		return sqlSession.selectList("ADMIN1.list_memberinfo");
	}
	
	public List<Object> memberUsage() throws Exception{
		return sqlSession.selectList("ADMIN1.member_usage");
	}
	
	public List<Object> boardRegCount(String itemnum) throws Exception{
		return sqlSession.selectList("ADMIN1.board_regcount", itemnum);
	}
	
	public List<Object> boardRegCategory(String itemnum) throws Exception{
		return sqlSession.selectList("ADMIN1.board_regcate", itemnum);
	}
	
	public List<Point> listUserAccountInfo(String id) throws Exception{
		return sqlSession.selectList("ADMIN1.list_useraccountinfo", id);
	}
	
	public int countMessageBellState(String id) throws Exception{
		return sqlSession.selectOne("ADMIN1.count_message", id);
	}
	
	public void editUserAccountInfo(Point point) throws Exception{
		sqlSession.update("ADMIN1.edit_useraccountinfo", point);
	}
	
	public void depositUserAccount(Point point) throws Exception{
		sqlSession.update("ADMIN1.deposit_useraccount", point);
	}
	
	public void withdrawUserAccount(Point point) throws Exception{
		sqlSession.update("ADMIN1.withdraw_useraccount", point);
	}
	
	public int countPlistBidcancel(String id) throws Exception{
		return sqlSession.selectOne("count_plist_bidcancel", id);
	}
	
	public List<Cancel> listPlistBidcancel(String id) throws Exception{
		return sqlSession.selectList("list_plist_bidcancel", id);
	}
	
	public void updatePlistResult(PList plist) throws Exception{
		sqlSession.update("update_plist_result", plist);
	}
	
	public BoardBean selectBidcancelBoardInfo(String itemnum) throws Exception{
		return sqlSession.selectOne("select_bidcancel_board_info", itemnum);
	}
	
	public void updateBidcancelBoardDate(BoardBean board) throws Exception{
		sqlSession.update("update_bidcancel_board_date", board);
	}
}

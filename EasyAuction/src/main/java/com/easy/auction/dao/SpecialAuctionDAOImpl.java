package com.easy.auction.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.easy.auction.model.BoardBean;
import com.easy.auction.model.MemberBean;
import com.easy.auction.model.SHouse;
import com.easy.auction.model.SHouseList;

@Repository
public class SpecialAuctionDAOImpl {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void bidPriceInsert(SHouse shouse) throws Exception {
		sqlSession.insert("SHOUSE1.price_insert", shouse);
	}
	
	public void addBidCount(SHouse shouse) throws Exception{
		sqlSession.update("SHOUSE1.add_bidcount", shouse);
	}
	
	public SHouse selectBidCount(SHouse shouse) throws Exception{
		return sqlSession.selectOne("SHOUSE1.select_bidcount", shouse);
	}
	
	public List<SHouse> commentList(SHouse shouse) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("SHOUSE1.comment_list", shouse);
	}
	
	public SHouse currentPrice(SHouse shouse) throws Exception{
		return sqlSession.selectOne("SHOUSE1.current_price", shouse);
	}
	
	public void addAdminComment(SHouse shouse) throws Exception{
		sqlSession.insert("SHOUSE1.price_insert", shouse);
	}
	
	public SHouse selectCommentInfo(SHouse shouse) throws Exception{
		return sqlSession.selectOne("SHOUSE1.select_commentinfo", shouse);
	}
	
	public void editAdkey(SHouse shouse) throws Exception{
		sqlSession.update("SHOUSE1.edit_adkey", shouse);
	}
	
	public List<SHouse> currentAdkey(SHouse shouse) throws Exception{
		return sqlSession.selectList("SHOUSE1.comment_list", shouse);
	}
	
	public SHouseList selectHouseInfo(String itemnum) throws Exception{
		return sqlSession.selectOne("SHOUSE1.select_houseinfo", itemnum);
	}
	
	public void insertHouseInfo(SHouseList shlist) throws Exception{
		sqlSession.insert("SHOUSE1.insert_houseinfo", shlist);
	}
	
	public void updateHouseCount(SHouseList shlist) throws Exception{
		sqlSession.update("SHOUSE1.update_housecount", shlist);
	}
	
	public MemberBean viewUserPoint(String id) throws Exception{
		return sqlSession.selectOne("view_userpoint", id);
	}
	
	public BoardBean selectBoardInfo(String itemnum) throws Exception{
		return sqlSession.selectOne("SHOUSE1.select_boardInfo", itemnum);
	}
	
	public void insertSpecialAuctionLaprice(BoardBean board) throws Exception{
		sqlSession.update("insert_specialauction_laprice", board);
	}
}

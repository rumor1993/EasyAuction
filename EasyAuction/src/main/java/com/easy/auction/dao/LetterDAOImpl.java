package com.easy.auction.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.easy.auction.model.BoardBean;
import com.easy.auction.model.GHouse;
import com.easy.auction.model.Letter;

@Repository
public class LetterDAOImpl {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<BoardBean> lastPriceConfirm(String id) throws Exception{
		return sqlSession.selectList("LETTER1.laprice_confirm", id);
	}
	
	public GHouse selectBidedUser(BoardBean board) throws Exception{
		return sqlSession.selectOne("LETTER1.select_bideduser", board);
	}
	
	public List<Letter> listMessageView(String id) throws Exception{
		return sqlSession.selectList("LETTER1.list_messageview", id);
	}
	
	public void updateMessageConfirm(Letter letter) throws Exception{
		sqlSession.update("LETTER1.update_messageconfirm", letter);
	}
}

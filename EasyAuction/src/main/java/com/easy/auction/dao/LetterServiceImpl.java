package com.easy.auction.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easy.auction.model.BoardBean;
import com.easy.auction.model.GHouse;
import com.easy.auction.model.Letter;

@Service("LetterService")
public class LetterServiceImpl implements LetterService{
	@Autowired
	private LetterDAOImpl letterDao;

	@Override
	public List<BoardBean> lastPriceConfirm(String id) throws Exception {
		// TODO Auto-generated method stub
		return letterDao.lastPriceConfirm(id);
	}

	@Override
	public GHouse selectBidedUser(BoardBean board) throws Exception {
		// TODO Auto-generated method stub
		return letterDao.selectBidedUser(board);
	}

	@Override
	public List<Letter> listMessageView(String id) throws Exception {
		// TODO Auto-generated method stub
		return letterDao.listMessageView(id);
	}

	@Override
	public void updateMessageConfirm(Letter letter) throws Exception {
		// TODO Auto-generated method stub
		letterDao.updateMessageConfirm(letter);
	}

}

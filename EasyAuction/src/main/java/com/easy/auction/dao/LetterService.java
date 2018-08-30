package com.easy.auction.dao;

import java.util.List;

import com.easy.auction.model.BoardBean;
import com.easy.auction.model.GHouse;
import com.easy.auction.model.Letter;

public interface LetterService {
	public List<BoardBean> lastPriceConfirm(String id) throws Exception;
	
	public GHouse selectBidedUser(BoardBean board) throws Exception;
	
	public List<Letter> listMessageView(String id) throws Exception;
	
	public void updateMessageConfirm(Letter letter) throws Exception;
}

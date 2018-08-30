package com.easy.auction.dao;

import java.util.List;

import com.easy.auction.model.BoardBean;
import com.easy.auction.model.MemberBean;
import com.easy.auction.model.SHouse;
import com.easy.auction.model.SHouseList;

public interface SpecialAuctionService {
	
	public void bidPriceInsert(SHouse shouse) throws Exception;
	
	public void addBidCount(SHouse shouse) throws Exception;
	
	public SHouse selectBidCount(SHouse shouse) throws Exception;
	
	public List<SHouse> commentList(SHouse shouse) throws Exception;
	
	public SHouse currentPrice(SHouse shouse) throws Exception;
	
	public void addAdminComment(SHouse shouse) throws Exception;
	
	public SHouse selectCommentInfo(String adkey, SHouse shouse) throws Exception;
	
	public void editAdkey(SHouse shouse) throws Exception;
	
	public List<SHouse> currentAdkey(SHouse shouse) throws Exception;
	
	public SHouseList selectHouseInfo(String itemnum) throws Exception;
	
	public void insertHouseInfo(SHouseList shlist) throws Exception;
	
	public void updateHouseCount(SHouseList shlist) throws Exception;
	
	public MemberBean viewUserPoint(String id) throws Exception;
	
	public BoardBean selectBoardInfo(String itemnum) throws Exception;
	
	public void insertSpecialAuctionLaprice(BoardBean board) throws Exception;
}

package com.easy.auction.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easy.auction.model.BoardBean;
import com.easy.auction.model.MemberBean;
import com.easy.auction.model.SHouse;
import com.easy.auction.model.SHouseList;

@Service("SpecialAuctionService")
public class SpecialAuctionServiceImpl implements SpecialAuctionService{
	
	@Autowired
	private SpecialAuctionDAOImpl specialAuctionDao;
	
	//응찰가 입력하기
	@Override
	public void bidPriceInsert(SHouse shouse) throws Exception {
		// TODO Auto-generated method stub
		specialAuctionDao.bidPriceInsert(shouse);
	}
	
	@Override
	public void addBidCount(SHouse shouse) throws Exception {
		specialAuctionDao.addBidCount(shouse);
	}
	
	@Override
	public SHouse selectBidCount(SHouse shouse) throws Exception{
		return specialAuctionDao.selectBidCount(shouse);
	}

	//코멘트 가져오기
	@Override
	public List<SHouse> commentList(SHouse shouse) throws Exception {
		// TODO Auto-generated method stub
		
		return specialAuctionDao.commentList(shouse);
	}

	@Override
	public SHouse currentPrice(SHouse shouse) throws Exception {
		// TODO Auto-generated method stub
		return specialAuctionDao.currentPrice(shouse);
	}
	
	@Override
	public void addAdminComment(SHouse shouse) throws Exception{
		specialAuctionDao.addAdminComment(shouse);
	}
	
	@Override
	public SHouse selectCommentInfo(String adkey, SHouse shouse) throws Exception{
		shouse.setSh_adkey(adkey);
		return specialAuctionDao.selectCommentInfo(shouse);
	}
	
	@Override
	public void editAdkey(SHouse shouse) throws Exception{
		specialAuctionDao.editAdkey(shouse);
	}

	@Override
	public List<SHouse> currentAdkey(SHouse shouse) throws Exception {
		// TODO Auto-generated method stub
		return specialAuctionDao.currentAdkey(shouse);
	}
	
	@Override
	public SHouseList selectHouseInfo(String itemnum) throws Exception {
		// TODO Auto-generated method stub
		return specialAuctionDao.selectHouseInfo(itemnum);
	}

	@Override
	public void insertHouseInfo(SHouseList shlist) throws Exception {
		// TODO Auto-generated method stub
		specialAuctionDao.insertHouseInfo(shlist);
	}

	@Override
	public void updateHouseCount(SHouseList shlist) throws Exception {
		// TODO Auto-generated method stub
		specialAuctionDao.updateHouseCount(shlist);
	}

	@Override
	public MemberBean viewUserPoint(String id) throws Exception {
		// TODO Auto-generated method stub
		return specialAuctionDao.viewUserPoint(id);
	}

	@Override
	public BoardBean selectBoardInfo(String itemnum) throws Exception {
		// TODO Auto-generated method stub
		return specialAuctionDao.selectBoardInfo(itemnum);
	}

	@Override
	public void insertSpecialAuctionLaprice(BoardBean board) throws Exception {
		// TODO Auto-generated method stub
		specialAuctionDao.insertSpecialAuctionLaprice(board);
	}
	
}

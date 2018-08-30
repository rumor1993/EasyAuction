package com.easy.auction.dao;

import java.util.List;

import com.easy.auction.model.BoardBean;
import com.easy.auction.model.Cancel;
import com.easy.auction.model.MemberBean;
import com.easy.auction.model.PList;
import com.easy.auction.model.Point;
import com.easy.auction.model.Review;

public interface AdminService {
	public List<Review> listReviewLatest() throws Exception;
	
	public List<BoardBean> listSpecialDeadline() throws Exception;
	
	public List<BoardBean> listCommonDeadline() throws Exception;
	
	public List<BoardBean> listCommonPopularity() throws Exception;
	
	public List<MemberBean> listMemberInfo() throws Exception;
	
	public List<Object> memberUsage() throws Exception;
	
	public List<Object> boardRegCount(String itemnum) throws Exception;
	
	public List<Object> boardRegCategory(String itemnum) throws Exception;
	
	public List<Point> listUserAccountInfo(String id) throws Exception;
	
	public int countMessageBellState(String id) throws Exception;
	
	public void editUserAccountInfo(Point point) throws Exception;
	
	public void depositUserAccount(Point point) throws Exception;
	
	public void withdrawUserAccount(Point point) throws Exception;
	
	public int countPlistBidcancel(String id) throws Exception;
	
	public List<Cancel> listPlistBidcancel(String id) throws Exception;
	
	public void updatePlistResult(PList plist) throws Exception;
	
	public BoardBean selectBidcancelBoardInfo(String itemnum) throws Exception;
	
	public void updateBidcancelBoardDate(BoardBean board) throws Exception;
}

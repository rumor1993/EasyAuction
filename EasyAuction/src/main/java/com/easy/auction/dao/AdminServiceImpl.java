package com.easy.auction.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easy.auction.model.BoardBean;
import com.easy.auction.model.Cancel;
import com.easy.auction.model.MemberBean;
import com.easy.auction.model.PList;
import com.easy.auction.model.Point;
import com.easy.auction.model.Review;

@Service("AdminService")
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDAOImpl adminDao;
	
	@Override
	public List<Review> listReviewLatest() throws Exception {
		// TODO Auto-generated method stub
		return adminDao.listReviewLatest();
	}
	
	@Override
	public List<BoardBean> listSpecialDeadline() throws Exception {
		// TODO Auto-generated method stub
		return adminDao.listSpecialDeadline();
	}

	
	@Override
	public List<BoardBean> listCommonDeadline() throws Exception {
		// TODO Auto-generated method stub
		return adminDao.listCommonDeadline();
	}
	
	@Override
	public List<BoardBean> listCommonPopularity() throws Exception {
		// TODO Auto-generated method stub
		return adminDao.listCommonPopularity();
	}

	@Override
	public List<MemberBean> listMemberInfo() throws Exception {
		// TODO Auto-generated method stub
		return adminDao.listMemberInfo();
	}

	@Override
	public List<Object> memberUsage() throws Exception {
		// TODO Auto-generated method stub
		return adminDao.memberUsage();
	}

	@Override
	public List<Object> boardRegCount(String itemnum) throws Exception {
		// TODO Auto-generated method stub
		return adminDao.boardRegCount(itemnum);
	}

	@Override
	public List<Object> boardRegCategory(String itemnum) throws Exception {
		// TODO Auto-generated method stub
		return adminDao.boardRegCategory(itemnum);
	}

	@Override
	public List<Point> listUserAccountInfo(String id) throws Exception {
		// TODO Auto-generated method stub
		return adminDao.listUserAccountInfo(id);
	}
	
	@Override
	public int countMessageBellState(String id) throws Exception{
		return adminDao.countMessageBellState(id);
	}

	@Override
	public void depositUserAccount(Point point) throws Exception {
		// TODO Auto-generated method stub
		adminDao.depositUserAccount(point);
	}
	
	@Override
	public void editUserAccountInfo(Point point) throws Exception {
		// TODO Auto-generated method stub
		adminDao.editUserAccountInfo(point);
	}

	@Override
	public void withdrawUserAccount(Point point) throws Exception {
		// TODO Auto-generated method stub
		adminDao.withdrawUserAccount(point);
	}
	
	@Override
	public int countPlistBidcancel(String id) throws Exception{
		return adminDao.countPlistBidcancel(id);
	}

	@Override
	public List<Cancel> listPlistBidcancel(String id) throws Exception{
		return adminDao.listPlistBidcancel(id);
	}

	@Override
	public void updatePlistResult(PList plist) throws Exception {
		// TODO Auto-generated method stub
		adminDao.updatePlistResult(plist);
		
	}

	@Override
	public BoardBean selectBidcancelBoardInfo(String itemnum) throws Exception {
		// TODO Auto-generated method stub
		return adminDao.selectBidcancelBoardInfo(itemnum);
	}

	@Override
	public void updateBidcancelBoardDate(BoardBean board) throws Exception {
		// TODO Auto-generated method stub
		adminDao.updateBidcancelBoardDate(board);
	}
}

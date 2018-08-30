package com.easy.auction.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.easy.auction.model.Review;

@Service("ReviewBoardService")
public class ReviewServiceImpl implements ReviewBoardService {
	
	@Autowired
	private ReviewBoardDAOImpl reviewDao;

	/*Review 등록*/
	@Override
	public void reviewInsert(Review review) throws Exception {
		reviewDao.reviewInsert(review);
	}

	/* Review 총 게시물 수*/
	@Override
	public int getReviewListCount() throws Exception {
		return reviewDao.getReviewListCount();
	}

	/* Review 목록과 페이징 */
	@Override
	public List<Review> getReviewList(int page, int limit) throws Exception {
		return reviewDao.getReviewList(page, limit);
	}

	/*번호를 기준으로 Review 내용 가져오기 */
	@Override
	public Review getReviewCont(int num) throws Exception {
		return reviewDao.getReviewCont(num);
	}
	
	/*내용보기 할때만 조회수 증가*/
	@Override
	public void reviewHit(int num) throws Exception {
		reviewDao.reviewHit(num);
		
	}

	/*Review 수정*/
	@Override
	public void editReview(Review review) throws Exception {
		reviewDao.editReview(review);
		
	}

	/*Review 삭제*/
	@Override
	public void deleteReview(int num) throws Exception {
		reviewDao.deleteReview(num);
		
	}
	
	/*검색 결과 게시물 수*/
	@Override
	public int getReviewListCount2(Map m) throws Exception {
		return reviewDao.getReviewListCount2(m);
	}

	/*검색 결과 페이징 목록*/
	@Override
	public List<Review> getReviewList2(Map m) throws Exception {
		return reviewDao.getReviewList2(m);
	}



}

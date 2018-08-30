package com.easy.auction.dao;
import java.util.List;
import java.util.Map;

import com.easy.auction.model.BoardBean;
import com.easy.auction.model.Review;

public interface ReviewBoardService {
	
	
	public void reviewInsert(Review review) throws Exception;

	
	public int getReviewListCount() throws Exception;

	
	public List<Review> getReviewList(int page, int limit) throws Exception ;

	
	public Review getReviewCont(int num) throws Exception;


	public void reviewHit(int num) throws Exception;

	
	public void editReview(Review review) throws Exception;


	public void deleteReview(int num) throws Exception;

	
	public int getReviewListCount2(Map m) throws Exception;

	
	public List<Review> getReviewList2(Map m) throws Exception ;


}

package com.easy.auction.dao;

import java.util.ArrayList;


import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.easy.auction.model.BoardBean;
import com.easy.auction.model.Review;

@Repository
public class ReviewBoardDAOImpl {
	
	@Autowired
	private SqlSessionTemplate sqlSession;


	/*게시판 저장*/
	public void reviewInsert(Review review) throws Exception {
		System.out.println("review.getem_id()=" + review.getEm_id());
		sqlSession.insert("review_insert",review);
	}

	/* Review 珥� 寃뚯떆臾� �닔*/
	public int getReviewListCount() throws Exception {
		int count = sqlSession.selectOne("review_count");
		return count;
	}

	/* Review 紐⑸줉怨� �럹�씠吏� */
	public List<Review> getReviewList(int page, int limit) {
		List<Review> list = new ArrayList<Review>();
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("page", page);
		hm.put("limit",limit);

		list = sqlSession.selectList("review_list", hm);
		return list;
	}

	/*踰덊샇瑜� 湲곗��쑝濡� Review �궡�슜 媛��졇�삤湲� */
	public Review getReviewCont(int er_num) {
		Review review =sqlSession.selectOne("review_cont", er_num);
		
		return review;

		
	}

	/*�궡�슜蹂닿린 �븷�븣留� 議고쉶�닔 利앷�*/
	public void reviewHit(int er_num) throws Exception {
		sqlSession.update("er_hit", er_num);
		
	}

	/*Review �닔�젙*/
	public void editReview(Review review) throws Exception {
		sqlSession.update("review_edit", review);
		
	}

	/*Review �궘�젣*/
	public void deleteReview(int num) throws Exception {
		sqlSession.delete("review_del", num);
		
	}
	
	
	public int getReviewListCount2(Map m) throws Exception {
		int count = sqlSession.selectOne("review_search_count", m);
		System.out.println("m :" + count);
		return count;
	}


	public List<Review> getReviewList2(Map m) throws Exception {
		List<Review> list = new ArrayList<Review>();
		list = sqlSession.selectList("review_search_list", m);
		return list;
	}
}

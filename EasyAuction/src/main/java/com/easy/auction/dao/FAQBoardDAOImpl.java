package com.easy.auction.dao;



import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.easy.auction.model.FAQ;


@Repository
public class FAQBoardDAOImpl {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/*FAQ 등록*/
	public void faqInsert(FAQ faq) throws Exception {
		sqlSession.insert("faq_insert", faq);
		
	}

	/* FAQ 목록과 페이징 */
	public List<FAQ> getFAQList(Map map) throws Exception {
		List<FAQ> list = new ArrayList<FAQ>();
		list = sqlSession.selectList("faq_getList", map);
		return list;
	}

	/* FAQ 총 게시물 수*/
	public int getFAQListCount() throws Exception {
		int result = sqlSession.selectOne("faq_listCount");
		return result;
	}
	
	/* FAQ 수정*/
	public FAQ getFAQCont(int num) throws Exception {
		FAQ faq = new FAQ();
		faq = sqlSession.selectOne("faq_cont", num);
		return faq;
	}
	
	/* FAQ 수정확인*/
	public void editFAQ(FAQ faq) throws Exception {
		sqlSession.update("faq_edit", faq);
	}
	
	/* FAQ 삭제*/
	public void deleteFAQ(int num) throws Exception {
		sqlSession.delete("faq_delete", num);
	}
	
	/*검색 게시물 수*/
	public int getFAQListCount2(Map map) throws Exception {
		int count=0;
		count = ((Integer)sqlSession.selectOne("faqfind_cnt", map)).intValue();
		return count;
	}
	
	/*검색 리스트 수*/
	public List<FAQ> getFAQList2(Map map) throws Exception {
		List<FAQ> list = new ArrayList<FAQ>();
		list = sqlSession.selectList("faqfind_list", map);
		return list;
	}
	

	


}

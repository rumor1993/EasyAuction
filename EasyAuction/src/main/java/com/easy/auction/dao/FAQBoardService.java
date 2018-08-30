package com.easy.auction.dao;
import java.util.List;
import java.util.Map;

import com.easy.auction.model.FAQ;

public interface FAQBoardService {
	
	/*FAQ 등록*/
	public void FAQInsert(FAQ faq) throws Exception;
	
	/* FAQ 목록과 페이징 */
	public List<FAQ> getFAQList(Map map) throws Exception;
	
	/* FAQ 총 게시물 수*/
	public int getFAQListCount() throws Exception;
	
	/* FAQ 삭제 */
	public void deleteFAQ(int num) throws Exception;

	/*번호를 기준으로 FAQ 내용 가져오기*/ 	
	public FAQ getFAQCont(int num) throws Exception;

	/*FAQ 수정*/
	public void editFAQ(FAQ faq) throws Exception;
	
	/*검색 결과 게시물 수*/
	public int getFAQListCount2(Map map) throws Exception;

	/* FAQ 검색목록과 페이징 */
	public List<FAQ> getFAQList2(Map map) throws Exception;

}

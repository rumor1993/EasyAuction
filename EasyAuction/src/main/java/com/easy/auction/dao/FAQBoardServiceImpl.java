package com.easy.auction.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easy.auction.model.FAQ;

@Service("FAQBoardService")
public class FAQBoardServiceImpl implements FAQBoardService {
	
	@Autowired
	private FAQBoardDAOImpl faqDao;
	
	/*FAQ 등록*/
	@Override
	public void FAQInsert(FAQ faq) throws Exception {
		faqDao.faqInsert(faq);
	}
	
	/* FAQ 총 게시물 수*/
	@Override
	public int getFAQListCount() throws Exception {
		int result = faqDao.getFAQListCount();
		return result;
	}
	
	/* FAQ 목록과 페이징 */
	@Override
	public List<FAQ> getFAQList(Map map) throws Exception {
		List<FAQ> list = new ArrayList<FAQ>();
		list = faqDao.getFAQList(map);
		return list;
	}
	
	/* FAQ 내용수정 */
	@Override
	public FAQ getFAQCont(int num) throws Exception {
		
		FAQ faq = new FAQ();
		faq = faqDao.getFAQCont(num);
		return faq;
	}
	
	/*FAQ 내용 수정확인*/
	@Override
	public void editFAQ(FAQ faq) throws Exception {
		faqDao.editFAQ(faq);
	}

	/* FAQ 삭제 */
	@Override
	public void deleteFAQ(int num) throws Exception {
		faqDao.deleteFAQ(num);
	}

	/*검색 결과 게시물 수*/
	@Override
	public int getFAQListCount2(Map map) throws Exception {
		return faqDao.getFAQListCount2(map);
	}

	/* FAQ 검색목록과 페이징 */
	@Override
	public List<FAQ> getFAQList2(Map map) throws Exception {
		return faqDao.getFAQList2(map);
	}
	
	
}

package com.easy.auction.dao;
import java.util.List;
import java.util.Map;

import com.easy.auction.model.Notice;

public interface NoticeBoardService {
	
	/*Notice 등록*/
	public void noticeInsert(Notice no) throws Exception;
	
	/* Notice 목록과 페이징 */
	public List<Notice> getNoticeList(Map map) throws Exception ;

	/* Notice 총 게시물 수*/
	public int getNoticeListCount() throws Exception;
	
	/*번호를 기준으로 Notice 내용 가져오기 */
	public Notice getNoticeCont(int num) throws Exception;

	/*내용보기 할때만 조회수 증가*/
	public void noticeHit(int num) throws Exception;

	/*Notice 수정*/
	public void editNotice(Notice no) throws Exception;

	/*Notice 삭제*/
	public void deleteNotice(int num) throws Exception;

	/*검색 결과 게시물 수*/
	public int getNoticeListCount2(Map m) throws Exception;
	
	/*검색 결과 페이징 목록*/
	public List<Notice> getNoticeList2(Map m) throws Exception;

}

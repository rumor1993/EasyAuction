package com.easy.auction.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easy.auction.model.Notice;

@Service("NoticeBoardService")
public class NoticeBoardServiceImpl implements NoticeBoardService {

	
	@Autowired
	private NoticeBoardDAOImpl noticeDao;
	
	/*Notice 등록*/
	@Override
	public void noticeInsert(Notice no) throws Exception {
		noticeDao.noticeInsert(no);
	}

	/* Notice 총 게시물 수*/
	@Override
	public int getNoticeListCount() throws Exception {
		int result = noticeDao.getNoticeListCount();
		return result;
	}

	/* Notice 목록과 페이징 */
	@Override
	public List<Notice> getNoticeList(Map map) throws Exception {
		List<Notice> list = new ArrayList<Notice>();
		list=noticeDao.getNoticeList(map);
		return list;
	}

	/*번호를 기준으로 Notice 내용 가져오기 */
	@Override
	public Notice getNoticeCont(int num) throws Exception {
		
		Notice notice = new Notice();
		notice = noticeDao.getNoticeCont(num);
		return notice;
	}

	/*내용보기 할때만 조회수 증가*/
	@Override
	public void noticeHit(int num) throws Exception {
		noticeDao.noticeHit(num);
	}
	
	/*Notice 수정*/
	@Override
	public void editNotice(Notice no) throws Exception {
		noticeDao.editNotice(no);
	}

	/*Notice 삭제*/
	@Override
	public void deleteNotice(int num) throws Exception {
		noticeDao.deleteNotice(num);
	}

	/*검색 결과 게시물 수*/
	@Override
	public int getNoticeListCount2(Map m) throws Exception {
		return noticeDao.getNoticeListCount2(m);
	}

	/*검색 결과 페이징 목록*/
	@Override
	public List<Notice> getNoticeList2(Map m) throws Exception {
		return noticeDao.getNoticeList2(m);
	}



}

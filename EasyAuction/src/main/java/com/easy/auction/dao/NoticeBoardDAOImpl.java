package com.easy.auction.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.easy.auction.model.BoardBean;
import com.easy.auction.model.Notice;

@Repository
public class NoticeBoardDAOImpl {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/*Notice 등록*/
	public void noticeInsert(Notice no) throws Exception {
		sqlSession.insert("notice_insert", no);
	}

	/* Notice 목록과 페이징 */
	public List<Notice> getNoticeList(Map map) {
		List<Notice> list = new ArrayList<Notice>();
		list = sqlSession.selectList("notice_getList", map);  
		return list;
	}
	
	/* Notice 총 게시물 수*/
	public int getNoticeListCount() throws Exception {
		int result = sqlSession.selectOne("notice_listCount");
		return result;
	}
	
	/*번호를 기준으로 Notice 내용 가져오기 */
	public Notice getNoticeCont(int num) throws Exception {
		Notice notice = new Notice();
		notice = sqlSession.selectOne("notice_cont", num);
		return notice;
	}

	/*내용보기 할때만 조회수 증가*/
	public void noticeHit(int num) throws Exception {
		sqlSession.update("notice_hit", num);
		
	}

	/*Notice 수정*/
	public void editNotice(Notice no) throws Exception {
		sqlSession.update("notice_edit", no);
	}

	/*Notice 삭제*/
	public void deleteNotice(int num) throws Exception {
		sqlSession.delete("notice_delete", num);
	}
	
	/*검색 결과 게시물 수*/
	public int getNoticeListCount2(Map m) throws Exception {
		int count = 0;
		count = ((Integer)sqlSession.selectOne("noticefind_cnt", m)).intValue();
		return count;
	}
	
	/*검색 결과 페이징 목록*/
	public List<Notice> getNoticeList2(Map m) throws Exception {
		List<Notice> list =  new ArrayList<Notice>();
		list = sqlSession.selectList("noticefind_list", m);
		return list;
	}
	
	
}

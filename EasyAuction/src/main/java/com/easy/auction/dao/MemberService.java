package com.easy.auction.dao;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.easy.auction.model.MemberBean;
import com.easy.auction.model.PList;
import com.easy.auction.model.SList;

public interface MemberService {
	
	/*회원저장*/
	public void insertMember(MemberBean m) throws Exception;

	/*로그인 체크 */
	public MemberBean userCheck(String id) throws Exception;
	
	/*아이디 중복 체크*/
	public int checkMemberId(String id) throws Exception;
	
	/*아디 검색*/ 
	public MemberBean findid(Map am) throws Exception ;
	
	 /*비번 검색*/ 
	public MemberBean findpwd(Map pm) throws Exception ;
	
	/* 회원 수정*/
	 public void updateMember(MemberBean member) throws Exception;
	 
	  /*회원탈퇴*/
	 public void deleteMember(String id) throws Exception;
	  /*
	회원탈퇴여부
	public void withdrawMember(MemberBean member) throws Exception;
	
	셀프회원탈퇴
	public void selfWithdrawMember(String id) throws Exception;
	
	회원삭제
	public void deleteMember(String id) throws Exception;

	
	
	회원 리스트
	public List<MemberBean> getMemberList() throws Exception;
	
	회원 리스트 정렬
	public List<MemberBean> getMemberListRange(HashMap m) throws Exception;
	
	포인트 충전
	public void pointCharge(MemberBean member) throws Exception;
	
	포인트 환전
	public void pointExchange(MemberBean member) throws Exception;
	*/

	


	

}

package com.easy.auction.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.easy.auction.model.MemberBean;


@Repository
public class MemberDAOImpl {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/*회원저장*/
	public void insertMember(MemberBean m) throws Exception {
		sqlSession.insert("member_join", m);
	}
	
	/*로그인 체크*/
	public MemberBean userCheck(String id) throws Exception {
		return (MemberBean)sqlSession.selectOne("login_check", id);
	}
	
	/*아이디 중복검사*/
	public MemberBean checkMemberId(String id) throws Exception {
		return (MemberBean) sqlSession.selectOne("login_check", id);
	}
	
	public MemberBean findid(Map am) {
		return sqlSession.selectOne("id_find", am);
	}
	
	/*비밀번호 찾기*/
	public MemberBean findpwd(Map pm) throws Exception {
		return sqlSession.selectOne("pwd_find", pm);
	}
	
	/*회원 정보 수정*/
	public void updateMember(MemberBean member) throws Exception {
		sqlSession.update("member_update", member);
		
	}
	
	/*회원 탈퇴*/
	public void deleteMember(String id) throws Exception {
		sqlSession.delete("member_delete", id);
	}
}
	/*
	public void withdrawMember(MemberBean member) throws Exception {
		sqlSession.update("state_update", member);
	}
	
	public void deletewMember(String id) throws Exception {
		sqlSession.delete("member_delete", id);
	}
	
	
	public List<MemberBean> getMemberList() throws Exception {
		return sqlSession.selectList("member_list");
	}

	public List<MemberBean> getMemberListRange(HashMap m) {
		System.out.println("m.get(range)="+m.get("range"));
		System.out.println("m.get(filter)="+m.get("filter"));
		return sqlSession.selectList("member_list_range", m);
	}
	
	public MemberBean memberPurchase(String id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	public MemberBean memberSell(String id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public MemberBean pointCharge(String id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public MemberBean pointExchange(String id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public MemberBean sellCancel(String id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public MemberBean auctionedCancel(String id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	*/



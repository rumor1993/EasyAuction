package com.easy.auction.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easy.auction.model.MemberBean;
import com.easy.auction.model.PList;
import com.easy.auction.model.SList;

@Service("MemberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAOImpl mdao;
	
	/*회원저장*/
	@Override
	public void insertMember(MemberBean m) throws Exception {
		mdao.insertMember(m);
	}
	
	/*로그인 체크*/
	@Override
	public MemberBean userCheck(String id) throws Exception {
		return mdao.userCheck(id);
	}
	
	/*아이디 중복검사*/
	@Override
	public int checkMemberId(String id) throws Exception {
		int result = -1;
		
		MemberBean mb = mdao.checkMemberId(id);
		if(mb !=null) {
			result = 1;
		}
		return result;
	}
	
	/*아이디찾기*/
	@Override
	public MemberBean findid(Map am) throws Exception {
		return mdao.findid(am);
	}
	
	/*비밀번호 찾기*/
	@Override
	public MemberBean findpwd(Map pm) throws Exception {
		return mdao.findpwd(pm);
	}
	
	/*회원 수정*/
	@Override
	public void updateMember(MemberBean member) throws Exception {
		mdao.updateMember(member);
	}
	
	/*회원 탈퇴*/
	@Override
	public void deleteMember(String id) throws Exception {
		mdao.deleteMember(id);
	}
	
	/*
	@Override
	public void selfWithdrawMember(String id) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<MemberBean> getMemberList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberBean> getMemberListRange(HashMap m) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void withdrawMember(MemberBean member) throws Exception {
		mdao.withdrawMember(member);
	}
*/

	
}

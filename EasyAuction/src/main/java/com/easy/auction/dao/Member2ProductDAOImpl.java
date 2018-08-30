package com.easy.auction.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.easy.auction.model.Delivery;
import com.easy.auction.model.MemberBean;
import com.easy.auction.model.PList;
import com.easy.auction.model.SList;


@Repository
public class Member2ProductDAOImpl {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/*구매내역*/
	public MemberBean memberPurchase(MemberBean member, PList plist) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	/*판매내역*/
	public MemberBean memberSell(MemberBean member, SList slist) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	/*입찰내역*/
	public MemberBean memberBid(MemberBean member, SList slist) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	/*판매 취소*/
	public void sellCancel(MemberBean member, SList slist) throws Exception {
		// TODO Auto-generated method stub
		
	}

	/*낙찰 거부*/
	public void auctionedCancel(MemberBean member, PList plist) throws Exception {
		// TODO Auto-generated method stub
		
	}

	/*배송 조회*/
	public void deliverySearch(Delivery dv) throws Exception {
		// TODO Auto-generated method stub
		
	}

	/*배송 중처리*/
	public void delivering(Delivery dv) throws Exception {
		// TODO Auto-generated method stub
		
	}

	/*배송 완료처리*/
	public void deliveringCompletion(Delivery dv) throws Exception {
		// TODO Auto-generated method stub
		
	}

	/*구매확정 처리*/
	public void purchaseCompletion(Delivery dv) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
}


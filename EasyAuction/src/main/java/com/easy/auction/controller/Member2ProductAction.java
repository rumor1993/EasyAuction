package com.easy.auction.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.easy.auction.dao.*;
import com.easy.auction.model.Delivery;
import com.easy.auction.model.MemberBean;
import com.easy.auction.model.PList;
import com.easy.auction.model.SList;

@Controller
public class Member2ProductAction {
	
	@Autowired
	private Member2ProductService memberService;
	
	/*구매내역*/
	@RequestMapping(value="/member_purchase.nhn")
	public MemberBean member_purchase(MemberBean member, PList plist) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	/*판매내역*/
	@RequestMapping(value="/member_sell.nhn")
	public MemberBean member_sell(MemberBean member, SList slist) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	/*입찰내역*/
	@RequestMapping(value="/member_bid.nhn")
	public MemberBean member_bid(MemberBean member, SList slist) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	/*판매 취소*/
	@RequestMapping(value="/sell_cancel.nhn")
	public void sell_cancel(MemberBean member, SList slist) throws Exception {
		// TODO Auto-generated method stub
		
	}

	/*낙찰 거부*/
	@RequestMapping(value="/auctioned_cancel.nhn")
	public void auctioned_cancel(MemberBean member, PList plist) throws Exception {
		// TODO Auto-generated method stub
		
	}

	/*배송 조회*/
	@RequestMapping(value="/delivery_search.nhn")
	public void delivery_search(Delivery dv) throws Exception {
		// TODO Auto-generated method stub
		
	}

	/*배송 중처리*/
	@RequestMapping(value="/delivering.nhn")
	public void delivering(Delivery dv) throws Exception {
		// TODO Auto-generated method stub
		
	}

	/*배송 완료처리*/
	@RequestMapping(value="/delivering_completion.nhn")
	public void delivering_completion(Delivery dv) throws Exception {
		// TODO Auto-generated method stub
		
	}

	/*구매확정 처리*/
	@RequestMapping(value="/purchase_completion.nhn")
	public void purchase_completion(Delivery dv) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	}



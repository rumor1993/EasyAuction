package com.easy.auction.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.easy.auction.dao.LetterService;
import com.easy.auction.model.Letter;

@Controller
public class LetterAction {
	
	@Autowired
	private LetterService letterService;

	//메인페이지 이동
	@RequestMapping(value="/message_view.nhn")
	@ResponseBody
	public Object messageView(
			HttpServletRequest request)throws Exception {
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		List<Letter> viewList = letterService.listMessageView(id);
		
		return viewList;
	}
	
	@RequestMapping(value="/message_confirm.nhn")
	public String messageConfirm(Letter letter) throws Exception{
		letter.setEl_confirm("확인");
		letterService.updateMessageConfirm(letter);
		
		return "main/header";
	}

}

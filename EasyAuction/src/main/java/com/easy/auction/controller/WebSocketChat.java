package com.easy.auction.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@ServerEndpoint(value="/main_echo.nhn")
public class WebSocketChat {
	private static final List<Session> sessionList = new ArrayList<Session>();
	private static final Logger logger = LoggerFactory.getLogger(WebSocketChat.class);
	private static String sender = "";
	public WebSocketChat() {
		System.out.println("웹소켓(서버) 객체생성");
	}
	
	@RequestMapping(value="/main_chat.nhn")
	public ModelAndView getChatViewPage(ModelAndView mav,
			HttpServletRequest request) {
		HttpSession hs = request.getSession();
		sender = (String) hs.getAttribute("id");
		System.out.println("sender : " + sender);
		mav.setViewName("main/chat");
		return mav;
	}
	
	@OnOpen
	public void onOpen(Session session) {
		logger.info("Open session id: " + session.getId());
		try {
			final Basic basic = session.getBasicRemote();
//			basic.sendText("Connection Established");
			for(Session se : WebSocketChat.sessionList) {
				if(!session.getId().equals(se.getId())) {
					se.getBasicRemote().sendText(sender + "님이 입장하셨습니다.");
				}
			}
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		sessionList.add(session);
	}
	
	/*
	 * 모든 사용자에게 메시지를 전달한다.
	 * @param self
	 * @param message
	 */
	@SuppressWarnings("unused")
	private void sendAllSessionToMessage(Session self, String message) {
		try {
			for(Session session : WebSocketChat.sessionList) {
				if(!self.getId().equals(session.getId())) {
					session.getBasicRemote().sendText("<div class='direct-chat-msg'>"
							+ "<div class='direct-chat-info clearfix'>"
							+ "<span class='direct-chat-name pull-left'>" + message.split(",")[1] + "</span>"
							+ "</div>"
							+ "<img class='direct-chat-img' src='https://bootdey.com/img/Content/user_1.jpg' alt='Message User Image'>"
							+ "<div class='direct-chat-text'>" + message.split(",")[0] + "</div></div>");
				}
			}
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	@OnMessage
	public void onMessage(String message, Session session) {
		logger.info("Message From " + message.split(",")[1] + " : " + message.split(",")[0]);
		try {
			final Basic basic = session.getBasicRemote();
			basic.sendText("<div class='direct-chat-msg right'>"
					+ "<div class='direct-chat-info clearfix'>"
					+ "<span class='direct-chat-name pull-right'>" + message.split(",")[1] + "</span>"
					+ "</div>"
					+ "<img class='direct-chat-img' src='https://bootdey.com/img/Content/user_1.jpg' alt='Message User Image'>"
					+ "<div class='direct-chat-text'>" + message.split(",")[0] + "</div></div>");
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		sendAllSessionToMessage(session, message);
	}
	
	@OnError
	public void onError(Throwable e, Session session) {
		
	}
	
	@OnClose
	public void onClose(Session session) {
		logger.info("Session " + session.getId() + " has ended");
		try {
			for(Session se : WebSocketChat.sessionList) {
				if(!session.getId().equals(se.getId())) {
					se.getBasicRemote().sendText(sender + "님이 퇴장하셨습니다.");
				}
			}
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		sessionList.remove(session);
	}
	
}

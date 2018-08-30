<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:forEach var="b" items="${boardlist }" begin="${start }" end="${end }"  varStatus="status">
	<div id="img_board">
		<div id="product">
			 
			<i class="material-icons">alarm</i><div class="enddate${status.index }"></div>
			
			<img alt="물품이미지" src="./resources/upload${b.eb_file }"  onclick="bid('${b.eb_itemnum }')" >
			<div>
				<span> [ 물품번호 ] </span>
				<span> ${b.eb_itemnum } </span>
			</div>	
			<div>
				<span> [ 물품이름 ] </span>
				<span> ${b.eb_itemname } </span>
			</div>

			<div>
				<span> [ 경매시작 ] </span>
				<span> ${b.eb_stdate } </span>
			</div>
			<div>
				<span> [ 경매종료 ] </span>
				<span class="hello${status.index }"> ${b.eb_ladate }  </span>
			</div> 
			
			<div>
				<span> [ 판매자 ] </span>
				<span> ${b.em_id } </span>
			</div>
			<div>
				<span> [ 조회수 ] </span>
				<span > ${b.eb_hit } </span>
				<span><button id="board_btn" onclick="bid('${b.eb_itemnum }')">입찰하러가기</button></span>
			</div>
		</div>
	</div>
	</c:forEach> 
	
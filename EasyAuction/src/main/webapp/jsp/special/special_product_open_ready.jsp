<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file = "../main/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="./resources/js/special/calendar.js"></script>
<script src="./resources/js/special/popup2.js"></script>
<script src="./resources/js/special/money.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
type="text/css" /> 
    

<script type="text/javascript" src="./resources/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>


<script type="text/javascript"> 
  	
  	var oEditors = [];
  	$(function(){
  	   nhn.husky.EZCreator.createInIFrame({
  	        oAppRef: oEditors,
  	        elPlaceHolder: "eb_cont",
  	        sSkinURI: "./resources/editor/SmartEditor2Skin.html",
  	        htParams : {
  	            // 툴바 사용 여부
  	            bUseToolbar : true,            
  	            // 입력창 크기 조절바 사용 여부
  	            bUseVerticalResizer : true,    
  	            // 모드 탭(Editor | HTML | TEXT) 사용 여부
  	            bUseModeChanger : true,
  	        }
  	    });
  	   });
  	   
  	   

  	

	
	
$(function(){
	$("form").submit(function(){
		if($("#sh_bidnum").val() == ""){
			return false;
		}
	})
	
	 $('#eb_choisedate').datepicker({
		 format: "yyyy-mm-dd",
		 language: "kr"
		 }); 
	
	$('#upfile').change(function(){
		var inputfile=$(this).val().split('\\');
        $('#close').show();
        $('#filevalue').text(inputfile[inputfile.length-1])
        
	});
	$("#close").click(function(){
		$('#filevalue').text('');
		$("#close").hide();
		$('#upfile').val('');
	});
	
	$("#save").click(function(){
	oEditors.getById["eb_cont"].exec("UPDATE_CONTENTS_FIELD", []);
	$("#frm").submit();
	});
	
	
	//캘린더 테이블 영역 스크립트들
	 var date = new Date();
	 
	 $("#prevClaendar").click(function(){
		 date = new Date(date.getFullYear(), date.getMonth()-1,1);
		 search(date);
	 })
	 
	 $("#nextCalendar").click(function(){
		 date = new Date(date.getFullYear(), date.getMonth()+1,1);
		 search(date);
	 })
	 
	 search(date);
	 function search(date){
	
	 var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');
	
	 var year = date.getFullYear();
	 var month = date.getMonth()+1;
	 $("#calendarYM").text(year+"년"+month+"월")
	 
	 var firstdate= new Date(year+"-"+month+"-"+1).getDay();
	 var firstyoil = week[firstdate];
	 var lastdate = new Date(date.getYear(), date.getMonth()+1, 0).getDate();
	 for(var i=0; i<42; i++){
		 $("#date"+i).empty();
	 }
	 switch(firstdate){
	 case 0:
		 for(var i=0; i<lastdate; i++){
			 $("#date"+i).append(i+1+"<br>");
			 <c:forEach var="li" items="${list}">
			 	if("${li.esl_date}" == Number(month.toString() + (i + 1))){
 			 		if('${li.eb_itemnum}' == ('')){
			 			$("#date"+i).append("<a id='"+year+"y"+month+"m"+(i+1)+"d' href='@' class='calendar_a' style='font-size:8pt'>"+"${li.sh_bidnum}"+"번방 가능</a><br>");
			 		} else{
			 			$("#date"+i).append("<div style='font-size:7pt; font-weight:bolder'>"+"${li.sh_bidnum}"+"번 ${li.eb_itemnum} 대기</div>");
			 		}
			 		
			 	}
			 </c:forEach>
		 }
		 break;
	 case 1:
		 for(var i=0; i<lastdate; i++){
			 $("#date"+(i+1)).append(i+1+"<br>");
			 <c:forEach var="li" items="${list}">
			 	if("${li.esl_date}" == Number(month.toString() + (i + 1))){
 			 		if('${li.eb_itemnum}' == ('')){
			 			$("#date"+(i+1)).append("<a id='"+year+"y"+month+"m"+(i+1)+"d' href='@' class='calendar_a' style='font-size:8pt'>"+"${li.sh_bidnum}"+"번방 가능</a><br>");
			 		} else{
			 			$("#date"+(i+1)).append("<div style='font-size:7pt; font-weight:bolder'>"+"${li.sh_bidnum}"+"번 ${li.eb_itemnum} 대기</div>");
			 		}
			 		
			 	}
			 </c:forEach>
		 }
		 break;
	 case 2:
		 for(var i=0; i<lastdate; i++){
			 $("#date"+(i+2)).append(i+1+"<br>");
			 <c:forEach var="li" items="${list}">
			 	if("${li.esl_date}" == Number(month.toString() + (i + 1))){
 			 		if('${li.eb_itemnum}' == ('')){
			 			$("#date"+(i+2)).append("<a id='"+year+"y"+month+"m"+(i+1)+"d' href='@' class='calendar_a' style='font-size:8pt'>"+"${li.sh_bidnum}"+"번방 가능</a><br>");
			 		} else{
			 			$("#date"+(i+2)).append("<div style='font-size:7pt; font-weight:bolder'>"+"${li.sh_bidnum}"+"번 ${li.eb_itemnum} 대기</div>");
			 		}
			 	}
			 </c:forEach>
		 }
		 break;
	 case 3:
		 for(var i=0; i<lastdate; i++){
			 $("#date"+(i+3)).append(i+1+"<br>");
			 <c:forEach var="li" items="${list}">
			 	if("${li.esl_date}" == Number(month.toString() + (i + 1))){
 			 		if('${li.eb_itemnum}' == ('')){
			 			$("#date"+(i+3)).append("<a id='"+year+"y"+month+"m"+(i+1)+"d' href='@' class='calendar_a' style='font-size:8pt'>"+"${li.sh_bidnum}"+"번방 가능</a><br>");
			 		} else{
			 			$("#date"+(i+3)).append("<div style='font-size:7pt; font-weight:bolder'>"+"${li.sh_bidnum}"+"번 ${li.eb_itemnum} 대기</div>");
			 		}
			 		
			 	}
			 </c:forEach>
		 }
		 break;
	 case 4:
		 for(var i=0; i<lastdate; i++){
			 $("#date"+(i+4)).append(i+1+"<br>");
			 <c:forEach var="li" items="${list}">
			 	if("${li.esl_date}" == Number(month.toString() + (i + 1))){
 			 		if('${li.eb_itemnum}' == ('')){
			 			$("#date"+(i+4)).append("<a id='"+year+"y"+month+"m"+(i+1)+"d' href='@' class='calendar_a' style='font-size:8pt'>"+"${li.sh_bidnum}"+"번방 가능</a><br>");
			 		} else{
			 			$("#date"+(i+4)).append("<div style='font-size:7pt; font-weight:bolder'>"+"${li.sh_bidnum}"+"번 ${li.eb_itemnum} 대기</div>");
			 		}
			 		
			 	}
			 </c:forEach>
		 }
		 break;
	 case 5:
		 for(var i=0; i<lastdate; i++){
			 $("#date"+(i+5)).append(i+1+"<br>");
			 <c:forEach var="li" items="${list}">
			 	if("${li.esl_date}" == Number(month.toString() + (i + 1))){
 			 		if('${li.eb_itemnum}' == ('')){
			 			$("#date"+(i+5)).append("<a id='"+year+"y"+month+"m"+(i+1)+"d' href='@' class='calendar_a' style='font-size:8pt'>"+"${li.sh_bidnum}"+"번방 가능</a><br>");
			 		} else{
			 			$("#date"+(i+5)).append("<div style='font-size:7pt; font-weight:bolder'>"+"${li.sh_bidnum}"+"번 ${li.eb_itemnum} 대기</div>");
			 		}
			 		
			 	}
			 </c:forEach>
		 }
		 break;
	 case 6:
		 for(var i=0; i<lastdate; i++){
			 $("#date"+(i+6)).append(i+1+"<br>");
			 <c:forEach var="li" items="${list}">
			 	if("${li.esl_date}" == Number(month.toString() + (i + 1))){
 			 		if('${li.eb_itemnum}' == ('')){
			 			$("#date"+(i+6)).append("<a id='"+year+"y"+month+"m"+(i+1)+"d' href='@' class='calendar_a' style='font-size:8pt'>"+"${li.sh_bidnum}"+"번방 가능</a><br>");
			 		} else{
			 			$("#date"+(i+6)).append("<div style='font-size:7pt; font-weight:bolder'>"+"${li.sh_bidnum}"+"번 ${li.eb_itemnum} 대기</div>");
			 		}
			 		
			 	}
			 </c:forEach>
		 }
		 break;		 
	 }
	 }
	 
	 
	 $(".calendar_a").click(function(){
		 $('.mask, .window').hide();
		 var roomnum = $(this).text().substring(0,1);
		 var aid = $(this).attr('id');
		 var yearIndex = aid.indexOf('y');
		 var monthIndex = aid.indexOf('m');
		 var dayIndex = aid.indexOf('d');
		 var year = aid.substring(0,yearIndex)
		 var month = aid.substring(yearIndex+1,monthIndex)
		 if(month < 10){
			 month = '0'+month
		 }
		 var day = aid.substring(monthIndex+1,dayIndex)
		 if(day < 10){
			 day = '0'+day
		 }
		 $("#audate_text").val(year+"-"+month+"-"+day);
		 $("#sh_bidnum").val(roomnum);
		 switch(roomnum){
		 case '1':
			 $("#audate_time_text").val('11:00');
			 break;
		 case '2':
			 $("#audate_time_text").val('13:00');
			 break;
		 case '3':
			 $("#audate_time_text").val('15:00');
			 break;
		 case '4':
			 $("#audate_time_text").val('17:00');
			 break;
		 case '5':
			 $("#audate_time_text").val('19:00');
			 break;
		 }
		 return false;
	 })
	 
	
})
 
</script>

<style>
#product_table{table-layout: auto; width:1300px;}
#calendar a{font-sizt:8pt}
#calendar a:link { color: blue; text-decoration: none;}
#calendar a:visited { color: black; text-decoration: none;}
#calendar a:hover { color: red; text-decoration: underline;}					
/* 달력부분 */
.datepicker{font-size:14pt}
.ui-datepicker-calendar{width:300px; height:200px; font-size:10pt}
.ui-datepicker-calendar>th{width:14.2%;}
#ui-datepicker-div{width:300px; height:300px; font-size:10pt}
.ui-datepicker-current-day{width:45px; height:30px}
#ui-datepicker-div .ui-state-active {
    border: 1px solid red;
    color: white; background:#616161;}

#ui-datepicker-div .ui-state-active::before {color:skyblue;
                                  display:block; font-size:6pt}
#close{display:none}     
.mask {position:fixed;
		min-width:1920px;
		min-height:100%;
		width:100%;
		height:auto;
       left:0;
       top:0;
       z-index:1;
       background-color:#000;
       display:none;
        }
@media screen and(max-width: 1920px) {
    .mask{
        left: 50%;
        margin-left: -960px;  
            }
    }
.window {position:fixed;
         top:20%;
         left:50%;
         margin-left:-450px;
	     display: none;
         background-color: white;
         height: 600px;
         width:900px;
         z-index:2;
         text-align: center;
         overflow: auto;
        }
.review-title{opacity:0.9;background:black;height:50px;
		margin:0px 0px 30px 0px;padding:30px 70px;z-index:1}
.review-title-addr{font-size:30pt;float:right;margin-right:35%;z-index:100;color:white;}
.review-title-img{float:right;z-index:100;color:white;margin-top:20px;}
.fa-home{color:white;font-size:15pt;}  
#write_menu{margin:10px 150px;}
.input_button1{width:300px;background-color:#F03C02;color:white;
	border:0px solid black;height:50px;border-radius:10px;}
.input_button2{width:300px;background-color:black;color:white;
	border:0px solid black;height:50px;margin:0px 30px;border-radius:10px;} 
.input_button1:hover, .input_button2:hover{background-color:gray;color:black;}            
</style>
</head>
<body>
   <div class="review-title">
		<span class="review-title-img"><i class="fa fa-home" aria-hidden="true"></i> &nbsp;> &nbsp;Special > &nbsp;Ready Page </span>
		<span class="review-title-addr" style="font-family: 'Pacifico', cursive;">Special Ready</span>
	</div>
	<div class="board-form">	
	<c:set var="board" value="${board}"/>
	<div id="bbswrite_wrap">
	<form action="special_product_open_ready_ok.nhn" method="post" enctype="multipart/form-data"
		onsubmit="return check()">
	
	<input type="hidden" name="eb_itemnum" value="${board.eb_itemnum}">
	<input type="hidden" name="page" value="${page}">
	
	<table id="product_table">
	
	<tr>
		<th>물품번호</th>
		<td>${board.eb_itemnum}</td>
	</tr>
	<tr>
		<th>게시판번호</th>
		<td>${board.eb_boardnum}</td>
	</tr>

	<tr>
		<th>판매자</th> 
		<td>
			${board.em_id}
		</td>
	</tr>

	<tr>
		<th>물품이름</th> 
		<td>
		 <input type="text" size="14" id="eb_itemname" value="${board.eb_itemname}" name="eb_itemname"
           class="eb_itemname">
		</td>
	</tr>
	
	
	
		<tr>
          <th>내용</th>
          <td>
          	<textarea rows="10" cols="30" id="eb_cont" name="eb_cont"
          	style="width:766px; height:412px;">
          		${board.eb_cont}
          		</textarea>
          </td>
        </tr>
	
		<tr>
          <th>메인 이미지</th>
          <td>
          	<label for="upfile"><img src="./resources/img/special/file_open.png" alt="파일열기"
          	style="width:30px; height:30px;"></label>
            <input type="file" name="uploadfile" id="upfile" 
            style="display:none">
            <span id="filevalue">${board.eb_original }</span>&nbsp;
            <span id="close"><img src="./resources/img/special/cancel.png"
            style="width:30px; height:30px;"></span>
          </td>
        </tr>       
        
		<tr>
        	<th>원산지</th>
        	<td>
        		<input type="text" name="eb_madein" id="eb_madein" size="14" class="input_box"
        		value="${board.eb_madein }">
        	</td>
        </tr>             
      
      
     	 <tr>
        	<th>고객 희망가격</th>
        	<td>
        		<div id="choice_price">${board.eb_stprice}원</div>
        	</td>
        </tr>
        
        <tr>
        	<th>시작가</th>
        	<td>
        		<input type="text" name="eb_stprice" id="eb_stprice" size="14"
        		 class="input_box" value="${board.eb_stprice}">원
        	</td>
        </tr>
              
        <tr>
    	  <th>고객 희망경매일</th>
   		  <td><div id="choice_date">${board.eb_choicedate}</div>
    	  </td>
    	</tr>
        
        <tr>
        	<th>경매장 선택하기</th>
        	<td><input type="button" value="경매장 선택" id="house_list_bt"></td>
        </tr>
        
        <tr>
    	  <th>경매 시작일</th>
   		  <td><input id="audate_text" name="audate_text" value="" readOnly>
   		  	  <input id="audate_time_text" name="audate_time_text" value="" readOnly size="5">시
    	  </td>
    	 </tr>
    	 
        <tr>
        	<th>경매장 번호</th>
        	<td><input id="sh_bidnum" name="sh_bidnum" value="" readOnly size="5">번방
        	</td>
        </tr>    	 

       
	</table>
	 <div id="write_menu">
        <input type="submit" value="경매오픈리스트로 이동"  id ="save"class="input_button1 btn-danger">
        <input type="reset" value="취소" class="input_button2 btn-cancel"
        		onclick="history.back();">
      </div>
	</form>
	</div>
	</div>
	
<div class="mask"></div>
<div class="window">
  <input type ="button" class="close" value="닫기">
  <div id ="car">
	
  <table id="calendar"  border="3" align="center" width="800" height="500"  >
    <tr><td colspan="7">1번방 = 11:00시&nbsp;&nbsp; I &nbsp;&nbsp;2번방 = 13:00시&nbsp;&nbsp; I &nbsp;&nbsp;3번방 = 15:00시&nbsp;&nbsp; I &nbsp;&nbsp;4번방 = 17:00시&nbsp;&nbsp; I &nbsp;&nbsp;5번방 = 19:00시</td>
    </tr>
	<tr>
	  <td align ="center"> <label id="prevClaendar"><</label> </td>
	  <td colspan="5" align ="center" id="calendarYM"></td>
	  <td align ="center"> <label id="nextCalendar">></label> </td>
	</tr>
	<tr>
	  <th width=14%>일</th>
	  <th width=14%>월</th>
	  <th width=14%>화</th>
	  <th width=14%>수</th>
	  <th width=14%>목</th>
	  <th width=14%>금</th>
	  <th width=14%>토</th>
	</tr>
	<tr>
	<c:forEach begin="0" end="6" var="i">
	  <td id="date${i}"></td>
	</c:forEach>
	</tr>	
	
	<tr>
	<c:forEach begin="7" end="13" var="i">
	  <td id="date${i}"></td>
	</c:forEach>
	</tr>	
	<tr>
	
	<c:forEach begin="14" end="20" var="i">
	  <td id="date${i}"></td>
	</c:forEach>
	</tr>	
	<tr>
	<c:forEach begin="21" end="27" var="i">
	  <td id="date${i}"></td>
	</c:forEach>
	</tr>			
	<tr>
	<c:forEach begin="28" end="34" var="i">
	  <td id="date${i}"></td>
	</c:forEach>
	</tr>		
	<tr>
	<c:forEach begin="35" end="41" var="i">
	  <td id="date${i}"></td>
	</c:forEach>
	</tr>		
						

  </table>
</div>
</div>
</body>
<br><br><br><br><br>
<jsp:include page="../main/footer.jsp"/>
</html>
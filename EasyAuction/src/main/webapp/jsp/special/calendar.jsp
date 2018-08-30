<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="./resources/js/jquery-3.3.1.js"></script>
 <script>
 $(function(){
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
			 $("#date"+i).text(i+1)
		 }
		 break;
 	 case 1:
		 for(var i=0; i<lastdate; i++){
			 $("#date"+(i+1)).text(i+1)
		 }
		 break;
 	 case 2:
		 for(var i=0; i<lastdate; i++){
			 $("#date"+(i+2)).text(i+1)
		 }
		 break;
 	 case 3:
		 for(var i=0; i<lastdate; i++){
			 $("#date"+(i+3)).text(i+1)
		 }
		 break;
 	 case 4:
		 for(var i=0; i<lastdate; i++){
			 $("#date"+(i+4)).text(i+1)
		 }
		 break;
 	 case 5:
		 for(var i=0; i<lastdate; i++){
			 $("#date"+(i+5)).text(i+1)
		 }
		 break;
 	 case 6:
		 for(var i=0; i<lastdate; i++){
			 $("#date"+(i+6)).text(i+1)
		 }
		 break;		 
	 }
	 }


 })

 	 
 
 </script>
</head>
<body>
  <table id="calendar"  border="3" align="center" width="800" height="500"  >
	<tr >
	  <td align ="center"> <label id="prevClaendar"><</label> </td>
	  <td colspan="5" align ="center" id="calendarYM"></td>
	  <td align ="center"> <label id="nextCalendar">></label> </td>
	</tr>
	<tr>
	  <th>일</th>
	  <th>월</th>
	  <th>화</th>
	  <th>수</th>
	  <th>목</th>
	  <th>금</th>
	  <th>토</th>
	</tr>
	<tr>
	<c:forEach begin="0" end="6" var="i">
	  <th id="date${i}"></th>
	</c:forEach>
	</tr>	
	
	<tr>
	<c:forEach begin="7" end="13" var="i">
	  <th id="date${i}"></th>
	</c:forEach>
	</tr>	
	<tr>
	
	<c:forEach begin="14" end="20" var="i">
	  <th id="date${i}"></th>
	</c:forEach>
	</tr>	
	<tr>
	<c:forEach begin="21" end="27" var="i">
	  <th id="date${i}"></th>
	</c:forEach>
	</tr>			
	<tr>
	<c:forEach begin="28" end="34" var="i">
	  <th id="date${i}"></th>
	</c:forEach>
	</tr>		
	<tr>
	<c:forEach begin="35" end="41" var="i">
	  <th id="date${i}"></th>
	</c:forEach>
	</tr>		
						

  </table>
</body>
</html>
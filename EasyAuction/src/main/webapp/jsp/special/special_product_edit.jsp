<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../main/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="resources/js/special/calendar.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
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
	
})
 
</script>

<style>
#product_table{table-layout: auto; width:1000px}
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
</style>
</head>
<body>
	<c:set var="boarddata" value="${boarddata}"/>
	<div id="bbswrite_wrap">
	<form action="./special_product_edit_ok.nhn" method="post" enctype="multipart/form-data"
		onsubmit="return check()">
	
	<input type="hidden" name="eb_boardnum" value="${boarddata.eb_boardnum}">
	<input type="hidden" name="page" value="${page}">
	
	<table id="product_table">
	
	<tr>
		<th>물품번호</th>
		<td>
		<input name="eb_itemnum" id="eb_itemnum" readOnly 
		type="text" size="10" maxlength="10" value="${boarddata.eb_itemnum }">
		</td>
	</tr>
	
	<tr>
		<th>검증상태</th>
		<td>
			<input name="eb_state" id="eb_state" readOnly 
				size="10" value="${boarddata.eb_state }">
		</td>

	</tr>
	<tr>
		<th>글쓴이</th> 
		<td>
			<input name="em_id" id="em_id" readOnly type="text"
			size="10" maxlength="10" value="${boarddata.em_id}">
		</td>
	</tr>
	<tr>
		<th>글 비밀번호</th>
		<td><input name="eb_pass" id="eb_pass" size="5" maxlength="10"
		type="password" value="${boarddata.eb_pass }"></td>
	</tr>
	<tr>
		<th>물품이름</th> 
		<td>
		 <input type="text" size="14" id="eb_itemname" value="${boarddata.eb_itemname}" name="eb_itemname"
           class="eb_itemname">
		
		</td>
	</tr>
	
		<tr>
          <th>내용</th>
          <td>
          	<textarea rows="10" cols="30" id="eb_cont" name="eb_cont"
          	style="width:766px; height:412px;">
         
          		${boarddata.eb_cont}
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
            <span id="filevalue">${boarddata.eb_original }</span>&nbsp;
            <span id="close"><img src="./resources/img/special/cancel.png"
            style="width:30px; height:30px;"></span>
          </td>
        </tr>            
      
		<tr>
        	<th>원산지</th>
        	<td>
        		<input type="text" name="eb_madein" id="eb_madein" size="14" class="input_box"
        		value="${boarddata.eb_madein }">
        	</td>
        </tr>
        <tr>
        	<th>희망 경매일</th>
        	<td>
        	 <input type="text" size="14" id="datepicker" value="${boarddata.eb_choicedate }" name="departuredate"
           class="datepicker">
         	</td>
        	
        </tr>
        <tr>
        	<th>희망가격</th>
        	<td>
        		<input type="text" name="eb_stprice" id="eb_stprice" size="14"
        		 class="input_box" value="${boarddata.eb_stprice }">
        	</td>
        </tr>
       
	</table>
	 <div id="write_menu">
        <input type="submit" value="수정완료"  id ="save"class="input_button">
        <input type="reset" value="취소" class="input_button"
        		onclick="history.back();">
      </div>
	</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>
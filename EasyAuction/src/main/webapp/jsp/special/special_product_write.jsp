<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file = "../main/header.jsp" %>
<!DOCTYPE html>
<html>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<head>
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
	
var type = $('#ey_bigcategory').val();
    
    $.ajax({
    	type: "POST",
    	data: "category="+type,
    	url: "special_small_category.nhn",
    	cache: false,
		headers : {"cache-control":"no-cache","pragma":"no-cache"},
    	success : function(response){
    		$("#small_category_select").empty().append(response);
    	}
    })
	
	$('#ey_bigcategory').change(function (){
         // 현재 선택된 검색분류 값을 가져옵니다.
         var type = $('#ey_bigcategory').val();
          
        $.ajax({
        	type: "POST",
        	data: "category="+type,
        	url: "special_small_category.nhn",
        	cache: false,
			headers : {"cache-control":"no-cache","pragma":"no-cache"},
        	success : function(response){
        		$("#small_category_select").empty().append(response);
        	}
        })
     });
	
	
	
})
 
 



</script>

<style>
#special_list{table-layout: auto; width:1000px}

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
.review-title{opacity:0.9;background:black;width:100%;height:110px;
		margin:0px 0px 0px 0px;padding:30px 70px;z-index:1}
.review-title-addr{font-size:30pt;float:right;margin-right:35%;z-index:100;color:white;}
.review-title-img{float:right;z-index:100;color:white;margin-top:20px;}
.fa-home{color:white;font-size:15pt;}
#bbswrite_wrap{padding:50px 200px;}
.category-area{margin-left:30px;}
.form-class-div{margin:15px 0px;}
#em_id{margin-left:50px;}
#eb_pass{margin-left:20px;}
#eb_itemname{margin-left:60px;}
#ey_bigcategory{margin-left:50px;}
#small_category_select{margin-left:50px;}
#eb_madein{margin-left:40px;}
#datepicker{margin-left:10px;}
#eb_stprice{margin-left:30px;}
.btn-danger, .btn-primary{width:300px;height:50px;margin-top:30px;}
</style>
</head>
<body>
  <div class="review-title">
		<span class="review-title-img"><i class="fa fa-home" aria-hidden="true"></i> &nbsp;> &nbsp;Special > &nbsp;Write Page </span>
		<span class="review-title-addr" style="font-family: 'Pacifico', cursive;">Special Write</span>
	</div>
	<div id="bbswrite_wrap">
    
    <form id="frm" method="post" action="./special_product_write_ok.nhn"
           enctype="multipart/form-data" class="form-inline">
     	<div class="form-class-div">
          <label for="exampleInputName2" >글쓴이</label>
          	
            <input name="em_id" id="em_id" size="14" class="form-control special-name" value="${id}"  type="text" readonly>
       		
        </div>
        
        <div class="form-class-div">
          <label for="exampleInputName2" >글 비밀번호</label>
          
            <input type="password" name="eb_pass" id="eb_pass" size="14" class="form-control">
          
        </div>
        <div class="form-class-div">
         	<label for="exampleInputName2" > 제목</label>
          	
            <input type="text" name="eb_itemname" id="eb_itemname" size="40" class="form-control">
         	
        </div>
         <div class="form-class-div" id='big_category_select_area'>
         	<label for="exampleInputName2" >대분류</label>
        	<select class="form-control input-lg category-area" id="ey_bigcategory" name="ey_bigcategory">
        	<c:forEach var="bigct" items="${bigct}">
        		<option value="${bigct.ey_bigcategory}">${bigct.ey_bigcategory}</option>
        	</c:forEach>
        	</select>
        </div>
        <div class="form-class-div" id="small_category_select_area" >
        	<label for="exampleInputName2" >소분류</label>
        	<select id="small_category_select" class="form-control input-lg category-area" name="ey_smallcategory">
        	</select>
        </div>
        
        <div class="form-class-div">
        
         	<label for="exampleInputName2"> 내용</label>
         
          	<textarea rows="10" cols="30" id="eb_cont" name="eb_cont"
          	style="width:766px; height:412px;"></textarea>
         
        </div>
        
        <div class="form-class-div">
         <label for="exampleInputName2">메인 이미지</label>
          
          	<label for="upfile"><img src="./resources/img/special/file_open.png" alt="파일열기"
          	style="width:30px; height:30px;"></label>
            <input type="file" name="uploadfile" id="upfile" 
            style="display:none">
            <span id="filevalue"></span>&nbsp;
            <span id="close"><img src="./resources/img/special/cancel.png"
            style="width:30px; height:30px;"></span>
          
        </div>            
        <div class="form-class-div">
        	<label for="exampleInputName2">원산지</label>
        	<input type="text" name="eb_madein" id="eb_madein" size="14" class="form-control" placeholder="원산지입력해주세요">
        	
        </div>
        <div class="form-class-div">
        	<label for="exampleInputName2">희망 경매일</label>
        	<input type="text" size="14" id="datepicker" value="" name="eb_choicedate"
           class="form-control">
           
          	<select name="start_hour" id="start_hour">
   		  	<c:forEach var="i" begin="1" end="24" step="1">
   		  	
   		  	<!-- 시간이 10시보다 작으면 0을 붙이고 아니면 0을떼고 -->
   		  	<c:choose>
   		  		<c:when test="${i<10}">
   		  			<option value="0${i}">0${i}</option>
   		  		</c:when>
   		  		<c:otherwise>
	   	  			<option value="${i}">${i}</option>
	   	  		</c:otherwise>
	   	  	</c:choose>
	  	  	</c:forEach>
    	  </select>시
    	  
    	  <select name="start_minute" id="start_minute">
   		  	<c:forEach var="i" begin="0" end="60" step="5">
	   	  		<!-- 시간이 10시보다 작으면 0을 붙이고 아니면 0을떼고 -->
   		  	<c:choose>
   		  		<c:when test="${i<10}">
   		  			<option value="0${i}">0${i}</option>
   		  		</c:when>
   		  		<c:otherwise>
	   	  			<option value="${i}">${i}</option>
	   	  		</c:otherwise>
	   	  	</c:choose>
	  	 	 </c:forEach>
    	  </select>분
           	
           	
        </div>
 		
 		<div class="form-class-div">
        	<label for="exampleInputName2">희망가격</label>
        	<input type="text" name="eb_stprice" id="eb_stprice" size="14" class="form-control" placeholder="숫자만입력하시오" value="" >
        	
        </div>
        
       
      
    
      
      <div class="form-class-div" id="write_menu">
        <input type="submit" value="등록"  id ="save"class="btn btn-danger">
        <input type="reset" value="취소" class="btn btn-primary"
        		onclick="history.back();">
      </div>
    </form>
  </div>
  <br><br><br><br><br><br>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>
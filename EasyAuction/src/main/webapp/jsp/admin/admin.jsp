<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <title>EasyAuction</title>
    <!-- Bootstrap Core CSS -->
    <link href="./resources/css/admin/lib/bootstrap/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="./resources/css/admin/helper.css" rel="stylesheet">
    <link href="./resources/css/admin/style.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:** -->
    <!--[if lt IE 9]>
    <script src="https:**oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<![endif]-->
	<style>
		.color-delete{color:#8c008c;}
		.color-deposit{color:#00A5FF;}
		.color-submit{color:#F03C02;}
		.recoin-price{boder:1px solid #F03C02; border-radius:5px; width:90%; height:30px; }
	</style>
	<script src="./resources/js/jquery-3.3.1.js"></script>
	<script>
		var usageMonth = ["01", "02", "03", "04", "05", "06",
			"07", "08", "09", "10", "11", "12"];
		var usageCount = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
		<c:forEach var="ulist" items="${usageList}">
			var umonth = ${ulist.MONTH};
			var ucount = ${ulist.COUNT};
			for(var m = 0; m < usageMonth.length; m++){
				if(usageMonth[m] == umonth ){
					usageCount[m] = ucount;
				}
			}
		</c:forEach>
		
		var CRegCount = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
		var SRegCount = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
		<c:forEach var="cRegCount" items="${CRegCount}">
			var cregMonth = ${cRegCount.MONTH};
			var cregCount = ${cRegCount.COUNT};
			for(var m = 0; m < usageMonth.length; m++){
				if(usageMonth[m] == cregMonth){
					CRegCount[m] = cregCount;
				}
			}
		</c:forEach>
		<c:forEach var="sRegCount" items="${SRegCount}">
			var sregMonth = ${sRegCount.MONTH};
			var sregCount = ${sRegCount.COUNT};
			for(var m = 0; m < usageMonth.length; m++){
				if(usageMonth[m] == sregMonth){
					SRegCount[m] = sregCount;
				}
			}
		</c:forEach>
	</script>
	<script>
		var regCate = ["패션의류","패션잡화","유아용품","가구생활","식품", "취미","디지털컴퓨터",
        	"스포츠레저","뷰티","생활가전", "자동차공구", "도서기타"];
		var cRegCateCount = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
		var sRegCateCount = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
		<c:forEach var="cRegCate" items="${cRegCategory}">
			var cregCate = "${cRegCate.CATEGORY}";
			var cregCateCount = ${cRegCate.COUNT};
			for(var m = 0; m < regCate.length; m++){
				if(regCate[m] == cregCate){
					cRegCateCount[m] = cregCateCount;
				}
			}
		</c:forEach>
		<c:forEach var="sRegCate" items="${sRegCategory}">
			var sregCate = "${sRegCate.CATEGORY}";
			var sregCateCount = ${sRegCate.COUNT};
			for(var m = 0; m < regCate.length; m++){
				if(regCate[m] == sregCate){
					sRegCateCount[m] = sregCateCount;
				}
			}
		</c:forEach>
	</script>
	<script>
		$(document).ready(function(){
			$('.user-id').click();
		});
		
		function bellState(eg_id){
			$.ajax({
				type: "POST",
				url: "./account_bell_state.nhn",
				data: "eg_id=" + eg_id,
				success: function(count){
					if(count > 0){
						var bell = ".fa-bell-" + eg_id;
						$(bell).css("color", "black");
					}
				}
			});
		}
		
		function accountInfoWindow(name){
			var url = "./account_message.nhn?eg_id=" + name;
			openWin = window.open(url, 
					"_new", "width=600, height=350, resizable = no, scrollbars = no");
			return false;
		}
		
		function cancelState(eg_id){
			$.ajax({
				type: "POST",
				url: "./bid_cancel_state.nhn",
				data: "ep_user=" + eg_id,
				success: function(count){
					if(count > 0){
						var bell = ".fa-envelope-" + eg_id;
						$(bell).css("color", "black");
					}
				}
			});
		}
		
		function cancelInfoWindow(name){
			var url = "./bid_message.nhn?ep_user=" + name;
			openWin = window.open(url, 
					"_new", "width=600, height=350, resizable = no, scrollbars = no");
			return false;
		}
		
		
		function accountTransfer(em_id){
			var eg_num = '#account-num-' + em_id;
			var eg_state = '#sel-state-' + em_id;
			var eg_recoin = '#account-recoin-' + em_id;
			$.ajax({
				type: "POST",
				url: "./account_transfer.nhn",
				data: {eg_num: $(eg_num).val(), eg_id: em_id,
					eg_state: $(eg_state).val(),
					eg_recoin: $(eg_recoin).val()},
				success: function(result){
					if(result == 1){
						alert(em_id + " 회원님의 " + $(eg_recoin).val() + " 포인트가 충전되었습니다.");
					} else if(result == -1){
						alert(em_id + " 회원님의 " + $(eg_recoin).val() + " 포인트가 반환되었습니다.");
					}
					
					$(eg_recoin).val("");
					
				}
					
			});
			return false;
		}
	</script>
	<style>
	.review-title{opacity:0.9;background:black;height:110px;
		margin:0px 0px 30px 0px;padding:30px 70px;z-index:1}
	.review-title-addr{font-size:30pt;float:right;margin-right:35%;z-index:100;color:white;}
	.review-title-img{float:right;z-index:100;color:white;margin-top:20px;}
	.fa-home{color:white;font-size:15pt;}
	</style>
</head>
<jsp:include page="../main/header.jsp"/>

<body class="fix-header fix-sidebar">
		<div class="review-title">
		<span class="review-title-img"><i class="fa fa-home" aria-hidden="true"></i> &nbsp;> &nbsp;Admin > &nbsp;List Page </span>
		<span class="review-title-addr" style="font-family: 'Pacifico', cursive;">Admin List</span>
	</div>
    <!-- Preloader - style you can find in spinners.css -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
			<circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
    </div>
    <!-- Main wrapper  -->
    <div id="main-wrapper">
        <!-- Page wrapper  -->
        <div class="page-wrapper">
            <!-- Container fluid  -->
            <div class="container-fluid">
                <!-- Start Page Content -->
                <div class="row">
                    
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>사용자</h4>
                            </div>
                            <div class="card-content">
                                <div id="b-area" style="height: 370px"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>경매물품</h4>
                            </div>
                            <div class="card-content">
                                <div id="rainfall" style="height: 370px"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>일반경매물품</h4>
                            </div>
                            <div class="card-content">
                                <div id="basic-Pie" style="height: 370px"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>특별경매물품</h4>
                            </div>
                            <div class="card-content">
                                <div id="basic-Pie2" style="height: 370px"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                <div class="col-lg-6" style="display:none;">
                        <div class="card">
                            <div class="card-title">
                                <h4>Echart</h4>
                            </div>
                            <div class="card-content">
                                <div id="bs-chart" style="height: 370px"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6" style="display:none;">
                        <div class="card">
                            <div class="card-title">
                                <h4>Echart</h4>
                            </div>
                            <div class="card-content">
                                <div id="b-line" style="height: 370px"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6" style="display:none;">
                        <div class="card">
                            <div class="card-title">
                                <h4>Echart</h4>
                            </div>
                            <div class="card-content">
                                <div id="nb-chart" style="height: 370px"></div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-lg-6"  style="display:none;">
                        <div class="card">
                            <div class="card-title">
                                <h4>Echart</h4>
                            </div>
                            <div class="card-content">
                                <div id="np-Pie" style="height: 370px"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6"  style="display:none;">
                        <div class="card">
                            <div class="card-title">
                                <h4>Echart</h4>
                            </div>
                            <div class="card-content">
                                <div id="doughnut" style="height: 370px"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6"  style="display:none;">
                        <div class="card">
                            <div class="card-title">
                                <h4>Echart</h4>
                            </div>
                            <div class="card-content">
                                <div id="radar" style="height: 370px"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6"  style="display:none;">
                        <div class="card">
                            <div class="card-title">
                                <h4>Echart</h4>
                            </div>
                            <div class="card-content">
                                <div id="gauge" style="height: 370px"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Start Page Content -->
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>회원 정보</h4>

                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Name</th>
                                                <th>ID</th>
                                                <th>M.S.</th>
                                                <th>Date</th>
                                                <th>Account</th>
                                                <th>Delete</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="list" items="${memberList}" varStatus="i" begin="0" end="${listCount}">
                                            <tr style="height:60px;">
                                                <th scope="row">${i.index + 1}</th>
                                                <td>${list.em_name}</td>
                                                <td><a href="#"><span class="badge badge-danger">${list.em_id}</span></a></td>
                                                <td>
                                                	<input type="hidden" class="user-id" onClick="cancelState('${list.em_id}');">
                                                	<a href="#" onClick="return cancelInfoWindow('${list.em_id}');" >
                                                		<i class="fa fa-envelope fa-envelope-${list.em_id}" aria-hidden="true"></i>
                                                	</a>
                                                </td>
                                                <td>${fn:substring(list.em_date, 0, 11)}</td>
                                                <td>${list.em_bank} ${list.em_account}</td>
                                                <td class="color-danger"><a href="#" class="color-delete">삭제</a></td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>포인트 충전 및 환불</h4>

                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>ID</th>
                                                <th>State</th>
                                                <th>Price</th>
                                                <th>Submit</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="list" items="${memberList}" varStatus="i" begin="0" end="${listCount}">
                                            <tr style="height:60px;">
                                                <th scope="row" class="account-row">
                                                	<input type="hidden" class="user-id" onClick="bellState('${list.em_id}');">
                                                	<a href="#" onClick="return accountInfoWindow('${list.em_id}');" >
                                                		<i class="fa fa-bell fa-bell-${list.em_id}" aria-hidden="true"></i>
                                                	</a>
                                                </th>
                                                <td><span class="badge badge-danger">${list.em_id}</span></td>
                                                <td>
                                                	<input type="hidden" class="eg_num" id="account-num-${list.em_id}">
                                                	<select class="sel-state-${list.em_id}" id="sel-state-${list.em_id }">
                                                		<option value="충전">충전</option>
                                                		<option value="반환">반환</option>
                                                	</select>
                                                </td>
                                                <td><input type="text" name="eg_recoin" id="account-recoin-${list.em_id}" class="recoin-price recoin-price-${list.em_id}" placeholder="금액을 입력하세요." readonly></td>
                                                <td class="color-primary">
                                                	<a href="#" onClick="return accountTransfer('${list.em_id}');" class="color-submit">전송하기</a></td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                <!-- End PAge Content -->
                
            </div>
        </div>
        <!-- End Page wrapper  -->
    </div>
    <!-- End Wrapper -->
    <!-- All Jquery -->
    <script src="./resources/js/admin/lib/jquery/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="./resources/js/admin/lib/bootstrap/js/popper.min.js"></script>
    <script src="./resources/js/admin/lib/bootstrap/js/bootstrap.min.js"></script>

     <!-- Echart -->
    <script src="./resources/js/admin/lib/echart/echarts.js"></script>
    <script src="./resources/js/admin/lib/echart/echarts-init.js"></script>
    <!--Custom JavaScript -->
    <script src="./resources/js/admin/scripts.js"></script>
	<c:if test="${sessionScope.id != 'admin'}">
	<script>
		alert("관리자만 사용가능합니다.");
		history.go(-1);
	</script>
</c:if>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>

</html>
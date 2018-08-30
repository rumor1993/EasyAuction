<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
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
    <style>
    	.row-form{display:inline-block;width:100%}
    	.btn-danger{border-radius:10px;}
    	.table-itemnum{color:black;}
    	.table-reason{color:#F03C02}
    </style>
    <script src="./resources/js/jquery-3.3.1.js"></script>
    <script>
    	function bidCancelRequest(ep_user, eb_itemnum){
			$.ajax({
				type:"POST",
				url: "./bid_cancel_request.nhn",
				data: {"ep_user": ep_user,
						"eb_itemnum": eb_itemnum},
				success: function(result){
					if(result > 0){
						alert("물품 취소가 완료 되었습니다.");
						var str = ".btn-danger-" + eb_itemnum;
						$(str).css("background-color", "gray");
						window.close();
					} else {
						alert("물품 취소를 실패했습니다.");
					}	
				}
			});
    	}
    </script>
</head>
<body>
	<div class="container-fluid">
       	<div class="row row-form">
			<div class="card">
		        <div class="card-body">
		            <h4 class="card-title">낙찰 취소 리스트</h4>
		            <h6 class="card-subtitle">취소 대기</h6>
		            <div class="table-responsive m-t-40">
		                <table id="myTable" class="table table-bordered table-striped">
		                    <thead>
		                        <tr>
		                            <th>No.</th>
		                            <th>User</th>
		                            <th>Product</th>
		                            <th>Reason</th>
		                            <th>Cancel</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                    	<c:forEach var="bclist" items="${bidCancelList}" varStatus="i" begin="0">
		                        <tr>
		                            <td class="table-number">${i.index + 1}</td>
		                            <td class="table-user">${bclist.em_id}</td>
		                            <c:if test="${fn:substring(bclist.eb_itemnum, 0, 2) == 'CP'}">
		                            	<td class="table-itemnum"><a href="./common_product_cont.nhn?eb_itemnum=${bclist.eb_itemnum}&state=cont">${bclist.eb_itemnum}</a></td>
		                            </c:if>
		                            <c:if test="${fn:substring(bclist.eb_itemnum, 0, 2) == 'SP'}">
		                            	<td class="table-itemnum"><a href="./special_product_cont.nhn?eb_itemnum=${bclist.eb_itemnum}&page=1&state=cont">${bclist.eb_itemnum}</a></td>
		                            </c:if>
		                            <td class="table-reason">${bclist.ex_reason}</td>
		                            <td class="table-submit"><button class="btn-danger btn-danger-${bclist.eb_itemnum}" 
		                            	onClick="bidCancelRequest('${bclist.em_id}','${bclist.eb_itemnum}')">취소완료</button></td>
		                        </tr>
		                        </c:forEach>
		                    </tbody>
		                </table>
		            </div>
		        </div>
		    </div>
		</div>
	</div>
</body>
</html>
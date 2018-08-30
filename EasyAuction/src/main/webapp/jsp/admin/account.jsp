<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    	.table-name{color:black;}
    	.table-request{color:#F03C02}
    </style>
    <script src="./resources/js/jquery-3.3.1.js"></script>
    <script>
    	function accountRequest(egNum, egId, egRecoin, egApply){
    		var accountNum = "account-num-" + egId;
    		var accountName = "account-recoin-" + egId;
    		var accountState = "sel-state-" + egId;
    		opener.document.getElementById(accountNum).value = egNum;
    		opener.document.getElementById(accountName).value = egRecoin;
    		opener.document.getElementById(accountState).value = egApply;
    		
    		window.close();
    	}
    </script>
</head>
<body>
	<div class="container-fluid">
       	<div class="row row-form">
			<div class="card">
		        <div class="card-body">
		            <h4 class="card-title">포인트 리스트</h4>
		            <h6 class="card-subtitle">충전 및 반환</h6>
		            <div class="table-responsive m-t-40">
		                <table id="myTable" class="table table-bordered table-striped">
		                    <thead>
		                        <tr>
		                            <th>No.</th>
		                            <th>ID</th>
		                            <th>Request</th>
		                            <th>State</th>
		                            <th>Apply</th>
		                            <th>Submit</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                    	<c:forEach var="alist" items="${accountList}" varStatus="i" begin="0">
		                        <tr>
		                            <td class="table-number">${i.index + 1}</td>
		                            <td class="table-name">${alist.eg_id}</td>
		                            <td class="table-request">${alist.eg_recoin}</td>
		                            <td class="table-state">${alist.eg_state}</td>
		                            <td class="table-apply">${alist.eg_apply}</td>
		                            <td class="table-submit"><button class="btn-danger" 
		                            	onClick="accountRequest('${alist.eg_num}', '${alist.eg_id}', '${alist.eg_recoin}', '${alist.eg_apply}')">요청</button></td>
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
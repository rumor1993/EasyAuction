<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script>
$(".small_category_a").click(function(e){
		e.preventDefault();
		var category = $(this).text();
		category = category.substring(2,category.length)
		
		location.href='special_auction_list.nhn?ey_smallcategory='+category
	})
</script>
<style>
a{font-size:10pt; font-weight:bolder}
a:link { color: black; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: red; text-decoration: underline;}
</style>
</head>

<body>
<c:forEach var="small" items="${small}">
	<a href="@" class="small_category_a"><img src=./resources/img/special/구형아이콘.jpg style="width:10px; height:10px">
	${small.ey_smallcategory}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</c:forEach>									 
</body>
</html>
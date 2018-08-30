<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>

<body>
<c:forEach var="small" items="${small}">
        		<option value="${small.ey_smallcategory}">${small.ey_smallcategory}</option>
</c:forEach>								 
</body>
</html>
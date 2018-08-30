<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.smcategory{
	margin-left: 20px
}
</style>
	<c:forEach var="c" items="${category }" varStatus="status">
		<span class="smcategory" id="${c.ey_smallcategory }"><a href="./get_category_list1.nhn?smallcategory=${c.ey_smallcategory }">${c.ey_smallcategory }</a></span>
	</c:forEach> 
	
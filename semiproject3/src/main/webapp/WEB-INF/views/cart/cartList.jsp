<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 카트 리스트입니다. 
 <table>
 	<thead>
 		<th>이름</th>
 		<th>컬러</th>
 		<th>사이즈</th>
 		<th>가격</th>
 	</thead>
 	
 	<c:forEach var="cartDto" items="${cart}">
 	<tbody>
 		<td>${cartDto.cartItemName}</td>
 		<td>${cartDto.cartItemColor}</td>
 		<td>${cartDto.cartItemSize}</td>
 		<td>${cartDto.cartItemPrice}</td>
 		
 		<td>삭제</td>
 	</tbody>
 	</c:forEach>
 	
 </table>
</body>
</html>
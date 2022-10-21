<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
 입출고테이블
 <table>
 <thead>
 	<tr>
 		<th>상품카테고리</th>
 		<th>상품이름</th>
 		<th>상품사이즈</th>
 		<th>상품컬러</th>
 		<th>현재재고</th>
 	</tr>
 </thead>
 <tbody>
 	<c:forEach var="item" items="${itemList}">
 	<tr>
		<td>${item.cateCode}</td>
		<td>${item.itemName }</td>
		<td>${item.itemSize}</td>
		<td>${item.itemColor}</td>
		<td>${item.itemTotalCnt}</td>
		<td>
			<a href="insert?itemNo=${item.itemNo}"><button>입고/출고</button></a>
		</td>
	</tr> 	
 	</c:forEach>
 </tbody>
 </table>
 </center>
 
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="상품 상세 페이지" name="title" />
</jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<br>
<br>
 카트 리스트입니다. 
 <br><br>
 <table>
 	<thead>
 		<th>사진</th>
 		<th>이름</th>
 		<th>컬러</th>
 		<th>사이즈</th>
 		<th>가격</th>
 	</thead>
 	
 	<c:forEach var="cartDto" items="${cart}">
 	<tbody>
 	
 		<td><img src="/image/download/${itemDto.imageNo}" width="200" ></td>
 		<td>${cartDto.cartItemName}</td>
 		<td>${cartDto.cartItemColor}</td>
 		<td>${cartDto.cartItemSize}</td>
 		<td>${cartDto.cartItemPrice}</td>
 		<c:set var="total" value="${total+cartDto.cartItemPrice}"/>
 		<td><a href="delete?itemNo=${cartDto.itemNo}">삭제</a></td>
 	</tbody>
 	</c:forEach>
 </table>
 <br>
  장바구니 총수량 ${cartCount}
 <br>
 <c:out value="상품 총금액 : ${total}"/> + 총 배송비 2500 = 주문금액${total+2500}
 <br>

 <button type="button">주문하기</button>
 </center>
</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</html>
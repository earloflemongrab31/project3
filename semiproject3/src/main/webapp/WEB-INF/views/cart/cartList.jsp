<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="장바구니" name="title" />
</jsp:include>

<div class="container-600 mt-50 mb-50">
<div class="row center mb-50">
	 <h1>CART</h1>
</div>
<div class="row center">
	장바구니 상품(${cartCount})
</div>
<table class="table table-border">
 	<tbody>
 	<c:forEach var="cartDto" items="${cart}">
 		<tr>
	 		<td rowspan="3">
	 			<img src="/image/download/${itemDto.imageNo}" width="200">
	 		</td>
	 		<td colspan="2">${cartDto.cartItemName}</td>
	 		<td class="right"><a href="delete?itemNo=${cartDto.itemNo}">삭제</a></td>
		</tr>
		<tr>
			<td>수량</td>
			<td>?</td>
	 		<td class="right" rowspan="2">
	 			<fmt:formatNumber value="${cartDto.cartItemPrice}" pattern="#,##0"/>원
	 		</td>
	 	</tr>
	 	<tr>	
	 		<td>옵션</td>
	 		<td>${cartDto.cartItemColor} / ${cartDto.cartItemSize}</td>
		</tr>
	 		<c:set var="total" value="${total+cartDto.cartItemPrice}"/>
 	</c:forEach>
 	</tbody>
 	<tfoot>
 		<tr>
 			<td class="left" colspan="6">
 				총 주문 금액
 			</td>
		</tr>
 		<tr>
 			<td class="center" colspan="6">
				상품 총금액 : 
				<fmt:formatNumber value="${total}" pattern="#,##0"/>원
				 + 2,500원(배송비) = 
				<fmt:formatNumber value="${total+2500}" pattern="#,##0"/>원
			</td>
		</tr>
 		<tr>
 			<td class="center" colspan="6">
				<button class="btn btn-positive" type="button">주문하기</button>
			</td>
		</tr>
 </table>

</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
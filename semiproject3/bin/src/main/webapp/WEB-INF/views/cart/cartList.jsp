<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="장바구니" name="title"/>
</jsp:include>


<div class="container-600 mt-50 mb-50">
<div class="row center mb-50">
	 <h1>CART</h1>
</div>
<div class="row center">
		장바구니 상품(${cartCount})
</div>
<!-- <form action="/orders/detail" method="post"> -->
<table class="table table-border" >
 	<tbody>
 	<c:forEach var="cartDto" items="${cartList}">
 		<c:if test="${cartDto.imageMain == 1}">
	 		<tr>
		 		<td class="center" rowspan="3" style="vertical-align: bottom;">
		 			<a href="/item/buydetail?itemNo=${cartDto.itemNo}">
		 				<img src="/image/download/${cartDto.imageNo}" width="100">
		 			</a>
		 		</td>
		 		<td colspan="2">${cartDto.itemName}</td>
		 		<td class="right"><a href="delete?cartNo=${cartDto.cartNo}">삭제</a></td>
			</tr>
 		</c:if>
		<tr>
			<td>수량</td>
			<td>
				<input type="number" class="itemCnt input w-100" value="${cartDto.itemCnt}" min="0" max="${cartDto.itemTotalCnt}">
<!-- 				<span> -->
<!-- 				<button class="plus btn">+</button> -->
<!-- 				<button class="minus btn">-</button> -->
<!-- 				</span> -->
			</td>
	 		<td class="right" rowspan="2">
	 			<c:set var="cntPrice" value="${cartDto.itemCnt*cartDto.itemPrice}"/>
	 			<fmt:formatNumber value="${cntPrice}" pattern="#,##0"/>원
	 		</td>
	 	</tr>
	 	<tr>	
	 		<td>옵션</td>
	 		<td>${cartDto.itemColor} / ${cartDto.itemSize}</td>
		</tr>
	 		<c:set var="total" value="${total+cntPrice}"/>
	 		<c:set var="deliveryFee" value="${cartDto.deliveryFee}"/>
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
				 + ${deliveryFee}원(배송비) = 
				<fmt:formatNumber value="${total+deliveryFee}" pattern="#,##0"/>원
			</td>
		</tr>
 		<tr>
 			<td class="center" colspan="6">
				<button class="btn btn-positive" type="submit">주문하기</button>
			</td>
		</tr>
 </table>
<!-- </form> -->
</div>





<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
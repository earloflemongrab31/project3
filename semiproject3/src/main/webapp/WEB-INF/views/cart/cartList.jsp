<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="장바구니" name="title"/>
</jsp:include>

<script>
	$(function(){
		$(".input[name=itemCnt]").on("input",function(){
			var itemCnt = $(this).val();
			var cartNo = $(this).parent("td").find("input[name=cartNo]").val();
			var itemPrice = $(this).parent("td").find("input[name=itemPrice]").val();
			var that = $(this);
			$.ajax({
				url: "${pageContext.request.contextPath}/rest/cart/",
				method: "post",
				data: {
					itemCnt: itemCnt,
					cartNo: cartNo
				},
				success: function(resp){
					that.parent("td").next().find(".price-result").text(itemPrice * itemCnt);
					var totalPay = 0;
					for(var i=0; i<resp.length; i++){
						totalPay += resp[i].itemCnt * resp[i].itemPrice;			
					}
					$("#pay-total").text(totalPay);
					$("#pay-real-total").text(totalPay + 3000);
				}
			});
		});
		
	});
	
</script>

<div class="container-600 mt-50 mb-50">
<div class="row center mb-30">
	 <h1>CART</h1>
</div>
<c:choose>
<c:when test="${!empty cartList}">
<div class="row center">
		장바구니 상품(${cartCount})
</div>
<form action="${pageContext.request.contextPath}/orders/cart-buy" method="post">
<table class="table table-border" >
 	<tbody>
 	<c:forEach var="cartDto" items="${cartList}">
 		<c:if test="${cartDto.imageMain == 1}">
	 		<tr>
		 		<td class="center" rowspan="3" style="vertical-align: bottom;">
		 			<a href="${pageContext.request.contextPath}/item/buydetail?itemNo=${cartDto.itemNo}">
		 				<img src="${pageContext.request.contextPath}/image/download/${cartDto.imageNo}" width="100">
		 				<input type="hidden" name="imageNo" value="${cartDto.imageNo}">
		 			</a>
		 		</td>
		 		<td colspan="2">${cartDto.itemName}</td>
		 		<td class="right"><a href="delete?cartNo=${cartDto.cartNo}"><i class="fa-solid fa-xmark"></i></a></td>
			</tr>
 		</c:if>
		<tr>
			<td>수량</td>
			<td>
		 		<input type="hidden" name="cartNo" value="${cartDto.cartNo}">
		 		<input type="hidden" name="customerId" value="${cartDto.customerId}">
		 		<input type="hidden" name="itemNo" value="${cartDto.itemNo}">
		 		<input type="hidden" name="itemName" value="${cartDto.itemName}">
	 			<input type="hidden" name="itemPrice" value="${cartDto.itemPrice}">
				<input type="number" class="itemCnt input w-100" name="itemCnt" value="${cartDto.itemCnt}" min="1" max="${cartDto.itemTotalCnt}">
			</td>
			<td class="center" width="100" rowspan="2">
				<span class="price-result">${cartDto.itemPrice * cartDto.itemCnt}</span>원
				<c:set var="total" value="${total + cartDto.itemPrice * cartDto.itemCnt}"></c:set>
	 		</td>
	 	</tr>
	 	<tr>	
	 		<td>옵션</td>
	 		<td>
		 		${cartDto.itemColor} / ${cartDto.itemSize}
		 		<input type="hidden" name="itemColor" value="${cartDto.itemColor}">
		 		<input type="hidden" name="itemSize" value="${cartDto.itemSize}">
	 		</td>
		</tr>
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
					상품 총금액 : <span id="pay-total">${total}</span>원
					 + 3000원(배송비) = <span id="pay-real-total">${total+3000}</span>원
				</td>
			</tr>
 		<tr>
 			<td class="center" colspan="6">
				<button class="btn btn-positive" type="submit">주문하기</button>
			</td>
		</tr>
	</tfoot>
</table>
</form>
</c:when>
<c:otherwise>
	<div class="row center mt-30">
		<h3>장바구니에 담긴 상품이 없습니다.</h3>
	</div>
	<div class="row center mt-30">
		<a href="${pageContext.request.contextPath}/" class="btn btn-positive">쇼핑하러 가기</a>
	</div>
</c:otherwise>
</c:choose>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="주문페이지" name="title"/>
</jsp:include>

<!-- <script> -->
<!-- 	$(window).on("beforeunload", function(){ -->
<!-- 	    return false; -->
<!-- 	}); -->
<!-- </script> -->

<form action="/buy/insert" method="post">

<div class="container-1000 mt-50 mb-50">
<input type="hidden" name="customerId" value="${customerDto.customerId}">
<div class="row center mb-30">
	<h1>ORDER</h1>
	<hr>
</div>

<div class="floate-container">
	<div class="float-left">
		<h2>구매자 정보</h2>
	</div>
	<div class="row float-right">
		<a href="delete-all" class="btn btn-neutral buy-delete">구매취소</a>
	</div>
</div>
<div class="row mb-30">
	<table class="table table-slit">
		<tbody>
			<tr>
				<th class="w-25">이름</th>
				<td>
					${customerDto.customerName}
				</td>
			</tr>
			<tr>
				<th>휴대폰 번호</th>
				<td>
					${customerDto.customerPhone}
				</td>
		</tbody>
	</table>
</div>

<div class="row float-left">
	<h2>배송지 정보</h2>
</div>
<div class="row mb-30">
	<table class="table table-slit">
		<tbody>
			<c:forEach var="addressDto" items="${addressList}">
			<c:if test="${addressDto.addressBasic == 'Y'}">
				<tr>
					<th class="w-25">이름</th>
					<td>
						<input class="input input-none w-100" type="text" name="deliveryName" 
								value="${addressDto.addressName}" readonly>
					</td>
				</tr>
				<tr>
					<th rowspan="3">배송지</th>
					<td>
						<input class="input input-none w-100" type="text" name="deliveryPost" 
								value="${addressDto.addressPost}" readonly>
					</td>
				</tr>
				<tr>
					<td>
						<input class="input input-none w-100" type="text" name="deliveryHost" 
								value="${addressDto.addressHost}" readonly>
					</td>
				</tr>
				<tr>
					<td>
						<input class="input input-none w-100" type="text" name="deliveryDetailHost" 
								value="${addressDto.addressDetailHost}" readonly>
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						<input class="input input-none w-100" type="text" name="deliveryPhone" 
								value="${addressDto.addressTel}" readonly>
					</td>
				</tr>
			</c:if>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="row">
	<h2>상품 내역</h2>
</div>
<div class="row mb-30">
	<table class="table table-slit">
		<tbody>
			<c:forEach var="ordersDto" items="${ordersList}">
				<input type="hidden" name="ordersNo" value="${ordersDto.ordersNo}">
				<input type="hidden" name="itemNo" value="${ordersDto.itemNo}">
				<tr>
					<th class="w-25" rowspan="4">
						<img class="w-100" src="/image/download/${ordersDto.imageNo}">
						<input type="hidden" name="imageNo" value="${ordersDto.imageNo}">
					</th>
					<td>상품명</td>
					<td>
						<input type="text" class="input input-none w-100" name="itemName" 
							value="${ordersDto.itemName}" readonly>
					</td>
<!-- 					<td class="right"> -->
<%-- 					<a href="delete?ordersNo=${ordersDto.orderNo}"> --%>
<!-- 					삭제 -->
<!-- 					</a> -->
<!-- 					</td> -->
					<td rowspan="4">
						금액 : 
						<c:set var="itemTotal" value="${ordersDto.itemPrice * ordersDto.itemCnt}"></c:set>
							<fmt:formatNumber value="${itemTotal}" pattern="#,##0원"/>
						<input type="hidden" name="itemTotalPrice" value="${itemTotal}">
					</td>
				</tr>
				<tr>
					<td>사이즈</td>
					<td>
						<input type="text" class="input input-none w-100" name="itemSize"
							value="${ordersDto.itemSize}" readonly>
					</td>
				</tr>
				<tr>
					<td>컬러</td>
					<td>
						<input type="text" class="input input-none w-100" name="itemColor"
							value="${ordersDto.itemColor}" readonly>
					</td>
				</tr>
				<tr>
					<td>수량</td>
					<td>
						<input type="number" class="input input-none w-100" name="itemCnt" 
								value="${ordersDto.itemCnt}" readonly>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div class="row">
	<h2>결제 정보</h2>
</div>
<div class="row mb-30">
	<table class="table table-slit">
		<tbody>
			<tr>
				<th rowspan="2" class="w-25">총 구매 금액</th>
				<td>
					<c:forEach var="ordersDto" items="${ordersList}">
						<c:set var="payPrice" value="${payPrice + ordersDto.itemPrice * ordersDto.itemCnt}"/>
					</c:forEach>
					${payPrice}원
					+ 3000원(배송비) 
				</td>
			</tr>
			<tr>
				<td>
					<span id="total-pay">${payPrice + 3000}</span>원
				</td>
			</tr>
			<tr>
				<th>포인트</th>
				<td>
					<input class="input w-33" type="number" name="usePoint" value="0"
							min="0" max="${customerDto.customerPoint}">
					사용 가능 포인트 : 
					${customerDto.customerPoint} point
				</td>
			</tr>
			<tr>
				<th rowspan="2" class="w-25">최종 결제 금액</th>
				<td>
					${payPrice}원
					+ 3000원(배송비) - <span id="use-point">0</span>point(사용 포인트)
				</td>
			</tr>
			<tr>
				<td>
					<span id="total-price">${payPrice + 3000}</span>원
				</td>
			</tr>
		</tbody>
	</table>
</div>

<div class="row center">
	<button class="btn btn-positive" type="submit">구매하기</button>
</div>

</div>

</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
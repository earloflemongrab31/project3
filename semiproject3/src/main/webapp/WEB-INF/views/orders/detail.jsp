<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="주문페이지" name="title"/>
</jsp:include>

<form action="/buy/insert" method="post">

<div class="container-1000 mt-50 mb-50">

<div class="row center">
	<h3>${customerDto}</h3>
</div>
<div class="row center">
	<h3>${addressList}</h3>
</div>
<div class="row center">
	<h3>${ordersDto}</h3>
</div>

<div class="row center">
	<h1>ORDER</h1>
</div>

<div class="row">
	<h2>구매자 정보</h2>
</div>

<div class="row mb-30">
	<table class="table table-slit">
		<tbody>
			<tr>
				<th class="w-25">이름</th>
				<td>
					<input class="input input-none w-100" type="text" name="customerName" 
							value="${customerDto.customerName}" readonly>
				</td>
			</tr>
			<tr>
				<th>휴대폰 번호</th>
				<td>
					<input class="input input-none w-100" type="text" name="customerPhone" 
							value="${customerDto.customerPhone}" readonly>
				</td>
		</tbody>
	</table>
</div>

<div class="row">
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
						<input class="input input-none w-100" type="text" name="addressName" 
								value="${addressDto.addressName}" readonly>
					</td>
				</tr>
				<tr>
					<th rowspan="3">배송지</th>
					<td>
						<input class="input input-none w-100" type="text" name="customerPost" 
								value="${addressDto.addressPost}" readonly>
					</td>
				</tr>
				<tr>
					<td>
						<input class="input input-none w-100" type="text" name="customerHost" 
								value="${addressDto.addressHost}" readonly>
					</td>
				</tr>
				<tr>
					<td>
						<input class="input input-none w-100" type="text" name="customerDetailHost" 
								value="${addressDto.addressDetailHost}" readonly>
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						<input class="input input-none w-100" type="text" name="addressPhone" 
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
			<tr>
				<th class="w-25" rowspan="3">
					<img src="/image/download/${ordersDto.itemNo}">
				</th>
				<td>상품명 : ${ordersDto.itemName }</td>
				<td rowspan="3">
					금액 : 
					${ordersDto.itemPrice} * ${ordersDto.itemCnt}
				</td>
			</tr>
			<tr>
				<td>옵션 : ${ordersDto.itemSize} / ${ordersDto.itemColor}</td>
			</tr>
			<tr>
				<td>수량 : ${ordersDto.itemCnt}</td>
			</tr>
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
				<th class="w-25">결제 금액</th>
				<td>
					상품 가격 * ${ordersDto.itemCnt}
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
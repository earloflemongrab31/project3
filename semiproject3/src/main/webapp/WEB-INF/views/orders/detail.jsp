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
	<h1>ORDER</h1>
</div>

<div class="row">
	<h2>구매자 정보</h2>
</div>

<div class="row mb-30">
	<table class="table table-border">
		<tbody>
			<tr>
				<th>이름</th>
				<td>${customerDto.customerName}</td>
			</tr>
			<tr>
				<th>휴대폰 번호</th>
				<td>
					${customerDto.customerPhone}
				</td>
		</tbody>
	</table>
</div>

<div class="row">
	<h2>배송지 정보</h2>
</div>
<div class="row mb-30">
	<table class="table table-border">
		<tbody>
			<c:forEach var="addressDto" items="${addressList}">
			<c:if test="${addressDto.addressBasic == 'Y'}">
				<tr>
					<th>이름</th>
					<td>${addressDto.addressName}</td>
				</tr>
				<tr>
					<th rowspan="3">배송지</th>
					<td>${addressDto.addressPost}</td>
				</tr>
				<tr>
					<td>${addressDto.addressHost}</td>
				</tr>
				<tr>
					<td>${addressDto.addressDetailHost}</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>?<%-- ${addressDto.addressTel} --%></td>
				</tr>
			</c:if>
			</c:forEach>
		</tbody>
	</table>
</div>

<div class="row">
	<h2>결제 정보</h2>
</div>
<div class="row mb-30">
	<table class="table table-border">
		<tbody>
			<tr>
				<th>결제 금액</th>
				<td>
					<c:forEach var="itemDto" items="${ordersItemList}">
						<c:set var="total" value="${total + itemDto.itemPrice * itemDto.itemCnt}"/>
					</c:forEach>
					${total}
				</td>
			</tr>
		</tbody>
	</table>
</div>

<div class="row">
	<button class="btn btn-positive" type="submit">구매하기</button>
</div>
<!-- <div class="row center"> -->
<%-- 	${customerDto} --%>
<!-- </div> -->
<!-- <div class="row center"> -->
<%-- 	${addressList} --%>
<!-- </div> -->
<!-- <div class="row center"> -->
<%-- 	${ordersItemList} --%>
<!-- </div> -->

</div>

</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="주문내역페이지" name="title"/>
</jsp:include>

<div class="container-700 mt-50 mb-50">

<div class="row center mb-30">
	<h1>BUY</h1>
	<hr>
</div>
<div class="row center mb-30">
	<table class="table table-border table-hover">
		<thead>
			<tr>
<!-- 				<th>선택</th> -->
				<th width="15%">주문번호</th>
				<th width="25%">아이디</th>
				<th width="20%">주문일</th>
				<th width="20%">배송현황</th>
				<th width="15%">비고</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="buyDto" items="${buyList}">
				<tr>
<!-- 					<td><input type="checkbox"></td> -->
					<td>${buyDto.buyNo}</td>
					<td>${buyDto.customerId}</td>
					<td>${buyDto.buyDate}</td>
					<td>${buyDto.deliveryStatus}</td>
					<td>
						<a class="btn btn-border"  href="admin-buydetail?buyNo=${buyDto.buyNo}">
							확인
						</a>
					</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
</div>

<div class="row center">
	<form action="list" method="get">
		<select class="input" name="type" required>
			<option value="customer_id">아이디</option>
		</select>
		<input type="search" name="keword" class="input" required>
		<button type="submit" class="btn btn-positive">검색</button>
	</form>
</div>

</div>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>
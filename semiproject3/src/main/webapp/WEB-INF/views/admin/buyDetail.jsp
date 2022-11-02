<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="주문상세페이지" name="title"/>
</jsp:include>

<div class="container-600 mt-50 mb-50">

<div class="row center mb-30">
	<h1>ORDER</h1>
	<hr>
</div>

<div class="row center">
	<table class="table table-border">
		<thead>
			<tr>
				<th class="left" colspan="3">주문번호 : ${buyDto.buyNo}</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="w-25" rowspan="3" style="vertical-align: bottom;">
					<a href="/item/buydetail?itemNo=${buyDto.itemNo}">
						<img class="w-100" src="/image/download/${buyDto.imageNo}">
					</a>
				</td>
				<td>${buyDto.itemName}</td>
				<td rowspan="3">
					<form action="update" method="post">
						<input type="hidden" name="buyNo" value="${buyDto.buyNo}">
						<select class="input" name="deliveryStatus">
						<c:choose>
							<c:when test="${buyDto.deliveryStatus == '결제완료'}">
								<option selected>결제완료</option>
								<option>배송준비중</option>
								<option>배송중</option>
								<option>배송완료</option>
							</c:when>
							<c:when test="${buyDto.deliveryStatus == '배송준비중'}">
								<option>결제완료</option>
								<option selected>배송준비중</option>
								<option>배송중</option>
								<option>배송완료</option>
							</c:when>
							<c:when test="${buyDto.deliveryStatus == '배송중'}">
								<option>결제완료</option>
								<option>배송준비중</option>
								<option selected>배송중</option>
								<option>배송완료</option>
							</c:when>
							<c:otherwise>
								<option>결제완료</option>
								<option>배송준비중</option>
								<option>배송중</option>
								<option selected>배송완료</option>
							</c:otherwise>
						</c:choose>
						</select>
					
						<button class="btn btn-positive" type="submit">변경</button>
					</form>
				</td>
			</tr>
			<tr>
				<td> 옵션 : ${buyDto.itemSize} / ${buyDto.itemColor}</td>
			</tr>
			<tr>
				<td> 수량 : ${buyDto.itemCnt}</td>
			</tr>
		</tbody>
	</table>
</div>

<div class="row center">
	<a class="btn btn-neutral" href="admin-buylist">이전으로</a>
</div>

</div>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>
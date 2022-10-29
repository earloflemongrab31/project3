<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/customerHeader.jsp">
	<jsp:param value="주문/배송조회" name="title"/>
</jsp:include>

<div class="container-550 mt-50 mb-50">

<div class="row center">
	<h1>주문/배송 조회</h1>
</div>
	<c:forEach var="buyItem" items="${buyList}">
	<table class="table table-border">
		<thead>
			<tr>
				<th>주문번호 : ${buyItem.buyNo}</th>
				<th>${buyItem.deliveryStatus}</th> 
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="w-25" rowspan="3">
					<a href="/item/buydetail?itemNo=${buyItem.itemNo}">
						<img class="w-100" src="/image/download/${buyItem.imageNo}">
					</a>
				</td>
				<td>${buyItem.itemName}</td>
			</tr>
			<tr>
				<td> 옵션 : ${buyItem.itemSize} / ${buyItem.itemColor}</td>
			</tr>
			<tr>
				<td> 
					<fmt:formatNumber value="${buyItem.itemTotalPrice}" pattern="#,##0원"/>
					 / ${buyItem.itemCnt}개
				</td>
			</tr>
		</tbody>
	</table>
	</c:forEach>
</div>

<jsp:include page="/WEB-INF/views/template/customerFooter.jsp"></jsp:include>
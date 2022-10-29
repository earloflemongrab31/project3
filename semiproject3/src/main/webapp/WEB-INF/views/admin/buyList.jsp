<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="관리자페이지" name="title"/>
</jsp:include>

<div class="container-600 mt-50 mb-50">

<div class="row center">
	<h1>주문 내역</h1>
</div>
<div class="row center">
	<table class="table table-border">
		<thead>
			<tr>
				<th>선택</th>
				<th>주문번호</th>
				<th>아이디</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="buyDto" items="${buyList}">
				<tr>
					<td><input type="checkbox"></td>
					<td>
						<a href="admin-buydetail?buyNo=${buyDto.buyNo}">
							${buyDto.buyNo}
						</a>
					</td>
					<td>${buyDto.customerId}</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
</div>
</div>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>
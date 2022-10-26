<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
    <jsp:param value="협력사 리스트" name="title"/>
</jsp:include>

<div class ="container-900 mt-50 mb-50">

	<div class = "row center mb-30">
		<h1>협력사 전체 리스트</h1>
		<hr>
	</div>
	
	<div class = "row">
		<table class="table table-hover table-border">
			<thead>
				<tr>
					<th>회사명</th>
					<th>회사 전화번호</th>
					<th>회사 주소</th>
					<th>관리자명</th>
					<th>관리자 직급</th>
					<th>관리자 전화번호</th>
					<th>특이사항</th>
					<th>수정/삭제</th>
				</tr>
			</thead>
				
			<tbody align="center">	
				<c:forEach var="list"  items="${list}">
					<tr>
						<td>${list.companyName}</td>
						<td>${list.companyNumber}</td>
						<td>${list.companyAddress}</td>
						<td>${list.customerName}</td>
						<td>${list.customerRank}</td>
						<td>${list.customerNumber}</td>
						<td>${list.companyExplan}</td>
						<td>
							<a href="update?companyNo=${list.companyNo}">수정</a>
							<a href="delete?companyNo=${list.companyNo}">삭제</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</div>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include> 
    
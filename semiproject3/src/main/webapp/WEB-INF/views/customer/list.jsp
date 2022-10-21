<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="회원 목록" name="title"/>
</jsp:include>

<div class="container-500 mt-40 mb-40">
	<div class="row center">
		<h1>회원 목록</h1>
	</div>
	
	<div class="row">
		<table class="table table-border table-stripe">
			<thead>
				<tr>
					<th>아이디</th>
					<th>닉네임</th>
					<th>핸드폰번호</th>
					<th>이메일</th>
					<th>회원관리</th>
				</tr>
			</thead>
			<tbody align="center">
				<%-- for(PocketMonsterDto dto : list){} --%>
				<c:forEach var="customerDto" items="${list}">
				<tr>
					<td>${customerDto.customerId}</td>
					<td>${customerDto.customerNick}</td>
					<td>${customerDto.customerPhone}</td>
					<td>${customerDto.customerEmail}</td>
					<td>
						<a href="edit?customerId=${customerDto.customerId}">수정</a>
						<a href="delete?customerId=${customerDto.customerId}">삭제</a>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="row">
		<ul class="pagination pagination-small">
			<li><a href="#">&laquo;</a></li>
			<li><a href="#">&lt;</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">6</a></li>
			<li><a href="#">7</a></li>
			<li><a href="#">8</a></li>
			<li><a href="#">9</a></li>
			<li><a href="#">10</a></li>
			<li><a href="#">&gt;</a></li>
			<li><a href="#">&raquo;</a></li>
		</ul>
	</div>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>



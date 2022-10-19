<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원 목록" name="title"/>
</jsp:include>

<div class="container-500 mt-40 mb-40">
	<div class="row center">
		<h1>회원 목록</h1>
	</div>
	<div class="row right">
		<a class="btn btn-neutral" href="insert">등록</a>
	</div>
	<div class="row">
		<table class="table table-border table-stripe">
			<thead>
				<tr>
					<th>아이디</th>
					<th>닉네임</th>
					<th>핸드폰번호</th>
					<th>이메일</th>
				</tr>
			</thead>
			<tbody align="center">
				<%-- for(PocketMonsterDto dto : list){} --%>
				<c:forEach var="dto" items="${list}">
				<tr>
					<td>${dto.customerId}</td>
					<td>${dto.customerNick}</td>
					<td>${dto.customerPhone}</td>
					<td>${dto.customerEmail}</td>
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



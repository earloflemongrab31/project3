<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="회원 목록" name="title"/>
</jsp:include>

<div class="container-800 mt-50 mb-50">
	<div class="row center mb-30">
		<h1>회원 목록</h1>
		<hr>
	</div>
	
	<div class="row">
		<table class="table table-border">
			<thead>
				<tr>
					<th width="15%">아이디</th>
					<th width="15%">닉네임</th>
					<th width="20%">핸드폰번호</th>
					<th width="30%">이메일</th>
					<th width="20%">회원관리</th>
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
						<a class="btn btn-border"  href="edit?customerId=${customerDto.customerId}">수정</a>
						<a class="btn btn-border"  href="delete?customerId=${customerDto.customerId}">삭제</a>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
<!-- 페이지 네비게이터 -->
<div class="row center">

<ul class="pagination">
<li>
	<c:choose>
		<c:when test="${not vo.isFirst()}">
			<a href="list?p=${vo.firstBlock()}&${vo.parameter()}">
				<i class="fa-solid fa-angles-left"></i>
			</a>
		</c:when>
		<c:otherwise>
			<a href="#"><i class="fa-solid fa-angles-left"></i></a>
		</c:otherwise>
	</c:choose>
</li>

<!-- 이전을 누르면 이전 구간의 마지막 페이지로 안내 -->
<li>
	<c:choose>
		<c:when test="${vo.hasPrev()}">
			<a href="list?p=${vo.prevBlock()}&${vo.parameter()}">
				<i class="fa-solid fa-chevron-left"></i>
			</a>
		</c:when>
		<c:otherwise>
			<a href="#"><i class="fa-solid fa-chevron-left"></i></a>
		</c:otherwise>
	</c:choose>
</li>
 
<c:forEach var="i" begin="${vo.startBlock()}" end="${vo.endBlock()}" step="1">
	<li <c:if test="${i==param.p}">class="on"</c:if>><a href="list?p=${i}&${vo.parameter()}">${i}</a></li>
</c:forEach>

<!-- 다음을 누르면 다음 구간의 첫 페이지로 안내 -->
<li>
	<c:choose>
		<c:when test="${vo.hasNext()}">
			<a href="list?p=${vo.nextBlock()}&${vo.parameter()}">
				<i class="fa-solid fa-chevron-right"></i>
			</a>
		</c:when>
		<c:otherwise>
			<a href="#"><i class="fa-solid fa-chevron-right"></i></a>
		</c:otherwise>
	</c:choose>
</li>

<li>
	<c:choose>
		<c:when test="${not vo.isLast()}">
			<a href="list?p=${vo.lastBlock()}&${vo.parameter()}">
				<i class="fa-solid fa-angles-right"></i>
			</a>
		</c:when>
		<c:otherwise>
			<a href="#"><i class="fa-solid fa-angles-right"></i></a>
		</c:otherwise>
	</c:choose>
</li>
</ul>

</div>	

</div>

<!-- 검색창 -->
<form action = "list" method="get" >
	<div class="row center">
		
		<select class="input" name="type" required>
			<option value="customer_id" <c:if test="${type == 'customer_id'}"></c:if>>아이디</option>
			<option value="customer_nick" <c:if test="${type == 'customer_nick'}"></c:if>>닉네임</option>
		</select>
			
		<input class="input" type="search" name="keyword" placeholder="검색어" required>
			<button class="btn btn-positive">검색</button>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>



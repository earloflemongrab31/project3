<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="주문내역페이지" name="title"/>
</jsp:include>

<div class="container-800 mt-50 mb-50">
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

<!-- 페이징 처리 -->
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




<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>
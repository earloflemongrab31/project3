<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="고객사 목록" name="title"/>
</jsp:include>

<div class="container-800 mt-50 mb-50">
	<div class="row center">
		<h1>고객사 목록</h1>
		<hr>
	</div>
	
	<div class="row">
		<table class="table table=border">
		<thead>
			<tr>
				<th>회사 이름</th>
				<th>회사 전화번호</th>
				<th>회사 주소</th>
				<th>관리자 이름</th>
				<th>관리자 직급</th>
				<th>관리자 전화번호</th>
				<th>특이사항</th>
				<th>수정/삭제</th>
			</tr>
		</thead>
		<tbody>
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
						<a href="update?companyNo=${list.companyNo}"><button>수정</button></a><br>
						<a href="delete?companyNo=${list.companyNo}"><button>삭제</button></a><br>
					</td>
				</tr>
					</c:forEach>
				</table>
				
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
	<li><a href="list?p=${i}&${vo.parameter()}">${i}</a></li>
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
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<jsp:include page="/WEB-INF/views/template/header.jsp">
    <jsp:param value="Q&A게시판" name="title"/>
</jsp:include>


<div class ="container-800 mt-50 mb-50">

	<div class = "row center mb-30">
		<h1>Q&A게시판</h1>
	</div>
	
	<div class = "row">
		<table class="table table-hover table-border">
			<thead>
				<tr>
					<th>글번호</th>
					<th>말머리</th>
					<th width="50%">제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
				
			<tbody align="center">
			<c:forEach var="centerDto" items="${list}">
			
				<tr>
				
				<td>${centerDto.centerNo}</td>
				
				<td>${centerDto.centerHead}</td>
					
				<td>
					<a href="detail?centerNo=${centerDto.centerNo}">
						${centerDto.centerTitle}
						<c:if test="${centerDto.adminContent != null}">
							[답변완료]
						</c:if>
						<c:if test="${centerDto.centerHead == '소지금' && centerDto.moneyConfirm == 'Y'}">
							[지급완료]
						</c:if>
					</a>
					
				</td>
					
				<td>${centerDto.customerId}</td>
				
				<td>
					<c:set var="current">
						<fmt:formatDate value="${centerDto.customerDate}" pattern="yyyy-MM-dd"/>
					</c:set>
					<c:choose>
						<c:when test="${today == current}">
							<fmt:formatDate value="${centerDto.customerDate}" 
													pattern="HH:mm"/>
						</c:when>
						<c:otherwise>
							<fmt:formatDate value="${centerDto.customerDate}" 
													pattern="yyyy-MM-dd"/>
						</c:otherwise>
					</c:choose>
				</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="row right">
		<a class="btn btn-positive" href="insert">문의사항 등록</a>
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

<!-- 검색창 -->
<form action = "list" method="get" autocomplete="off">
	<div class="row center">
		
		<select class="input input-none" name="type" required>
		<option value="center_title" <c:if test="${type == 'center_title'}"></c:if>>제목</option>
		<option value="center_head" <c:if test="${type == 'center_head'}"></c:if>>말머리</option>
		<option value="customer_id" <c:if test="${type == 'customer_id'}"></c:if>>작성자</option>
		
		</select>
			
		<input class="input" type="search" name="keyword" placeholder="검색어" value="${param.keyword}" required>
		<button class="btn btn-positive">검색</button>
	</div>
	
</form>

</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
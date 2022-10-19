<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<jsp:include page="/WEB-INF/views/template/header.jsp">
    <jsp:param value="공지사항" name="title"/>
</jsp:include>


<div class ="container-800 mt-40 mb-40">

	<div class = "row center">
		<h1>공지사항</h1>
	</div>
	
	<div class = "row">
		<table class="table table-hover table-border">
			<thead>
				<tr>
					<th>공지번호</th>
					<th>말머리</th>
					<th width="45%">제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
					
				</tr>
			</thead>
				
			<tbody align="center">
			<c:forEach var="Dto" items="${list}">
			
				<tr>
				
				<td>${Dto.noticeNo}</td>

				<td>
					<c:if test="${Dto.noticeHead != null}">
						${Dto.noticeHead}
					</c:if>
				</td>
					
				<td>
					<a href="detail?noticeNo=${Dto.noticeNo}">
						${Dto.noticeTitle}
					</a>
				</td>
					
				<td>${Dto.adminId}</td>
				
				<td>
					<c:set var="current">
						<fmt:formatDate value="${Dto.noticeDate}" pattern="yyyy-MM-dd"/>
					</c:set>
					<c:choose>
						<c:when test="${today == current}">
							<fmt:formatDate value="${Dto.noticeDate}" 
													pattern="HH:mm"/>
						</c:when>
						<c:otherwise>
							<fmt:formatDate value="${Dto.noticeDate}" 
													pattern="yyyy-MM-dd"/>
						</c:otherwise>
					</c:choose>
				</td>
			
				<td>${Dto.noticeRead}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="row right">
		<a class="btn btn-positive" href="insert">공지사항 등록</a>
	</div>
	


	<!-- 페이지 네비게이터 -->
<!-- 	<h3>  -->
	
<%-- 	<c:choose> --%>
<%-- 		<c:when test="${not vo.isFirst()}"> --%>
<%-- 			<a href="list?p=${vo.firstBlock()}&${vo.parameter()}">&laquo;</a> --%>
<%-- 		</c:when> --%>
<%-- 		<c:otherwise> --%>
<!-- 			<a href="#">&laquo;</a> -->
<%-- 		</c:otherwise> --%>
<%-- 	</c:choose> --%>
	
<!-- 	<!-- 이전을 누르면 이전 구간의 마지막 페이지로 안내 -->
<%-- 	<c:choose> --%>
<%-- 		<c:when test="${vo.hasPrev()}"> --%>
<%-- 			<a href="list?p=${vo.prevBlock()}&${vo.parameter()}">&lt;</a> --%>
<%-- 		</c:when> --%>
<%-- 		<c:otherwise> --%>
<!-- 			<a href="#">&lt;</a> -->
<%-- 		</c:otherwise> --%>
<%-- 	</c:choose> --%>
	 
<%-- 	<c:forEach var="i" begin="${vo.startBlock()}" end="${vo.endBlock()}" step="1"> --%>
<%-- 		<a href="list?p=${i}&${vo.parameter()}">${i}</a> --%>
<%-- 	</c:forEach> --%>
	
<!-- 	<!-- 다음을 누르면 다음 구간의 첫 페이지로 안내 --> 
<%-- 	<c:choose> --%>
<%-- 		<c:when test="${vo.hasNext()}"> --%>
<%-- 			<a href="list?p=${vo.nextBlock()}&${vo.parameter()}">&gt;</a> --%>
<%-- 		</c:when> --%>
<%-- 		<c:otherwise> --%>
<!-- 			<a href="#">&gt;</a> -->
<%-- 		</c:otherwise> --%>
<%-- 	</c:choose> --%>
	
<%-- 	<c:choose> --%>
<%-- 		<c:when test="${not vo.isLast()}"> --%>
<%-- 			<a href="list?p=${vo.lastBlock()}&${vo.parameter()}">&raquo;</a> --%>
<%-- 		</c:when> --%>
<%-- 		<c:otherwise> --%>
<!-- 			<a href="#">&raquo;</a> -->
<%-- 		</c:otherwise> --%>
<%-- 	</c:choose> --%>
	
<!-- 	</h3> -->
		
</div>

<!-- 검색창 -->
<form action = "list" method="get" >
	<div class="row center">
		
		<select class="input" name="type" required>
		<option value="notice_title" <c:if test="${type == 'notice_title'}"></c:if>>공지사항제목</option>
		<option value="notice_no" <c:if test="${type == 'notice_no'}"></c:if>>공지번호</option>
		</select>
			
		<input class="input" type="search" name="keyword" placeholder="검색어" required>
		<button class="btn btn-positive">검색</button>
	</div>
	
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
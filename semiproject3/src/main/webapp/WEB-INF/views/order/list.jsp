<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 현재 시간 구하기 -->
<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
<c:set var="today">
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>
</c:set>
   
<jsp:include page="/WEB-INF/views/template/header.jsp">
    <jsp:param value="주문 목록" name="title"/>
</jsp:include>


<div class ="container-800 mt-40 mb-40">

	<div class = "row center">
		<h1>목록</h1>
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
			<c:forEach var="noticeDto" items="${list}">
			
				<tr>
				
				<td>${noticeDto.noticeNo}</td>

				<td>
					<c:if test="${noticeDto.noticeHead != null}">
						${noticeDto.noticeHead}
					</c:if>
				</td>
					
				<td>
					<a href="detail?noticeNo=${noticeDto.noticeNo}">
						${noticeDto.noticeTitle}
					</a>
				</td>
					
				<td>${noticeDto.adminId}</td>
				
				<td>
					<c:set var="current">
						<fmt:formatDate value="${noticeDto.noticeDate}" pattern="yyyy-MM-dd"/>
					</c:set>
					<c:choose>
						<c:when test="${today == current}">
							<fmt:formatDate value="${noticeDto.noticeDate}" 
													pattern="HH:mm"/>
						</c:when>
						<c:otherwise>
							<fmt:formatDate value="${noticeDto.noticeDate}" 
													pattern="yyyy-MM-dd"/>
						</c:otherwise>
					</c:choose>
				</td>
			
				<td>${noticeDto.noticeRead}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="row right">
		<a class="btn btn-positive" href="insert">공지사항 등록</a>
	</div>





<!-- 검색창 -->
<form action = "list" method="get" >
	<div class="row center">
		<input type="hidden" name="size" value="${vo.size}">
		<select class="input" name="type" required>
		<option value="notice_title" <c:if test="${type == 'notice_title'}"></c:if>>공지사항제목</option>
		<option value="notice_no" <c:if test="${type == 'notice_no'}"></c:if>>공지번호</option>
		</select>
			
		<input class="input" name="keyword" type="search" placeholder="검색어" required="required" value="${param.keyword}">
		<button class="btn btn-positive">검색</button>
	</div>
	
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
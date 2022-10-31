<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="관리자 목록" name="title"/>
</jsp:include>

<div class="container-800 mt-50 mb-50">
	<div class="row center mb-30">
		<h1>ADMIN</h1>
		<hr>
	</div>
	
	<div class="row">
		<table class="table table-border">
			<thead>
				<tr>
					<th width="20%">아이디</th>
					<th width="20%">이름</th>
					<th width="20%">닉네임</th>
					<th width="20%">등급</th>
					<c:set var="main" value="${loginGrade == '메인관리자'}"></c:set>
						<c:if test="${main}">
					<th>비고</th>
					</c:if>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach var="adminDto" items="${list}">
				<tr>
					<td >${adminDto.adminId}</td>
					<td>${adminDto.adminName}</td>
					<td>${adminDto.adminNick}</td>
					<td>${adminDto.adminGrade}</td>
						<c:set var="main" value="${loginGrade == '메인관리자'}"></c:set>
						<c:if test="${main}">
							<td>
								<a class="btn btn-border" href="edit?adminId=${adminDto.adminId}"  >수정</a>
								<a class="btn btn-border" href="delete?adminId=${adminDto.adminId}">삭제</a>
							</td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<c:if test="${loginGrade == '메인관리자'}">
			<div class="row right">
				<a href="insert" class="btn btn-border">관리자 추가 등록</a>
			</div>
		</c:if>
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
	
>>>>>>> refs/remotes/origin/main
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>


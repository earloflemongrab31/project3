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
	
	<c:if test="${loginGrade == '메인관리자'}">
	<div class="row right">
	<a href="insert" class="btn btn-border">등록</a>
	</div>
	</c:if>
	
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
	</div>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="관리자 목록" name="title"/>
</jsp:include>

<div class="container-800 mt-50 mb-50">
	<div class="row center">
		<h1>관리자 목록</h1>
		<hr>
	</div>
	
	<div class="row right">
		<a href="insert" class="btn btn-border">등록</a>
	</div>
	
	<div class="row">
		<table class="table table-border">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>등급</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach var="adminDto" items="${list}">
				<tr>
					<td>${adminDto.adminId}</td>
					<td>${adminDto.adminName}</td>
					<td>${adminDto.adminNick}</td>
					<td>${adminDto.adminGrade}</td>
						<c:set var="main" value="${loginGrade == '메인관리자'}"></c:set>
						<c:if test="${main}">
							<td>
								<a class="btn btn-border" href="edit?adminId=${adminDto.adminId}">수정</a>
								<a class="btn btn-border" href="delete?adminId=${adminDto.adminId}">삭제</a>
							</td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>


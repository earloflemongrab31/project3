<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="메인관리자 변경" name="title"/>
</jsp:include>


<form action="edit" method="post">

<input name="adminId"  type="hidden"  value="${adminDto.adminId}">

<div class="container-300 mt-40">
	<div class="row center">
		<h1>메인 관리자 변경</h1>
	</div>

	<div class="row left">
		등급
		<input class="input w-100" name="adminGrade"  value="${adminDto.adminGrade}">
	</div>
	
	
	<div class="row right">
		<a href="list" class="btn btn-neutral">목록</a>
		<button type="submit" class="btn btn-positive">수정</button>	
	</div>
</div>
</form>


<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>
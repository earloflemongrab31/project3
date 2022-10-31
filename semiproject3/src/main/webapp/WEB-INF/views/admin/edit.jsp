<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="메인관리자 변경" name="title"/>
</jsp:include>


<form action="edit" method="post">

<input name="adminId"  type="hidden"  value="${adminDto.adminId}">

<div class="container-300 mt-50 mb-50">
	<div class="row center mb-30">
		<h1>ADMIN</h1>
		<hr>
	</div>

	<div class="row left ">
		현재등급
		<input class="input w-100"  value="${adminDto.adminGrade}" readonly>
	</div>
	
	<div class="row left">
		등급변경
		<select class="input w-100" name="adminGrade">
			<option value="">선택</option>
			<option disabled>------</option>
			<option value="일반관리자">일반관리자</option>
		     <option value="메인관리자">메인관리자</option>
		</select>
	</div>
	
	
	<div class="row right">
		<a href="list" class="btn btn-neutral">목록</a>
		<button type="submit" class="btn btn-positive">수정</button>	
	</div>
</div>
</form>


<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp">
    <jsp:param value="공지사항 등록 페이지" name="title"/>
</jsp:include>
    
<form action="insert" method="post">

<div class="container-500">
	<div class="row center">
		<h1>공지사항 등록 페이지</h1>
	</div>

	<div class="row">
		<div>번호</div><br><br>
		<div>제목</div><br><br>
		<div>작성일</div><br><br>
		<div>수정일</div><br><br>
		<div>조회수</div><br><br>
		<div>내용</div><br><br>
		<div>머리말</div>
	</div>









</div>
</form>   

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> 
    
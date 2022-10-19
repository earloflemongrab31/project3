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
	
	<div class="row center">
	
	번호 : <input type="number" name="noticeNo" value="${Dto.noticeNo}"><br><br>
	제목 : <input type="text" name="noticeTitle" value="${Dto.noticeTitle}"><br><br>
	작성일 : <input type="date" name="noticeDate" value="${Dto.noticeDate}"><br><br>
	수정일 : <input type="date" name="noticeUpdate" value="${Dto.noticeUpdate}"><br><br>
	조회수 : <input type="number" name="noticeRead" value="${Dto.noticeRead}"><br><br>
	내용 : <input type="text" name="noticeContent" value="${Dto.noticeContent}"><br><br>
	머리말 : <input type="text" name="noticeHead" value="${Dto.noticeHead}"><br><br>
	
	</div>


</div>
</form>   

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> 
    
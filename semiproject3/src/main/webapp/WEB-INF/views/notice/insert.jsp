<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp">
    <jsp:param value="공지사항 등록 페이지" name="title"/>
</jsp:include>
 


<form action="insert" method="post" enctype="multipart/form-data">

	<div class ="container-600">
	
	<div class="row">
		<h1>공지 사항 작성</h1>
		<hr>
	</div>
	
	<div class = "row">
		<label> 말머리 <select name="noticeHead">
			<option value="">선택</option>
			<option>긴급</option>
            <option>이벤트</option>
			</select>
			</label>
	</div>
	
	<div class="row">
		<label>제목 <input name="noticeTitle" type="text" required
			class="input mt-10 w-100" autocomplete="off">
		</label>
	</div>


	<div class="row w-100">
		<label> 내용 <textarea class="input mt-10 w-100"
				name="noticeContent" rows="10" cols="75" required></textarea>
		</label>
	</div>

	<div class="row right">
		<a class="btn btn-neutral" href="list">목록</a>
		<button class="btn btn-positive" type="submit">등록</button>
	</div>

	</div>
</form>
 


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> 
    
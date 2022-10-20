<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp">
    <jsp:param value="공지사항 등록 페이지" name="title"/>
</jsp:include>
 


<form action="insert" method="post" enctype="multipart/form-data">

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
 

</div>
</form>   

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> 
    
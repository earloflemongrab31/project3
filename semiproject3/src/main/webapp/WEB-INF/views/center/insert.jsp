<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp">
    <jsp:param value="문의사항 등록페이지" name="title"/>
</jsp:include>
 


<form action="insert" method="post">
<input name="customerId" type="hidden" value="${loginId}" >

	<div class ="container-600">
	
	<div class="row">
		<h1>Q&A 등록</h1>
		<hr>
	</div>
	
	<div class="row">
		<label>제목 <input name="centerTitle" type="text" required
			class="input mt-10 w-100" autocomplete="off">
		</label>
	</div>


	<div class="row w-100">
		<label> 내용 <textarea class="input mt-10 w-100"
				name="customerContent" rows="10" cols="75" required></textarea>
		</label>
	</div>

	<div class="row right">
		<a class="btn btn-neutral" href="list">목록</a>
		<button class="btn btn-positive" type="submit">등록</button>
	</div>

	</div>
</form>
 


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> 
    
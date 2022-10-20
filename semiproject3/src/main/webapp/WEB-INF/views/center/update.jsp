<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp">
    <jsp:param value="문의사항 답변페이지" name="title"/>
</jsp:include>
 


<form action="insert" method="post" enctype="multipart/form-data">

	<div class ="container-600">
	
	<div class="row">
		<h1>Q&A 답변</h1>
		<hr>
	</div>
	
	<div class="row">
		<label>문의 제목 <input name="centerTitle" type="text" 
			class="input mt-10 w-100" value ="${centerDto.centerTitle}">
		</label>
	</div>


	<div class="row w-100">
		<label> 문의 내용 <textarea class="input mt-10 w-100"
				name="customerContent" rows="10" cols="75" value ="${centerDto.customerConternt}"></textarea>
		</label>
	</div>
	
	
	<div class="row w-100">
		<label> 답변 내용 <textarea class="input mt-10 w-100"
				name="adminContent" rows="10" cols="75"></textarea>
		</label>
	</div>
	

	<div class="row right">
		<a class="btn btn-neutral" href="list">목록</a>
		<button class="btn btn-positive" type="submit">등록</button>
	</div>

	</div>
</form>
 


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> 
    
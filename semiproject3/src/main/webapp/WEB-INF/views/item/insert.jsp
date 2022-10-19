<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<jsp:include page="/WEB-INF/views/template/header.jsp">
    <jsp:param value="상품 등록 페이지" name="title"/>
</jsp:include>


<form action = "insert" method="post" enctype ="multipart/form-data">

<div class ="container-600">

	<div class = "row center">
		<h1>상품 등록 페이지</h1>
	</div>
	
	<div class = "row">
	<label> 카테고리
		<select class = "input w-100"" name ="cateCode">
			<option value="">선택</option>
			<option val></option>
		</select>
	</label>
	</div>
	
	<div class = "row">
	<label> 상품명
		<input name="itemName" type="text" required class = "input w-100"  autocomplete="off">
	</label>
	</div>
	
	<div class = "row">
	<label> 상품메모
		<input name="itemMemo" type="text" required class = "input w-100"  autocomplete="off">
	</label>
	</div>
	
	<div class = "row">
	<label> 가격
		<input name="itemPrice" type="number" required class = "input w-100"  autocomplete="off">
	</label>
	</div>
	
	<div class = "row">
	<label> 색상
		<input name="itemColor" type="text" required class = "input w-100"  autocomplete="off">
	</label>
	</div>
	
	<div class = "row">
	<label> 사이즈
		<input name="itemSize" type="text" required class = "input w-100"  autocomplete="off">
	</label>
	</div>
	
	<div class = "row">
	<label> 상품 설명
		 <textarea name="itemContent" rows="10" cols="56" required ></textarea>
	</label>
	</div>
	
	<div class = "row">
	<label> 상품 이미지
		 <input name="itemImage" type="file" accept=".png, .jpg">
	</label>
	</div>
	
	<div class="row right">
		<a class="btn btn-neutral" href="list">목록</a>
		<button class="btn btn-positive" type="submit">등록</button>
	</div>

</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
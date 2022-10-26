<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="상품리뷰" name="title" />
</jsp:include>


<form action="insert" method="post" enctype="multipart/form-data">

	<div class="container-500 mt-50">
	
	<div class="row center mb-50">
	    <h1>Review</h1>
	     <hr>
	</div>

	<div class="row">
	    <input type="hidden" name="reviewCustomerId" class="input " value="${loginId}">
	</div>
	
	<div class="row">
	<h3>1 .상품 만족도 조사</h3>
	</div>
	<div class="row">
	<input name="reviewStar" type="radio" value=1>1점
	<input name="reviewStar" type="radio" value=2>2점
	<input name="reviewStar" type="radio" value=3>3점
	<input name="reviewStar" type="radio" value=4>4점
	<input name="reviewStar" type="radio" value=5>5점
	</div>
	
	<div class="row">
	<h3>2. 배송 만족도 조사</h3>
	</div>
	<div class="row">
	<input name="reviewShipping" type="radio" value="느려요">느려요
	<input name="reviewShipping" type="radio" value="적당해요">적당해요
	<input name="reviewShipping" type="radio" value="빨라요">빨라요
	</div>

	<div class="row">
	<h3>3. 포장 만족도 조사</h3>
	</div>
	<div class="row">
	<input name="reviewPackaging" type="radio" value="별로예요">별로예요
	<input name="reviewPackaging" type="radio" value="적당해요">적당해요
	<input name="reviewPackaging" type="radio" value="꼼꼼해요">꼼꼼해요
	</div>
	
	<div class="row">
	<h3>4. 기타 의견이 있으시면 작성해주세요.</h3>
	<textarea class="input w-100 fix-size" name="reviewContent" placeholder="이 외 의견"></textarea>
	</div>
	
	<div class="row">
	<h3>사진 첨부</h3>
	</div>
	<div class="row">
	<input type="file" name="attachment" multiple>
	</div>
	
	<div class="row center">
	    <button type="submit" class="btn btn-positive">작성완료</button>
	</div>
	
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
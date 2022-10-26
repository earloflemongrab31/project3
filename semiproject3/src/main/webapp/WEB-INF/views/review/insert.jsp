<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="상품리뷰" name="title" />
</jsp:include>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/hiphop5782/score@latest/score.min.js"></script>
	<script type = "text/javascript">
    
    $(function(){
        $(".star-score").score({
            starColor : "red", // 별색상 (기본 : 금색)
            integerOnly:false, // 소수점 포함 별점
            display:{
                showNumber : true, // 숫자표시
                textColor : "red",
                placeLimit : 1, // 소수점 자리수
            }
        });


        $(".star-score-edit").score({
            editable:true, // 사용자가 클릭하여 수정가능하도록 설정
            integerOnly:true, // 정수만 가능
            display: {
                showNumber:true,
                textColor : "black",
            },
            send:{
                sendable : true, // 전송 가능 설정
                name : "reviewScore" // 전송 파라미터 명 설정
            }

        })
    })
    
    </script>


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
	<div class="row star-rating">
		<input type="radio" id="5-stars" name="reviewStar" value=5>
		<label for="5-stars">★</label>
		<input type="radio" id="4-stars" name="reviewStar" value=4>
		<label for="4-stars">★</label>
		<input type="radio" id="3-stars" name="reviewStar" value=3>
		<label for="3-stars">★</label>
		<input type="radio" id="2-stars" name="reviewStar" value=2>
		<label for="2-stars">★</label>
		<input type="radio" id="1-star" name="reviewStar" value=1>
		<label for="1-star">★</label>
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
		<input type="file" name="attachment">
	</div>
	
	<div class="row center">
	    <button type="submit" class="btn btn-positive">작성완료</button>
	</div>
	
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
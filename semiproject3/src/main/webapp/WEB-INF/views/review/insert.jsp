<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>상품리뷰</h3>

상품은 만족하셨나요?<br>
1점<input name="reviewStar" type="radio" value=1>
2점<input name="reviewStar" type="radio" value=2>
3점<input name="reviewStar" type="radio" value=3>
4점<input name="reviewStar" type="radio" value=4>
5점<input name="reviewStar" type="radio" value=5>
<br><br>
빠르게 배송이되었나요?<br>
느려요<input name="reviewShipping" type="radio">
적당해요<input name="reviewShipping" type="radio">
빨라요<input name="reviewShipping" type="radio">
<br><br>
포장은 잘되었나요?<br>
별로예요<input name="reviewPackaging" type="radio">
적당해요<input name="reviewPackaging" type="radio">
꼼꼼해요<input name="reviewPackaging" type="radio">
<br><br>
어떤 점이 좋았나요?<br>
<textarea name="reviwContent"></textarea>
</body>
</html>
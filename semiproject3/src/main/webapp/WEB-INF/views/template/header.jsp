<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>
	<c:choose>
		<c:when test="${param.title != null}">
			${param.title}
		</c:when>
		<c:otherwise>
			semi3조
		</c:otherwise>
	</c:choose>
</title>

<!-- 글꼴 cdn -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">

<!-- 디자인 틀 -->
<link rel="stylesheet" type="text/css" href="/css/reset.css">
<link rel="stylesheet" type="text/css" href="/css/commons.css">
<link rel="stylesheet" type="text/css" href="/css/layout.css">

<!-- 틀 선 디자인할 때 주석 풀기 -->
<!-- <link rel="stylesheet" type="text/css" href="/css/test.css"> -->

<!-- 아이콘 cdn -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>

<!-- jQuery -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
<script src="http://code.jquery.com/jquery-3.6.1.js"></script>
<!-- 배포 시 min 버전으로 -->
<!-- <script src="http://code.jquery.com/jquery-3.6.1.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>

<style>
	.input.find{
	    padding-left: 2em;
		background-image: url("./image/search.webp");
	    background-size: 1em;
	    background-repeat: no-repeat;
	    background-position-x: 0.5em;
	    background-position-y: center;
	}
	
	li.cart{
		width: 50px;
		padding-right: 20px;
	}
</style>

</head>

<body>

<header>
	<h2 class="logo">
		<a href="/">Logo</a>
	</h2>
</header>

<!-- 드롭다운 메뉴 -->
<nav>
<div class="float-container">
<ul class="dropdown-menu">
	<!-- 좌측 드롭다운 메뉴 -->
	<li class="float-left"><a href="#">BEST</a></li>
	<li class="float-left"><a href="#">New 5%</a></li>
	<li class="float-left">
		<a href="#">outer</a>
		<ul>
			<li><a href="#">자켓</a></li>
			<li><a href="#">코트</a></li>
			<li><a href="#">가디건</a></li>
			<li><a href="#">패딩</a></li>
		</ul>
	</li>
	<li class="float-left">
		<a href="#">top</a>
		<ul>
			<li><a href="#">민소매</a></li>
			<li><a href="#">티셔츠</a></li>
			<li><a href="#">맨투맨</a></li>
			<li><a href="#">니트</a></li>
			<li><a href="#">블라우스</a></li>
		</ul>
	</li>
	<li class="float-left">
		<a href="#">pants</a>
		<ul>
			<li><a href="#">청바지</a></li>
			<li><a href="#">면바지</a></li>
			<li><a href="#">슬랙스</a></li>
		</ul>
	</li>
	<li class="float-left">
		<a href="#">skirt</a>
		<ul>
			<li><a href="#">숏치마</a></li>
			<li><a href="#">롱치마</a></li>
		</ul>
	</li>
	<li class="float-left"><a href="#">dress</a></li>
	<li class="float-left">
		<a href="#">acc</a>
		<ul>
			<li><a href="#">쥬얼리</a></li>
			<li><a href="#">모자</a></li>
			<li><a href="#">가방</a></li>
			<li><a href="#">신발</a></li>
			<li><a href="#">양말</a></li>
		</ul>
	</li>
	<!-- 우측 드롭다운 메뉴 : 순서 반대로 구현 -->
	<li class="float-right cart"><a href="#"><i class="fa-solid fa-cart-shopping"></i></a></li>
	<form action="#" method="get">
		<button class="float-right btn btn-neutral" type="submit">search</button>
		<input class="float-right input input-underline find" name="#" id="search" placeholder="가을 신상">
	</form>
		<li class="float-right"><a href="#">MYPAGE</a></li>
	<c:choose>
		<c:when test="${loginId == null}">
			<li class="float-right"><a href="#">LOGIN</a></li>
			<li class="float-right"><a href="#">JOIN US</a></li>
		</c:when>
		<c:otherwise>
			<li class="float-right"><a href="#">LOGOUT</a></li>
		</c:otherwise>
	</c:choose>
</ul>
</div>
</nav>

<main>
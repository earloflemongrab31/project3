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

</head>

<body>

<header>
	<h2 class="logo">
		<a href="/">Logo</a>
		<a href="customer/login">로그인</a>
	</h2>
</header>
<nav>
</nav>

<main>
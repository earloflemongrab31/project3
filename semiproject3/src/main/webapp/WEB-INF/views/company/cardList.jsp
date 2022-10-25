<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2>명함리스트</h2>
<c:forEach var="cardDto" items="${list}">
<a href="download?cardNo=${cardDto.cardNo}">

<img src="download?cardNo=${cardDto.cardNo}">
	${cardDto.cardName}
	</a><br>
</c:forEach>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3조 세미프로젝트 방문을 환영합니다.</title>
</head>
<body>
	<a href="research/insert">리서치페이지</a>
	(아이디 : ${loginId})
</body>
</html>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="메인페이지" name="title"/>
</jsp:include>

<!-- 사진 넣고 지우기 -->
<div class="center" style="background-color:#ede8e4; min-height:400px">
	<h1 style="margin:0;"></h1>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

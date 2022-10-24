<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>비밀번호 변경페이지</h1><br>
<form action="changePassword" method="post">
	
	<label>아이디 입력</label><br>
	<input type="text" name="customerId"><br><br>
	
	<label>비밀번호 입력</label><br>
	<input type="password" name="customerPw"><br><br>
	
	<button type="submit">확인</button>
</form>
</body>
</html>
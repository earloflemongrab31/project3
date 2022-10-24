<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h2>고객사 정보입력</h2>
<form action="insert" method="post">
회사이름 :<input name="companyName"><br>
회사 전화번호 : <input name="companyNumber"><br>
회사 주소 : <input name="companyAddress"><br>
직원 이름 :<input name="customerName"><br>
직원 직책 : <input name="customerRank"><br>
직원 전화번호 : <input name="customerNumber"><br>
특이사항 :<input name="companyExplan"><br>
<button type="submit">입력</button>
</form>
</body>
</html>
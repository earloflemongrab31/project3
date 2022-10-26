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
<form action="insert" method="post" enctype="multipart/form-data">
회사이름 :<input name="companyName" placeholder="회사이름" autocomplete="off" required><br>
회사 전화번호 : <input name="companyNumber" placeholder="회사 전화번호" autocomplete="off"><br>
회사 주소 : <input name="companyAddress" placeholder="회사 주소" autocomplete="off"><br>
직원 이름 :<input name="customerName" placeholder="직원 이름" autocomplete="off"><br>
직원 직책 : <input name="customerRank" placeholder="직원 직책" autocomplete="off"><br>
직원 전화번호 : <input name="customerNumber" placeholder="직원 전화번호" autocomplete="off"><br>
특이사항 :<input name="companyExplan" placeholder="특이사항" autocomplete="off"><br>
명함사진 :<input type="file" name="card" placeholder="명함사진" autocomplete="off"><br>
<button class="btn btn-positive" type="submit">입력</button>
</form>
</body>
</html>
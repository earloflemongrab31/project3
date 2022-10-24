<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>수정페이지</h1>
	<form action="update" method="post">
	회사번호(히든) : <input name="companyNo" value="${companyDto.companyNo}"><br>
	회사이름 : <input name="companyName" value="${companyDto.companyName}"> <br>
	회사전화번호 :<input name="companyNumber" value="${companyDto.companyNumber}"> <br>
	회사주소 : <input name="companyAddress" value="${companyDto.companyAddress}"><br>
	관리자 이름 : <input name="customerName" value="${companyDto.customerName}"><br>
	관리자 직급 : <input name="customerRank" value="${companyDto.customerRank}"><br>
	관리자 전화번호 :<input name="customerNumber" value="${companyDto.customerNumber}"><br>
	특이사항 : <input name="companyExplan" value="${companyDto.companyExplan}"><br>
	<button type="submit">수정</button>
	</form>
	<a href="list"><button>목록</button></a>
</body>
</html>
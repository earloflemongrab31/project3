<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>디테일페이지</h1>
	회사이름 : ${companyDto.companyName} <br>
	회사전화번호 : ${companyDto.companyNumber}<br>
	회사주소 : ${companyDto.companyAddress}<br>
	관리자 이름 : ${companyDto.customerName}<br>
	관리자 직급 : ${companyDto.customerRank}<br>
	관리자 전화번호 :${companyDto.customerNumber}<br>
	특이사항 : ${companyDto.companyExplan}<br>
	<a href="update?companyNo=${companyDto.companyNo}"><button>수정</button></a>
	<a href="delete?companyNo=${companyDto.companyNo}"><button>삭제</button></a>
	<a href="list"><button>목록</button></a>
</body>
</html>
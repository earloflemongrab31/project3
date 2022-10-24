<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
전체 리스트페이지

	<table>
		<thead>
			<tr>
				<th>회사 이름</th>
				<th>회사 전화번호</th>
				<th>회사 주소</th>
				<th>관리자 이름</th>
				<th>관리자 직급</th>
				<th>관리자 전화번호</th>
				<th>특이사항</th>
				<th>수정/삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list"  items="${list}">
				<tr>
					<td>${list.companyName}</td>
					<td>${list.companyNumber}</td>
					<td>${list.companyAddress}</td>
					<td>${list.customerName}</td>
					<td>${list.customerRank}</td>
					<td>${list.customerNumber}</td>
					<td>${list.companyExplan}</td>
					<td>
						<a href="update?companyNo=${list.companyNo}"><button>수정</button></a>
						<a href="delete?companyNo=${list.companyNo}"><button>삭제</button></a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>
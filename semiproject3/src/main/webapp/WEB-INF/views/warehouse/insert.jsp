<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>입/출고 관리 시스템</h1>
<form action="insert" method="post">
<table>
	<thead>
		<tr>
			<th>카테고리</th>
			<th>상품명</th>
			<th>상품사이즈</th>
			<th>상품색상</th>
			<th>입고/출고</th>
			<th>날짜</th>
			<th>회사명(이름)</th>
			<th>전화번호</th>
			<th>상품상태</th>
			<th>수량</th>
		</tr>
	</thead>
	<tbody>
		<input name="itemNo" value="${itemList.itemNo}" hidden>
		<tr>
			<td><input name="itemCate" value="${itemList.cateCode}" readonly></td>
			<td><input name="itemName" value="${itemList.itemName}" readonly></td>
			<td><input name="itemSize" value="${itemList.itemSize}" readonly></td>
			<td><input name="itemColor" value="${itemList.itemColor}" readonly></td>
			<td>
				<select name="invenInout">
					<option value="입고">입고</option>
					<option value="출고">출고</option>
				</select>
			</td>
			<td>
				<input name="invenDate" type="date">
			</td>
			<td>
				<input name="invenName" type="text">
			</td>
			<td>
				<input name="invenPhone"type="text">
			</td>
			<td>
				<select name="invenStatus">
					<option value="입고예정">입고예정</option>
					<option value="출고예정">출고예정</option>
					<option value="입고완료">입고완료</option>
					<option value="출고완료">출고완료</option>
				</select>
			</td>
			<td><input name="invenQuantity" type="number"></td>
			<td><button type="submit">확인</button></td>
		</tr>
	</tbody>
</table>
</form>

</body>
</html>
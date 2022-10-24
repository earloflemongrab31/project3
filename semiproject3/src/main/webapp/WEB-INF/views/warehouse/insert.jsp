<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="재고등록" name="title"/>
</jsp:include>

<form action="insert" method="post">

	<div class ="container-900 mt-50 mb-50">
        
        <div class="row center mb-30">
            <h1>입/출고 관리 시스템</h1>
            <hr>
        </div>
    
          
        <div class="row">
            <h2>상품 정보</h2>
        </div>

        <div class ="row">
        <input name="itemNo" value="${itemList.itemNo}" type="hidden">
        <table class="table table-border">
	        <thead>
	            <tr>
                    <th>카테고리</th>
                    <th>상품명</th>
                    <th>상품사이즈</th>
                    <th>상품색상</th>
                </tr>
            </thead>
        
        <tbody>
                <tr>
                    <td><input class="input w-100 input-none center" name="itemCate" 
                    	value="${itemList.cateCode}" readonly></td>
                    <td><input class="input w-100 input-none center" name="itemName" 
                     	value="${itemList.itemName}" readonly></td>
                    <td><input class="input w-100 input-none center" name="itemSize" 
                    	value="${itemList.itemSize}" readonly></td>
                    <td><input class="input w-100 input-none center" name="itemColor" 
                    	value="${itemList.itemColor}" readonly></td>
                </tr>
            </tbody>
        </table>
        </div>

        <div class="row mt-30">
            <h2>입 / 출고 등록</h2>
        </div>

        <div class ="row">
            <table class="table table-border">
                <thead>
                <tr>
                    <th>입고/출고</th>
                    <th>날짜</th>
                    <th>회사명(이름)</th>
                    <th>전화번호</th>
                    <th>상품상태</th>
                    <th>수량</th>
                </tr>
                </thead>

                <tbody align="center">
                <tr>
                    <td>
                        <select class="input w-100" name="invenInout">
                            <option value="입고">입고</option>
                            <option value="출고">출고</option>
                        </select>
                    </td>
                            <td>
                                <input class="input w-100" name="invenDate" type="date">
                            </td>
                            <td>
                                <input class="input w-100" name="invenName" type="text">
                            </td>
                            <td>
                                <input class="input w-100" name="invenPhone"type="text">
                            </td>
                            <td>
                                <select class="input w-100" name="invenStatus">
                                    <option value="입고예정">입고예정</option>
                                    <option value="출고예정">출고예정</option>
                                    <option value="입고완료">입고완료</option>
                                    <option value="출고완료">출고완료</option>
                                </select>
                            </td>
                            <td><input class="input w-100" name="invenQuantity" type="number"></td>
                        </tr>
                    </tbody>
                </table>
                </div>
                
			<div class="row center mt-30">
				<button class="btn btn-positive" type="submit">등록</button>
			</div>

 	
<div class="row">
    <button class="btn btn-neutral btn-corp" type="button">
        협력사 리스트 <i class="fa-solid fa-chevron-right"></i>
    </button>
</div> 	

<!--고객 관리 테이블   -->
    <div class="row corp-list">
	    <div class="row">
	        <h2>협력사 리스트</h2>
	    </div>
	</div>
    <div class="row">
    <table class="table table-border">
            <thead>
                <tr>
                    <th>회사명</th>
                    <th>전화번호</th>
                    <th>주소</th>
                    <th>관리자 이름</th>
                    <th>관리자 직급</th>
                    <th>관리자 전화번호</th>
                    <th>특이사항</th>
                    <th>수정/삭제</th>
                </tr>
            </thead>
            <tbody>
				<c:forEach var="list"  items="${companyList}">
				<tr>
					<td>${list.companyName}</td>
					<td>${list.companyNumber}</td>
					<td>${list.companyAddress}</td>
					<td>${list.customerName}</td>
					<td>${list.customerRank}</td>
					<td>${list.customerNumber}</td>
					<td>${list.companyExplan}</td>
                        <td>
                            <a href="/company/update?companyNo=${list.companyNo}">수정</a>
                            <a href="/company/delete?companyNo=${list.companyNo}">삭제</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </div>
    </div>  
</form>
</body>
</html>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
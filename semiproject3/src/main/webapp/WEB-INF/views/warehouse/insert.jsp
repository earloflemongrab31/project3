<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="재고등록" name="title"/>
</jsp:include>


        
      <form action="insert" method="post">

    <div class ="container-900 mt-40 mb-40">
        
        <div class="row">
            <h1>입/출고 관리 시스템</h1>
            <hr>
        </div>
    
          
        <div class="row">
            <h2>상품 정보</h2>
            <hr>
        </div>

        <div class ="row">
         <table class="table table-border">
                 <thead>
                    <tr>
                    <th>카테고리</th>
                    <th>상품명</th>
                    <th>상품사이즈</th>
                    <th>상품색상</th>
                    <th>입고/출고</th>
                </tr>
                
            </thead>
        
        <tbody align="center">
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
                </tr>
            </tbody>
        </table>
        </div>

        <div class="row">
            <h2>입 / 출고 등록</h2>
            <hr>
        </div>

        <div class ="row">
            <table class="table table-border">
                <thead>
                    <th>날짜</th>
                    <th>회사명(이름)</th>
                    <th>전화번호</th>
                    <th>상품상태</th>
                    <th>수량</th>
                    <th>비고</th>
                </thead>

                <tbody align="center">
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
                            <td><button type="submit">등록</button></td>
                        </tr>
                    </tbody>
                </table>
                </div>

    </div>
    
  </form>
 	
 	
 	
 <!--고객 관리 테이블   -->
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
						<a href="/company/update?companyNo=${list.companyNo}"><button>수정</button></a>
						<a href="/company/delete?companyNo=${list.companyNo}"><button>삭제</button></a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
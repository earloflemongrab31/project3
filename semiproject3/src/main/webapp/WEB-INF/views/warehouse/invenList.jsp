<%@ page language="java" contentType="text/html; charset=UTF-8" 
      pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
   <jsp:param value="입출고 상태 페이지" name="title"/>
</jsp:include>

<div class ="container-900 mt-40 mb-40">
        
        <div class="row">
            <h1>상품 입/출고 기록</h1>
            <hr>
        </div>

 
 <div class ="row center">
         <table class="table table-border table-hover"  >
           <thead>
       <tr>
          <th>카테고리</th>
          <th>상품명</th>
          <th>상품사이즈</th>
          <th>상품색상</th>
          <th>입고/출고</th>
          <th>날짜</th>
          <th>회사명</th>
          <th>전화번호</th>
          <th>상품상태</th>
          <th>수량</th>
       </tr>
    </thead>
    <tbody>
       <c:forEach var="invenList" items="${invenList}">
          <tr>
             <td>${invenList.itemCate}</td>
             <td>${invenList.itemName}</td>
             <td>${invenList.itemSize}</td>
             <td>${invenList.itemColor}</td>
             <td>${invenList.invenInout}</td>
             <td>${invenList.invenDate}</td>
             <td>${invenList.invenName}</td>
             <td>${invenList.invenPhone}</td>
             <td>${invenList.invenStatus}</td>
             <td>${invenList.invenQuantity}</td>
          </tr>
       </c:forEach>
    </tbody>
 </table>
 </div>
 

 <div class="row right">
 <a class="btn btn-positive" href="itemList">입/출고 목록 </a>
      </div>
</div>

  
  
</body>
</html>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
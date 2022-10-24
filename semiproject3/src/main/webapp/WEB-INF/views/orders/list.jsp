<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="주문 목록" name="title"/>
</jsp:include>

    <div class ="container-900 mt-40 mb-40">
        
        <div class="row">
            <h1>주문 목록</h1>
            <hr>
        </div>
    
        <div class ="row center">
         	<table class="table table-border table-hover"  >
          		<thead>
 					<tr>
 						<th>회원아이디</th>
 						<th>회원아이디</th>
				 		<th>상품번호</th>
				 		<th>주소번호</th>
				 		<th>상품명</th>
				 		<th>가격</th>
				 		<th>색상</th>
				 		<th>크기</th>
				 		<th>주문수량</th>
				 		<th>주문날짜</th>
				 		<th>배송료</th>
				 		<th>휴대폰번호</th>
				 		<th>등록</th>
				 		
 					</tr>
 				</thead>
        
        <table class="table table-border table-hover" >
        	<thead>
        		<tr>
        		
        	
         		</tr>
         		</thead>
        </table>
           		<tbody>
				 <c:forEach var="orders" items="${orders}">
				 		<tr>
							<td>?</td>
							<td>?</td>
							<td>?</td>
							<td>?</td>
							<td>?</td>
							<td>?</td>
								<button class="btn btn-positive">주문  목록</button></a>
							</td>
						</tr> 	
 					</c:forEach>
 				</tbody>
       		</table>
        </div>
    </div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>


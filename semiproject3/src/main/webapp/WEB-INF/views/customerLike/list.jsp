<%@ page language="java" contentType="text/html; charset=UTF-8" 
      pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   

<jsp:include page="/WEB-INF/views/template/customerHeader.jsp">
    <jsp:param value="내가 찜한 상품" name="title"/>
</jsp:include>

<div class ="container-800 mt-40 mb-40">
   <div class = "row center">
      <h1>찜한 상품 목록</h1>
      <hr>
   </div>
   
	<div class="row center">
		<c:choose>
			<c:when test="${list.isEmpty()}">
				<h4 style="padding-left:20px">
				  찜한 상품이 없습니다.
				</h4>
			</c:when>
			<c:otherwise>
				<table class="table table-border table-hover">
					<thead>
				 <tr>
	               <th width="10%">상품 번호</th>
	               <th width="10%">찜한 시간</th>
	               <th width="10%">찜한 상품 확인</th>
	            </tr>
	         </thead>
	            
	         <tbody align="center">
	            <c:forEach var="customerLikeDto" items="${list}">
	               <tr>
	                  <td>
	                 	 ${customerLikeDto.itemNo}
	                  </td>
	                  <td>${customerLikeDto.likeTime}</td>
	                  <td>
	                   	<a href="http://localhost:8888/item/buydetail?itemNo=${customerLikeDto.itemNo}">확인</a>
	                  </td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:otherwise>
	</c:choose>
	</div>


</div>

<jsp:include page="/WEB-INF/views/template/customerFooter.jsp"></jsp:include>

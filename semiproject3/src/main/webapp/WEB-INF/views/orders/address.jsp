<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="주문 상품 배송지" name="title"/>
</jsp:include>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div class ="container-800 mt-40 mb-40">

   <div class = "row ">
       <h3>기본 배송지</h3>
      <hr>
     </div>
  
	<div class="row left">
		<c:choose>
			<c:when test="${listBasic.isEmpty()}">
				<h4 style="padding-left:20px">
				 등록된 기본 배송지가 없습니다.
				</h4>
			</c:when>
			<c:otherwise>
				<table class="table table-border">
					<thead>
				 <tr>
	               <th>번호</th>
	               <th width="20%">배송지명</th>
	               <th width="10%">우편번호</th>
	               <th width="35%">기본주소</th>
	               <th width="25%">상세주소</th>
	            </tr>
	         </thead>
	            
	         <tbody align="center">
	            <c:forEach var="addressDto" items="${listBasic}">
	               <tr>
	                  <td>${addressDto.addressNo}</td>
	                  <td>${addressDto.addressName}</td>
	                  <td>${addressDto.addressPost}</td>
	                  <td>${addressDto.addressHost}</td>
	                  <td>${addressDto.addressDetailHost}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:otherwise>
		</c:choose>
      </div>
      

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="주문 상품 등록" name="title"/>
</jsp:include>

<div class ="container-800 mt-40 mb-40">

    <div class = "row ">
      <h3>기본 배송지</h3>
      <hr>
      </div>
      
      <div class = "row">
        <table class="table table-hover table-border">
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
	            <c:forEach var="addressDto" items="${listBaisc}">
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
	      
		  <div class="row right">
     	 <input type="button" onclick="add()";  class="btn btn-positive"  value="기본배송지 변경하러 가기" />
   		</div>

   		</div>
   		</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
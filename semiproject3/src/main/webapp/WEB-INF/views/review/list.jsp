<%@ page language="java" contentType="text/html; charset=UTF-8" 
      pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<jsp:include page="/WEB-INF/views/template/customerHeader.jsp">
    <jsp:param value="내 리뷰 목록" name="title"/>
</jsp:include>


<div class ="container-800 mt-40 mb-40">
   <div class = "row center">
      <h1>내 리뷰목록</h1>
      <hr>
   </div>

  
	<div class="row left">
		<c:choose>
			<c:when test="${list.isEmpty()}">
				<h4 style="padding-left:20px">
			    작성한 리뷰가 없습니다.
				</h4>
			</c:when>
			<c:otherwise>
				<table class="table table-border">
					<thead>
				 <tr>
	               <th >테스트</th>
	            </tr>
	         </thead>
	            
	         <tbody align="center">
	            <c:forEach var="reviewDto" items="${list}" >
	               <tr>
	                <td>${reviewDto.reviewNo}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:otherwise>
		</c:choose>
      </div>

	</div>

<jsp:include page="/WEB-INF/views/template/customerFooter.jsp"></jsp:include>

	
<%@ page language="java" contentType="text/html; charset=UTF-8" 
      pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
   <jsp:param value="신고 목록 페이지" name="title"/>
</jsp:include>

<div class ="container-900 mt-50 mb-50">
        
<div class="row center">
	<h1>신고 목록</h1>
	<hr>
</div>

<div class="row center">
<form action="reportList" method="get">

</form>
</div>
<div class ="row center">
        <table class="table table-border" >
          <thead>
      <tr>
      	<th>신고번호</th>
         <th>회원아이디</th>
         <th>신고내용</th>
       	<th>신고날짜</th>
      </tr>
   </thead>
   <tbody>
      <c:forEach var="reportList" items="${reportList}">
         <tr>
         	<td>${reportList.reportNo}</td>
            <td>${reportList.customerId}</td>
            <td>${reportList.reviewContent}</td>
            <td>${reportList.reportDate}</td>
         </tr>
      </c:forEach>
   </tbody>
</table>
</div>
			
	</div>

	<div class="row center">
	    <a href="/">홈으로 이동</a>
	</div>
	
    
    
    
    
    
  <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>  
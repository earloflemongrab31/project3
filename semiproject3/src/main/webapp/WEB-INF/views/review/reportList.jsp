<%@ page language="java" contentType="text/html; charset=UTF-8" 
      pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
   <jsp:param value="신고 목록 페이지" name="title"/>
</jsp:include>

<div class ="container-1200">
        
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
      	<th>번호</th>
         <th>신고자아이디</th>
         <th>이유</th>
       	<th>내용</th>
       	<th>리뷰자아이디</th>
       	<th>리뷰내용</th>
      </tr>
   </thead>
   <tbody>
      <c:forEach var="reportList" items="${reportList}">
         <tr>
         	<td>${reportList.reportNo}</td>
            <td>${reportList.who}</td>
            <td>${reportList.reportRadio}</td>
            <td>${reportList.reportContent}</td>
            <td>${reportList.customerId}</td>
            <td>${reportList.reviewContent}</td>
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
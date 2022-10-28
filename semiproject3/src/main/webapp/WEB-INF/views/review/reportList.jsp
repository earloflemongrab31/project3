<%@ page language="java" contentType="text/html; charset=UTF-8" 
      pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
   <jsp:param value="신고 목록 페이지" name="title"/>
</jsp:include>

<div class ="container-1000">
        
<div class="row center">
	<h1>리뷰 신고 목록</h1>
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
	

<!-- 검색창 -->
<form action = "reportList" method="get" >
	<div class="row center">
	    <a href="/">홈으로 이동</a>
		<input type="hidden" name="size" value="${vo.size}">
		<select class="input" name="type" required>
		<option value="report_no" selected <c:if test="${vo.type == 'report_no'}"></c:if>>번호</option>
		<option value="who" selected <c:if test="${vo.type == 'who'}"></c:if>>신고자아이디</option>
		</select>

		<input class="input" name="keyword" type="search" placeholder="검색어" required="required" value="${param.keyword}">
		<button class="btn btn-positive">검색</button>
	</div>
	
</form>

<div class="row center">
	    <a href="/">홈으로 이동</a>
</div>
	
	
<!-- 페이징 처리 -->
<ul class="pagination">
<li>
	<c:choose>
		<c:when test="${not vo.isFirst()}">
			<a href="reportList?p=${vo.firstBlock()}&${vo.parameter()}">
				<i class="fa-solid fa-angles-left"></i>
			</a>
		</c:when>
		<c:otherwise>
			<a href="#"><i class="fa-solid fa-angles-left"></i></a>
		</c:otherwise>
	</c:choose>
</li>

<!-- 이전을 누르면 이전 구간의 마지막 페이지로 안내 -->
<li>
	<c:choose>
		<c:when test="${vo.hasPrev()}">
			<a href="reportList?p=${vo.prevBlock()}&${vo.parameter()}">
				<i class="fa-solid fa-chevron-left"></i>
			</a>
		</c:when>
		<c:otherwise>
			<a href="#"><i class="fa-solid fa-chevron-left"></i></a>
		</c:otherwise>
	</c:choose>
</li>
 
<c:forEach var="i" begin="${vo.startBlock()}" end="${vo.endBlock()}" step="1">
	<li <c:if test="${i==param.p}">class="on"</c:if>><a href="reportList?p=${i}&${vo.parameter()}">${i}</a></li>
</c:forEach>

<!-- 다음을 누르면 다음 구간의 첫 페이지로 안내 -->
<li>
	<c:choose>
		<c:when test="${vo.hasNext()}">
			<a href="reportList?p=${vo.nextBlock()}&${vo.parameter()}">
				<i class="fa-solid fa-chevron-right"></i>
			</a>
		</c:when>
		<c:otherwise>
			<a href="#"><i class="fa-solid fa-chevron-right"></i></a>
		</c:otherwise>
	</c:choose>
</li>

<li>
	<c:choose>
		<c:when test="${not vo.isLast()}">
			<a href="reportList?p=${vo.lastBlock()}&${vo.parameter()}">
				<i class="fa-solid fa-angles-right"></i>
			</a>
		</c:when>
		<c:otherwise>
			<a href="#"><i class="fa-solid fa-angles-right"></i></a>
		</c:otherwise>
	</c:choose>
</li>
</ul>		
    
    
    
    
    
  <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>  
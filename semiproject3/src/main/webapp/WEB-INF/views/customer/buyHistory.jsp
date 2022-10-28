<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/customerHeader.jsp">
	<jsp:param value="주문/배송조회" name="title"/>
</jsp:include>

${buyList}

<div class="container-550">

<div class="row center">
	<h1>주문/배송 조회</h1>
</div>
	
</div>

<jsp:include page="/WEB-INF/views/template/customerFooter.jsp"></jsp:include>
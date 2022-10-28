<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="관리자페이지" name="title"/>
</jsp:include>

<div class="container-600 mt-50 mb-50">

<div class="row center">
${buyDto}
</div>

</div>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>
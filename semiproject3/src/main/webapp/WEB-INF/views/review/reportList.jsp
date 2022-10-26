<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="신고 목록 페이지" name="title" />
</jsp:include>
    
 <style>
        .danger {
            color:red;
        }
 </style>

 <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <script type="text/javascript">
        $(function(){
         
            $(".q1-input").on("input", function(){
                var text = $(this).val();

                $(this).next().text(text.length);

                if(text.length > 1000){
                    $(this).next().addClass("danger");
                }
                else {
                    $(this).next().removeClass("danger"); 
                }
            });
        });
    </script>
    
<form action="reportList" method="post">

	<div class="container-500 mt-50">
		<div class="row center mb-50">
			<h1>신고 목록 페이지</h1>
	   		  <hr>
		</div>
		
		
	</div>

	<div class="row center">
	    <a href="/">홈으로 이동</a>
	</div>
	
	</form>    
    
    
    
    
    
    
  <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="신고페이지" name="title" />
</jsp:include>

 <style>
        .danger {
            color:red;
        }
 </style>
<script>


</script>

 <script src="//code.jquery.com/jquery-3.6.1.js"></script>
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
    
<form action="report" method="post">

	<div class="container-500 mt-50 mb-50">
		<div class="row center mb-30">
			<h1>작성 글 신고하기 </h1>
	   		  <hr>
		</div>
		
		<div class="row">
			<h3>신고대상 ID 및 내용</h3>
		</div>
		<div class="row">
		 <input style="border-bottom:0px;" class="input w-100 w-100 " name="customerId" type="text" value="<c:out value="${fn:substring(review.customerId, 0, fn:length(review.customerId) - 4)}" /> ****" readonly>
		  <%--${review.customerId}  --%>
		  
		
		 <textarea style="border-top:0px;"  class="input w-100 fix-size" rows="10" name="reviewShipping" readonly>${review.reviewContent}</textarea>
		</div>
		
		<div class="row">
			<h3>신고사유</h3>
		</div>
		<div class="row">
			<ul>
				<label>
					<input type="radio" name="reportRadio" value="관련없는 이미지">
					관련없는 이미지
				</label>
		
				<label>
					<input type="radio" name="reportRadio" value="관련없는 내용">
					관련없는 내용
				</label>
		
				<label>
					<input type="radio" name="reportRadio" value="욕설/비방">
					욕설/비방
				</label>
			</ul>
			<ul class="mt-10">
				<label>
					<input type="radio" name="reportRadio" value="광고/홍보글">
					광고/홍보글
				</label>
			
				<label>
					<input type="radio" name="reportRadio" value="개인정보유출">
					개인정보유출
				</label>
			
				<label>
					<input type="radio" name="reportRadio" value="게시글도배">
					게시글도배/비방
				</label>
			</ul>
			<ul class="mt-10">
				<label>
					<input type="radio" name="reportRadio" value="음란/선정성">
					음란/선정성
				</label>
		
				<label>
					<input type="radio" name="reportRadio" value="기타">
					기타
				</label>
			</ul>
			<div class="right">
			<textarea class="input w-100 fix-size mt-10 q1-input"  name="reportContent" placeholder="신고해주신 내용은 관리자 검토 후 내부정책에 의거 조치가 진행됩니다."></textarea>
			 <span class="q1-input-length">0</span> / 1000
			 </div>
	</div>

	<div class="row center">
	    <button type="submit" class="btn btn-positive" >신고</button>
	</div>
	
	</form>
	
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
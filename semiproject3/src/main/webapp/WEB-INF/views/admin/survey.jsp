<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="관리자페이지" name="title"/>
</jsp:include>

<script>
	$(function(){
		$(".btn-preview").click(function(){
			if($("#popup-preview").children().hasClass("hide")){
				$("#popup-preview").children().removeClass("hide");
			}
			else{
				$("#popup-preview").children().addClass("hide");
			}
		});
	});
</script>

<div class="container-600 mt-50 mb-50">
<div class="row center mb-30">
	<h1>이벤트 팝업 수정</h1>
	<hr>
</div>
<form action="survey" method="post" enctype="multipart/form-data">
    <div class="row flexbox">
        <label class="w-50">파일[1300px X 560px]</label>
        <label class="w-50">경로</label>
    </div>
    <div class="row flexbox">
        <input class="input w-50" type="file" name="mainImage">
        <input class="input w-50" type="text" name="imagePath">
    </div>
    <div class="row right">
    	<button type="button" class="btn btn-neutral btn-preview">미리보기</button>
    </div>
   	<div class="w-100 center" id="popup-preview">
   		<img class="w-50 hide" src="${pageContext.request.contextPath}/image/survey.png">
   	</div>
    <div class="row center">
    	<button type="button" class="btn btn-positive">수정하기</button>
    </div>
</form>
</div>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>
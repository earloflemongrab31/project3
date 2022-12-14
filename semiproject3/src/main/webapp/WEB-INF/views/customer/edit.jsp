<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="관리자 회원정보 수정" name="title"/>
</jsp:include>

<script type="text/javascript">
	$(function(){
		$(window).on("beforeunload", function(){
		    return false;
		});
		$(".btn-pass").click(function(){
		    $(window).off("beforeunload");
		    return true;
		});
	
		$("input[name=customerMoney]").blur(function(){
			var changeMoney = $(this).val();
			if(changeMoney < 0){
				$(this).val(0);
			}
		});
		$("input[name=customerPoint]").blur(function(){
			var changeMoney = $(this).val();
			if(changeMoney < 0){
				$(this).val(0);
			}
		});
	});
</script>
<!-- 
	변경이 불가능한 항목에 대한 처리 방법
	[1] 읽기 전용 처리(readonly) - 전송은 됨
	[2] 비활성화 처리(disabled) - 전송도 안됨
	[3] 숨김 처리(type=hidden)
 -->

<form name="edit-form" action="edit" method="post">

<input name="customerId"  type="hidden"  value="${customerDto.customerId}">

<div class="container-300 mt-50 mb-50">
	<div class="row center mb-30">
		<h1>회원 정보 수정</h1>
		<hr>
	</div>
		
	<div class="row left">
		<label>회원 등급</label>
		<select class="input w-100"  name="customerGrade">
			<option <c:if test="${customerDto.customerGrade == '일반'}">selected</c:if> value="일반">일반</option>
			<option <c:if test="${customerDto.customerGrade == 'VIP'}">selected</c:if> value="VIP">VIP</option>
		</select>
	</div>
	
	<div class="row left">
		<label>회원 소지금 충전</label>
		<input class="input w-100" name="customerMoney" value="0">
	</div>

	<div class="row left">
		<label>회원 포인트 충전</label>
		<input class="input w-100" name="customerPoint" value="0">
	</div>
	
	
	<div class="row right">
		<a href="list" class="btn btn-neutral">목록</a>
		<button type="submit" class="btn btn-positive btn-pass">수정</button>	
	</div>
</div>
</form>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>



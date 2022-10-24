<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="비밀번호변경" name="title"/>
</jsp:include>

<form action="changePw" method="post" class="change-pw">
    <div class="container-300 mt-50 mb-50">
    
    <div class="row center mb-30">
        <h1>비밀번호 변경</h1>
    </div>
    
    <input type="hidden" name="loginId" value="${loginId}">

    <div class="row check-pw">
        <div class="row">
            <label>기존 비밀번호 입력
            <input class="input w-100" type="password" name="checkPw">
            <span class="NNNNN-message">입력하신 정보를 확인해주세요.</span>
            </label>
        </div>
        
        <div class="row mt-30">
            <button class="btn btn-neutral w-100 btn-check-pw" type="button">비밀번호 확인</button>
        </div>
    </div>

    <div class="row input-pw">
        <div class="row">
            <label>변경 비밀번호 입력
            <input class="input w-100" type="password" name="customerPw">
            </label>
        </div>
        
        <div class="row">
            <label>변경 비밀번호 확인
            <input class="input w-100" type="password" id="customer-pwcheck">
            </label>
        </div>
            
        <div class="row mt-30">
            <button class="btn btn-positive w-100" type="submit">변경하기</button>
        </div>
    </div>
        
    </div>
    
</form>
    
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
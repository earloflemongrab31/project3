<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="설문조사" name="title"/>
</jsp:include>

<form action="insert" method="post" class="research-form">

	<div class="container-800 mt-50">
	
	<div class="row center mb-50">
	    <h1>고객만족 설문조사</h1>
	</div>
	<div class="row">
	    <input type="hidden" name="researchCustomerId" class="input input-none" value="${loginId}">
	</div>
	<div class="row">
	    <div class="progressbar"><div class="inner"></div></div>
	</div>
	
	<div class="page">
	    <div class="row">
	         <h2>1. 고객님의 성별에 체크해주세요.</h2>
	    </div>
	    <div class="row">
	        <label>
	            <input type="radio" name="researchSex" value="남자">남자
	        </label>
	        <label>
	            <input type="radio" name="researchSex" value="여자">여자
	        </label>
	    </div>
	    <div class="row float-container">
	        <button type="button" class="prev btn btn-neutral btn-border float-left">이전</button>
	        <button type="button" class="next btn btn-neutral btn-border float-right" disabled>다음</button>
	    </div>
	</div>
	<div class="page">
	    <div class="row">
	        <h2>2. 나이를 선택해주세요.</h2>
	    </div>
	    <div class="row">
	        <label>
	            <input type="radio" name="researchAge" value="10대">10대
	        </label>
	        <label>
	            <input type="radio" name="researchAge" value="20대">20대
	        </label>
	        <label>
	            <input type="radio" name="researchAge" value="30대">30대
	        </label>
	        <label>
	            <input type="radio" name="researchAge" value="40대">40대
	        </label>
	        <label>
	            <input type="radio" name="researchAge" value="50대">50대
	        </label>
	    </div>
	    <div class="row float-container">
	        <button type="button" class="prev btn btn-neutral btn-border float-left">이전</button>
	        <button type="button" class="next btn btn-neutral btn-border float-right" disabled>다음</button>
	    </div>
	</div>
	<div class="page">
	    <div class="row">
	        <h2>3. 고객님이 사이트를 알게된 경로를 선택해주세요.</h2>
	    </div>
	    <div class="row">
	        <label>
	            <input type="radio" name="researchPath" value="인터넷광고">인터넷 광고
	        </label>
	        <label>
	            <input type="radio" name="researchPath" value="지인소개">지인소개
	        </label>
	        <label>
	            <input type="radio" name="researchPath" value="신문광고">신문 광고
	        </label>
	        <label>
	            <input type="radio" name="researchPath" value="포털사이트검색">포털사이트 검색
	        </label>
	        <label>
	            <input type="radio" name="researchPath" value="페이스북,인스타그램광고">페이스북, 인스타그램 광고
	        </label>
	    </div>
	    <div class="row float-container">
	        <button type="button" class="prev btn btn-neutral btn-border float-left">이전</button>
	        <button type="button" class="next btn btn-neutral btn-border float-right" disabled>다음</button>
	    </div>
	</div>
	<div class="page">
	    <div class="row">
	        <h2>4. 고객님의 최근 관심있는 물건은 무엇입니까? </h2>
	    </div>
	    <div class="row">
	        <label>
	            <input type="radio" name="researchInterest" value="자켓">자켓  
	        </label>
	        <label>
	            <input type="radio" name="researchInterest" value="바지">바지
	        </label>
	        <label>
	            <input type="radio" name="researchInterest" value="아우터">아우터
	        </label>
	        <label>
	            <input type="radio" name="researchInterest" value="악세사리">악세서리
	        </label>
	        <label>
	            <input type="radio" name="researchInterest" value="원피스">원피스 
	        </label>
	    </div>
	    <div class="row float-container">
	        <button type="button" class="prev btn btn-neutral btn-border float-left">이전</button>
	        <button type="button" class="next btn btn-neutral btn-border float-right" disabled>다음</button>
	    </div>
	</div>
	<div class="page">
	    <div class="row">
	        <h2>5. 고객님의 생각하는 이 쇼핑몰에 장점은 무엇입니까?</h2>
	    </div>
	    <div class="row">
	        <label>
	            <input type="radio" name="researchBest" value="가격">가격
	        </label>
	        <label>
	            <input type="radio" name="researchBest" value="패션">패션
	        </label>
	        <label>
	            <input type="radio" name="researchBest" value="빠른배송">빠른배송
	        </label>
	        <label>
	            <input type="radio" name="researchBest" value="친절한응답">친절한응답
	        </label>
	        <label>
	            <input type="radio" name="researchBest" value="편의성">편의성
	        </label>
	    </div>
	    <div class="row float-container">
	        <button type="button" class="prev btn btn-neutral btn-border float-left">이전</button>
	        <button type="button" class="next btn btn-neutral btn-border float-right" disabled>다음</button>
	    </div>
	</div>
	<div class="page">
	    <div class="row">
	        <h2>6. 쇼핑몰에 만족도를 선택해주세요.</h2>
	    </div>
	    <div class="row">
	        <label>
	            <input type="radio" name="researchSatisfaction" value="매우 만족">매우 만족
	        </label>
	        <label>
	            <input type="radio" name="researchSatisfaction" value="만족">만족
	        </label>
	        <label>
	            <input type="radio" name="researchSatisfaction" value="보통">보통
	        </label>
	        <label>
	            <input type="radio" name="researchSatisfaction" value="불만족">불만족
	        </label>
	        <label>
	            <input type="radio" name="researchSatisfaction" value="매우 불만족">매우 불만족
	        </label>
	    </div>
	    <div class="row float-container">
	        <button type="button" class="prev btn btn-neutral btn-border float-left">이전</button>
	        <button type="button" class="next btn btn-neutral btn-border float-right" disabled>다음</button>
	    </div>
	</div>
	<div class="page">
	    <div class="row">
	        <h2>7. 고객님의 지불방식을 선택해주세요.</h2>
	    </div>
	    <div class="row">
	        <label>
	            <input type="radio" name="researchPayment" value="온라인뱅킹">온라인 뱅킹
	        </label>
	        <label>
	            <input type="radio" name="researchPayment" value="우체국송금">우체국 송금
	        </label>
	        <label>
	            <input type="radio" name="researchPayment" value="계좌이체">계좌이체
	        </label>
	        <label>
	            <input type="radio" name="researchPayment" value="모바일결제 ">모바일 결제
	        </label>
	        <label>
	            <input type="radio" name="researchPayment" value="기타">기타 
	        </label>
	    </div>
	    <div class="row float-container">
	        <button type="button" class="prev btn btn-neutral btn-border float-left">이전</button>
	        <button type="button" class="next btn btn-neutral btn-border float-right" disabled>다음</button>
	    </div>
	</div>
	<div class="page">
	    <div class="row">
	        <h2>8. 고객님의 구매목적은 무엇입니까?</h2>
	           <textarea class="input w-100 fix-size" name="researchPurpose" placeholder="10자 이상 작성"></textarea>
	    </div>
	    <div class="row float-container">
	        <button type="button" class="prev btn btn-neutral btn-border float-left">이전</button>
	        <button type="button" class="next btn btn-neutral btn-border float-right" disabled>다음</button>
	    </div>
	</div>
	<div class="page">
	    <div class="row">
	        <h2>9. 쇼핑몰 이용시 불편사항을 적어주세요.</h2>
	        <textarea class="input w-100 fix-size" name="researchComplain" placeholder="10자 이상 작성"></textarea>
	    </div>
	    <div class="row float-container">
	        <button type="button" class="prev btn btn-neutral btn-border float-left">이전</button>
	        <button type="button" class="next btn btn-neutral btn-border float-right" disabled>다음</button>
	    </div>
	</div>
	<div class="page">
	    <div class="row">
	        <h2>10. 온라인몰 관련 개선사항 등 여러 아이디어를 기술해주세요.</h2>
	        <textarea class="input w-100 fix-size last-answer" name="researchIdea" placeholder="10자 이상 작성"></textarea>
	    </div>
	    <div class="row float-container">
	        <button type="button" class="prev btn btn-neutral btn-border float-left">이전</button>
	        <button type="button" class="next btn btn-neutral btn-border float-right" disabled>다음</button>
	    </div>
	</div>
	<!-- 설문조사 끝나면 활성화시키기 -->
	<div class="row center">
	    <button type="submit" class="btn btn-positive">제출하기</button>
	</div>
	
	</div>
        
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="insert" method="post">

	<input name="ResearchCustomerId" placeholder="hello1234" value="${loginId}" hidden>
	<br>
 	<label>1. 고객님의 성별에 체크해주세요</label>
    <br>
    <input type="radio" name="researchSex" value="남자">남자
    <input type="radio" name="researchSex" value="여자">여자
    <br>
    <label>2. 나이를 선택해주세요</label>
    <br>
    <input type="radio" name="researchAge" value="10대">10대
    <input type="radio" name="researchAge" value="20대">20대
    <input type="radio" name="researchAge" value="30대">30대
    <input type="radio" name="researchAge" value="40대">40대
    <input type="radio" name="researchAge" value="50대">50대
    <br>
    <label>3. 고객님이 사이트를 알게된 경로를 선택해주세요</label>
    <br>
    <input type="radio" name="researchPath" value="인터넷광고">인터넷광고
    <input type="radio" name="researchPath" value="지인소개">지인소개
    <input type="radio" name="researchPath" value="신문광고">신문광고
    <input type="radio" name="researchPath" value="포털사이트검색">포털사이트검색
    <input type="radio" name="researchPath" value="페이스북,인스타그램광고">페이스북,인스타그램광고
    <br>
    <label>4. 고객님의 최근 관심있는 물건은 무엇입니까? </label>
    <br>
    <input type="radio" name="researchInterest" value="자켓">자켓  
    <input type="radio" name="researchInterest" value="바지">바지
    <input type="radio" name="researchInterest" value="아웃터">아웃터
    <input type="radio" name="researchInterest" value="악세사리">악세서리
    <input type="radio" name="researchInterest" value="원피스">원피스 
    <br>
    <label>5. 고객님의 생각하는 이 쇼핑몰에 장점은 무엇입니까?</label>
    <br>
    <input type="radio" name="researchBest" value="가격">가격
    <input type="radio" name="researchBest" value="패션">패션
    <input type="radio" name="researchBest" value="빠른배송">빠른배송
    <input type="radio" name="researchBest" value="친절한응답">친절한응답
    <input type="radio" name="researchBest" value="편의성">편의성
    <br>
    <label>6. 쇼핑몰에 만족도를 선택해주세요</label>
    <br>
    <input type="radio" name="researchSatisfaction" value="매우 만족스럽다.">매우 만족스럽다.
    <input type="radio" name="researchSatisfaction" value="만족스럽다.">만족스럽다.
    <input type="radio" name="researchSatisfaction" value="보통">보통
    <input type="radio" name="researchSatisfaction" value="불만족">불만족
    <input type="radio" name="researchSatisfaction" value="매우 불만족">매우 불만족
    <br>
    <label>7. 고객님의 지불방식을 선택해주세요</label>
    <br>
    <input type="radio" name="researchPayment"value="온라인뱅킹">온라인 뱅킹
    <input type="radio" name="researchPayment" value="우체국송금">우체국 송금
    <input type="radio" name="researchPayment" value="계좌이체">계좌이체
    <input type="radio" name="researchPayment" value="모바일결제 ">모바일 결제
    <input type="radio" name="researchPayment" value="기타">기타 
    <br>
    <label>8. 고객님의 구매목적은 무엇입니까?</label>
    <br>
    <textarea name="researchPurpose"></textarea>
    <br>
    <label>9. 쇼핑몰 이용시 불편사항을 적어주세요</label>
    <br>
    <textarea name="researchComplain"></textarea>
    <br>
    
    <label>10. 온라인몰 관련 개선사항 등 여러 아이디어를 기술해주세요</label>
    <br>
    <textarea name="researchIdea"></textarea>
    <br>
    <button>설문조사참여완료</button>
   </form>
</body>
</html>
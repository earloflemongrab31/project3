<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
	<h1>작성글 신고하기 </h1>

	<form action="report" method="post">
	신고대상 ID 및 내용
	<br>
	아이디 :${review.customerId}
	<br>
	내용 :${review.reviewContent}
	<br>
	신고사유<br>
	<input type="radio" name="reportRadio" value="관련없는 이미지">관련없는 이미지 <br>
	<input type="radio" name="reportRadio" value="관련없는 내용">관련없는 내용<br>
	<input type="radio" name="reportRadio" value="욕설/비방">욕설/비방<br>
	<input type="radio" name="reportRadio" value="광고/홍보글">광고/홍보글<br>
	<input type="radio" name="reportRadio" value="개인정보유출">개인정보유출<br>
	<input type="radio" name="reportRadio" value="게시글도배">게시글도배<br>
	<input type="radio" name="reportRadio" value="음란/선정성">음란/선정성<br>
	<input type="radio" name="reportRadio" value="기타">기타  <br>
	
	<textarea name="reportContent"></textarea>
	<br>
	신고해주신 내용은 관리자 검토 후 내부정책에 의거 조치가 진행됩니다. 
	<br>

	<button type="submit">신고 </button>
	</form>
	
	
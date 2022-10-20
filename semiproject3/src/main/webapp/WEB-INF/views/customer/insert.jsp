<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원가입" name="title"/>
</jsp:include>

<!-- 테이블 폰트 변경해야함 -->
<form action="insert" method="post" autocomplete="off">

	<div class="container-800 mt-50 mb-50">
		<div class="row center mb-50">
			<h1>JOIN US</h1>
		</div>

		<div class="row">
		<table class="table table-slit mb-30">
			<thead>
				<tr>
					<th class="left w-25">기본정보</th>
					<td class="right"><span class="required">*</span>필수입력 사항</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>아이디<span class="required">*</span></td>
					<td>
						<input class="input" type="text" name="customerId" required>
						<button class="btn btn-neutral btn-border" type="button">중복 확인</button>
						<span>(영문 소문자/숫자, 5~20자)</span>
					</td>
				</tr>
				<tr>
					<th>비밀번호<span class="required">*</span></td>
					<td>
						<input class="input" type="password" name="customerPw" required>
						<!-- 마지막에 비밀번호 컬럼 변경할 때 넣을게요~ -->
						<!-- <span>(영문 대소문자/숫자/특수[!@#$], 8~16)</span> -->
					</td>
				</tr>
				<!-- 비밀번호 확인 질문 말고도 다른 방법 있는지 생각해보기 -->	
				<tr>
					<th>비밀번호 확인<span class="required">*</span></td>
					<td>
						<input class="input" type="password" required>
					</td>
				</tr>	
				<tr>
					<th rowspan="2" style="vertical-align:middle">비밀번호 확인 질문<span class="required">*</span></td>
					<td>
						<input type="text" class="input input-none" readonly placeholder="나의 보물 1호는?">
					</td>
				</tr>
				<tr>
					<td>
						<input class="input" type="text" name="customerPwsearch" required placeholder="질문답변">
					</td>
				</tr>
				<tr>
					<th>닉네임<span class="required">*</span></td>
					<td>
						<input class="input" type="text" name="customerNick" required>
					</td>
				</tr>
				<tr>
					<th>이름<span class="required">*</span></td>
					<td>
						<input class="input" type="text" name="customerName" required>
					</td>
				</tr>
				<tr>
					<th>휴대전화<span class="required">*</span></td>
					<td>
						<input class="input" type="tel" name="customerPhone" required maxlength="11">
					</td>
				</tr>
			</tbody>
		</table>


		<table class="table table-slit mb-50">
			<thead>
				<tr>
					<th class="left" colspan="2">추가정보</th>
				</tr>
			</thead>
			<tbody>
				<!-- 달력 변경할 수 있으면 하기 cdn은 넣어놓음 -->
				<tr>
					<th class="w-25">생년월일</td>
					<td>
						<input class="input w-75" type="date" name="customerBirth">
					</td>
				</tr>
				<tr>
					<th>일반전화</td>
					<td>
						<input class="input w-75" type="tel" name="customerTel" maxlength="11">
					</td>
				</tr>
				<tr>
					<th>이메일</td>
					<td>
						<input class="input w-75" type="email" name="customerEmail">
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="row center">
		<button class="btn btn-positive w-25" type="submit">가입하기</button>
	</div>	
	</div>	
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>




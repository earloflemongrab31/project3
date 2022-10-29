<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="관리자 등록" name="title"/>
</jsp:include>

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript"></script>
<!-- 테이블 폰트 변경해야함 -->

<form action="insert" method="post" autocomplete="off">

    <div class="container-800 mt-50 mb-50">
        <div class="row center mb-50">
            <h1>관리자 등록</h1>
            <hr>
        </div>

        <div class="row">
        <table class="table table-slit mb-30">
            <tbody>
                <tr>
                    <th>아이디</th>
                    <td>
                        <input class="input" type="text" name=adminId>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td>
                        <input class="input" type="password" name="adminPw">
                    </td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td>
                        <input class="input" type="text" name="adminName">
                    </td>
                </tr>
                <tr>
                    <th>닉네임</th>
                    <td>
                        <input class="input" type="text" name="adminNick">
                    </td>
                </tr>
            </tbody>
        </table>

    <div class="row center">
        <button class="btn btn-positive w-25" type="submit">등록</button>
    </div>	
    </div>	
</form>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>



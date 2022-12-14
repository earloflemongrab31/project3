<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="관리자페이지" name="title"/>
</jsp:include>

<div class="container-800 mt-50 mb-50">
<div class="row center mb-30">
	<h1>메인페이지 수정</h1>
</div>

<form action="main" method="post" enctype="multipart/form-data">
<div class="row left">
	<h3>내용</h3>
</div>
<div class="row">
	<textarea class="content" name="mainContent"></textarea>
</div>

<div class="image-box">
    <div class="row left">
        <h3>이미지1</h3>
    </div>
    <div class="row flexbox">
        <label class="w-50">파일[1300px X 480px]</label>
        <label class="w-50">경로</label>
    </div>
    <div class="row flexbox">
        <input class="input w-50" type="file" name="mainImage">
        <input class="input w-50" type="text" name="imagePath">
    </div>
    <div class="row right">
        <button type="button" class="btn btn-neutral add-image">+ 추가</button>
    </div>
</div>
<div class="image-box">
    <div class="row left">
        <h3>이미지2</h3>
    </div>
    <div class="row flexbox">
        <label class="w-50">파일[1300px X 480px]</label>
        <label class="w-50">경로</label>
    </div>
    <div class="row flexbox">
        <input class="input w-50" type="file" name="mainImage">
        <input class="input w-50" type="text" name="imagePath">
    </div>
    <div class="row right">
        <button type="button" class="btn btn-neutral add-image">+ 추가</button>
    </div>
</div>
<div class="image-box">
    <div class="row left">
        <h3>이미지3</h3>
    </div>
    <div class="row flexbox">
        <label class="w-50">파일[1300px X 480px]</label>
        <label class="w-50">경로</label>
    </div>
    <div class="row flexbox">
        <input class="input w-50" type="file" name="mainImage">
        <input class="input w-50" type="text" name="imagePath">
    </div>
    <div class="row right">
        <button type="button" class="btn btn-neutral add-image">+ 추가</button>
    </div>
</div>
<div class="image-box">
    <div class="row left">
        <h3>이미지4</h3>
    </div>
    <div class="row flexbox">
        <label class="w-50">파일[1300px X 480px]</label>
        <label class="w-50">경로</label>
    </div>
    <div class="row flexbox">
        <input class="input w-50" type="file" name="mainImage">
        <input class="input w-50" type="text" name="imagePath">
    </div>
    <div class="row right">
        <button type="button" class="btn btn-neutral add-image">+ 추가</button>
    </div>
</div>

<div class="image-box">
    <div class="row left">
        <h3>이미지5</h3>
    </div>
    <div class="row flexbox">
        <label class="w-50">파일[1300px X 480px]</label>
        <label class="w-50">경로</label>
    </div>
    <div class="row flexbox">
        <input class="input w-50" type="file" name="mainImage">
        <input class="input w-50" type="text" name="imagePath">
    </div>
    <div class="row right">
        <button type="button" class="btn btn-neutral add-image">+ 추가</button>
    </div>
</div>

<div class="row center mt-30">
	<button class="btn btn-positive" type="submit">수정</button>
</div>	
</form>

</div>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>
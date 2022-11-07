<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="재고등록" name="title"/>
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
	});
</script>
<form action="insert" method="post">

	<div class ="container-900 mt-50 mb-50">
        
        <div class="row center mb-30">
            <h1>입/출고 관리 시스템</h1>
            <hr>
        </div>
    
          
        <div class="row">
            <h2>상품 정보</h2>
        </div>

        <div class ="row">
        <input name="itemNo" value="${itemDto.itemNo}" type="hidden">
        <table class="table table-border">
	        <thead>
	            <tr>
                    <th width="20%">카테고리</th>
                    <th width="40%">상품명</th>
                    <th>상품사이즈</th>
                    <th>상품색상</th>
                </tr>
            </thead>
        
        <tbody>
                <tr>
                    <td><input class="input w-100 input-none center" name="itemCate" 
                    	value="${itemDto.itemCate}" readonly></td>
                    <td><input class="input w-100 input-none center" name="itemName" 
                     	value="${itemDto.itemName}" readonly></td>
                    <td>
                    	<c:choose>
                    	<c:when test="${itemCntDto.itemSize != null}">
                    		<input class="input input-none w-100 center" type="text" 
                    			name="itemSize" value="${itemCntDto.itemSize}" readonly>
                   		</c:when>
                    	<c:otherwise>
	                   		<select class="input w-100" name="itemSize">
								<option value="">선택</option>
					            <option disabled>------</option>
								<option>XS</option>
								<option>S</option>
								<option>M</option>
								<option>L</option>
								<option>XL</option>
							</select>
                    	</c:otherwise>
						</c:choose>
                    </td>
                    <td>
                    	<c:choose>
                    	<c:when test="${itemCntDto.itemColor != null}">
                    		<input class="input input-none w-100 center" type="text" 
                    			name="itemColor" value="${itemCntDto.itemColor}" readonly>
                    	</c:when>
                    	<c:otherwise>
	                    	<select class="input w-100" name="itemColor">
								<option value="">선택</option>
					            <option disabled>------</option>
								<option>Black</option>
								<option>White</option>
								<option>Blue</option>
								<option>Red</option>
								<option>Beige</option>
							</select>
                    	</c:otherwise>
                    	</c:choose>
					</td>
                </tr>
            </tbody>
        </table>
        </div>

        <div class="row mt-30">
            <h2>입 / 출고 등록</h2>
        </div>

        <div class ="row">
            <table class="table table-border">
                <thead>
                <tr>
                    <th width="10%">입고/출고</th>
                    <th width="15%">날짜</th>
                    <th>회사명(이름)</th>
                    <th>전화번호</th>
                    <th width="15%">상품상태</th>
                    <th width="15%">수량</th>
                </tr>
                </thead>

                <tbody align="center">
                <tr>
                    <td>
                        <select class="input w-100" name="invenInout">
                            <option value="입고">입고</option>
                            <option value="출고">출고</option>
                        </select>
                    </td>
                            <td>
                                <input class="input w-100" name="invenDate" type="date">
                            </td>
                            <td>
                                <input class="input w-100" name="invenName" type="text">
                            </td>
                            <td>
                                <input class="input w-100" name="invenPhone"type="text" maxlength="11">
                            </td>
                            <td>
                                <select class="input w-100" name="invenStatus">
                                    <option value="입고예정">입고예정</option>
                                    <option value="출고예정">출고예정</option>
                                    <option value="입고완료">입고완료</option>
                                    <option value="출고완료">출고완료</option>
                                </select>
                            </td>
                            <td><input class="input w-100" name="invenQuantity" type="number"></td>
                        </tr>
                    </tbody>
                </table>
                </div>
                
			<div class="row center mt-30">
				<button class="btn btn-positive btn-pass" type="submit">등록</button>
			</div>

 	
<div class="row">
    <button class="btn btn-neutral btn-corp" type="button">
        협력사 리스트 <i class="fa-solid fa-chevron-right"></i>
    </button>
</div> 	

<!--고객 관리 테이블   -->
    <div class="row corp-list">
	    
	     
    <div class="row">
    <table class="table table-border">
            <thead>
                <tr>
                    <th>회사명</th>
                    <th>전화번호</th>
                    <th>주소</th>
                    <th>관리자 이름</th>
                    <th>관리자 직급</th>
                    <th>관리자 전화번호</th>
                    <th>특이사항</th>
                    <th>수정/삭제</th>
                </tr>
            </thead>
            <tbody>
				<c:forEach var="list"  items="${companyList}">
				<tr>
					<td>${list.companyName}</td>
					<td>${list.companyNumber}</td>
					<td>${list.companyAddress}</td>
					<td>${list.customerName}</td>
					<td>${list.customerRank}</td>
					<td>${list.customerNumber}</td>
					<td>${list.companyExplan}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/company/update?companyNo=${list.companyNo}">수정</a>
                            <a href="${pageContext.request.contextPath}/company/delete?companyNo=${list.companyNo}">삭제</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </div>
        <div class="row right">
	       <a class="btn btn-positive btn-pass" href="${pageContext.request.contextPath}/company/insert">등록</a>
	    </div>
	</div>
    </div>  
</form>
</body>
</html>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
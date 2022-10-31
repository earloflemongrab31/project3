<%@ page language="java" contentType="text/html; charset=UTF-8" 
      pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<jsp:include page="/WEB-INF/views/template/customerHeader.jsp">
    <jsp:param value="주소목록" name="title"/>
</jsp:include>

<script src="/confirm-link.js"></script> 
<script src="/checkbox.js"></script> 

<div class ="container-800 mt-50 mb-50">
   <div class = "row center mb-30">
      <h1>ADDRESS</h1>
      <hr>
   </div>

   <div class="row right">
		  <a class="btn btn-positive" href="insert">새주소 등록</a>
	</div>
   
 
  <div class = "row ">
       <h3>기본 배송지</h3>
      <hr>
     </div>
  
	<div class="row left">
		<c:choose>
			<c:when test="${listBasic.isEmpty()}">
				<h4 style="padding-left:20px">
				 등록된 기본 배송지가 없습니다.
				</h4>
			</c:when>
			<c:otherwise>
				<table class="table table-border">
					<thead>
				 <tr>
	               <th>번호</th>
	               <th width="20%">배송지명</th>
	               <th width="10%">우편번호</th>
	               <th width="35%">기본주소</th>
	               <th width="25%">상세주소</th>
	            </tr>
	         </thead>
	            
	         <tbody align="center">
	            <c:forEach var="addressDto" items="${listBasic}" varStatus="status">
	               <tr>
<!-- 	               <th width="25%">상세주소</tr> -->
<!-- 					</thead> -->

<!-- 					<tbody align="center"> -->
<%-- 						   <c:forEach var="addressDto" items="${listBaisc}"> --%>
<!-- 							<tr> -->
	                  <td>${status.count}</td>
	                  <td>${addressDto.addressName}</td>
	                  <td>${addressDto.addressPost}</td>
	                  <td>${addressDto.addressHost}</td>
	                  <td>${addressDto.addressDetailHost}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:otherwise>
		</c:choose>
      </div>
      
   <div class="row right">
     	 <input type="button" onclick="add()";  class="btn btn-positive"  value="기본배송지설정" />
   		</div>

      
      
    <div class = "row ">
      <h3>배송지 목록</h3>
      <hr>
     </div>
  
 
	<div class="row left">
		<c:choose>
			<c:when test="${list.isEmpty()}">
				<h4 style="padding-left:20px">
				 등록된 배송지가 없습니다.
				</h4>
			</c:when>
			<c:otherwise>
				<table class="table table-border">
					<thead>
				 <tr>
				 <th>
	                  <input type="checkbox" class="check-all">
	               </th>
	               <th>번호</th>
	               <th width="20%">배송지명</th>
	               <th width="10%">우편번호</th>
	               <th width="35%">기본주소</th>
	               <th width="25%">상세주소</tr>
					</thead>
					
					<tbody align="center">
						   <c:forEach var="addressDto" items="${list}" varStatus="status">
							<tr>
							<td>
	                     <input type="checkbox" class="check-item" name="addressNo" value="${addressDto.addressNo}">
	                  </td>
	                  <td>${status.count}</td>
	                  <td>${addressDto.addressName}</td>
	                  <td>${addressDto.addressPost}</td>
	                  <td>${addressDto.addressHost}</td>
	                  <td>${addressDto.addressDetailHost}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:otherwise>
		</c:choose>
   <div class="row right">
      <input type="button" onclick="upGo()";  class="btn btn-positive"  value="수정하기" />
      <input type="button" onclick="delNo()"; class="btn btn-positive"  value="삭제하기" />
   </div>

</div>

</div>

<!-- 페이징 처리 -->
<ul class="pagination">
<li>
	<c:choose>
		<c:when test="${not vo.isFirst()}">
			<a href="list?p=${vo.firstBlock()}&${vo.parameter()}">
				<i class="fa-solid fa-angles-left"></i>
			</a>
		</c:when>
		<c:otherwise>
			<a href="#"><i class="fa-solid fa-angles-left"></i></a>
		</c:otherwise>
	</c:choose>
</li>

<!-- 이전을 누르면 이전 구간의 마지막 페이지로 안내 -->
<li>
	<c:choose>
		<c:when test="${vo.hasPrev()}">
			<a href="list?p=${vo.prevBlock()}&${vo.parameter()}">
				<i class="fa-solid fa-chevron-left"></i>
			</a>
		</c:when>
		<c:otherwise>
			<a href="#"><i class="fa-solid fa-chevron-left"></i></a>
		</c:otherwise>
	</c:choose>
</li>
 
<c:forEach var="i" begin="${vo.startBlock()}" end="${vo.endBlock()}" step="1">
	<li <c:if test="${i==param.p}">class="on"</c:if>><a href="list?p=${i}&${vo.parameter()}">${i}</a></li>
</c:forEach>

<!-- 다음을 누르면 다음 구간의 첫 페이지로 안내 -->
<li>
	<c:choose>
		<c:when test="${vo.hasNext()}">
			<a href="list?p=${vo.nextBlock()}&${vo.parameter()}">
				<i class="fa-solid fa-chevron-right"></i>
			</a>
		</c:when>
		<c:otherwise>
			<a href="#"><i class="fa-solid fa-chevron-right"></i></a>
		</c:otherwise>
	</c:choose>
</li>

<li>
	<c:choose>
		<c:when test="${not vo.isLast()}">
			<a href="list?p=${vo.lastBlock()}&${vo.parameter()}">
				<i class="fa-solid fa-angles-right"></i>
			</a>
		</c:when>
		<c:otherwise>
			<a href="#"><i class="fa-solid fa-angles-right"></i></a>
		</c:otherwise>
	</c:choose>
</li>
</ul>	


<jsp:include page="/WEB-INF/views/template/customerFooter.jsp"></jsp:include>


<script>

function upGo(){
	var checkboxValues = [];
	var count = 0;
	$("input[name='addressNo']:checked").each(function(i) {
					count += 1;
    });
	
	if(count > 1 || count == 0){
		alert("미선택 또는 복수선택은 불가합니다.");
		return false;
	}else{
	$("input[name='addressNo']:checked").each(function(i) {
		checkboxValues.push($(this).val());
    });
	window.location = "http://localhost:8888/address/edit?addressNo=" + checkboxValues;
	}
}

function add(){
	window.location = "http://localhost:8888/address/addBasic"
	}


function delNo(){
  
    // name이 같은 체크박스의 값들을 배열에 담는다.
    var checkboxValues = [];
    $("input[name='addressNo']:checked").each(function(i) {
        checkboxValues.push($(this).val());
    });
     
    // 사용자 ID(문자열)와 체크박스 값들(배열)을 name/value 형태로 담는다.
    var allData = { "addressNo": checkboxValues };
     
    $.ajax({
        url:"delete",
        type:'GET',
        data: allData,
 
 
//데이터 전송이 완료되면 출력되는 메시지
 
        success:function(data){
        	
            location.replace("list");
        },
 
//에러가 발생되면 출력되는 메시지
 
        error:function(jqXHR, textStatus, errorThrown){
        	alert("미선택 또는 복수선택은 불가합니다.");
            self.close();
        }
    });
}

</script>



	




    
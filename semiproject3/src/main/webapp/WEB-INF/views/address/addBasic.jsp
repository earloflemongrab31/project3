<%@ page language="java" contentType="text/html; charset=UTF-8" 
      pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<jsp:include page="/WEB-INF/views/template/header.jsp">
    <jsp:param value="주소목록" name="title"/>
</jsp:include>

<script src="/confirm-link.js"></script> 
<script src="/checkbox.js"></script> 

<div class ="container-800 mt-40 mb-40">

   <div class = "row center">
      <h1>주소목록</h1>
      <hr>
   </div>

   <div class = "row">
      <table class="table table-hover table-border">
         <thead>
            <tr>
               <th>
                  <input type="checkbox" class="check-all">
               </th>
               
               <th>번호</th>
               <th width="20%">배송지명</th>
               <th width="10%">우편번호</th>
               <th width="35%">기본주소</th>
               <th width="25%">상세주소</th>
               <th width="10%">대표여부</th>
            </tr>
         </thead>
            
         <tbody align="center">
            <c:forEach var="addressDto" items="${list}">
               <tr>
                  <td>
                     <input type="checkbox" class="check-item" name="addressNo" value="${addressDto.addressNo}">
                  </td>
                  <td>   ${addressDto.addressNo}</td>
                  <td>   ${addressDto.addressName}</td>
                  <td>   ${addressDto.addressPost}</td>
                  <td>${addressDto.addressHost}</td>
                  <td>${addressDto.addressDetailHost}</td>
            	  <td>${addressDto.addressBasic}</td>
         
               </tr>
            </c:forEach>
         </tbody>
      </table>
   </div>

   <div class="row right">
      <a class="btn btn-positive" href="insert">새주소 등록</a>
      <input type="button" onclick="upGo()"; value="기본배송지 설정" />
   </div>

</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>


<script>

function upGo(){
	var checkboxValues = [];
	var count = 0;
	$("input[name='addressNo']:checked").each(function(i) {
					count += 1;
    });
	
	
	
	if(count > 1 || count == 0){
		alert("기본배송지는 하나만 선택 가능합니다.");
		return false;
	}else{
		
	    $("input[name='addressNo']:checked").each(function(i) {
	        checkboxValues.push($(this).val());
	        alert(checkboxValues);
	    });
	    alert(checkboxValues);
	    var allData = { "addressNo": checkboxValues, "addressBasic" :  "Y"};
	}
	
    $.ajax({
        url:"addBasic",
        type:'POST',
        data: allData,
 
 
//데이터 전송이 완료되면 출력되는 메시지
 
        success:function(data){
        	
            location.replace("list");
        },
 
//에러가 발생되면 출력되는 메시지
 
        error:function(jqXHR, textStatus, errorThrown){
            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
            self.close();
        }
    });
}

</script>
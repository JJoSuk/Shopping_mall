<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<style>
   td{vertical-align:middle;}
</style>   

<c:if test="${requestScope.msg != null}">
<script>
   alert("${requestScope.msg}")
</script>
</c:if>
   
<div class="container w-75 mt-5">
   <h3>회원 리스트</h3>
   <table class="table">
      <thead>
         <tr>
            <th>아이디</th>               
            <th>패스워드</th>
            <th>이름</th>
            <th>전화번호</th>
            <th>이메일</th>
            <th>주소</th>
            <th>수정날짜</th>
            <th>수정/삭제</th>
         </tr>
      </thead>
      <tbody>
         <c:if test="${dtos==null || dtos.size() ==0}">
            <tr>
               <td colspan="8">회원이 존재하지 않습니다!!</td>
            </tr>
         </c:if>
         <c:if test="${dtos!=null || dtos.size() !=0}">
            <c:forEach var="dto" items="${dtos}">
            <tr>
               <td>${dto.id}</td>
               <td>${dto.pw}</td>
               <td>${dto.name}</td>
               <td>${dto.tel}</td>
               <td>${dto.email}</td>
               <td>${dto.addr}</td>
               <td>${dto.rdate}</td>
               <td>
                  <a href="memberUpdate.do?id=${dto.id}" class="btn btn-sm btn-info">수정</a>
                  <a href="javascript:memberDel('${dto.id}')" class="btn btn-sm btn-danger">삭제</a>
               </td>
            </tr>
            </c:forEach>            
         </c:if>
      </tbody>
   </table>
</div>
<script>
   function memberDel(id){
      let isDel = confirm("삭제 하시겠습니까?");
      if(isDel) location.href="memberDelete.do?id="+id;
   }
</script>

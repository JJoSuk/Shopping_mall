<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../inc/header.jsp" %>

<div class="container mt-5 border shadow p-5">
	<h3>관리자 로그인</h3>
	<form action="<c:url value="adminLogin.do"/>" method="post">
      <div class="mt-3 mb-3">
         <lable for="id">아이디</lable>
         <input type="text" class="form-control" id="id" placeholder="관리자 아이디" name="id">

      </div>
      <div class="mb-3">
         <lable for="pw">비밀번호</lable>
         <input type="password" class="form-control" id="password" placeholder="관리자 비밀번호" name="password"/>
      </div>
      <div class="text-center">
         <input type="submit" class="btn btn-sm btn-primary" value="로그인"/>
      </div>
   </form>
</div>

<jsp:include page="../inc/footer.jsp" />
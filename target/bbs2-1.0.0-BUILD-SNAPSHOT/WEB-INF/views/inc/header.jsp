<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  
  <link  href="<c:url value="/css/main.css"/>" rel="stylesheet"/>
</head>
<body>
<c:if test="${sessionScope.adminMode != true}">
<nav class="navbar navbar-expand-sm sticky-top nacolor1">
	<div class="container">
		<ul class="navbar-nav w-100">
			<li class="nav-item ">
				<a class="nav-link" href="<c:url value="/"/>">HOME</a>
			</li>
			<li class="nav-item ms-auto">
				<a class="nav-link" href="<c:url value="/cart/cartList.do?id=${sessionScope.loginDto.id}"/>">장바구니</a>
			</li>
			<li class="nav-item ">
				<c:if test="${sessionScope.loginDto.id == null}">
					<a class="nav-link btn btn-sm btn-outline-light" href="<c:url value="/member/login.do"/>">로그인</a>
				</c:if>
			</li>

			<c:if test="${sessionScope.loginDto.id != null && sessionScope.adminLogin == null}">
				<li class="nav-item d-flex">
					<a class="me-3 myProfile" type="button" href="<c:url value="/member/myProfile.do"/>">
						<i class="fa fa-user-circle"></i> ${sessionScope.loginDto.name}
					</a>
					<a class="nav-link btn btn-sm btn-outline-light" href="javascript:logout()">로그아웃</a>
				</li>
			</c:if>

			<c:if test="${sessionScope.loginDto.id == null && sessionScope.adminLogin != null}">
				<li class="nav-item">
					<a class="nav-link btn btn-sm btn-outline-light" href="javascript:logout()">관리자 로그아웃</a>
				</li>
			</c:if>




			<li class="nav-item ">
				<c:if test="${sessionScope.loginDto.id == null}">
					<a class="nav-link btn btn-sm btn-outline-light" href="<c:url value="/admin/adminLogin.do"/>">관리자 로그인</a>
				</c:if>
			</li>
		</ul>
	</div>
</nav>
	<nav class="navbar navbar-expand-sm sticky-top nacolor2">
	  <div class="container">
	  	<ul class="navbar-nav w-100">
			<li class="nav-item">
				<a class="nav-link" href="<c:url value="/product/proList.do"/>">상품페이지</a>
			</li>
	  		<li class="nav-item">
			    <a class="nav-link" href="<c:url value="/board/list.do"/>">게시판</a>	  		
	  		</li>
	  	</ul>
	  </div>
	</nav>
</c:if>
<c:if test="${sessionScope.adminMode == true}">
<nav class="navbar navbar-expand-sm sticky-top nacolor1">
	<div class="container">
		<ul class="navbar-nav w-100">
			<li class="nav-item ">
				<a class="nav-link" href="<c:url value="/"/>">HOME</a>
			</li>
			<li class="nav-item ms-auto">
<%--				<a class="nav-link" href="<c:url value="/cart/cartList.do?id=${sessionScope.loginDto.id}"/>">장바구니</a>--%>
			</li>
			<li class="nav-item ">
				<c:if test="${sessionScope.loginDto.id == null}">
					<a class="nav-link btn btn-sm btn-outline-light" href="<c:url value="/admin/adminLogin.do"/>">관리자 로그인</a>
				</c:if>
				<c:if test="${sessionScope.loginDto.id != null}">
					<a class="nav-link btn btn-sm btn-outline-light" href="javascript:logout()">관리자 로그아웃</a>
				</c:if>
			</li>
		</ul>
	</div>
</nav>
<nav class="navbar navbar-expand-sm sticky-top nacolor2">
	<div class="container">
		<ul class="navbar-nav w-100">
			<li class="nav-item">
				<a class="nav-link" href="<c:url value="/category/catReg.do"/>">카테고리등록</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<c:url value="/category/catList.do"/>">카테고리 리스트</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<c:url value="/product/prodInput.do"/>">상품등록</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<c:url value="/product/prodList.do"/>">상품 리스트-관리자</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<c:url value="/member/memberList.do"/>">회원 리스트</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<c:url value="/product/proList.do"/>">상품 리스트-회원</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<c:url value="/board/list.do"/>">게시판</a>
			</li>
		</ul>
	</div>
</nav>
</c:if>
<script>
	function logout(){
		location.href="<c:url value="/member/logout.do"/>"
	}
</script>



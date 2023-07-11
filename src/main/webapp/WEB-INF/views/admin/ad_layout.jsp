<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>                                         
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<header>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="container">
    <a class="navbar-brand" href="#">SHOP</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="#">카테고리등록</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">카테고리리스트</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">상품등록</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">상품리스트</a>
        </li>  
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Dropdown</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Link</a></li>
            <li><a class="dropdown-item" href="#">Another link</a></li>
            <li><a class="dropdown-item" href="#">A third link</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
</header>
<main>
   <div class="container">
      <h2>관리자 페이지</h2>
      <ul>
      	<li><a href="">쇼핑몰 카테고리 등록</a></li>
      	<li><a href="">쇼핑몰 카테고리 리스트</a></li>
      	<li><a href="">쇼핑몰 상품 등록</a></li>
      	<li><a href="">쇼핑몰 상품 리스트</a></li>
      </ul>
   </div>
</main>
<footer class = "text-center border-top container">
   &copy; Powered by Academy.
</footer>
</body>
</html>
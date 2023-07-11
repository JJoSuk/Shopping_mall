<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="cnt" value="${cnt+1}" />
<!-- Card -->
<div class="card me-2" style="width: 200px">
	<a href="prodView.do?pNum=${pDto.pNum}"
		style="height: 120px; overflow: hidden;">
		<img class="card-img-top" src="../fileRepo/${pDto.pImage}" alt="Card image" style="width: 100%;">
	</a>
	<div class="card-body">
		<h4 class="card-title" style="font-size: 15px;">
			<b>상품명 :${pDto.pName}</b>
		</h4>
		<p class="card-text">
			가격 :
			<fmt:formatNumber value="${pDto.price}" />
		</p>
		<p class="card-text">
			포인트 :
			<fmt:formatNumber value="${pDto.pPoint}" />
		</p>
		<!-- 로그인 되었을 경우 -->
		<c:if test="${sessionScope.loginDto.id != null }">
		<a href="<c:url value="/cart/cartAdd.do?pNum=${pDto.pNum}&pQty=1&pSpec=${pDto.pSpec}&id=${sessionScope.loginDto.id}"/>" class="btn btn-primary" style="width: 100%">장바구니 담기</a>
		</c:if>
		
		<!-- 로그인 안되었을 경우 -->
		<c:if test="${sessionScope.loginDto.id == null }">
		<a href="javascript:alert('로그인이 필요합니다')" class="btn btn-primary" style="width: 100%">장바구니 담기</a>
		</c:if>
		
	</div>
</div>
<!-- Card End -->
<c:if test="${cnt%4 ==0}">
	</div><div class="d-flex mt-3">
</c:if>
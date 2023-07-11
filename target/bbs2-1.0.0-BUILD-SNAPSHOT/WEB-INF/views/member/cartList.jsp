<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<style>
	td{vertical-align:middle;}
</style>   
<c:if test="${requestScope.msg !=null}">
<script>
	alert("${requestScope.msg}");
</script>
</c:if>

<div class="container w-75 mt-5">
	<h3>장바구니 리스트</h3>
	<table class="table">
		<thead>
			<tr>
				<th>상품이미지</th>
				<th>상품명</th>
				<th>수량</th>
				<th>판매가</th>
				<th>합계</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${dtos==null || dtos.size() ==0}">
				<tr>
					<td colspan="6">장바구니가 비었습니다!!</td>
				</tr>
			</c:if>
			<c:if test="${dtos!=null || dtos.size() !=0}">
				<c:set var="cartTotPrice" value="0"/>
				<c:set var="cartTotPoint" value="0"/>
				
				<c:forEach var="dto" items="${dtos}">
				<tr>					
					<td>
						<a href="<c:url value="/product/prodView.do?pNum=${dto.pNum}&pSpec=${dto.pSpec}"/>">
						<img src="<c:url value="../fileRepo/${dto.pImage}"/>" style="width:60px"/>
						</a>
					</td>
					<td>${dto.pName}</td>
					<td>
					<form action="cartModify.do" method="post">
						<input type="hidden" id="cNum" name="cNum" value="${dto.cNum}"/>
						<input type="hidden" id="id" name="id" value="${dto.id}"/>
						<input type="text" size="3" id="pQty" name="pQty" value="${dto.pQty}"/>개<br/>
						<input type="submit" class="btn btn-sm btn-secondary mt-3" value="수정"/>
					</form>
					</td>
					<td>
						<fmt:formatNumber value="${dto.price}"/>원<br/>
						<fmt:formatNumber value="${dto.pPoint}"/>포인트
					</td>
					<td>
						<fmt:formatNumber value="${dto.totPrice}"/>원<br/>
						<fmt:formatNumber value="${dto.totPoint}"/>포인트
					</td>
					<td>
						<%--
							pNum 파라미터 노출
							<a href="cartDelete.do?pNum=${dto.pNum}" class="btn btn-sm btn-danger">삭제</a>
						--%>
						<form action="cartDelete.do" method="post">
							<input type="hidden" name="cNum" value="${dto.cNum}"/>
							<input type="hidden" name="id" value="${dto.id}"/>
							<input type="submit" class="btn btn-sm btn-danger" value="삭제"/>
							<%-- <a href="cartDelete.do?pNum=${dto.pNum}" class="btn btn-sm btn-danger">삭제</a> --%>
						</form>
					</td>
				</tr>
				<c:set var="cartTotPrice" value="${cartTotPrice + dto.totPrice}"/>
				<c:set var="cartTotPoint" value="${cartTotPoint + dto.totPoint}"/>
				
				</c:forEach>				
			</c:if>
		</tbody>
	</table>
	<!-- 장바구니 총액 표시 -->
	<div class="text-end">
		장바구니 총액 : <fmt:formatNumber value="${cartTotPrice}"/> 원 <br/>
		총 포인트 : <fmt:formatNumber value="${cartTotPoint}"/> 포인트 
	</div>
	<div class="text-center">
		<a href="<c:url value="/cart/checkout.do?id=${sessionScope.loginDto.id}"/>" class="btn btn-primary me-2">구매하기</a>
		<a href="${pageContext.request.contextPath}/product/proList.do" class="btn btn-outline-primary me-2">계속 쇼핑하기</a>
	</div>
	
</div>
<script>
	function pdDel(pNum, pImage){
		let isDel = confirm("삭제 하시겠습니까?");
		if(isDel) ;
	}
</script>






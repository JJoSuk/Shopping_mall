<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<style>
	td{vertical-align:middle;}
</style>   
<c:if test="${requestScope.msg !=null}">
<script>
	alert("${requestScope.msg}");
</script>
</c:if>

<%@ include file="../inc/header.jsp" %>

<div class="container w-75 mt-5">
	<h3>상품 리스트</h3>
	<table class="table">
		<thead>
			<tr>
				<th>번호</th>					
				<th>카테고리 코드</th>
				<th>이미지</th>
				<th>상품명</th>
				<th>가격</th>
				<th>제조사</th>
				<th>수량</th>
				<th>수정/삭제</th>
			</tr>
		</thead>
		<tbody>
<c:set var="rowNum" value="${pDto.startRowNum}"/>
<c:if test="${dtos==null || dtos.size() ==0}">
	<tr>
		<td colspan="8">상품이 존재하지 않습니다!!</td>
	</tr>
</c:if>
<c:if test="${dtos!=null || dtos.size() !=0}">
<c:forEach var="dto" items="${dtos}">
	<tr>
		<tr>
		<td>${dto.pNum}</td>
		<td>${dto.pCategory_fk}</td>
		<td>
				<%-- 						<img src="<%=request.getContextPath() %>/uploadedFile/${dto.pImage}" style="width:60px"/> --%>
				<%--<c:url />은 context경로를 자동으로 붙여줌 --%>
			<img src="../fileRepo/${dto.pImage}" style="width:60px"/>
		</td>
		<td>${dto.pName}</td>
		<td>${dto.price}</td>
		<td>${dto.pCompany}</td>
		<td>${dto.pQty}</td>

		<td>
			<a href="prodUpdate.do?pNum=${dto.pNum}" class="btn btn-sm btn-info">수정</a>
			<a href="javascript:pdDel('${dto.pNum}', '${dto.pImage}')" class="btn btn-sm btn-danger">삭제</a>
		</td>
		</tr>

	</tr>
	<c:set var="rowNum" value="${rowNum - 1}"/>
</c:forEach>
</c:if>
		</tbody>
	</table>
      <!-- 페이지네이션 -->
	<ul class="pagination justify-content-center my-5">
		<li class="page-item ${pDto.prevPage <=0 ? 'disabled':''}">
			<a class="page-link" href="prodList.do?viewPage=${pDto.prevPage}&cntPerPage=${pDto.cntPerPage}">이전</a>
		</li>

		<c:forEach var="i" begin="${pDto.blockStart}" end="${pDto.blockEnd}">
			<li class="page-item ${pDto.viewPage == i ? 'active':''}">
				<a class="page-link" href="prodList.do?viewPage=${i}&cntPerPage=${pDto.cntPerPage}">${i}</a>
			</li>
		</c:forEach>

		<li class="page-item ${pDto.blockEnd >=pDto.totalPage ? 'disabled':''}">
			<a class="page-link" href="prodList.do?viewPage=${pDto.nextPage}&cntPerPage=${pDto.cntPerPage}">다음</a>
		</li>
	</ul>
</div>
<script>
	function pdDel(pNum, pImage){
		let isDel = confirm("삭제 하시겠습니까?");
		if(isDel) location.href="prodDelete.do?pNum="+pNum+"&pImage="+pImage;
	}

</script>

<jsp:include page="../inc/footer.jsp" />

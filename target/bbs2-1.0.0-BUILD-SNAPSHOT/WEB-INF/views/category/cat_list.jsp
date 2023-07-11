<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../inc/header.jsp" %>

<!-- <main>   -->
<div class="container w-50 border shadow-sm p-5 my-5">
	<h3>카테고리 목록</h3>
	<table class="table">
		<thead>
			<tr>
				<th>번호</th>
				<th>코드</th>
				<th>카테고리명</th>
				<th>수정/삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td>${dto.catNum}</td>
					<td>${dto.code}</td>
					<td>${dto.catName}</td>
					<td>
						<a href="catUpdate.do?catNum=${dto.catNum}"
						class="btn btn-sm btn-info">수정</a>
						<a href="catDelete.do?catNum=${dto.catNum}"
						class="btn btn-outline-danger btn-sm">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<jsp:include page="../inc/footer.jsp" />
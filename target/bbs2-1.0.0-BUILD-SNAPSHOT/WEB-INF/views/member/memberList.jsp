<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%@ include file="../inc/header.jsp" %>
<div class='container mt-5'>
	<h3> 회원 리스트</h3>
	<table class='table table-striped'>
		<thead class='table-dark'>
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>나이</th>
			<th>생년월일</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>삭제</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.no}</td>
				<td><a href="<c:url value='memberInfo.do?no=${dto.no}'/>">${dto.id}</a></td>
				<td>${dto.pw}</td>
				<td>${dto.name}</td>
				<td>${dto.age}</td>
				<td>${dto.birthday}</td>
				<td>${dto.email}</td>
				<td>${dto.tel}</td>
				<td><a href="<c:url value='memberDelete.do?no=${dto.no}'/>" class='btn btn-danger btn-sm'>삭제</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
<div class='text-center'>
<%--	<a href='<c:url value="memberRegister.do"/>' class='btn btn-primary'>회원가입</a>--%>
	<a href='<c:url value="/"/>' class='btn btn-info'>홈으로</a>
</div>


<jsp:include page="../inc/footer.jsp" />
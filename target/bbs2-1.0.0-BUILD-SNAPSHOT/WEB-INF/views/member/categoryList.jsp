<%@page import="util.ProdSpec"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
    
<section class="w-75 ps-5">
	<c:if test="${pDtos.size() == 0}">
		<p>상품이 존재하지 않습니다!!</p>
	</c:if>
	<c:if test="${pDtos.size() != 0}">
   <h3>[${requestScope.catName}] 상품</h3>

	   <div class="d-flex">
	   	   <c:set var="cnt" value="0"/>
	   	   <c:forEach var="pDto" items="${requestScope.pDtos}">
	   	   	  <%@ include file="../product/card.jsp" %>
			</c:forEach>
		</div>
	</c:if>
</section>

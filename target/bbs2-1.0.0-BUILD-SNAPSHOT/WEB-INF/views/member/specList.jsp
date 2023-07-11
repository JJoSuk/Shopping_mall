<%@page import="util.ProdSpec"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
    
<section class="w-75 ps-5">
   <h3>[${requestScope.specValue}] 상품</h3>

	   <div class="d-flex"> 
	   	   <c:set var="cnt" value="0"/>
		   <c:forEach var="pDto" items="${pDto}">
			   <c:if test="${pDto.pSpec == requestScope.pSpec}">
				   <%@ include file="../product/card.jsp" %>
			   </c:if>
		   </c:forEach>
		</div>
</section>

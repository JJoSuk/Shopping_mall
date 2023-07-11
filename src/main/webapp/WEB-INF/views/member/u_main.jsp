<%@page import="util.ProdSpec"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="kr.ezen.bbs.domain.ProductDTO" %>
<%@ page import="kr.ezen.service.ProductService" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="kr.ezen.bbs.mapper.CategoryMapper" %>
<%@ page import="kr.ezen.bbs.mapper.ProductMapper" %>
<%@ page import="kr.ezen.controller.ProductController" %>
<%@ page import="kr.ezen.service.ProductServiceImpl" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--<%@ include file="../inc/header.jsp" %>--%>

<%--<c:if test="${requestScope.msg !=null}">--%>
<%--<script>--%>
<%--   alert("${requestScope.msg}");--%>
<%--</script>--%>
<%--</c:if>--%>
<%--<section class="w-75 ps-5">--%>
<%--   <h4>쇼핑몰에 오신것을 환영합니다.</h4>--%>
<%--   <%--%>

<%--      ProductService service = pDao;--%>

<%--//      ArrayList<ProductDTO> pDtos = null;--%>

<%--      ProdSpec[] pdSpecs = ProdSpec.values();--%>

<%--      for(ProdSpec ps : pdSpecs){--%>
<%--         String key = ps.name();// HIT, NEW, RECOMMEND  //${spec.name()}--%>
<%--         // 상품사양별 리스트 가져오기--%>
<%--         pDtos = ProductService.getProdBySpec(key);--%>
<%--         System.out.println(pDtos);--%>

<%--         pageContext.setAttribute("ps", ps);--%>
<%--         pageContext.setAttribute("pDtos", pDtos);--%>
<%--   %>--%>
<%--   <c:if test="${pDtos.size() == 0}">--%>
<%--         ${ps.getValue()}상품이 없습니다!!   --%>
<%--   </c:if>--%>
<%--   --%>
<%--   <c:if test="${pDtos.size() != 0}">--%>
<%--         <h4 class="mt-3">${ps.getValue()} 상품</h4>    --%>
<%--      <div class="d-flex"> --%>
<%--            <c:set var="cnt" value="0"/>   --%>
<%--            <c:forEach var="pDto" items="${pDtos}">--%>
<%--                 <%@ include file="../product/card.jsp" %>--%>
<%--         </c:forEach>--%>
<%--      </div>--%>
<%--   </c:if>--%>
<%--   <%} // for문 %>--%>




</section>
<section class="w-75 ps-5">
	<h4>쇼핑몰에 오신것을 환영합니다.</h4>
	<c:forEach var="spec" items="${requestScope.pdSpecs}">
		<%--   <c:if test="${spec.size() == 0}">--%>
		<%--      ${spec.value}상품이 없습니다!!--%>
		<%--   </c:if>--%>
		<c:if test="${spec.value != null}">
			<h4 class="mt-3">${spec.value} 상품</h4>
			<div class="d-flex">
				<c:forEach var="pDto" items="${pDto}">
					<c:if test="${pDto.pSpec == spec.name()}">
						<%--						                        <h4 class="mt-3">[${pDto.pSpec}]</h4>--%>
						<%@ include file="../product/card.jsp" %>
					</c:if>
				</c:forEach>
			</div>
		</c:if>
		<%--   </c:if>--%>
	</c:forEach>
</section>





<%--<jsp:include page="../inc/footer.jsp" />--%>

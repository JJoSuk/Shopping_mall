<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="util.ProdSpec"%>
<%@page import="kr.ezen.bbs.domain.CategoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%--<%@page import="model.CategoryDAO"%>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<style>
	ul {
		list-style: none;
		text-decoration: none;
	}

	li>a {
		text-decoration: none;
	}
</style>

<aside class="border-end" style="width: 200px">
	<h4>카테고리</h4>
	<ul>
		<%--    <%--%>
		<%--//      CategoryDAO cDao = CategoryDAO.getInstance();--%>
		<%--//      ArrayList<CategoryDTO> cDtos = cDao.categoryList();--%>

		<%--//      if (cDtos != null || cDtos.size() != 0) {--%>
		<%--      if (cDtos.size() != 0) {--%>
		<%--        for (CategoryDTO cDto : cDtos) {--%>
		<%--          String catName = cDto.getCatName();--%>
		<%--          String code = cDto.getCode();--%>
		<%--          pageContext.setAttribute("code", code);--%>
		<%--          pageContext.setAttribute("catName", catName);--%>
		<%--    %>--%>
		<c:if test="${cDtos != null}">
			<c:forEach var="dto" items="${cDtos}">
				<li><a href="<c:url value="/product/categoryList.do?code=${dto.code}&catName=${dto.catName}"/>">${dto.catName}</a></li>
			</c:forEach>
		</c:if>
		<c:if test="${cDtos == null}">
			<li>카테고리 없음</li>
		</c:if>
	</ul><ul class='mt-3'>
	<c:forEach var="ps" items="${pdSpecs}">
		<li>
			<a href="<c:url value="/product/specList.do?pSpec=${ps.name()}"/>">${ps.value}상품</a>
		</li>
	</c:forEach>
	<%--    <%--%>
	<%--        } // for문--%>
	<%--      } else {--%>
	<%--        out.print("<li>카테고리 없음</li>");--%>
	<%--      } // if문--%>
	<%--      out.print("</ul><ul class='mt-3'>");--%>
	<%--      ProdSpec[] pdSpecs = ProdSpec.values();--%>
	<%--      for(ProdSpec ps : pdSpecs){--%>
	<%--        pageContext.setAttribute("ps",ps);--%>
	<%--    %>--%>
	<%--    <li>--%>
	<%--      <a href="specList.do?pSpec=${ps.name()}">${ps.getValue()}상품</a>--%>
	<%--    </li>--%>
	<%--    <%--%>
	<%--      } // for문--%>
	<%--    %>--%>
</ul>


</aside>










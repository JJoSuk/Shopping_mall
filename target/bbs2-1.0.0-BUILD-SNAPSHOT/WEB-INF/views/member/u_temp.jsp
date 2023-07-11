<%--
  Created by IntelliJ IDEA.
  User: B-30
  Date: 2023-06-30
  Time: 오후 4:06
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	String pg = request.getParameter("pg");
	if(pg==null) pg="u_main.jsp";

	// if(session.getAttribute("isLogin") == null) pg = "u_main.jsp";
%>
<jsp:include page="../inc/header.jsp" />
<main>
	<div class="container mt-5 d-flex">
		<%@ include file="u_left.jsp" %>
		<jsp:include page="<%=pg%>"/>
	</div>
</main>
<jsp:include page="../inc/footer.jsp" />


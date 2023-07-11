<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pg = request.getParameter("pg");
	
	if(session.getAttribute("isLogin") == null) pg="ad_login.jsp";
%>    
<jsp:include page="ad_top.jsp"/>
<main>    
	<jsp:include page="<%=pg%>"/>
</main>
<jsp:include page="ad_bottom.jsp"/>    

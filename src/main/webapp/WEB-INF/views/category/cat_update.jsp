<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../inc/header.jsp" %>

<div class="container w-50 mt-5">
      <h3>카테고리 수정</h3>
      <form action="catUpdate.do" method="post">
      <table class="table table-borderless">
         <tbody>
            <tr>
               <td>카테고리 번호</td>
               <td><input class="form-control form-control-sm" type="text" name="catNum" value="${dto.catNum}" readonly/></td>
            </tr>
            <tr>
               <td>코드</td>
               <td><input type="text" class="form-control form-control-sm" name="code" value="${dto.code}"/></td>
            </tr>
            <tr>
               <td>카테고리</td>
               <td><input type="text" class="form-control form-control-sm" name="catName" value="${dto.catName}"/></td>
            </tr>
           <%--  <tr>
               <td>카테고리</td>
               <td>
                  <select class="form-select form-select-sm" name="pCategory_fk">
                  		<c:if test="${list !=null || list.size !=0}">
                  			<c:forEach var="cDto" items="${list}">                     
                        		<option value="${cDto.code}" 
                        		 ${(cDto.code == dto.pCategory_fk) ? 'selected':''}>${cDto.catName}[${cDto.code}]</option>
                        	</c:forEach>
                        </c:if>                                                            
                  </select>
               </td>
            </tr> --%>
            <tr>
               <td colspan="2" class="text-center">
                  <input type="submit" class="btn btn-sm btn-primary" value="상품수정"/>   
                  <input type="reset" class="btn btn-sm btn-secondary" value="취소"/>   
               </td>
            </tr>
         </tbody>         
      </table>
      </form>   
   </div>

<jsp:include page="../inc/footer.jsp" />
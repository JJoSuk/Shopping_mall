<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../inc/header.jsp" %>

<div class="container w-50 mt-5">
      <h3>상품 수정</h3>
      <form action="prodUpdate.do" method="post" enctype="multipart/form-data">
      <table class="table table-borderless">
         <tbody>
         <tr>
            <td>상품번호</td>
            <td><input class="form-control form-control-sm" type="text" name="pNum" id="pNum" value="${dto.pNum}" readonly/></td>
         </tr>
         <tr>
            <td>카테고리</td>
            <td>
               <select class="form-select form-select-sm" name="pCategory_fk" id="pCategory_fk">
                  <c:if test="${list !=null || list.size !=0}">
                     <c:forEach var="cDto" items="${list}">
                        <option value="${cDto.code}"
                           ${(cDto.code == dto.pCategory_fk) ? 'selected':''}>${cDto.catName}[${cDto.code}]</option>
                     </c:forEach>
                  </c:if>
               </select>
            </td>
         </tr>
         <tr>
            <td>상품명</td>
            <td><input type="text" class="form-control form-control-sm" name="pName" id="pName" value="${dto.pName}"/></td>
         </tr>
         <tr>
            <td>제조회사</td>
            <td><input type="text" class="form-control form-control-sm"
                       name="pCompany" id="pCompany" value="${dto.pCompany}"/></td>
         </tr>

         <tr>
            <td>상품이미지</td>
            <%--                  <c:forEach var="fName" items="${map.fileList}">--%>
            <td>
               <img src="../fileRepo/${dto.pImage}" width="100px"/>${dto.pImage}
               <input type="file" class="form-control form-control-sm" name="file" onchange="preViewImg(this)"/><img/></td>

            <%--                  </c:forEach>--%>
         </tr>
         <tr>
            <td>상품수량</td>
            <td><input type="text" class="form-control form-control-sm"
                       name="pQty" id="pQty" value="${dto.pQty}"/></td>
         </tr>
         <tr>
            <td>상품가격</td>
            <td><input type="text" class="form-control form-control-sm"
                       name="price" id="price" value="${dto.price}"/></td>
         </tr>
         <tr>
            <td>상품사양</td>
            <td>
               <select class="form-select form-select-sm" name="pSpec">
                  <option value="none" selected>일반</option>
                  <c:forEach var="spec" items="${requestScope.pdSpecs}">
                     <%-- <%=spec.getValue() %> --%>
                     <option value="${spec.name()}"  ${(spec.name() == dto.pSpec) ? 'selected':''} >${spec.value}</option>
                  </c:forEach>
               </select>
            </td>
         </tr>
         <tr>
            <td>상품소개</td>
            <td>
               <textarea class="form-control" name="pContent" id="pContent" rows="3">${dto.pContent}</textarea>
            </td>
         </tr>
         <tr>
            <td>상품포인트</td>
            <td><input type="text" class="form-control form-control-sm"
                       name="pPoint" id="pPoint" value="${dto.pPoint}"/></td>
         </tr>
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
<script>
   $("#btn-list").click(()=>{
      location.href="<c:url value='/product/prodList.do?viewPage=${pDto.viewPage}&cntPerPage=${pDto.cntPerPage}&searchType=${pDto.searchType}&keyWord=${pDto.keyWord}'/>";
   });
</script>
<jsp:include page="../inc/footer.jsp" />
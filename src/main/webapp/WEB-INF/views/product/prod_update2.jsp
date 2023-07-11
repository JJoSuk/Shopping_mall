<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../inc/header.jsp" %>

<div class="container w-50 mt-5">
      <h3>상품 수정</h3>
      <form action="UDupload.do" method="post" enctype="multipart/form-data">
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
               <td>
                  <img src="../fileRepo/${dto.pImage}" width="100px"/>
                  <input type="text" class="form-control form-control-sm"
                          name="pImage" id="pImage" value="${dto.pImage}" onclick="fileAppend()"/>
               </td>
               <div id="div-file">

               </div>
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

   var cnt = 1;
   function fileAppend(){
      var fileElement = '<input type="file" class="form-control"  name="file' + cnt +
              '"  onchange="preViewImg(this)"/><img /><button type="button" class="btn-close border bg-danger" style="display:none; position:relative; left:-24px; top:-30px;" onclick="delInput(this)"></button>';

      $("#div-file").append(fileElement);
      cnt++;
   }

   function fileRemove(){
      $("#div-file").empty();
   }

   function delInput(obj){
      var imgTag = obj.previousSibling; // 이전 형제 요소
      var inputTag = obj.previousSibling.previousSibling;

      inputTag.value="";
      inputTag.style.display="none";
      imgTag.src="";
      imgTag.style.display="none";
      obj.style.display="none";

   }

   function preViewImg(obj){
      console.log(obj.files);

      var imgTag = obj.nextSibling; // nextSibling : 다음 형제요소
      var btnTag = obj.nextSibling.nextSibling;

      console.log(imgTag);

      if(obj.files && obj.files[0]){
         var fileReader = new FileReader(); // js의 라이브러리

         // fileReader.onload는 파일을 성공적으로 읽었을 때 발생하는 이벤트
         fileReader.onload = function(e){
            imgTag.width=100;
            imgTag.height=100;
            // e.target은 이벤트가 발생한 대상
            imgTag.src = e.target.result; // 파일을 읽어온 결과값
            btnTag.style.display=""; // button이 보이게 함.
         }
         // 파일의 종류를 크게 두가지로 분류
         // i) 바이너리 파일 : 데이터를 있는 그대로 읽고 쓰는 파일
         // ii) 텍스트 파일 : 데이터를 문자로 변환한 파일

         // Base64(2^6)는 binary Data를 텍스트로 손실없이 안전하게 인코딩하는 방식
         // 바이너리 데이터의 훼손없이 장확하게 데이터를 전달할 수 있음.

         // 바이너리 파일을 base64 형식으로 변환해줌
         fileReader.readAsDataURL(obj.files[0]);
      }
   }
</script>
<jsp:include page="../inc/footer.jsp" />
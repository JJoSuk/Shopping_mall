<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div class="container w-50 mt-5">
      <h3>상품 수정</h3>
      <form action="memeberUpdateOk.do" method="post" enctype="multipart/form-data">
      <table class="table table-borderless">
         <tbody>
            <tr>
               <td>회원아이디</td>
               <td><input class="form-control form-control-sm" type="text" name="id" value="${dto.id}" readonly/></td>
            </tr>
            <tr>
               <td>비밀번호</td>
               <td><input class="form-control form-control-sm" type="text" name="pw" value="${dto.pw}" /></td>
            </tr>
            <tr>
               <td>회원명</td>
               <td><input class="form-control form-control-sm" type="text" name="name" value="${dto.name}" /></td>
            </tr>
            <tr>
               <td>전화번호</td>
               <td><input class="form-control form-control-sm" type="text" name="tel" value="${dto.tel}" /></td>
            </tr>
            <tr>
               <td>이메일</td>
               <td><input class="form-control form-control-sm" type="text" name="email" value="${dto.email}" /></td>
            </tr>
            <tr>
               <td>주소</td>
               <td><input class="form-control form-control-sm" type="text" name="addr" value="${dto.addr}" /></td>
            </tr>
            <tr>
               <td>가입일자</td>
               <td><input class="form-control form-control-sm" type="text" name="rdate" value="${dto.rdate}" readonly /></td>
            </tr>
            <tr>
               <td colspan="2" class="text-center">
                  <input type="submit" class="btn btn-sm btn-primary" value="회원수정"/>   
                  <input type="reset" class="btn btn-sm btn-secondary" value="취소"/>   
               </td>
            </tr>
         </tbody>         
      </table>
      </form>   
   </div>
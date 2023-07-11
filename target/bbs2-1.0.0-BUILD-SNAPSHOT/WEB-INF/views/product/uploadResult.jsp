<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang='en'>
<head>                                                                                                                                                                               
  <meta charset='utf-8'>                                                                                    
  <meta name='viewport' content='width=device-width, initial-scale=1'>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">                                      
  <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css' rel='stylesheet'>    
  <script src='https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js'></script>      
</head>  
<body>
	<div class='container mt-3 w-50 rounded shadow p-5 mt-5'>
		<form action=""/>" method="post">	
      <h3 class="text-center mb-4">파일 업로드 확인</h3>         
         <input class="form-control mb-2" type="text" id="id" value="${map.id}" disabled />
         <input class="form-control mb-2" type="text" id="name" value="${map.name}" disabled />
         <div class="">
            <table class="table table-borderless">    
            	<c:forEach var="fName" items="${map.fileList}">                        
               <tr>
                  <td class="col-md-8">
                  	   <img src="fileRepo/${fName}" width="100px" /> ${fName}               
                  </td>
                  <td class="col-md-4">
                     <a href="javascript:downloadFile('${fName}')" class="btn btn-sm btn-outline-success">다운로드 <i class="far fa-save"></i></a>
                  </td>                  
               </tr>    
                 </c:forEach>           
               <tr>
                  <td colspan="2" ><a href="<c:url value="form.do"/>" class="btn btn-primary">다시 업로드하기</a></td>
               </tr>
            </table>      
         </div>   
   </form>
		</div>
		<script>
			function downloadFile(fileName){
				location.href="<c:url value='download.do'/>?fileName="+fileName;
			}
		</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!DOCTYPE html>
<html lang='en'>
<head>
<title>Bootstrap Example</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link
	href='https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css'
	rel='stylesheet'>
<script
	src='https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js'></script>
</head>
<body>
	<div class='container mt-3 w-50 rounded shadow p-5 mt-5'>
		<form action="upload.do" method="post"  enctype="multipart/form-data">
			<h3 class="text-center mb-4">파일 업로드</h3>
			<input class="form-control mb-2" type="text" id="id" name="id"
				placeholder="아이디" /> <input class="form-control mb-2" type="text"
				id="name" name="name" placeholder="이름" />

			<div class="row mb-2">
				<div class="col-md-6 col-sm-6">
					<input type="button" class="form-control btn btn-outline-secondary"
						type="text" value="업로드파일 추가" onclick="fileAppend()" />
				</div>
				<div class="col-md-6 col-sm-6">
					<input type="button" class="form-control btn btn-outline-secondary"
						type="text" value="업로드파일 취소" onclick="fileRemove()" />
				</div>
			</div>
			<div id="div-file">
			</div>

			<div class="text-center pt-4">
				<button class="btn btn-primary form-contorl">파일 업로드</button>
			</div>
		</form>
		</div>
		<script>
		var cnt = 1;
			function fileAppend(){
				var fileElement = '<input type="file" class="form-control" name="file' + cnt + 
				'" onchange="preViewImg(this)"/><img /><button type="button" class="btn-close border bg-danger" style="display:none; position:relative; left:-24px; top:-30px;" onclick="delInput(this)"></button>';
				
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
	
</body>
</html>

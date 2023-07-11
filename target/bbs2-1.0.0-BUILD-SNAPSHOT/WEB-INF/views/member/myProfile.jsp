<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../inc/header.jsp" %>
<div class="container mt-5 d-flex">
    <aside class="border-end" style="width: 200px">
        <h4>프로필</h4>
        <ul>
            <li><a href="<c:url value="/member/myProfile.do"/>">비밀번호 변경</a></li>
            <li><a href="<c:url value="/member/userModify.do?id=${sessionScope.loginDto.id}"/>">회원정보</a></li>
        </ul>
    </aside>
    <div class="container">
        <h3>비밀번호 변경</h3>
        <input type="text" id="memberId" value="${sessionScope.loginDto.id}" readonly/>
<%--        <input type="text" id="memberPw" value="${sessionScope.loginDto.pw}"/>--%>
        <p id="pwChkMsg"></p>
        <input type="text" class="form-control mb-2" id="pw" name="pw" placeholder="현재비밀번호"/>
        <input type="text" class="form-control mb-2" id="newPw" name="newPw" placeholder="새비밀번호"/>
        <input type="text" class="form-control mb-2" id="newPwConfirm" name="newPwConfirm" placeholder="새비밀번호 확인"/>

        <div class="text-center">
            <button id="pwChangeBtn" class="btn btn-sm btn-success"> 비밀번호 변경</button>
        </div>
    </div>
</div>

<script>
    let pw="";
    let currentPwChk="";

    // 현재 비밀번호 체크
    function pwCheck(){
        pw = $("#pw").val(); // 입력된 현재 비밀번호

        $.ajax({
            url:"<c:url value='pwCheck.do' />",
            type: "post",
            data:{"pw":pw},
            async:false, // 동기화처리
            success:function(result){
                console.log("result : " + result);
                if(result =="ok"){ // 입력된 비밀번호와 현재 비밀번호가 일치
                    alert("현재 비밀번호 확인 완료!!");
                    currentPwChk=true;
                }else{
                    alert("현재 비밀번호 다시 확인 요망!!");
                    currentPwChk=false;
                }
            },
            error:function(){alert("현재 비밀번호 체크 요청 실패!!")}
        });
    }

    let newPwChk = "";
    // 새비밀번호 유효성 체크
    $("#newPw").on("keyup", function(){
       let npValue = $("#newPw").val();
       if(npValue ==""){
           $("#pwChkMsg").text("새 비밀번호를 입력하세요.")
           newPwChk = false;
       }else if(npValue.length < 4){
           $("#pwChkMsg").text("4자리 이상 입력하세요.")
           newPwChk = false;
       }else{
           $("#pwChkMsg").text("");
           newPwChk = true;
       }
    });

    let newPwConfirmChk="";

    // 새비밀번호 확인 체크
    $("#newPwConfirm").on("keyup", function(){
       let npcValue = $("#newPwConfirm").val();
       if(npcValue ==""){
           $("#pwChkMsg").text("확인 비밀번호를 입력하세요.")
           newPwConfirmChk = false;
       }else if($("#newPw").val() != npcValue){
           $("#pwChkMsg").text("새 비밀번호가 일치하지 않습니다.")
           newPwConfirmChk = false;
       }else{
           $("#pwChkMsg").text("");
           newPwConfirmChk = true;
       }

    });


    // 비밀번호 변경 요청
    $("#pwChangeBtn").on("click", function(){
        pwCheck();

        console.log("currentPwChk : "+currentPwChk);
        if(currentPwChk == false){
            alert("현재 비밀번호를 다시 확인하세요!!")
        }else if(newPwChk == false){
            alert("새 비밀번호를 다시 확인하세요!!")
        }else if(newPwConfirmChk == false){
            alert("새 비밀번호가 일치하지 않습니다... 다시 확인하세요!!")
        }else if(currentPwChk && newPwChk && newPwConfirmChk){
            let id = $("#memberId").val();
            let pw = $("#newPw").val();
            let member = {"id":id, "pw":pw};

            $.ajax({
               url:"<c:url value="pwChange.do"/>",
               type:"post",
               data:JSON.stringify(member), // JSON 문자열로 변환
               contentType:"application/json; charset=utf8",
               success: function(result){
                   if(result > 0){
                       alert("비밀번호 변경처리 완료!! 새로운 비밀번호로 로그인 하세요!!");
                       location.href="<c:url value="/member/logout.do"/>"
                   }
               },
               error:function(){alert("비밀번호 변경 요청 실패!!");}
            });
        }
    });
</script>

<jsp:include page="../inc/footer.jsp" />
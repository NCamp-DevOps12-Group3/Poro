<%--
  Created by IntelliJ IDEA.
  User: BITCAMP
  Date: 24. 7. 26.
  Time: 오후 3:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 확인</title>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.bundle.js"></script>
    <link href="${pageContext.request.contextPath}/static/css/login_join_changepassword.css" rel="stylesheet">
    <style>
        /* 컨테이너 스타일 */
        
    
    
    
    
    </style>
</head>
<body>
<div id="liveAlertPlaceholder" ></div><!-- 경고창 위치 마커-->
<div class="container">
    <div class="card">
        
        <p class="h5 card-title text-center">비밀번호변경</p><!-- 회원가입 양식 텍스트 -->
        <p class="text-center" >본인확인을 위해서 다시한번  <br>비밀번호를 입력하세요 </p><!-- 회원가입 양식 텍스트 -->
        <form  action="" id="login-form">
            <div class="mb-3">
                <form  action="/user/passwordchangesChk.do" id="passwordchangesChk-form" method="post">
                <div style="height: 60px; margin-bottom: 50px;">비밀번호
                    <input type="password" class="form-control" id="password" name="password" placeholder="특수문자, 숫자, 영문자 조합의 8자리 이상">
                    <div id="PasswordAlertholder"></div>
                </div>
                <div class="d-grid mb-3">
                    <button type="button" class="btn btn-dark" id="ChangePassword">비밀번호변경</button>
                </div>
                <div style="text-align: center;">
                    <a href="user/settings.do" style="color: white;">
                        <button type="button" class="btn border border-dark" >취소
                        </button></a>
                </div>
                </form>
            </div>
        </form>
    </div>
</div>

<script>
    $(()=>{
        const PasswordAlertholder = document.getElementById('PasswordAlertholder'); /*경고창 위치 마커 선택*/
        
        const PasswordappendAlert = (message, type) => {
            const wrapper = document.createElement('div'); /*wrapper선언하고 div만들기*/
            wrapper.innerHTML = [  /*wrapper 의 내용물(String 배열) 넣기*/`<div class="alert " role="alert">`,
                /*div 열고 wrapper 스타일 부트스트랩*/` <div>\${message}</div>`, /*wrapper에들어갈메세지*/'</div>'
                /*div닫기*/].join(''); /*위내용을 문자열로 바꾸기 */
            const alerts = PasswordAlertholder.querySelectorAll('.alert');
            if (alerts.length >= 1) {PasswordAlertholder.removeChild(alerts[0]);}
            PasswordAlertholder.append(wrapper); /*Alert holder 에 써 넣기*/
            setTimeout(() => { wrapper.remove();}, 1000);
        }
        
        
        
        $("#password").on("keydown", (e) => {
            if(e.key.toLowerCase() === 'enter') {
                e.preventDefault();
                $("#ChangePassword").click();
            }
        });
        
        
        
        <%--$("#ChangePassword").on("click", (e) => {--%>
        <%--    console.log($("#password").val());--%>
        <%--    if($("#password").val() === '') {--%>
        <%--        PasswordappendAlert('비밀번호를  입력하세요', 'success');--%>
        <%--        e.preventDefault();--%>
        <%--        return;--%>
        <%--    }--%>
        <%--    --%>
        <%--    --%>
        <%--    --%>
        <%--   --%>
        <%--    const loginFailMsg = '${loginFailMsg}';--%>
        <%--    if (loginFailMsg === 'wrongPassword') {--%>
        <%--       --%>
        <%--        PasswordappendAlert('잘못된 비밀번호입니다.', 'success');--%>
        <%--    }--%>
        <%--    --%>
        <%--    --%>
        <%--});--%>
        
        
        let passwordCheck = false;
        // ajax를 통한 email 중복체크
        $("#ChangePassword").on("click", (e) => {
            console.log($("#passwordchangesChk-form").serialize());
            // 중복체크 버튼 클릭 시 email값이 비어 있으면
            if($("#password").val() === "") {
                PasswordappendAlert('비밀번호를 입력하세요.', 'success');
                $("#password").focus();
                return;
            }
            
            // ajax를 이용해서 백엔드와 비동기 통신
            $.ajax({
                url: "/user/passwordchangesChk.do",
                type: "post",
                data: $("#passwordchangesChk-form").serialize(),
                
                success: (obj1) => {
                    
                    // Json String을 Json Object로 변경
                    const jsonObj1 = JSON.parse(obj1);
                    
                    console.log(obj1);
                    console.log(jsonObj1);
                    
                    if(jsonObj1.passwordCheckMsg === 'passwordOk') {
                        
                        return window.location.href ="/user/passwordchanges.do";
                    }else {
                        PasswordappendAlert("비밀번호가 다릅니다.", 'success');
                        passwordCheck = false;
                        $("#password").focus();
                    }
                    
                    
                  
                },
                error: (err) => {
                    console.log(err);
                }
            });
        });
        
       
        
    })
</script>
</body>
</html>
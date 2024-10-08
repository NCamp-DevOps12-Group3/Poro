<%-- Created by IntelliJ IDEA. User: BITCAMP Date: 24. 7. 26. Time: 오후 2:20 To change this template use File | Settings
    | File Templates. --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>







<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>로그인 페이지</title>
	
	<link href="${pageContext.request.contextPath}/static/css/bootstrap.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/static/js/jquery-3.7.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/bootstrap.bundle.js"></script>
	<link href="${pageContext.request.contextPath}/static/css/login_join_changepassword.css" rel="stylesheet">
	<style>
	
	</style>
</head>

<body>
<div class="container">
	<div class="card">
		<div style="height: 60px; margin-bottom: 50px;">
			<p class="h5 card-title text-center">로그인</p>
			<p class="text-center">이메일로 로그인하기</p>
		</div>
		<form action="/user/login.do" id="login-form" method="post">
			<div class="mb-3">
				<div style="height: 60px; margin-bottom: 25px;">
					<label for="email">이메일</label><input type="email" class="form-control" id="email"
					                                     name="email" placeholder="이메일">
					<div id="EmailAlertholder"></div>
				</div>
				<div style="height: 60px; margin-bottom: 50px;">
					<label for="password">비밀번호</label><input type="password" class="form-control"
					                                         id="password" name="password" placeholder="비밀번호">
					<div id="PasswordAlertholder"></div>
				</div>
			</div>
			<div class="d-grid mb-3">
				<button type="submit" class="btn btn-dark" id="signIn">로그인</button>
			</div>
			
			<div class="d-grid mb-3">
				
				<button type="button" class="btn btn-dark" id="signUp"> 이메일로 회원가입</button>
			
			</div>
		
		</form>
	</div>
</div>
<script>
    $(() => {



        const joinForm = document.querySelector("#login-form"); /*회원가입 양식 폼 선택*/
        const EmailAlertholder = document.getElementById('EmailAlertholder'); /*경고창 위치 마커 선택*/
        const PasswordAlertholder = document.getElementById('PasswordAlertholder'); /*경고창 위치 마커 선택*/

        // 알림 메시지를 추가하는 함수입니다.
        const EmailappendAlert = (message, type) => {
            const wrapper = document.createElement('div'); /*wrapper선언하고 div만들기*/
            wrapper.innerHTML = [  /*wrapper 의 내용물(String 배열) 넣기*/`<div class="alert " role="alert">`,
                /*div 열고 wrapper 스타일 부트스트랩*/` <div>\${message}</div>`, /*wrapper에들어갈메세지*/'</div>'
                /*div닫기*/].join(''); /*위내용을 문자열로 바꾸기 */
            const alerts = EmailAlertholder.querySelectorAll('.alert');

            if (alerts.length >= 1) { EmailAlertholder.removeChild(alerts[0]); }

            EmailAlertholder.append(wrapper); /*Alert holder 에 써 넣기*/
            setTimeout(() => { wrapper.remove(); }, 2000);
        }
        const EmailappendAlert2 = (message, type) => {
            const wrapper = document.createElement('div'); /*wrapper선언하고 div만들기*/
            wrapper.innerHTML = [  /*wrapper 의 내용물(String 배열) 넣기*/`<div class="alert " role="alert">`,
                /*div 열고 wrapper 스타일 부트스트랩*/` <div>\${message}</div>`, /*wrapper에들어갈메세지*/'</div>'
                /*div닫기*/].join(''); /*위내용을 문자열로 바꾸기 */
            const alerts = EmailAlertholder.querySelectorAll('.alert');

            if (alerts.length >= 1) { EmailAlertholder.removeChild(alerts[0]); }

            EmailAlertholder.append(wrapper); /*Alert holder 에 써 넣기*/
            setTimeout(() => { wrapper.remove(); }, 2000);
        }

        const PasswordappendAlert = (message, type) => {
            const wrapper = document.createElement('div'); /*wrapper선언하고 div만들기*/
            wrapper.innerHTML = [  /*wrapper 의 내용물(String 배열) 넣기*/`<div class="alert " role="alert">`,
                /*div 열고 wrapper 스타일 부트스트랩*/` <div>\${message}</div>`, /*wrapper에들어갈메세지*/'</div>'
                /*div닫기*/].join(''); /*위내용을 문자열로 바꾸기 */
            const alerts = PasswordAlertholder.querySelectorAll('.alert');
            if (alerts.length >= 1) { PasswordAlertholder.removeChild(alerts[0]); }
            PasswordAlertholder.append(wrapper); /*Alert holder 에 써 넣기*/
            setTimeout(() => { wrapper.remove(); }, 2000);
        }
        const PasswordappendAlert2 = (message, type) => {
            const wrapper = document.createElement('div'); /*wrapper선언하고 div만들기*/
            wrapper.innerHTML = [  /*wrapper 의 내용물(String 배열) 넣기*/`<div class="alert " role="alert">`,
                /*div 열고 wrapper 스타일 부트스트랩*/` <div>\${message}</div>`, /*wrapper에들어갈메세지*/'</div>'
                /*div닫기*/].join(''); /*위내용을 문자열로 바꾸기 */
            const alerts = PasswordAlertholder.querySelectorAll('.alert');
            if (alerts.length >= 1) { PasswordAlertholder.removeChild(alerts[0]); }
            PasswordAlertholder.append(wrapper); /*Alert holder 에 써 넣기*/
            setTimeout(() => { wrapper.remove(); }, 2000);
        }



        $("#email").on("keydown", (e) => {
            if (typeof e.key !== "undefined") {
                if (e.key.toLowerCase() === 'enter') {
                    e.preventDefault();
                    $("#signIn").click();
                }
            }
        });


        $("#password").on("keydown", (e) => {
            if (typeof e.key !== "undefined") {
                if (e.key.toLowerCase() === 'enter') {
                    e.preventDefault();
                    $("#signIn").click();
                }
            }
        });



        $("#signIn").on("click", (e) => {

            // 이메일 미 입력시
            if ($("#email").val() === '') {
                EmailappendAlert('이메일를 입력하세요', 'success');
                e.preventDefault();
                return;
            }


            // 비밀번호 미 입력시
            if ($("#password").val() === '') {
                PasswordappendAlert('비밀번호를 입력하세요', 'success');
                e.preventDefault();
                return;
            }

        });









        $("#signUp").on("click", () => {
            window.location.href = "/user/join.do";
        });

        const loginFailMsg = '${loginFailMsg}';

        if (loginFailMsg === 'emailNotExist') {
            EmailappendAlert2('존재하지 않는 아이디입니다.', 'success');
        } else if (loginFailMsg === 'wrongPassword') {
            PasswordappendAlert2('잘못된 비밀번호입니다.', 'success');
        }

    });
</script>

</body>

</html>
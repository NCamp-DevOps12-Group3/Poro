
<%--
  Created by IntelliJ IDEA.
  User: BITCAMP
  Date: 24. 7. 26.
  Time: 오후 3:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.bundle.js"></script>
    <link href="${pageContext.request.contextPath}/static/css/login_join_changepassword.css" rel="stylesheet">
    <style>
        /* 컨테이너 스타일 */
        .container {
            height: 130vh;
        }

    </style>
</head>
<body>



<div class="container">

    <div class="card"><!-- 회원가입 양식 -->
        <p class="h5 card-title text-center">계정생성</p><!-- 회원가입 양식 텍스트 -->
        <p class="text-center" >이메일로 회원가입 하기</p><!-- 회원가입 양식 텍스트 -->
        <form  action="/user/join.do" id="join-form" method="post"><!-- 회원가입 양식 폼 -->
            <div class="mb-3"><!-- 회원가입 양식 입력창 -->
                <div style="height: 60px; margin-bottom: 70px;">닉네임
                    <input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임 ">
                    <button type="button" class="btn btn-outline-dark" id="nicknameChk">중복확인</button>
                    <div id="nicknameAlertholder"></div>
                </div>

                
                <div style="height: 60px; margin-bottom: 70px;">이름

                    <input type="text" class="form-control" id="name" name="name" placeholder="이름">
                    <button type="button" class="btn btn-outline-dark" id="nameChk">중복확인</button>
                    <div id="nameAlertholder"></div>
                </div>
                <div style="height: 60px; margin-bottom: 25px;">성별
                    <div class="types">
                        <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                            <input type="radio" class="btn-check" name="gender" id="gender-male" value="male" autocomplete="off" >
                            <label class="btn btn-outline-dark" for="gender-male">남성</label>

                            
                            <input type="radio" class="btn-check" name="gender" id="gender-female" value="female" autocomplete="off">

                            <label class="btn btn-outline-dark" for="gender-female">여성</label>
                        </div>
                    </div>
                    <div id="genderAlertholder"></div>
                </div>
                <div style="height: 60px; margin-bottom: 25px;">소속
                    <input type="text" class="form-control" id="job" name="job" placeholder="소속((예)학생,직장인,등... )">
                    <div id="JopAlertholder"></div>
                </div>


                <div style="height: 60px; margin-bottom: 25px;">전화번호
                    <input type="tel" class="form-control" id="phonenumber" name="phonenumber" pattern="\d{3}\d{4}\d{4}" placeholder="000-0000-0000 -없이입력" required>
                    <div id="TelAlertholder"></div>
                </div>
                <div style="height: 60px; margin-bottom: 70px;">이메일
                    <input type="email" class="form-control" id="email" name="email" placeholder="이메일">
                    <button type="button" class="btn btn-outline-dark" id="emailChk">중복확인</button>
                    <div id="EmailAlertholder"></div>
                </div>
                <div style="height: 60px; margin-bottom: 50px;">비밀번호
                    <input type="password" class="form-control" id="password" name="password" placeholder="특수문자, 숫자, 영문자 조합의 8자리 이상">
                    <div id="PasswordAlertholder"></div>
                </div>
                <div style="height: 60px; margin-bottom: 25px;">비밀번호 확인
                    <input type="password" class="form-control" id="passwordChk" name="passwordChk" placeholder="비밀번호 확인 ">
                    <div id="PasswordChkAlertholder"></div>
                </div>

                <div style="height: 60px; margin-bottom: 40px;">
                    <div class="types" style="text-align: center;">

                        <br>
                        <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                            <input type="radio" class="btn-check" name="role" id="individualuser" value="COMMON"
                                   autocomplete="off" >
                            <label class="btn btn-outline-dark" for="individualuser">개인 사용자</label>

                            
                            
                            
                            <input type="radio" class="btn-check" name="role" id="corporateusers" value="COMPANY"

                                   autocomplete="off">
                            <label class="btn btn-outline-dark" for="corporateusers">기업 사용자</label>

                        </div>
                    </div>
                    <div id="UserAlertholder"></div>
                </div>
            </div>
            <div class="d-grid mb-3"><!-- 회원가입 양식 텍스트 보내기버튼 -->
                <button type="submit" class="btn btn-dark" id="signUp">회원가입</button>
            </div>
        </form>

    </div>
</div>
<script>
    $(()=>{
        // 사용자의 정보를 저장할 객체를 생성합니다.

        // HTML 요소를 선택합니다.
        const anickname = document.querySelector("input[name='nickname']"); /*닉네임 선택*/
        const aname = document.querySelector("input[name='name']"); /*닉네임 선택*/
        const agender = document.querySelector("input[name='gender']"); /*닉네임 선택*/
        const aTel = document.querySelector("input[name='phonenumber']"); /*전화번호 선택*/
        const aemail = document.querySelector("input[name='email']"); /*이메일 선택*/
        const apassword = document.querySelector("input[name='password']"); /*비밀번호 선택*/
        const apasswordchk = document.querySelector("input[name='passwordChk']"); /*비밀번호 확인 선택*/
        const joinform = document.querySelector("#join-form"); /*회원가입 양식 폼 선택*/
        const nicknameAlertholder = document.getElementById('nicknameAlertholder'); /*경고창 위치 마커 선택*/
        const nameAlertholder = document.getElementById('nameAlertholder'); /*경고창 위치 마커 선택*/
        const GenderAlertholder = document.getElementById('genderAlertholder');
        const JobAlertholder = document.getElementById('JobAlertholder');
        const EmailAlertholder = document.getElementById('EmailAlertholder'); /*경고창 위치 마커 선택*/
        const PasswordAlertholder = document.getElementById('PasswordAlertholder'); /*경고창 위치 마커 선택*/
        const PasswordChkAlertholder = document.getElementById('PasswordChkAlertholder'); /*경고창 위치 마커 선택*/
        const UserAlertholder = document.getElementById('UserAlertholder'); /*경고창 위치 마커 선택*/


        // 알림 메시지를 추가하는 함수입니다.
        const nicknameappendAlert = (message, type) => {
            const wrapper = document.createElement('div'); /*wrapper선언하고 div만들기*/
            wrapper.innerHTML = [  /*wrapper 의 내용물(String 배열) 넣기*/`<div class="alert " role="alert">`,
                /*div 열고 wrapper 스타일 부트스트랩*/` <div>\${message}</div>`, /*wrapper에들어갈메세지*/'</div>'
                /*div닫기*/].join(''); /*위내용을 문자열로 바꾸기 */
            const alerts = nicknameAlertholder.querySelectorAll('.alert');
            if (alerts.length >= 1) {nicknameAlertholder.removeChild(alerts[0]);}
            nicknameAlertholder.append(wrapper); /*Alert holder 에 써 넣기*/
            setTimeout(() => { wrapper.remove();}, 5000);
        }

        const nameappendAlert = (message, type) => {
            const wrapper = document.createElement('div'); /*wrapper선언하고 div만들기*/
            wrapper.innerHTML = [  /*wrapper 의 내용물(String 배열) 넣기*/`<div class="alert " role="alert">`,
                /*div 열고 wrapper 스타일 부트스트랩*/` <div>\${message}</div>`, /*wrapper에들어갈메세지*/'</div>'
                /*div닫기*/].join(''); /*위내용을 문자열로 바꾸기 */
            const alerts = nameAlertholder.querySelectorAll('.alert');
            if (alerts.length >= 1) {nameAlertholder.removeChild(alerts[0]);}
            nameAlertholder.append(wrapper); /*Alert holder 에 써 넣기*/
            setTimeout(() => { wrapper.remove();}, 1000);
        }

        const GenderappendAlert = (message, type) => {
            const wrapper = document.createElement('div'); /*wrapper선언하고 div만들기*/
            wrapper.innerHTML = [  /*wrapper 의 내용물(String 배열) 넣기*/`<div class="alert " role="alert">`,
                /*div 열고 wrapper 스타일 부트스트랩*/` <div>\${message}</div>`, /*wrapper에들어갈메세지*/'</div>'
                /*div닫기*/].join(''); /*위내용을 문자열로 바꾸기 */
            const alerts = GenderAlertholder.querySelectorAll('.alert');
            if (alerts.length >= 1) {GenderAlertholder.removeChild(alerts[0]);}
            GenderAlertholder.append(wrapper); /*Alert holder 에 써 넣기*/
            setTimeout(() => { wrapper.remove();}, 1000);
        }



        const TelappendAlert = (message, type) => {
            const wrapper = document.createElement('div'); /*wrapper선언하고 div만들기*/
            wrapper.innerHTML = [  /*wrapper 의 내용물(String 배열) 넣기*/`<div class="alert " role="alert">`,
                /*div 열고 wrapper 스타일 부트스트랩*/` <div>\${message}</div>`, /*wrapper에들어갈메세지*/'</div>'
                /*div닫기*/].join(''); /*위내용을 문자열로 바꾸기 */
            const alerts = TelAlertholder.querySelectorAll('.alert');
            if (alerts.length >= 1) {TelAlertholder.removeChild(alerts[0]);}
            TelAlertholder.append(wrapper); /*Alert holder 에 써 넣기*/
            setTimeout(() => { wrapper.remove();}, 1000);
        }

        const EmailappendAlert = (message, type) => {
            const wrapper = document.createElement('div'); /*wrapper선언하고 div만들기*/
            wrapper.innerHTML = [  /*wrapper 의 내용물(String 배열) 넣기*/`<div class="alert " role="alert">`,
                /*div 열고 wrapper 스타일 부트스트랩*/` <div>\${message}</div>`, /*wrapper에들어갈메세지*/'</div>'
                /*div닫기*/].join(''); /*위내용을 문자열로 바꾸기 */
            const alerts = EmailAlertholder.querySelectorAll('.alert');
            if (alerts.length >= 1) {EmailAlertholder.removeChild(alerts[0]);}
            EmailAlertholder.append(wrapper); /*Alert holder 에 써 넣기*/
            setTimeout(() => { wrapper.remove();}, 1000);
        }

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

        const PasswordChkappendAlert = (message, type) => {
            const wrapper = document.createElement('div'); /*wrapper선언하고 div만들기*/
            wrapper.innerHTML = [  /*wrapper 의 내용물(String 배열) 넣기*/`<div class="alert " role="alert">`,
                /*div 열고 wrapper 스타일 부트스트랩*/` <div>\${message}</div>`, /*wrapper에들어갈메세지*/'</div>'
                /*div닫기*/].join(''); /*위내용을 문자열로 바꾸기 */
            const alerts = PasswordChkAlertholder.querySelectorAll('.alert');
            if (alerts.length >= 1) {PasswordChkAlertholder.removeChild(alerts[0]);}
            PasswordChkAlertholder.append(wrapper); /*Alert holder 에 써 넣기*/
            setTimeout(() => { wrapper.remove();}, 1000);
        }

        const UserappendAlert = (message, type) => {
            const wrapper = document.createElement('div'); /*wrapper선언하고 div만들기*/
            wrapper.innerHTML = [  /*wrapper 의 내용물(String 배열) 넣기*/`<div class="alert " role="alert">`,
                /*div 열고 wrapper 스타일 부트스트랩*/` <div>\${message}</div>`, /*wrapper에들어갈메세지*/'</div>'
                /*div닫기*/].join(''); /*위내용을 문자열로 바꾸기 */
            const alerts = UserAlertholder.querySelectorAll('.alert');
            if (alerts.length >= 1) {UserAlertholder.removeChild(alerts[0]);}
            UserAlertholder.append(wrapper); /*Alert holder 에 써 넣기*/
            setTimeout(() => { wrapper.remove();}, 1000);
        }

        
        
        
        let nicknameValidation = false; // 이름 유효성 검사를 위한 변수입니다.
        // 이름 입력란에 조건을 만족못하고  포커스를 잃었을 때 발생하는 이벤트입니다.

        anickname.addEventListener("blur", (e) => {
            console.log(e.target.value);
            if(e.target.value === "") {
                nicknameappendAlert('닉네임을 입력 해주세요.', 'success');
                nicknameValidation = false;
                return;
            }
            nicknameValidation = true;
        });

        let nameValidation = false; // 이름 유효성 검사를 위한 변수입니다.
        // 이름 입력란에 조건을 만족못하고  포커스를 잃었을 때 발생하는 이벤트입니다.
        aname.addEventListener("blur", (e) => {
            console.log(e.target.value);
            if(e.target.value === "") {
                nameappendAlert('이름을 입력 해주세요.', 'success');
                nameValidation = false;
                return;
            }
            nameValidation = true;
        });

        let TelValidation = false;
        // 전화번호 입력란에 조건을 만족못하고 포커스를 잃었을 때 발생하는 이벤트입니다.
        aTel.addEventListener("blur", (e) => {
            console.log(e.target.value);
            if(e.target.value.length < 11 || e.target.value.length > 11) {
                TelappendAlert('전화번호를 제대로입력해주세요.', 'success');
                TelValidation = false;
                return;
            }
            TelValidation = true;
        });

        let emailValidation = false;
        // 이메일 입력란에 조건을 만족못하고 포커스를 잃었을 때 발생하는 이벤트입니다.
        aemail.addEventListener("blur", (e) => {
            console.log(e.target.value);
            // 이메일 형식을 확인하는 정규 표현식
            const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

            if (!emailPattern.test(e.target.value)) {
                EmailappendAlert('올바른 이메일 형식을 입력해주세요.', 'success');
                emailValidation = false;
                return;
            }

            emailValidation = true;
        });

        let passwordValidation = false; // 비밀번호 유효성 검사를 위한 변수입니다.

        // 비밀번호 입력란에 조건을 만족못하고 포커스를 잃었을 때 발생하는 이벤트입니다.
        apassword.addEventListener("blur", (e) => {
            let reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-])(?=.*[0-9]).{8,15}$/;
            if(!reg.test(e.target.value)) {
                PasswordappendAlert('비밀번호는 특수문자, 숫자, 영문자 조합의 8자리 이상으로 지정하세요.', 'success');
                passwordValidation = false;
                return;
            }
            passwordValidation = true;
        });
        let passwordChkValidation = false; // 비밀번호 유효성 검사를 위한 변수입니다.
        // 비밀번호 확인 입력란에 조건을 만족못하고 포커스를 잃었을 때 발생하는 이벤트입니다.
        apasswordchk.addEventListener("blur", (e) => {
            console.log(e.target.value);
            if($("#password").val() !== $("#passwordChk").val()) {
                PasswordChkappendAlert('비밀번호가 비밀번호확인과 일치하지 않습니다.', 'success');
                passwordChkValidation = false;
                return;
            }
            passwordChkValidation = true;
        });
        
        let emailCheck = false;
        // ajax를 통한 email 중복체크
        $("#emailChk").on("click", (e) => {
            console.log($("#join-form").serialize());
            // 중복체크 버튼 클릭 시 email값이 비어 있으면
            if($("#email").val() === "") {
                EmailappendAlert('아이디를 입력하세요.', 'success');
                $("#email").focus();
                return;
            }

            // ajax를 이용해서 백엔드와 비동기 통신
            $.ajax({
                url: "/user/emailCheck.do",
                type: "post",
                data: $("#join-form").serialize(),

                success: (obj1) => {
                    
                    // Json String을 Json Object로 변경
                    const jsonObj1 = JSON.parse(obj1);
                    
                    console.log(obj1);
                    console.log(jsonObj1);
                    
                    if(jsonObj1.emailCheckMsg === 'emailOk') {
                        if(confirm(`사용가능한 이메일입니다. \${\$("#email").val()}를 사용하시겠습니까?`)) {
                            emailCheck = true;
                            $("#emailChk").attr("disabled", true);
                        }
                        return;
                    }
                    
                    EmailappendAlert("중복된 이메일입니다.", 'success');
                    emailCheck = false;
                    $("#email").focus();

                    // if(obj === 'usernameOk') {
                    //     alert("사용가능한 아이디입니다.");
                    // } else {
                    //     alert("중복된 아이디입니다.");
                    // }
                },
                error: (err) => {
                    console.log(err);
                }
            });
        });

        // 중복체크 후에 아이디 값이 변경되면 다시 중복체크 버튼을 활성화
        $("#email").on("change", (e) => {
            emailCheck = false;
            $("#emailChk").attr("disabled", false);
        });

        
        // ---------------------------------------------------------------------------------------------
        let nicknameCheck = false;
        $("#nicknameChk").on("click", (e) => {
            console.log($("#join-form").serialize());
            // 중복체크 버튼 클릭 시 email값이 비어 있으면
            if($("#nickname").val() === "") {
                nicknameappendAlert('닉네임를 입력하세요.', 'success');
                $("#nickname").focus();
                return;
            }
            
            // ajax를 이용해서 백엔드와 비동기 통신
            $.ajax({
                url: "/user/nicknameCheck.do",
                type: "post",
                data: $("#join-form").serialize(),
                success: (obj2) => {
                    
                    // Json String을 Json Object로 변경
                    const jsonObj2 = JSON.parse(obj2);
                    
                    console.log(obj2);
                    console.log(jsonObj2);
                    
                    if(jsonObj2.nicknameCheckMsg === 'nicknameOk') {
                        if(confirm(`사용가능한 닉네임입니다. \${\$("#nickname").val()}를 사용하시겠습니까?`)) {
                            nicknameCheck = true;
                            $("#nicknameChk").attr("disabled", true);
                        }
                        return;
                    }
                    
                    nicknameappendAlert('중복된 닉네임 입니다.', 'success');
                    nicknameCheck = false;
                    $("#nickname").focus();
                    // if(obj === 'usernameOk') {
                    //     alert("사용가능한 아이디입니다.");
                    // } else {
                    //     alert("중복된 아이디입니다.");
                    // }
                },
                error: (err) => {
                    console.log(err);
                }
            });
        });
        
        // 중복체크 후에 아이디 값이 변경되면 다시 중복체크 버튼을 활성화
        $("#nickname").on("change", (e) => {
            nicknameCheck = false;
            $("#nicknameChk").attr("disabled", false);
        });
        
        
        
        
        
        // ------------------------------------------------------------------------------------------------
        let nameCheck = false;
        $("#nameChk").on("click", (e) => {
            console.log($("#join-form").serialize());
            // 중복체크 버튼 클릭 시 email값이 비어 있으면
            if($("#name").val() === "") {
                nameappendAlert('이름을 입력하세요.', 'success');
                $("#name").focus();
                return;
            }
            
            // ajax를 이용해서 백엔드와 비동기 통신
            $.ajax({
                url: "/user/nameCheck.do",
                type: "post",
                data: $("#join-form").serialize(),
                success: (obj) => {
                    
                    // Json String을 Json Object로 변경
                    const jsonObj = JSON.parse(obj);
                    
                    console.log(obj);
                    console.log(jsonObj);
                    
                    if(jsonObj.nameCheckMsg === 'nameOk') {
                        if(confirm(`사용가능한 이름입니다. \${\$("#name").val()}를 사용하시겠습니까?`)) {
                            nameCheck = true;
                            $("#nameChk").attr("disabled", true);
                        }
                        return;
                    }
                    
                    nameappendAlert('중복된 이름입니다.', 'success');
                    nameCheck = false;
                    $("#name").focus();
                    // if(obj === 'usernameOk') {
                    //     alert("사용가능한 아이디입니다.");
                    // } else {
                    //     alert("중복된 아이디입니다.");
                    // }
                },
                error: (err) => {
                    console.log(err);
                }
            });
        });
        
        // 중복체크 후에 아이디 값이 변경되면 다시 중복체크 버튼을 활성화
        $("#name").on("change", (e) => {
            nameCheck = false;
            $("#nameChk").attr("disabled", false);
        });
        
        
        // 조건을 만족못하고 회원가입 버튼 클릭 시 발생하는 이벤트입니다.
        $("#signUp").on("click", (e) => {
            // 닉네임 미 입력시
            if($("#nickname").val() === '') {
                nicknameappendAlert('닉네임을 입력하세요', 'success');
                e.preventDefault();
                return;
            }



            if($("#name").val() === '') {
                nameappendAlert('이름을 입력하세요', 'success');
                e.preventDefault();
                return;
            }






            //성별미입력시
            let genderTypeCtn = 0;

            $("input[name='gender']").each(function() {
                console.log($("input[name='gender']").is(":checked"));
                if($(this).is(":checked")) {

                    genderTypeCtn++;
                }
            });

            if(genderTypeCtn === 0) {
                GenderappendAlert('성별 유형을 지정해주세요.', 'success');
                e.preventDefault();
                return;
            }


            // 전화번호 미 입력시
            if($("#tel").val() === '') {
                TelappendAlert('전화번호를 입력하세요', 'success');
                e.preventDefault();
                return;
            }

            // 이메일 미 입력시
            if($("#email").val() === '') {
                EmailappendAlert('이메일를 입력하세요', 'success');
                e.preventDefault();
                return;
            }


            // 비밀번호 미 입력시
            if($("#password").val() === '') {
                PasswordappendAlert('비밀번호를 입력하세요', 'success');
                e.preventDefault();
                return;
            }
            // 비밀번호확인 미 입력시
            if($("#passwordChk").val() === '') {
                PasswordChkappendAlert('비밀번호확인을  입력하세요', 'success');
                e.preventDefault();
                return;
            }
            //비밀번호와 비밀번호확인 불일치시
            if($("#password").val() !== $("#passwordChk").val()) {
                PasswordChkappendAlert('비밀번호가 일치하지 않습니다.', 'success');
                e.preventDefault();
                return;
            }





            let userTypeCtn = 0;

            $("input[name='role']").each(function() {
                console.log($("input[name='role']").is(":checked"));
                if($(this).is(":checked")) {
                    userTypeCtn++;
                }
            });

            if(userTypeCtn === 0) {
                UserappendAlert('사용자 유형을 지정해주세요.', 'success');
                e.preventDefault();
                return;
            }







            //로그인으로이동
           
        });
    });
</script>

</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: BITCAMP
  Date: 24. 7. 26.
  Time: 오후 3:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/modal-main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/add-main.css">
    <style>

        .content {
            padding: 20px;
            margin-left: 30vw;
            height: 100vh;
        }
        .content-item {
            background-color: white;
            padding: 20px;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            width: 30vw;
            height: 50vh;
            position: relative;
        }

        .viewAll {
            text-decoration: none;
            /* 밑줄 제거 */
            color: black;
            /* 기본 텍스트 색상 설정 */
        }

        .viewAll:visited {
            color: black;
        }

        #recommendItemContent {
            cursor: pointer;
        }

        .bookmark-path.filled {
            fill: red;
            stroke: none;
            /* 원하는 색상으로 설정 */
        }

        .modal-comment.reply{
            width: 95%;
            margin: 5px;
            margin-left: 55px;
        }

        .reply-box{
            flex-direction: column;
            margin-left: 40px;
        }

        .reply-view{
            cursor: pointer;
        }

        .reply-btn{
            cursor : pointer;
        }

        .hidden{
            display: none;
        }

        .modal-comment-like-logo-wrapper{
            cursor : pointer;
        }

        .modal-portfolio-like-logo-wrapper{
            cursor : pointer;
        }

        .bi-three-dots{
            cursor : pointer;
        }
    </style>
</head>
<body>
<div class="container-content d-flex align-items-start">
    <jsp:include page="${pageContext.request.contextPath}/sidebar.jsp"></jsp:include>

    <div class="content d-flex flex-column" id="main-content">
        <div class="base-sector" id="baseContentSector">
            <div class="base-sector-personal">
                <div class="base-sector-personal-title">
                    <div class="portfolio-container-wrapper" , id="portfolioContainerWrapper">
                        <div class="portfolio-item" id="portfolioContainer">
                            <form id="page-form" action="/main/main.do" method="post">
                                <input type="hidden" name="pageNum" value="${page.mainCri.pageNum}">
                                <input type="hidden" name="amount" value="${page.mainCri.amount}">
                                <input type="hidden" name="endPage" value="${page.endPage}">
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <div class="recommend d-flex flex-column"
         style="display: flex; flex-direction: column; margin-top: 12vh; margin-left : 5vw;">

        <div class="recomment-description" style="display : flex; font-size: 0.8rem; margin:10px;
                        justify-content:space-between; width:15vw;">
            <strong>회원님을 위한 추천공고</strong>
            <a href="mini_project(company).html" class="viewAll"><strong>모두보기</strong></a>
        </div>

        <div class="recommend-item" style="display:flex; align-items: center; margin-top : 5px;">
            <a href="userfeeds.html">
                <div class="recommend-item-logo" style="background-image : url('${pageContext.request.contextPath}/static/img/이모티콘/6.png'); background-size:cover;
                        width:3vw; height:2vh; margin : 10px; ">
                </div>
            </a>
            <div class=" recommend-item-content" style="display:flex; flex-direction : column; padding-left :2px;"
                 id="recommendItemContent">
                <div class="recommend-item-content-tit"
                     style="font-size:0.8rem; color:gray; display:flex; align-items:center;">
                    웹개발자(PHP/JAVA/프론트) 경력
                </div>
                <div class="recommend-item-content-corp"
                     style="font-size:0.8rem; color:gray; display:flex; align-items:center;">
                    <div style="background-image : url('${pageContext.request.contextPath}/static/img/이모티콘/1.png') ; width:15px; height : 15px;
                            background-size : cover; margin-right : 3px;"></div>
                    서울전체 외 / 2년.초대졸
                    <div style="background-image : url('${pageContext.request.contextPath}/static/img/이모티콘/2.png') ; width:10px; height : 10px;
                            background-size : cover; margin-left : 3px;"></div>
                </div>
            </div>
            <div class="recommend-item-bookmark" style="margin:10px; cursor: pointer;">
                <svg xmlns= "http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"
                     class="bi bi-bookmark" viewBox="0 0 16 16">
                    <path
                            d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1z" />
                </svg>

                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"
                     class="bi bi-bookmark-fill" viewBox="0 0 16 16" style="display:none;">
                    <path
                            d="M2 2v13.5a.5.5 0 0 0 .74.439L8 13.069l5.26 2.87A.5.5 0 0 0 14 15.5V2a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2" />
                </svg>

            </div>
        </div>

        <div class="recommend-item" style="display:flex; align-items: center; margin-top : 5px;">
            <div class="recommend-item-logo" style="background-image : url('${pageContext.request.contextPath}/static/img/이모티콘/7.png'); background-size:cover;
                    width:3vw; height:2vh; margin : 10px; ">
            </div>
            <div class=" recommend-item-content" style="display:flex; flex-direction : column; padding-left :2px;">
                <div class="recommend-item-content-tit"
                     style="font-size:0.8rem; color:gray; display:flex; align-items:center;">
                    웹개발자(PHP/JAVA/프론트) 경력
                </div>
                <div class="recommend-item-content-corp"
                     style="font-size:0.8rem; color:gray; display:flex; align-items:center;">
                    <div style="background-image : url('${pageContext.request.contextPath}/static/img/이모티콘/1.png') ; width:15px; height : 15px;
                            background-size : cover; margin-right : 3px;"></div>
                    서울전체 외 / 2년.초대졸
                    <div style="background-image : url('${pageContext.request.contextPath}/static/img/이모티콘/2.png') ; width:10px; height : 10px;
                            background-size : cover; margin-left : 3px;"></div>
                </div>
            </div>
            <div class="recommend-item-bookmark" style="margin:10px;">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" class="bi bi-bookmark"
                     viewBox="0 0 16 16">
                    <path
                            d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1z" />
                </svg>
            </div>
        </div>

        <div class="recommend-item" style="display:flex; align-items: center; margin-top : 5px;">
            <div class="recommend-item-logo-wrapper"
                 style="width:3vw; height:2vh; display:flex; justify-content:center; margin:10px;">
                <div class="recommend-item-logo" style="background-image : url('${pageContext.request.contextPath}/static/img/이모티콘/8.png'); background-size:cover;
                        background-repeat: no-repeat; width:100%; height:100%;">
                </div>
            </div>
            <div class=" recommend-item-content" style="display:flex; flex-direction : column; padding-left :2px;">
                <div class="recommend-item-content-tit"
                     style="font-size:0.8rem; color:gray; display:flex; align-items:center;">
                    웹개발자(PHP/JAVA/프론트) 경력
                </div>
                <div class="recommend-item-content-corp"
                     style="font-size:0.8rem; color:gray; display:flex; align-items:center;">
                    <div style="background-image : url('${pageContext.request.contextPath}/static/img/이모티콘/1.png') ; width:15px; height : 15px;
                            background-size : cover; margin-right : 3px;"></div>
                    서울전체 외 / 2년.초대졸
                    <div style="background-image : url('${pageContext.request.contextPath}/static/img/이모티콘/2.png') ; width:10px; height : 10px;
                            background-size : cover; margin-left : 3px;"></div>
                </div>
            </div>
            <div class="recommend-item-bookmark" style="margin:10px;">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"
                     class="bi bi-bookmark" viewBox="0 0 16 16">
                    <path
                            d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1z" />
                </svg>
            </div>
        </div>

        <div class="recommend-item" style="display:flex; align-items: center; margin-top : 5px;">
            <div class="recommend-item-logo-wrapper"
                 style="width:3vw; height:2vh; display:flex; justify-content:center; margin:10px;">
                <div class="recommend-item-logo" style="background-image : url('${pageContext.request.contextPath}/static/img/이모티콘/9.png'); background-size:cover;
                        background-repeat: no-repeat; width:100%; height:100%;">
                </div>
            </div>
            <div class=" recommend-item-content" style="display:flex; flex-direction : column; padding-left :2px;">
                <div class="recommend-item-content-tit"
                     style="font-size:0.8rem; color:gray; display:flex; align-items:center;">
                    웹개발자(PHP/JAVA/프론트) 경력
                </div>
                <div class="recommend-item-content-corp"
                     style="font-size:0.8rem; color:gray; display:flex; align-items:center;">
                    <div style="background-image : url('${pageContext.request.contextPath}/static/img/이모티콘/1.png') ; width:15px; height : 15px;
                            background-size : cover; margin-right : 3px;"></div>
                    서울전체 외 / 2년.초대졸
                    <div style="background-image : url('${pageContext.request.contextPath}/static/img/이모티콘/2.png') ; width:10px; height : 10px;
                            background-size : cover; margin-left : 3px;"></div>
                </div>
            </div>
            <div class="recommend-item-bookmark" style="margin:10px;">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"
                     class="bi bi-bookmark" viewBox="0 0 16 16">
                    <path
                            d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1z" />
                </svg>
            </div>
        </div>

        <div class="recommend-item" style="display:flex; align-items: center; margin-top : 5px;">
            <div class="recommend-item-logo-wrapper"
                 style="width:3vw; height:2vh; display:flex; justify-content:center; margin:10px;">
                <div class="recommend-item-logo" style="background-image : url('${pageContext.request.contextPath}/static/img/이모티콘/11.png'); background-size:cover;
                        background-repeat: no-repeat; width:100%; height:100%;">
                </div>
            </div>
            <div class=" recommend-item-content" style="display:flex; flex-direction : column; padding-left :2px;">
                <div class="recommend-item-content-tit"
                     style="font-size:0.8rem; color:gray; display:flex; align-items:center;">
                    웹개발자(PHP/JAVA/프론트) 경력
                </div>
                <div class="recommend-item-content-corp"
                     style="font-size:0.8rem; color:gray; display:flex; align-items:center;">
                    <div style="background-image : url('${pageContext.request.contextPath}/static/img/이모티콘/1.png') ; width:15px; height : 15px;
                            background-size : cover; margin-right : 3px;"></div>
                    서울전체 외 / 2년.초대졸
                    <div style="background-image : url('${pageContext.request.contextPath}/static/img/이모티콘/2.png') ; width:10px; height : 10px;
                            background-size : cover; margin-left : 3px;"></div>
                </div>
            </div>
            <div class="recommend-item-bookmark" style="margin:10px;">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"
                     class="bi bi-bookmark" viewBox="0 0 16 16">
                    <path
                            d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1z" />
                </svg>
            </div>
        </div>
    </div>


</div>



<script>
    document.addEventListener('DOMContentLoaded', function () {

        $.ajax({
            url: '/main/main-ajax.do',
            type: 'post',
            data: $("#page-form").serialize(),
            success: (obj) => {
                console.log("ajax success")
                let htmlStr = "";
                for (let i = 0; i < obj.portfolioList.length; i++) {
                    htmlStr += `
                               <div class="content-item-wrapper" style="border-bottom: 1px solid gainsboro;">
                                   <form id="portfolioForm">
                                      <input type="hidden" name="portfolio_id" value="\${obj.portfolioList[i].portfolioDto.portfolio_id}">
                                   </form>
                                   <div class="content-item-header" style="padding: 5px; display: flex; align-items: center; padding-bottom: 10px; margin-top: 5px;">
                                       <div class="content-item-header-user-logo" style="background-image: url('/static/img/cat1.jpg'); display: flex; justify-content: center; align-items: center; height: 2vw; width: 2vw; border-radius: 50%; background-size: cover; flex-shrink: 0;"></div>
                                           <div class="content-item-header-main" style="display: flex; flex-direction: column; flex-grow: 1;">
                                               <div class="content-item-header-userid" style="font-size: 14px; margin-left: 10px;">
                                                   <strong>\${obj.portfolioList[i].portfolioDto.nickname}</strong> <strong style="color: gray;">1주전</strong>
                                               </div>
                                               <div class="content-item-header-content" style="font-size: 14px; margin-left: 10px;">
                                                   \${obj.portfolioList[i].portfolioDto.description}
                                               </div>
                                           </div>
                                   </div>
                                   <div class="content-item" style="background-image: url('\${obj.portfolioList[i].portfolioDto.thumbnail_url}'); background-size: cover; border-radius: 5px;"></div>
                                   <div class="content-item-footer" style="padding-top: 10px; display: flex; flex-direction: column;">
                                       <div class="content-item-footer-logos" style="margin: 1px;">
                                           <svg xmlns=" http://www.w3.org/2000/svg" width="24" height="24"
                                           fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16"
                                           style="margin-right : 3px;">
                                           <path
                                               d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.6 7.6 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
                                           </svg>
                                           <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                               fill="currentColor" class="bi bi-chat" viewBox="0 1 16 16"
                                               style="margin-right : 3px;">
                                               <path
                                                   d="M2.678 11.894a1 1 0 0 1 .287.801 11 11 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8 8 0 0 0 8 14c3.996 0 7-2.807 7-6s-3.004-6-7-6-7 2.808-7 6c0 1.468.617 2.83 1.678 3.894m-.493 3.905a22 22 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a10 10 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9 9 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105" />
                                           </svg>
                                           <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22"
                                               fill="currentColor" class="bi bi-bookmark" viewBox="0 0 16 16">
                                               <path
                                                   d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1z" />
                                           </svg>
                                       </div>
                                       <div class="content-item-footer-like" style="font-size: 0.8rem; margin: 1px;">
                                           <strong>좋아요 \${obj.portfolioList[i].portfolioDto.likeCount}개</strong>
                                       </div>
                                       <div class="content-item-footer-user" style="font-size: 0.8rem; margin: 1px;">
                                           <strong>\${obj.portfolioList[i].portfolioDto.nickname}: \${obj.portfolioList[i].portfolioDto.description}</strong>
                                       </div>
                                       <div class="content-item-footer-comment" style="font-size: 0.8rem; color: gray; margin: 1px;">
                                           <strong>댓글 \${obj.portfolioList[i].portfolioDto.commentCount}개 모두 보기</strong>
                                       </div>
                                       <div class="content-item-footer-postcomment" style="font-size: 0.8rem; color: gray; margin: 1px; margin-bottom: 10px;">
                                           <strong>댓글 달기</strong>
                                       </div>
                                   </div>
                               </div>
                               `;
                }
                $("#portfolioContainer").append(htmlStr);
            },
            error: (err) => {
                console.log(err);
            }
        });

        $(window).on("scroll", (e) => {

            // 현재 스크롤의 위치
            const scrollTop = $(window).scrollTop();
            // 브라우저의 세로길이(스크롤 길이는 포함되지 않음)
            const windowHeight = window.innerHeight;
            // 웹 문서의 세로 길이(스크롤 길이 포함됨)
            const documentHeight = document.documentElement.scrollHeight;
            // 스크롤이 바닥에 닿았는지 여부
            const isBottom = documentHeight <= scrollTop + windowHeight;

            if (isBottom) {

                // 현재 페이지의 번호가 마지막 페이지의 번호와 같으면 함수 종료
                if (parseInt($("input[name='pageNum']").val()) >= parseInt($("input[name='endPage']").val())) {
                    return;

                } else {
                    // 스크롤이 바닥에 닿으면 현재 페이지 번호 + 1
                    $("input[name='pageNum']").val(parseInt($("input[name='pageNum']").val()) + 1);

                    $.ajax({
                        url: '/main/main-ajax.do',
                        type: 'post',
                        data: $("#page-form").serialize(),
                        success: (obj) => {
                            console.log("ajax success")
                            let htmlStr = "";
                            for (let i = 0; i < obj.portfolioList.length; i++) {
                                htmlStr += `
                                            <div class="content-item-wrapper" style="border-bottom: 1px solid gainsboro;">
                                                <form id="portfolioForm">
                                                  <input type="hidden" name="portfolio_id" value="\${obj.portfolioList[i].portfolioDto.portfolio_id}">
                                                </form>
                                                <div class="content-item-header" style="padding: 5px; display: flex; align-items: center; padding-bottom: 10px; margin-top: 5px;">
                                                    <div class="content-item-header-user-logo" style="background-image: url('/static/img/cat1.jpg'); display: flex; justify-content: center; align-items: center; height: 2vw; width: 2vw; border-radius: 50%; background-size: cover; flex-shrink: 0;"></div>
                                                        <div class="content-item-header-main" style="display: flex; flex-direction: column; flex-grow: 1;">
                                                            <div class="content-item-header-userid" style="font-size: 14px; margin-left: 10px;">
                                                                <strong>\${obj.portfolioList[i].portfolioDto.nickname}</strong> <strong style="color: gray;">1주전</strong>
                                                            </div>
                                                            <div class="content-item-header-content" style="font-size: 14px; margin-left: 10px;">
                                                                \${obj.portfolioList[i].portfolioDto.description}
                                                            </div>
                                                        </div>
                                                </div>
                                                <div class="content-item" style="background-image: url('\${obj.portfolioList[i].portfolioDto.thumbnail_url}'); background-size: cover; border-radius: 5px;"></div>
                                                <div class="content-item-footer" style="padding-top: 10px; display: flex; flex-direction: column;">
                                                    <div class="content-item-footer-logos" style="margin: 1px;">
                                                        <!-- SVG icons -->
                                                    </div>
                                                    <div class="content-item-footer-like" style="font-size: 0.8rem; margin: 1px;">
                                                        <strong>좋아요 \${obj.portfolioList[i].portfolioDto.likeCount}개</strong>
                                                    </div>
                                                    <div class="content-item-footer-user" style="font-size: 0.8rem; margin: 1px;">
                                                        <strong>\${obj.portfolioList[i].portfolioDto.nickname}: \${obj.portfolioList[i].portfolioDto.description}</strong>
                                                    </div>
                                                    <div class="content-item-footer-comment" style="font-size: 0.8rem; color: gray; margin: 1px;">
                                                        <strong>댓글 \${obj.portfolioList[i].portfolioDto.commentCount}개 모두 보기</strong>
                                                    </div>
                                                    <div class="content-item-footer-postcomment" style="font-size: 0.8rem; color: gray; margin: 1px; margin-bottom: 10px;">
                                                        <strong>댓글 달기</strong>
                                                    </div>
                                                </div>
                                            </div>
                                            `;
                            }
                            $("#portfolioContainer").append(htmlStr);
                        },
                        error: (err) => {
                            console.log(err);
                        }
                    });
                }
            }
        });
    });

    // 이벤트 위임을 사용하여 .content-item 요소에 클릭 이벤트 설정
    document.getElementById('portfolioContainer').addEventListener('click', function(event) {
        if (event.target.classList.contains('content-item')) {
            const form = event.target.closest('.content-item-wrapper').querySelector('form');
            console.log($(form).serialize());
            $.ajax({
                url: '/main/modal-ajax.do',
                type: 'post',
                data: $(form).serialize(),
                success: (obj) => {
                    console.log(obj);
                    openModal(obj);
                },
                error: (err) => {
                    console.log(err);
                }
            });
        }
    });

</script>


<script>

    function openModal(obj){

        if(obj){

            console.log(obj);
            const portfolioHeartOutlineClass = obj.portfolio.liked ? 'hidden' : '';
            const portfolioHeartFilledClass = obj.portfolio.liked ? '' : 'hidden';

            const modalBox = document.createElement('div');
            modalBox.classList.add('modal-portfolio-overlay');
            modalBox.id = 'modalPortfolioOverlay';

            let htmlStr = `
                               <div class="modal-portfolio-overlay-bond" id="modalPortfolioOverlayBond">
                                   <div class="modal-portfolio" id="modalPortfolio">
                                       <div class="modal-portfolio-bond" id="modalPortfolioBond">

                                           <!-- iframe을 사용하여 콘텐츠 로드 -->
                                           <iframe class="modal-portfolio-iframe" id="modalPortfolioIframe"></iframe>

                                           <!--코멘트-->
                                           <div class="modal-comment-section" id="modalCommentSection">
                                               <div class="modal-comment-section-bond" id="modalCommentSectionBond">
                                                   <div class="modal-comment-content" id="modalCommentContent">
                                                       <div class="modal-comment-header" id="modalCommentHeader">
                                                           <div class="modal-comment-header-logo" id="modalCommentHeaderLogo"></div>
                                                           <div class="modal-comment-header-userId"> <strong>cat1</strong>
                                                           </div>
                                                           <form id="modalPortfolioForm" action="/main/delete-portfolio.do" method="post" style="margin-bottom : 0; margin-right : 10px; display : flex; align-items : center">
                                                                <input type="hidden" name="user_id" value="\${obj.portfolio.user_id}">
                                                                <input type="hidden" name="portfolio_id" value="\${obj.portfolio.portfolio_id}">
                                                                <button type="submit" id="hiddenSubmitBtn" style="display: none;"></button>
                                                                <div class="modal-comment-header-option" id="modalCommentHeaderOption">
                                                                   <div class="modal-comment-header-optionBtn" id="modalCommentHeaderOptionBtn">
                                                                       <svg aria-label="옵션 더 보기" class="x1lliihq x1n2onr6 x5n08af"
                                                                            fill="currentColor" height="24" role="img" viewBox="0 0 24 24"
                                                                            width="24">
                                                                           <title>옵션 더 보기</title>
                                                                           <circle cx="12" cy="12" r="1.5"></circle>
                                                                           <circle cx="6" cy="12" r="1.5"></circle>
                                                                           <circle cx="18" cy="12" r="1.5"></circle>
                                                                       </svg>
                                                                   </div>
                                                                </div>
                                                           </form>
                                                       </div>

                                                       <div class="modal-comment-main-box" id="modalCommentMain">
                                                           <!-- 여기에 코멘트 추가-->
                                                       </div>

                                                       <div class="modal-comment-footer" id="modalCommentFooter">

                                                           <div class="modal-likeCnt" id="modalLikeCnt">

                                                               <div class="modal-portfolio-like-logo" style="display:flex">
                                                                   <div class="modal-portfolio-like-logo-wrapper" >
                                                                        <form>
                                                                            <input type="hidden" name="isLiked" value = "\${obj.portfolio.liked}"/>
                                                                            <input type="hidden" name="portfolio_id" value = "\${obj.portfolio.portfolio_id}"/>
                                                                           <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="red"
                                                                               class="bi bi-suit-heart portfolio-like-logo \${portfolioHeartOutlineClass}" viewBox="0 0 16 16">
                                                                               <path
                                                                                   d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.6 7.6 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
                                                                           </svg>
                                                                           <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="red"
                                                                               class="bi bi-suit-heart-fill portfolio-like-logo \${portfolioHeartFilledClass}" viewBox="0 0 16 16">
                                                                               <path
                                                                                   d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1" />
                                                                           </svg>
                                                                        </form>
                                                                   </div>
                                                               </div>

                                                               <div class="modal-likeCnt-text" id="modalLikeCntText">
                                                                   <p> 좋아요 \${obj.portfolio.likeCount}</p>
                                                               </div>
                                                           </div>

                                                           <!--댓글 입력창-->
                                                           <div class="modal-leaveComment" id="modalLeaveComment">
                                                               <input type="text" id="modalCommentInput" class="form-control"
                                                                      autocomplete="off" placeholder="댓글을 입력하세요..."/>
                                                           </div>
                                                       </div>

                                                   </div>
                                               </div>
                                           </div>
                                       </div>
                                   </div>
                               </div>

                                <!-- 옵션 모달 (본인)-->
                                <div class="modal-options-overlay" id="modalOptionsOverlaySelf" style="display : none;>
                                    <div class="modal-options-overlay-bond">
                                        <div class="modal-options">
                                            <div class="modal-options-item" id="modalOptionsItemModify" data-bs-toggle="modal"
                                                 data-bs-target="#modifyModal">게시글 수정</div>
                                            <div class="modal-options-item" id="modalOptionsItemDelete" style="color:red">게시글 삭제</div>
                                            <div class="modal-options-item close" id="modalOptionsItemCancle">취소</div>
                                        </div>
                                    </div>
                                </div>

                                <!-- 옵션 모달 (타인)-->
                                <div class="modal-options-overlay" id="modalOptionsOverlayOther" style="display : none;>
                                    <div class="modal-options-overlay-bond">
                                        <div class="modal-options">
                                            <div class="modal-options-item" id="modalOptionsItemUser">계정</div>
                                            <div class="modal-options-item" id="modalOptionsItemReport" style="color:red">신고</div>
                                            <div class="modal-options-item close" id="modalOptionsItemCancle">취소</div>
                                        </div>
                                    </div>
                                </div>

                                <!-- 댓글 옵션 모달 (본인) -->
                                <div class="modal-comment-options-overlay" id="deleteCommentModal" style="display : none;">
                                    <div class="modal-comment-options-overlay-bond">
                                        <div class="modal-comment-options">
                                            <div class="modal-comment-options-item" id="deleteCommentBtn" style="color: red">삭제</div>
                                            <div class="modal-comment-options-item close" >취소</div>
                                        </div>
                                    </div>
                                </div>

                                <!-- 댓글 옵션 모달 (타인) -->
                                <div class="modal-comment-options-overlay" id="reportCommentModal" style="display : none;">
                                    <div class="modal-comment-options-overlay-bond">
                                        <div class="modal-comment-options">
                                            <div class="modal-comment-options-item" id="reportCommentBtn" style="color: red">신고</div>
                                            <div class="modal-comment-options-item close">취소</div>
                                        </div>
                                    </div>
                                </div>
                           `

            modalBox.innerHTML = htmlStr;
            document.body.appendChild(modalBox);

            let replymode = false;
            let comment_id = null;
            let curr_reply_box = null;
            let curr_comment_box = null;

            const iframe = document.getElementById('modalPortfolioIframe');

            if (iframe) {
                iframe.srcdoc = `\${obj.portfolio.mergeCode}`;
            }

            const modalCommentMain = document.getElementById('modalCommentMain');
            const modalCommentInput = document.getElementById('modalCommentInput');
            const modalCommentContent = document.getElementById('modalCommentContent');

            const modalOverlay = document.getElementById('modalPortfolioOverlay');
            const modalCommentSection = document.getElementById('modalCommentSection');
            const modalIframe = document.getElementById('modalPortfolioIframe');

            if (modalCommentMain) {
                // 먼저 댓글창 비우기
                modalCommentMain.innerHTML = '';

                // 제일 처음은 소개문
                const commentElement = `
                                        <div class="modal-comment">
                                            <div class="modal-comment-user-logo" style="background-image: url('/static/img/cat1.jpg');"></div>
                                            <div class="modal-comment-main">
                                                <div class="modal-comment-main-userid"><strong>cat1</strong></div>
                                                <div class="modal-comment-main-content">\${obj.portfolio.description}</div>
                                            </div>
                                        </div>
                                        `;
                modalCommentMain.insertAdjacentHTML('beforeend', commentElement);

                // 댓글 데이터 로드
                function renderComments(comments, container) {
                    comments.forEach(comment => {

                        console.log(comment);
                        const commentHeartOutlineClass = comment.liked ? 'hidden' : '';
                        const commentHeartFilledClass = comment.liked ? '' : 'hidden';

                        const commentBox = document.createElement('div');
                        commentBox.classList.add('comment-box');
                        container.appendChild(commentBox);

                        const commentElement = `
                            <form id="commentForm">
                                            <input type="hidden" name="comment_id" value="\${comment.comment_id}"/>
                                            <input type="hidden" name="nickname" value="\${comment.nickname}"/>
                                            <input type="hidden" name="user_id" value="\${comment.user_id}"/>
                            <div class="modal-comment">
                                <a href="">
                                    <div class="modal-comment-user-logo"
                                        style="background-image: url('/static/img/cat1.jpg');"></div>
                                </a>
                                <div class="modal-comment-wrapper" style="display : flex; width: 75%;">
                                    <div class="modal-comment-main">
                                        <div class="modal-comment-main-userid">
                                            <div style="margin-left:5px; font-weight: bold;" class="userId"><strong>\${comment.user_id}</strong>
                                            </div>
                                            <div style="margin-left:5px;">\${comment.content}</div>
                                        </div>
                                        <div class="modal-comment-main-content">
                                            <div style="color: gray;">1주</div>
                                            <div style="color: gray; margin-left : 10px">좋아요 \${comment.likeCount}개</div>
                                            <div class="reply-btn" style="color: gray; margin-left : 10px">답글 달기</div>
                                            <form>
                                                <input type="hidden" name="comment_id" value="\${comment.comment_id}"/>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots" style="margin-left : 10px;"  viewBox="0 -2 16 16">
                                                  <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3"/>
                                                </svg>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-comment-like-logo" style="display : flex; align-items : center">
                                    <div class="modal-comment-like-logo-wrapper">
                                        <form style="margin-bottom : 0; display : flex; align-items : center">
                                            <input type="hidden" name="isLiked" value = "\${comment.liked}"/>
                                            <input type="hidden" name="comment_id" value = "\${comment.comment_id}"/>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="red"
                                                class="bi bi-suit-heart comment-like-logo \${commentHeartOutlineClass}" viewBox="0 0 16 16">
                                                <path
                                                    d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.6 7.6 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
                                            </svg>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="red"
                                                class="bi bi-suit-heart-fill comment-like-logo \${commentHeartFilledClass}" viewBox="0 0 16 16">
                                                <path
                                                    d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1" />
                                            </svg>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            </form>
                        `;

                        commentBox.insertAdjacentHTML('beforeend', commentElement);

                        if (comment.replies && comment.replies.length > 0) {
                            commentBox.insertAdjacentHTML('beforeend', '<div class="reply-view" style="color : gainsboro;"> ---- 답글 보기 ---- </div>');
                            const replyBox = document.createElement('div');
                            replyBox.classList.add('reply-box');
                            replyBox.style.display = 'none';
                            commentBox.appendChild(replyBox);
                            renderComments(comment.replies, replyBox);  // 재귀 호출
                        }
                    });
                }
                renderComments(obj.commentList, modalCommentMain);

                // 코멘트창 메인핸들러 (모달 여닫을 시 이벤트리스너 초기화를 위해 익명함수가 아닌 실명함수 사용)
                function modalCommentContentHandler(event){

                    // 클릭된 요소가 딥글보기 인지 확인합니다.
                    if (event.target.classList.contains('reply-view')) {
                        const replyBox = event.target.closest('.comment-box').querySelector('.reply-box');
                        if (replyBox) {
                            replyBox.style.display = replyBox.style.display === 'none' ? 'flex' : 'none';
                        }
                    }

                    // 클릭된 요소가 답글달기 인지 확인합니다.
                    if (event.target.classList.contains('reply-btn')){
                        curr_comment_box = event.target.closest('.comment-box');
                        curr_reply_box = curr_comment_box.querySelector('.reply-box');
                        if(!curr_reply_box){
                            curr_reply_box = event.target.closest('.reply-box');
                        }

                        replymode = true;
                        const modalCommentInput = document.getElementById('modalCommentInput');
                        modalCommentInput.focus();
                        const commentForm = event.target.closest('.comment-box').querySelector('form');
                        comment_id = commentForm.querySelector('input[name="comment_id"]').value;
                    }

                    // 클릭된 요소가 댓글창인지 확인합니다.
                    if (event.target.classList.contains('form-control')){
                        replymode = false;
                        comment_id = 0;
                    }

                    // 클릭된 요소가 댓글 좋아요 인지 확인합니다.
                    if (event.target.closest('.modal-comment-like-logo-wrapper')){

                        const commentLikeForm = event.target.closest('form');
                        const input = commentLikeForm.querySelector('input[name="isLiked"]');
                        console.log(input);

                        $.ajax({
                            url: '/main/comment-like-ajax.do',
                            type: 'post',
                            data: $(commentLikeForm).serialize(),
                            success: (obj) => {
                                input.value = input.value === 'false' ? 'true' : 'false';
                                const heartOutline = event.target.closest('.modal-comment-like-logo-wrapper').querySelector('.bi-suit-heart');
                                const heartFilled = event.target.closest('.modal-comment-like-logo-wrapper').querySelector('.bi-suit-heart-fill');
                                heartOutline.classList.toggle('hidden');
                                heartFilled.classList.toggle('hidden');
                            },
                            error: (err) => {
                                console.log(err);
                            }
                        });
                    }

                    // 클릭된 요소가 게시글 좋아요인지 확인합니다.
                    if (event.target.closest('.modal-portfolio-like-logo-wrapper')){

                        const portfolioLikeForm = event.target.closest('form');
                        const input = portfolioLikeForm.querySelector('input[name="isLiked"]');

                        $.ajax({
                            url: '/main/portfolio-like-ajax.do',
                            type: 'post',
                            data: $(portfolioLikeForm).serialize(),
                            success: (obj) => {
                                input.value = input.value === 'false' ? 'true' : 'false';
                                const heartOutline2 = event.target.closest('.modal-portfolio-like-logo-wrapper').querySelector('.bi-suit-heart');
                                const heartFilled2 = event.target.closest('.modal-portfolio-like-logo-wrapper').querySelector('.bi-suit-heart-fill');
                                heartOutline2.classList.toggle('hidden');
                                heartFilled2.classList.toggle('hidden');
                            },
                            error: (err) => {
                                console.log(err);
                            }
                        });
                    }

                    // 클릭된 요소가 댓글 옵션창 인지 확인합니다.
                    if(event.target.closest('.bi-three-dots')){

                        const commentUserId = event.target.closest('#commentForm').querySelector('input[name="user_id"]').value;

                        // 댓글 작성자와 사용자의 일치여부에 따라 다른 옵션창
                        openCommentOptions( commentUserId , ${loginUser.user_id});

                        const deleteCommentForm = event.target.closest('form');
                        const deleteCommentBtn = document.getElementById('deleteCommentBtn');
                        const reportCommentBtn = document.getElementById('reportCommentBtn');

                        deleteCommentBtn.onclick = null;
                        reportCommentBtn.onclick = null;

                        deleteCommentBtn.onclick = function() {
                            $.ajax({
                                url: '/main/delete-comment-ajax.do',
                                type: 'post',
                                data: $(deleteCommentForm).serialize(),
                                success: (obj) => {
                                    modalCommentMain.innerHTML='';
                                    // 제일 처음은 소개문
                                    const commentElement = `
                                        <div class="modal-comment">
                                            <div class="modal-comment-user-logo" style="background-image: url('/static/img/cat1.jpg');"></div>
                                            <div class="modal-comment-main">
                                                <div class="modal-comment-main-userid"><strong>cat1</strong></div>
                                                <div class="modal-comment-main-content">\${obj.portfolio.description}</div>
                                            </div>
                                        </div>
                                        `;
                                    modalCommentMain.insertAdjacentHTML('beforeend', commentElement);
                                    renderComments(obj.commentList, modalCommentMain);
                                    document.getElementById('deleteCommentModal').style.display = 'none';
                                },
                                error: (err) => {
                                    console.log(err);
                                }
                            });
                        };

                        reportCommentBtn.onclick = function() {
                            alert("부적절한 댓글을 신고했습니다");
                            document.getElementById('reportCommentModal').style.display = 'none';
                        };
                    }

                    // 클릭된 요소가 게시글 옵션창 인지 확인합니다.
                    if(event.target.closest('.modal-comment-header-optionBtn')){

                        const modalPortfolioForm = event.target.closest('#modalPortfolioForm');

                        const portfolioUserId = modalPortfolioForm.querySelector('input[name="user_id"]').value;

                        // 게시글 작성자와 사용자의 일치여부에 따라 다른 옵션창
                        openPortfolioOptions(portfolioUserId , ${loginUser.user_id});

                        const deletePortfolioBtn = document.getElementById('modalOptionsItemDelete');

                        console.log(deletePortfolioBtn);
                        const reportPortfolioBtn = document.getElementById('modalOptionsItemReport');

                        deletePortfolioBtn.onclick = null;
                        reportPortfolioBtn.onclick = null;

                        deletePortfolioBtn.onclick = function() {
                            // '게시글 삭제' 버튼 클릭 시 숨겨진 폼 제출 버튼을 클릭합니다.
                            document.getElementById('hiddenSubmitBtn').click();
                            modalBox.remove();
                        };

                        reportPortfolioBtn.onclick = function() {
                            alert("부적절한 게시물을 신고했습니다");
                            document.getElementById('modalOptionsOverlayOther').style.display = 'none';
                        };
                    }
                }

                // 댓글창에 이벤트 리스너 등록
                modalCommentContent.addEventListener('click', modalCommentContentHandler);

                // 댓글 입력 로직 (1. 비동기로 DB에 저장  2.저장 성공시 HTML에 동적 DOM 생성하는 renderCommentToDOM 호출)
                function addComment(comment, comment_id, portfolio_id){
                    fetch('/main/comment-ajax.do', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({ content: comment, portfolio_id: portfolio_id, user_id: ${loginUser.user_id},
                            comment_parent_id: comment_id})
                    })
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                console.log("댓글 입력 성공")
                                // // 댓글이 성공적으로 저장되면
                                renderCommentToDOM(comment);
                            } else {
                                console.error('Error saving comment:', data.message);
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                        });
                }

                // 댓글 입력 로직 (1. 비동기로 DB에 저장  2.저장 성공시 HTML에 동적 DOM 생성하는 renderCommentToDOM 호출)
                function addComment(comment, comment_id, portfolio_id){
                    fetch('/main/comment-ajax.do', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({ content: comment, portfolio_id: portfolio_id, user_id: ${loginUser.user_id},
                            comment_parent_id: comment_id})
                    })
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                console.log("댓글 입력 성공")
                                // // 댓글이 성공적으로 저장되면
                                renderCommentToDOM(comment);
                            } else {
                                console.error('Error saving comment:', data.message);
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                        });
                }

                // 새 댓글을 DOM에 추가하는 함수
                function renderCommentToDOM(comment) {

                    const commentBox = document.createElement('div');
                    commentBox.classList.add('comment-box');
                    const modifiedContent = replymode ? "@" + `\${comment.nickname}` + `\${comment}` : `\${comment}`;
                    console.log(comment);
                    const commentElement = `
                                    <div class="modal-comment">
                                        <a href="">
                                            <div class="modal-comment-user-logo"
                                                style="background-image: url(${loginUser.profile_image});"></div>
                                        </a>
                                        <div class="modal-comment-wrapper" style="display : flex; width: 75%;">
                                            <div class="modal-comment-main">
                                                <div class="modal-comment-main-userid">
                                                    <div style="margin-left:5px; font-weight: bold;" class="userId"><strong>${loginUser.nickname}</strong></div>
                                                    <div style="margin-left:5px;">\${modifiedContent}</div>
                                                </div>
                                                <div class="modal-comment-main-content">
                                                    <div style="color: gray;">방금</div>
                                                    <div style="color: gray; margin-left : 10px">좋아요 0개</div>
                                                    <div class="reply-btn" style="color: gray; margin-left : 10px">답글 달기</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-comment-like-logo" style="display : flex; align-items : center">
                                            <div class="modal-comment-like-logo-wrapper">
                                                <form style="margin-bottom : 0; display : flex; align-items : center">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="red"
                                                        class="bi bi-suit-heart comment-like-logo" viewBox="0 0 16 16">
                                                        <path
                                                            d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.6 7.6 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
                                                    </svg>
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="red"
                                                        class="bi bi-suit-heart-fill comment-like-logo hidden" viewBox="0 0 16 16">
                                                        <path
                                                            d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1" />
                                                    </svg>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                `;


                    commentBox.insertAdjacentHTML('beforeend', commentElement);

                    // 댓글인지 대댓글인지 여부에 따라 다른 동작
                    if(!replymode){
                        // 기존 댓글 목록에 댓글 추가
                        document.getElementById('modalCommentMain').appendChild(commentBox);
                    }else{
                        // 이미 1개 이상의 대댓글이 있는 경우 기존 대댓글 목록에 대댓글 추가
                        if(curr_reply_box){
                            curr_reply_box.appendChild(commentBox);
                            // 대댓글이 없던 경우 새롭게 대댓글 박스 생성
                        }else{
                            curr_comment_box.insertAdjacentHTML('beforeend', '<div class="reply-view" style="color : gainsboro;"> ---- 답글 보기 ---- </div>');
                            const replyBox2 = document.createElement('div');
                            replyBox2.classList.add('reply-box');
                            replyBox2.style.display = 'none';
                            curr_comment_box.appendChild(replyBox2);
                            replyBox2.appendChild(commentBox);
                            curr_reply_box = replyBox2;
                        }
                    }
                }
                // 댓글창 이벤트핸들러 (엔터키 입력시 addComment 메소드 실행)
                function createCommentInputHandler(e) {
                    if (e.key.toLowerCase() === "enter") {
                        e.preventDefault();
                        const comment = this.value.trim();
                        if (comment) {
                            addComment(comment, comment_id, obj.portfolio.portfolio_id);
                        }
                        // 종료 후에는 댓글창 비워주기
                        modalCommentInput.value = '';
                    }
                }
                modalCommentInput.addEventListener('keypress', createCommentInputHandler);

                // 모달 오버레이 이벤트 핸들러 (클릭 시 기존의 이벤트 리스너를 제거하지 않으면 여러 번 모달을 여닫을 시 중복 생성되어
                // 로직이 꼬이게 된다.)
                function overlayClickHandler(e) {
                    if (e.target.id === 'modalPortfolioOverlayBond' || e.target.id === 'modalPortfolioOverlay') {
                        modalOverlay.classList.remove('modal-portfolio-overlay-show');
                        modalCommentSection.classList.remove('modal-comment-section-active');
                        modalIframe.classList.remove('modal-portfolio-iframe-faded');
                        document.body.style.overflow = ''; // 스크롤 복구
                        modalOverlay.removeEventListener('click', overlayClickHandler); // 이벤트 리스너 제거
                        modalCommentInput.removeEventListener('keypress', createCommentInputHandler);
                        modalCommentContent.removeEventListener('click', modalCommentContentHandler);
                        modalBox.remove();
                    }
                }
                modalOverlay.addEventListener('click', overlayClickHandler);
            }

            // 모달 오버레이 표시
            const modalPortfolioOverlay = document.getElementById('modalPortfolioOverlay');
            if (modalPortfolioOverlay) {
                modalPortfolioOverlay.classList.add('modal-portfolio-overlay-show');
                // 전체화면의 스크롤은 모달이 떠있을 때 사용 불가
                document.body.style.overflow = 'hidden';
            }

            // iframe 외부 스크롤 이벤트 핸들러 설정
            window.addEventListener('wheel', function(event) {
                const iframe = document.getElementById('modalPortfolioIframe');
                if (iframe) {
                    const iframeDoc = iframe.contentDocument || iframe.contentWindow.document;
                    if (iframeDoc) {
                        iframeDoc.documentElement.scrollTop += event.deltaY;
                    }
                }
            });

            // 댓글 옵션 버튼 클릭 시 호출되는 함수
            function openCommentOptions(comment_user_id, loginUser_id) {
                if (parseInt(comment_user_id) === parseInt(loginUser_id)) {
                    // 삭제 모달 표시
                    document.getElementById('deleteCommentModal').style.display = 'flex';
                } else {
                    // 신고 모달 표시
                    document.getElementById('reportCommentModal').style.display = 'flex';
                }
            }

            // 게시글 옵션 버튼 클릭 시 호출되는 함수
            function openPortfolioOptions(portfolio_user_id, loginUser_id) {
                if (parseInt(portfolio_user_id) === parseInt(loginUser_id)) {
                    // 삭제 모달 표시
                    document.getElementById('modalOptionsOverlaySelf').style.display = 'flex';
                } else {
                    // 신고 모달 표시
                    document.getElementById('modalOptionsOverlayOther').style.display = 'flex';
                }
            }

            // 모달 닫기 기능
            document.querySelectorAll('.modal-comment-options-item.close').forEach(function(element) {
                element.onclick = function() {
                    document.getElementById('deleteCommentModal').style.display = 'none';
                    document.getElementById('reportCommentModal').style.display = 'none';
                };
            });

            // 취소 클릭시도 옵션창 닫힘
            document.querySelectorAll('.modal-options-item.close').forEach(function(element) {
                element.onclick = function() {
                    document.getElementById('modalOptionsOverlaySelf').style.display = 'none';
                    document.getElementById('modalOptionsOverlayOther').style.display = 'none';
                };
            });

            window.addEventListener('click', (e) => {
                console.log(e.target);
            });

            // 모달 외부를 클릭했을 때 닫기 기능 추가
            document.querySelectorAll('.modal-comment-options-overlay-bond').forEach(function(overlay) {
                overlay.onclick = function(event) {
                    // 클릭한 요소가 오버레이인 경우에만 모달 닫기
                    if (event.target === overlay) {
                        overlay.closest('.modal-comment-options-overlay').style.display = 'none';
                    }
                };
            });

            // 모달 외부를 클릭했을 때 닫기 기능 추가
            document.querySelectorAll('.modal-options-overlay').forEach(function(overlay) {
                overlay.onclick = function(event) {
                    // 클릭한 요소가 오버레이인 경우에만 모달 닫기
                    if (event.target === overlay) {
                        overlay.closest('.modal-options-overlay').style.display = 'none';
                    }
                };
            });
        }
    }

</script>


</body>
</html>

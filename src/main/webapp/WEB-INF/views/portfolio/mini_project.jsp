<%--
  Created by IntelliJ IDEA.
  User: BITCAMP
  Date: 24. 7. 26.
  Time: 오후 3:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/modal-main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/mini_project.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/add-main.css">

    <style>
        .content {
            padding: 20px;
            margin-left: 30vw;
            margin-right: 5vw;
            height: 100vh;

        }

        /* 메인화면 프로필 영역 */
        .top-line-personal-info {
            margin-right: 1vw;
        }

        .top-line-personal-info img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            border: 2px solid #222;
            background: #ffffff;
        }

        .top-line-personal-info-identifier {
            padding-left: 10px;
        }

        .top-line-personal-info-identifier i {
            color: blue;
            padding-left: 2px;
            vertical-align: center;
            display: none;
        }

        .top-line-personal-info-identifier div:first-child {
            font-size: 0.8em;
            font-weight: 600;
            padding: 1px;
        }

        .top-line-personal-info-identifier div:last-child {
            font-size: 0.7em;
            padding: 1px;
        }

        /* .base-sector{

        } */
        .base-sector-personal,
        .base-sector-company {
            margin: 5vh auto;
        }


        .base-sector-personal-title,
        .base-sector-company-title {
            margin: 0 5px 10px;
            min-width: 200px;
        }

        .sector-content-item {
            margin-bottom: 10px;
        }

        .content-img-thumbnail {
            width: 100%;
            height: 25vh;
            object-fit: cover;
        }

        .card-content-item {
            transition: transform 0.3s;
        }

        .card-content-item:hover {
            transform: scale(1.1);
            z-index: 50;
        }

        .base-header button {
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }

        .base-header img {
            width: 30px;
            height: auto;
        }

        .base-header button div {
            display: inline-block;
            margin-left: 10px;
        }

        @media screen and (max-width:900px) {
            .base-header button div {
                display: none;
            }

            .sidebar div {
                display: none;
            }
        }

        @media screen and (max-width:770px) {
            .sidebar {
                width: 50px;
            }

            .sidebar a {
                padding: 10px 10px;

            }

            .sidebar div {
                display: none;
            }

            .content {
                padding: 20px;
                margin-top: 0px;
            }

            .card-content-item {
                margin: 2vh
            }
        }

        .notification-dropdown {
            transition: background-color 0.3s, border-color 0.3s;
        }

        .container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 5px;
            /* Space between grid items */
            padding: 10px;
        }

        .content-item {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            width: 17vw;
            height: 26vh;
            position: relative;
        }

        .content-item:hover {
            background-color: #ddd;
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            /* 반투명한 검은색 */
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            font-size: 20px;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .content-item:hover .overlay {
            opacity: 1;
        }

        .likes,
        .comments {
            display: flex;
            align-items: center;
            gap: 5px;
            margin: 8px;
        }

    </style>
</head>

<body>

    <div class="container-content d-flex">
        <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/sidebar.jsp"></jsp:include>
        <!--콘텐츠-->
        <div class="content d-flex flex-column justify-content-start" id="main-content">
            <form id="page-form">
                <input type="hidden" name="pageNum" value="${page.miniProjectCri.pageNum}">
                <input type="hidden" name="amount" value="${page.miniProjectCri.amount}">
                <input type="hidden" name="endPage" value="${page.endPage}">
            </form>
            <!--콘텐츠 메인 콘테이너-->
            <div class="container" id="miniProjectContainer" style="margin-top : 2vh;">

                <!--DB에서 동적으로 로드-->

            </div>
        </div>
    </div>

<!-- <script src="js/modal-mini-project.js"></script> -->

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            $.ajax({
                url: '/mini/mini_project-ajax.do',
                type: 'post',
                data: $("#page-form").serialize(),
                success: (obj) => {
                    let htmlStr = "";
                    for (let i = 0; i < obj.portfolioList.length; i++) {
                        htmlStr += `
                                    <div class="content-item" style="background-image: url('\${obj.portfolioList[i].portfolioDto.thumbnail_url}'); background-size: cover;">
                                        <form id="portfolioForm">
                                        <input type="hidden" name="portfolio_id" value="\${obj.portfolioList[i].portfolioDto.portfolio_id}" />
                                        </form>
                                        <div class="overlay">
                                            <div class="likes" style="font-size: 18px;"> <svg xmlns="http://www.w3.org/2000/svg" width="18"
                                                                                              height="18" fill="currentColor" class="bi bi-suit-heart-fill2" viewBox="0 0 16 16">
                                                <path
                                                        d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1" />
                                            </svg> \${obj.portfolioList[i].portfolioDto.likeCount}</div>
                                            <div class="comments" style="font-size: 18px;"> <svg xmlns="http://www.w3.org/2000/svg"
                                                                                                 width="18" height="18" fill="currentColor" class="bi bi-chat-fill2" viewBox="0 0 16 16">
                                                <path
                                                        d="M8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6-.097 1.016-.417 2.13-.771 2.966-.079.186.074.394.273.362 2.256-.37 3.597-.938 4.18-1.234A9 9 0 0 0 8 15" />
                                            </svg>\${obj.portfolioList[i].portfolioDto.commentCount}</div>
                                        </div>
                                    </div>
                               `;
                    }
                    $("#miniProjectContainer").append(htmlStr);
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
                            url: '/mini/mini_project-ajax.do',
                            type: 'post',
                            data: $("#page-form").serialize(),
                            success: (obj) => {
                                console.log("ajax success")
                                let htmlStr = "";
                                for (let i = 0; i < obj.portfolioList.length; i++) {
                                    htmlStr += `
                                            <div class="content-item" style="background-image: url('\${obj.portfolioList[i].portfolioDto.thumbnail_url}'); background-size: cover;">
                                                <form id="portfolioForm">
                                                <input type="hidden" name="portfolio_id" value="\${obj.portfolioList[i].portfolioDto.portfolio_id}" />
                                                </form>
                                                <div class="overlay">
                                                    <div class="likes" style="font-size: 18px;"> <svg xmlns="http://www.w3.org/2000/svg" width="18"
                                                                                                      height="18" fill="currentColor" class="bi bi-suit-heart-fill2" viewBox="0 0 16 16">
                                                        <path
                                                                d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1" />
                                                    </svg> \${obj.portfolioList[i].portfolioDto.likeCount}</div>
                                                    <div class="comments" style="font-size: 18px;"> <svg xmlns="http://www.w3.org/2000/svg"
                                                                                                         width="18" height="18" fill="currentColor" class="bi bi-chat-fill2" viewBox="0 0 16 16">
                                                        <path
                                                                d="M8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6-.097 1.016-.417 2.13-.771 2.966-.079.186.074.394.273.362 2.256-.37 3.597-.938 4.18-1.234A9 9 0 0 0 8 15" />
                                                    </svg> \${obj.portfolioList[i].portfolioDto.commentCount}</div>
                                                </div>
                                            </div>
                                            `;
                                }
                                $("#miniProjectContainer").append(htmlStr);
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
        document.getElementById('miniProjectContainer').addEventListener('click', function(event) {
            if (event.target.classList.contains('overlay')) {
                const portfolioForm = event.target.closest('.content-item').querySelector('#portfolioForm');
                $.ajax({
                    url: '/main/modal-ajax.do',
                    type: 'post',
                    data: $(portfolioForm).serialize(),
                    success: (obj) => {
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
                let portfolioId = obj.portfolio.portfolio_id;
                const portfolioHeartOutlineClass = obj.portfolio.liked ? 'hidden' : '';
                const portfolioHeartFilledClass = obj.portfolio.liked ? '' : 'hidden';

                const modalBox = document.createElement('div');
                modalBox.classList.add('modal-portfolio-overlay');
                modalBox.id = 'modalPortfolioOverlay';

                let htmlStr = `
                               <div class="modal-portfolio-overlay-bond" id="modalPortfolioOverlayBond">
                                    <form id="modalPortfolioForm" action="/main/delete-portfolio.do" method="post" style="margin-bottom : 0; margin-right : 10px; display : flex; align-items : center">
                                        <input type="hidden" name="user_id" value="\${obj.portfolio.user_id}">
                                        <input type="hidden" name="portfolio_id" value="\${obj.portfolio.portfolio_id}">
                                        <input type="hidden" name="isLiked" value = "\${obj.portfolio.liked}"/>
                                        <input type="hidden" name="portfolio_id" value = "\${obj.portfolio.portfolio_id}"/>
                                        <button type="submit" id="hiddenSubmitBtn" style="display: none;"></button>
                                    </form>
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
                                                       </div>

                                                       <div class="modal-comment-main-box" id="modalCommentMain">
                                                           <!-- 여기에 코멘트 추가-->
                                                       </div>

                                                       <div class="modal-comment-footer" id="modalCommentFooter">

                                                           <div class="modal-likeCnt" id="modalLikeCnt">

                                                               <div class="modal-portfolio-like-logo" style="display:flex">
                                                                   <div class="modal-portfolio-like-logo-wrapper" >
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
                                                                   </div>
                                                               </div>

                                                               <div class="modal-likeCnt-text" id="modalLikeCntText">
                                                                   <p> 좋아요 \${obj.portfolio.likeCount}</p>
                                                               </div>
                                                           </div>

                                                           <!--댓글 입력창-->
                                                           <div class="modal-leaveComment" id="modalLeaveComment">
                                                               <input type="text" id="modalCommentInput" class="form-control"
                                                                      autocomplete="off" placeholder="댓글을 입력하세요..." value=""/>
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

                            const commentHeartOutlineClass = comment.liked ? 'hidden' : '';
                            const commentHeartFilledClass = comment.liked ? '' : 'hidden';

                            const commentBox = document.createElement('div');
                            commentBox.classList.add('comment-box');
                            container.appendChild(commentBox);

                            const commentElement = `
                            <div class="modal-comment">
                                <form id="commentForm">
                                                <input type="hidden" name="comment_id" value="\${comment.comment_id}"/>
                                                <input type="hidden" name="nickname" value="\${comment.nickname}"/>
                                                <input type="hidden" name="user_id" value="\${comment.user_id}"/>
                                                <input type="hidden" name="likeCount" value="\${comment.likeCount}"/>
                                                <input type="hidden" name="isLiked" value = "\${comment.liked}"/>
                                </form>
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
                                            <div style="color: gray; margin-left : 10px" id="commentLike">좋아요 \${comment.likeCount}개</div>
                                            <div class="reply-btn" style="color: gray; margin-left : 10px">답글 달기</div>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots" style="margin-left : 10px;"  viewBox="0 -2 16 16">
                                              <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3"/>
                                            </svg>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-comment-like-logo" style="display : flex; align-items : center">
                                    <div class="modal-comment-like-logo-wrapper">
                                        <form style="margin-bottom : 0; display : flex; align-items : center">
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
                            let curr_comment_box = event.target.closest('.comment-box');
                            let curr_reply_box = curr_comment_box.querySelector('.reply-box');

                            if(!curr_reply_box){
                                curr_reply_box = event.target.closest('.reply-box');
                            }

                            const modalCommentInput = document.getElementById('modalCommentInput');
                            modalCommentInput.focus();

                            const commentForm = event.target.closest('.modal-comment').querySelector('#commentForm');
                            comment_id = commentForm.querySelector('input[name="comment_id"]').value;

                        }

                        // 클릭된 요소가 댓글창인지 확인합니다.
                        if (event.target.classList.contains('form-control')){
                            comment_id = null;
                        }

                        // 클릭된 요소가 댓글 좋아요 인지 확인합니다.
                        if (event.target.closest('.modal-comment-like-logo-wrapper')) {

                            const commentForm = event.target.closest('.modal-comment').querySelector('#commentForm');
                            const input = commentForm.querySelector('input[name="isLiked"]');
                            const heartOutline = event.target.closest('.modal-comment-like-logo-wrapper').querySelector('.bi-suit-heart');
                            const heartFilled = event.target.closest('.modal-comment-like-logo-wrapper').querySelector('.bi-suit-heart-fill');

                            $.ajax({
                                url: '/main/comment-like-ajax.do',
                                type: 'post',
                                data: $(commentForm).serialize(),
                                success: (obj) => {
                                    input.value = input.value === 'false' ? 'true' : 'false';
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

                            const modalPortfolioForm = event.target.closest('.modal-portfolio-overlay-bond').querySelector('#modalPortfolioForm');
                            const input = modalPortfolioForm.querySelector('input[name="isLiked"]');
                            const heartOutline = event.target.closest('.modal-portfolio-like-logo-wrapper').querySelector('.bi-suit-heart');
                            const heartFilled = event.target.closest('.modal-portfolio-like-logo-wrapper').querySelector('.bi-suit-heart-fill');

                            $.ajax({
                                url: '/main/portfolio-like-ajax.do',
                                type: 'post',
                                data: $(modalPortfolioForm).serialize(),
                                success: (obj) => {
                                    input.value = input.value === 'false' ? 'true' : 'false';
                                    heartOutline.classList.toggle('hidden');
                                    heartFilled.classList.toggle('hidden');
                                },
                                error: (err) => {
                                    console.log(err);
                                }
                            });
                        }

                        // 클릭된 요소가 댓글 옵션창 인지 확인합니다.
                        if(event.target.closest('.bi-three-dots')){

                            const commentForm = event.target.closest('.modal-comment').querySelector('#commentForm');
                            const commentUserId = commentForm.querySelector('input[name="user_id"]').value;

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

                            const modalPortfolioForm = event.target.closest('.modal-portfolio-overlay-bond').querySelector('#modalPortfolioForm');
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

                    // 댓글창 이벤트핸들러 (엔터키 입력시 addComment 메소드 실행)
                    function createCommentInputHandler(e) {
                        if (e.key.toLowerCase() === "enter") {
                            e.preventDefault();
                            const comment = this.value.trim();
                            if (comment) {
                                const commentDto = {
                                    content: `\${comment}`,
                                    comment_parent_id: `\${comment_id}`,
                                    user_id: ${loginUser.user_id},
                                    portfolio_id : `\${portfolioId}`
                                };
                                $.ajax({
                                    url: '/main/comment-ajax.do',
                                    type: 'post',
                                    data: JSON.stringify(commentDto),
                                    contentType: 'application/json',
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
                                    },
                                    error: (err) => {
                                        console.log(err);
                                    }
                                });
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

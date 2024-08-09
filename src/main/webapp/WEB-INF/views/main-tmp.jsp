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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/mini_project(company).css">
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
        .view-all-comments{
            cursor: pointer;
        }

        .write-comments{
            cursor: pointer;
        }

        input:focus {
            outline: none; /* 기본 포커스 스타일 제거 */
        }

        .modal-body{
            padding: 0 !important;
        }

        .modal-backdrop{
            position: static !important;
        }
        
        .recommend-item-content{
            cursor: pointer;
        }

        .mainPortfolio-like-logo{
            cursor: pointer;
        }

        .bi-chat{
            cursor: pointer;
        }

        .mainPortfolio-bookmark-logo{
            cursor: pointer;
        }

        .mainCompany-bookmark-logo{
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="container-content d-flex align-items-start">
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/sidebar.jsp"></jsp:include>

    <div class="content d-flex flex-column" id="main-content">
        <div class="base-sector" id="baseContentSector">
            <div class="base-sector-personal">
                <div class="base-sector-personal-title">
                    <div class="portfolio-container-wrapper" id="portfolioContainerWrapper">
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
         style="display: flex; flex-direction: column; margin-top: 12vh; margin-left : 5vw;" id="recommendContainer">

        <div class="recomment-description" style="display : flex; font-size: 0.8rem; margin:10px;
                        justify-content:space-between; width:15vw;">
            <strong>회원님을 위한 추천공고</strong>
            <a href="/company/test.do" class="viewAll"><strong>모두보기</strong></a>
        </div>

    </div>

    <div class="modal fade" id="CompanyPortFolioModal" tabindex="-1" aria-labelledby="CompanyPortFolioModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content2">
                <div class="modal-body">
                    <iframe id="imageIframe"></iframe>
                </div>
            </div>
        </div>
    </div>

</div>

<script>
    function showModal(imageUrl) {
        var iframe = $('#imageIframe');
        // 이미지 로드 완료 시 크기 조절
        var img = new Image();
        img.onload = function () {
            var imgWidth = img.width;
            var imgHeight = img.height;

            iframe.css({
                width: imgWidth + 'px',
                height: imgHeight + 'px'
            });

            $('#CompanyPortFolioModal .modal-content2').css({
                width: imgWidth + 'px',
                height: imgHeight + 'px'
            });

            $('#CompanyPortFolioModal').modal('show');

            // 이미지가 로드된 후에 iframe의 src 설정
            iframe.attr('src', imageUrl);

            $('#CompanyPortFolioModal').on('hidden.bs.modal', function () {
                // 모달이 숨겨질 때 iframe의 src를 초기화
                $('#imageIframe').attr('src', '');
            });

        };
        img.src = imageUrl;
    }
</script>


<script>
    document.addEventListener('DOMContentLoaded', function () {

        $.ajax({
            url: '/main/main-ajax.do',
            type: 'post',
            data: $("#page-form").serialize(),
            success: (obj) => {

                let htmlStr = "";
                for (let i = 0; i < obj.portfolioList.length; i++) {

                    const portfolioHeartOutlineClass = obj.portfolioList[i].portfolioDto.liked ? 'hidden' : '';
                    const portfolioHeartFilledClass = obj.portfolioList[i].portfolioDto.liked ? '' : 'hidden';

                    const portfolioBookmarkOutlineClass = obj.portfolioList[i].portfolioDto.bookmarked ? 'hidden' : '';
                    const portfolioBookmarkFilledClass = obj.portfolioList[i].portfolioDto.bookmarked ? '' : 'hidden';

                    htmlStr += `
                               <div class="content-item-wrapper" style="border-bottom: 1px solid gainsboro;">
                                   <div class="content-item-header" style="padding: 5px; display: flex; align-items: center; padding-bottom: 10px; margin-top: 5px;">
                                       <div class="content-item-header-user-logo" style="background-image: url('\${obj.portfolioList[i].portfolioDto.profile_image}'); display: flex; justify-content: center; align-items: center; height: 2vw; width: 2vw; border-radius: 50%; background-size: cover; flex-shrink: 0;"></div>
                                           <div class="content-item-header-main" style="display: flex; flex-direction: column; flex-grow: 1;">
                                               <div class="content-item-header-userid" style="font-size: 14px; margin-left: 10px;">
                                                   <strong>\${obj.portfolioList[i].portfolioDto.nickname}</strong> <strong style="color: gray;">\${obj.portfolioList[i].portfolioDto.regdateStr}</strong>
                                               </div>
                                               <div class="content-item-header-content" style="font-size: 14px; margin-left: 10px;">
                                                   \${obj.portfolioList[i].portfolioDto.description}
                                               </div>
                                           </div>
                                   </div>
                                   <div class="content-item" style="background-image: url('\${obj.portfolioList[i].portfolioDto.thumbnail_url}'); background-size: cover; border-radius: 5px;"></div>
                                   <div class="content-item-footer" style="padding-top: 10px; display: flex; flex-direction: column;">
                                       <div class="content-item-footer-logos" style="margin: 1px;">
                                            <form id="portfolioForm">
                                              <input type="hidden" name="portfolio_id" value="\${obj.portfolioList[i].portfolioDto.portfolio_id}"/>
                                              <input type="hidden" name="isLiked" value="\${obj.portfolioList[i].portfolioDto.liked}"/>
                                              <input type="hidden" name="bookmarked" value="\${obj.portfolioList[i].portfolioDto.bookmarked}"/>
                                           </form>
                                           <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="red"
                                               class="bi bi-suit-heart mainPortfolio-like-logo \${portfolioHeartOutlineClass}" viewBox="0 0 16 16">
                                               <path
                                                   d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.6 7.6 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
                                           </svg>
                                           <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="red"
                                               class="bi bi-suit-heart-fill mainPortfolio-like-logo \${portfolioHeartFilledClass}" viewBox="0 0 16 16">
                                               <path
                                                   d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1" />
                                           </svg>
                                           <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                               fill="currentColor" class="bi bi-chat" viewBox="0 1 16 16"
                                               style="margin-right : 3px;">
                                               <path
                                                   d="M2.678 11.894a1 1 0 0 1 .287.801 11 11 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8 8 0 0 0 8 14c3.996 0 7-2.807 7-6s-3.004-6-7-6-7 2.808-7 6c0 1.468.617 2.83 1.678 3.894m-.493 3.905a22 22 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a10 10 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9 9 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105" />
                                           </svg>
                                           <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22"
                                               fill="red" class="bi bi-bookmark mainPortfolio-bookmark-logo \${portfolioBookmarkOutlineClass}" viewBox="0 0 16 16">
                                               <path
                                                   d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1z" />
                                           </svg>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22"
                                                fill="red" class="bi bi-bookmark-fill mainPortfolio-bookmark-logo \${portfolioBookmarkFilledClass}" viewBox="0 0 16 16">
                                              <path d="M2 2v13.5a.5.5 0 0 0 .74.439L8 13.069l5.26 2.87A.5.5 0 0 0 14 15.5V2a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2"/>
                                            </svg>
                                       </div>
                                       <div class="content-item-footer-like" style="font-size: 0.8rem; margin: 1px;">
                                           <strong>좋아요 \${obj.portfolioList[i].portfolioDto.likeCount}개</strong>
                                       </div>
                                       <div class="content-item-footer-comment" style="font-size: 0.8rem; color: gray; margin: 1px;">
                                           <strong class="view-all-comments">댓글 \${obj.portfolioList[i].portfolioDto.commentCount}개 모두 보기</strong>
                                       </div>
                                       <div class="content-item-footer-postcomment" style="font-size: 0.8rem; color: gray; margin: 1px; margin-bottom: 10px;">
                                           <strong class="write-comments">댓글 달기</strong>
                                           <div class="main-write-comment" id="mainLeaveComment" style="display:none;">
                                               <input style="border:none; padding: 0; font-size: 0.8rem; margin: 3px 1px 1px 0; color : gray; font-weight: bold" type="text" id="mainCommentInput" class="mainCommentForm"
                                                      autocomplete="off" placeholder="댓글을 입력하세요..." value=""/>
                                           </div>
                                       </div>
                                   </div>
                               </div>
                               `;
                }
                $("#portfolioContainer").append(htmlStr);

                let htmlStr2 = "";
                for (let i = 0; i < obj.companyList.length; i++) {

                    const companyBookmarkOutlineClass = obj.companyList[i].bookmarked ? 'hidden' : '';
                    const companyBookmarkFilledClass = obj.companyList[i].bookmarked ? '' : 'hidden';

                    console.log( obj.companyList[i]);

                    htmlStr2 += `
                                <div class="recommend-item" style="display:flex; align-items: center; margin-top : 5px;">
                                    <form id="recruitmentForm">
                                        <input type="hidden" name="imageUrl" value="\${obj.companyList[i].recruitment_url}">
                                    </form>
                                    <div class="recommend-item-logo-wrapper"
                                         style="width:3vw; height:2vh; display:flex; justify-content:center; margin:10px;">
                                            <a class="recommend-item-logo" style="background-image : url('\${obj.companyList[i].company_icon_url}'); background-size:cover;
                                                    background-repeat: no-repeat; width:100%; height:100%;"  href="/userfeeds/user-feeds.do?id=\${obj.companyList[i].user_id}">
                                            </a>
                                    </div>
                                    <div class=" recommend-item-content" style="display:flex; flex-direction : column; padding-left :2px; flex-grow : 1">
                                        <div class="recommend-item-content-tit"
                                             style="font-size:0.8rem; color:gray; display:flex; align-items:center;">
                                            \${obj.companyList[i].career}
                                        </div>
                                        <div class="recommend-item-content-corp"
                                             style="font-size:0.8rem; color:gray; display:flex; align-items:center;">
                                            <div style="background-image : url('${pageContext.request.contextPath}/static/img/이모티콘/1.png') ; width:15px; height : 15px;
                                                    background-size : cover; margin-right : 3px;"></div>
                                            \${obj.companyList[i].location} / \${obj.companyList[i].education} / <span style="color:gray; margin-left : 5px; font-weight : bold;">\${obj.companyList[i].dday} </span>
                                            <div style="background-image : url('${pageContext.request.contextPath}/static/img/이모티콘/2.png') ; width:10px; height : 10px;
                                                    background-size : cover; margin-left : 3px;"></div>
                                        </div>
                                    </div>
                                    <div class="recommend-item-bookmark" style="margin:10px;">
                                            <form id="companyForm">
                                                <input type="hidden" name="bookmarked" value="\${obj.companyList[i].bookmarked}">
                                                <input type="hidden" name="recruitment_id" value="\${obj.companyList[i].recruitment_id}">
                                            </form>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                               fill="red" class="bi bi-bookmark mainCompany-bookmark-logo \${companyBookmarkOutlineClass}" viewBox="0 0 16 16">
                                               <path
                                                   d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1z" />
                                           </svg>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                                fill="red" class="bi bi-bookmark-fill mainCompany-bookmark-logo \${companyBookmarkFilledClass}" viewBox="0 0 16 16">
                                              <path d="M2 2v13.5a.5.5 0 0 0 .74.439L8 13.069l5.26 2.87A.5.5 0 0 0 14 15.5V2a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2"/>
                                            </svg>
                                    </div>
                                </div>
                                `;
                }
                $("#recommendContainer").append(htmlStr2);

                document.querySelectorAll('.recommend-item-content').forEach((item) => {
                    item.addEventListener('click', () => {
                        const recruitmentForm = item.closest('.recommend-item').querySelector('#recruitmentForm');
                        showModal(recruitmentForm.querySelector('input').value);
                    });
                });

                $(document).on('click', function (event) {
                    if (event.target.closest('.mainPortfolio-like-logo')) {

                        const portfolioForm = event.target.closest('.content-item-footer-logos').querySelector('#portfolioForm');
                        console.log(portfolioForm);
                        const input = portfolioForm.querySelector('input[name="isLiked"]');
                        const heartOutline = event.target.closest('.content-item-footer-logos').querySelector('.bi-suit-heart');
                        const heartFilled = event.target.closest('.content-item-footer-logos').querySelector('.bi-suit-heart-fill');
                        const likeCntText = event.target.closest('.content-item-footer').querySelector('.content-item-footer-like');

                        $.ajax({
                            url: '/main/portfolio-like-ajax.do',
                            type: 'post',
                            data: $(portfolioForm).serialize(),
                            success: (obj) => {
                                likeCntText.innerHTML = `<strong>좋아요 \${obj.portfolio.likeCount}개</strong>`;
                                input.value = input.value === 'false' ? 'true' : 'false';
                                heartOutline.classList.toggle('hidden');
                                heartFilled.classList.toggle('hidden');
                            },
                            error: (err) => {
                                console.log(err);
                            }
                        });
                    }
                });

                $(document).on('click', function (event) {
                    if (event.target.closest('.mainPortfolio-bookmark-logo')) {

                        const portfolioForm = event.target.closest('.content-item-footer-logos').querySelector('#portfolioForm');
                        const input = portfolioForm.querySelector('input[name="bookmarked"]');
                        const bookmarkOutline = event.target.closest('.content-item-footer-logos').querySelector('.bi-bookmark');
                        const bookmarkFilled = event.target.closest('.content-item-footer-logos').querySelector('.bi-bookmark-fill');
                        console.log(bookmarkOutline);

                        $.ajax({
                            url: '/main/portfolio-bookmark-ajax.do',
                            type: 'post',
                            data: $(portfolioForm).serialize(),
                            success: (obj) => {
                                input.value = input.value === 'false' ? 'true' : 'false';
                                bookmarkOutline.classList.toggle('hidden');
                                bookmarkFilled.classList.toggle('hidden');
                            },
                            error: (err) => {
                                console.log(err);
                            }
                        });
                    }
                });

                $(document).on('click', function (event) {
                    if (event.target.closest('.mainCompany-bookmark-logo')) {

                        const companyForm = event.target.closest('.recommend-item-bookmark').querySelector('#companyForm');
                        const input = companyForm.querySelector('input[name="bookmarked"]');
                        const bookmarkOutline = event.target.closest('.recommend-item-bookmark').querySelector('.bi-bookmark');
                        const bookmarkFilled = event.target.closest('.recommend-item-bookmark').querySelector('.bi-bookmark-fill');
                        console.log(bookmarkOutline);

                        $.ajax({
                            url: '/main/company-bookmark-ajax.do',
                            type: 'post',
                            data: $(companyForm).serialize(),
                            success: (obj) => {
                                input.value = input.value === 'false' ? 'true' : 'false';
                                bookmarkOutline.classList.toggle('hidden');
                                bookmarkFilled.classList.toggle('hidden');
                            },
                            error: (err) => {
                                console.log(err);
                            }
                        });
                    }
                });


                document.querySelectorAll('.bi-chat').forEach((item) => {
                    item.addEventListener('click', () => {
                        const writeBtn = item.closest('.content-item-footer').querySelector('.write-comments');
                        writeBtn.click();
                    })
                });

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

                                const portfolioHeartOutlineClass = obj.portfolioList[i].portfolioDto.liked ? 'hidden' : '';
                                const portfolioHeartFilledClass = obj.portfolioList[i].portfolioDto.liked ? '' : 'hidden';

                                const portfolioBookmarkOutlineClass = obj.portfolioList[i].portfolioDto.bookmarked ? 'hidden' : '';
                                const portfolioBookmarkFilledClass = obj.portfolioList[i].portfolioDto.bookmarked ? '' : 'hidden';

                                htmlStr += `
                                            <div class="content-item-wrapper" style="border-bottom: 1px solid gainsboro;">
                                                <form id="portfolioForm">
                                                  <input type="hidden" name="portfolio_id" value="\${obj.portfolioList[i].portfolioDto.portfolio_id}">
                                                </form>
                                                <div class="content-item-header" style="padding: 5px; display: flex; align-items: center; padding-bottom: 10px; margin-top: 5px;">
                                                    <div class="content-item-header-user-logo" style="background-image: url('\${obj.portfolioList[i].portfolioDto.profile_image}'); display: flex; justify-content: center; align-items: center; height: 2vw; width: 2vw; border-radius: 50%; background-size: cover; flex-shrink: 0;"></div>
                                                        <div class="content-item-header-main" style="display: flex; flex-direction: column; flex-grow: 1;">
                                                            <div class="content-item-header-userid" style="font-size: 14px; margin-left: 10px;">
                                                                <strong>\${obj.portfolioList[i].portfolioDto.nickname}</strong> <strong style="color: gray;">\${obj.portfolioList[i].portfolioDto.regdateStr}</strong>
                                                            </div>
                                                            <div class="content-item-header-content" style="font-size: 14px; margin-left: 10px;">
                                                                \${obj.portfolioList[i].portfolioDto.description}
                                                            </div>
                                                        </div>
                                                </div>
                                                <div class="content-item" style="background-image: url('\${obj.portfolioList[i].portfolioDto.thumbnail_url}'); background-size: cover; border-radius: 5px;"></div>
                                                <div class="content-item-footer" style="padding-top: 10px; display: flex; flex-direction: column;">
                                                    <div class="content-item-footer-logos" style="margin: 1px;">
                                                          <form id="portfolioForm">
                                                              <input type="hidden" name="portfolio_id" value="\${obj.portfolioList[i].portfolioDto.portfolio_id}"/>
                                                              <input type="hidden" name="isLiked" value="\${obj.portfolioList[i].portfolioDto.liked}"/>
                                                              <input type="hidden" name="bookmarked" value="\${obj.portfolioList[i].portfolioDto.bookmarked}"/>
                                                           </form>
                                                           <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="red"
                                                               class="bi bi-suit-heart mainPortfolio-like-logo \${portfolioHeartOutlineClass}" viewBox="0 0 16 16">
                                                               <path
                                                                   d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.6 7.6 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
                                                           </svg>
                                                           <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="red"
                                                               class="bi bi-suit-heart-fill mainPortfolio-like-logo \${portfolioHeartFilledClass}" viewBox="0 0 16 16">
                                                               <path
                                                                   d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1" />
                                                           </svg>
                                                           <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                               fill="currentColor" class="bi bi-chat" viewBox="0 1 16 16"
                                                               style="margin-right : 3px;">
                                                               <path
                                                                   d="M2.678 11.894a1 1 0 0 1 .287.801 11 11 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8 8 0 0 0 8 14c3.996 0 7-2.807 7-6s-3.004-6-7-6-7 2.808-7 6c0 1.468.617 2.83 1.678 3.894m-.493 3.905a22 22 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a10 10 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9 9 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105" />
                                                           </svg>
                                                           <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22"
                                                               fill="red" class="bi bi-bookmark mainPortfolio-bookmark-logo \${portfolioBookmarkOutlineClass}" viewBox="0 0 16 16">
                                                               <path
                                                                   d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1z" />
                                                           </svg>
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22"
                                                                fill="red" class="bi bi-bookmark-fill mainPortfolio-bookmark-logo \${portfolioBookmarkFilledClass}" viewBox="0 0 16 16">
                                                              <path d="M2 2v13.5a.5.5 0 0 0 .74.439L8 13.069l5.26 2.87A.5.5 0 0 0 14 15.5V2a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2"/>
                                                            </svg>
                                                    </div>
                                                    <div class="content-item-footer-like" style="font-size: 0.8rem; margin: 1px;">
                                                        <strong>좋아요 \${obj.portfolioList[i].portfolioDto.likeCount}개</strong>
                                                    </div>
                                                    <div class="content-item-footer-comment" style="font-size: 0.8rem; color: gray; margin: 1px;">
                                                        <strong class="view-all-comments">댓글 \${obj.portfolioList[i].portfolioDto.commentCount}개 모두 보기</strong>
                                                    </div>
                                                    <div class="content-item-footer-postcomment" style="font-size: 0.8rem; color: gray; margin: 1px; margin-bottom: 10px;">
                                                        <strong class="write-comments">댓글 달기</strong>
                                                        <div class="main-write-comment" id="mainLeaveComment" style="display:none;">
                                                           <input style="border:none; padding: 0; font-size: 0.8rem; margin: 3px 1px 1px 0; color : gray; font-weight: bold" type="text" id="mainCommentInput" class="mainCommentForm"
                                                                  autocomplete="off" placeholder="댓글을 입력하세요..." value=""/>
                                                       </div>
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
        if (event.target.classList.contains('content-item') || event.target.classList.contains('view-all-comments')  ) {
            console.log(event.target.closest('.content-item-wrapper'));
            const portfolioForm = event.target.closest('.content-item-wrapper').querySelector('#portfolioForm');
            console.log(portfolioForm);
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

        if(event.target.classList.contains('write-comments')){
            const mainLeaveComment = event.target.closest('.content-item-footer-postcomment').querySelector('.main-write-comment');
            mainLeaveComment.style.display = 'block';
            const mainCommentInput = mainLeaveComment.querySelector('input');
            mainCommentInput.focus();
            const portfolioForm = event.target.closest('.content-item-wrapper').querySelector('#portfolioForm');
            const viewAllComments = event.target.closest('.content-item-footer').querySelector('.view-all-comments');

            mainCommentInput.addEventListener("keydown", function(e){
                if (e.key.toLowerCase() === "enter") {
                    e.preventDefault();
                    const comment = this.value.trim();
                    if (comment) {
                        const commentDto = {
                            content: comment,
                            user_id: ${loginUser.user_id},
                            portfolio_id : portfolioForm.querySelector('input[name="portfolio_id"]').value
                        };
                        $.ajax({
                            url: '/main/comment-ajax.do',
                            type: 'post',
                            data: JSON.stringify(commentDto),
                            contentType: 'application/json',
                            success: (obj) => {
                                mainCommentInput.value='';
                                viewAllComments.innerHTML = `댓글 \${obj.portfolio.commentCount}개 모두 보기`
                            },
                            error: (err) => {
                                console.log(err);
                            }
                        });
                    }
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
                                           <div id="iframeContainer">
                                                <img id="loadingImage" src="${pageContext.request.contextPath}/static/img/loading.gif" alt="Loading..." style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 1000;">
                                                <iframe id="modalPortfolioIframe" style="display: none; width: 100%; height: 100%;"></iframe>
                                            </div>

                                           <!--코멘트-->
                                           <div class="modal-comment-section" id="modalCommentSection">
                                               <div class="modal-comment-section-bond" id="modalCommentSectionBond">
                                                   <div class="modal-comment-content" id="modalCommentContent">
                                                       <div class="modal-comment-header" id="modalCommentHeader">
                                                           <div class="modal-comment-header-logo" id="modalCommentHeaderLogo">
                                                                <a href="/userfeeds/user-feeds.do?id=\${obj.portfolio.user_id}">
                                                                    <div class="modal-comment-user-logo" style="background-image: url('\${obj.portfolio.profile_image}'); margin-left : 10px;"></div>
                                                                </a>
                                                            </div>
                                                           <div class="modal-comment-header-userId">
                                                                 <a href="/userfeeds/user-feeds.do?id=\${obj.portfolio.user_id}" style="text-decoration: none; color : black;">
                                                                    <strong>\${obj.portfolio.nickname}</strong></div>
                                                                </a>
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
                                                                   <p style = "margin-bottom: 0px"> 좋아요 \${obj.portfolio.likeCount}개</p>
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

            const iframeContainer = document.getElementById('iframeContainer');
            const loadingImage = document.getElementById('loadingImage');
            const iframe = document.getElementById('modalPortfolioIframe');
            const iframeDoc = iframe.contentDocument || iframe.contentWindow.document;

            async function loadPortfolio(obj) {
                try {
                    // 로딩 이미지 표시
                    loadingImage.style.display = 'block';
                    iframe.style.display = 'none';

                    const response = await fetch(obj.portfolio.htmlurl);
                    const html = await response.text();

                    const parser = new DOMParser();
                    const doc = parser.parseFromString(html, 'text/html');

                    doc.querySelectorAll('img').forEach(img => {
                        img.remove();
                    });

                    // 필요에 따라 doc을 다시 문자열로 변환
                    const updatedHtml = new XMLSerializer().serializeToString(doc);

                    // iframe의 내부 문서 객체를 초기화하고 HTML 콘텐츠 작성
                    iframeDoc.open();
                    iframeDoc.write(updatedHtml);
                    iframeDoc.close();

                    // CSS 파일 추가
                    const link = iframeDoc.createElement('link');
                    link.rel = 'stylesheet';
                    link.href = obj.portfolio.cssurl;
                    iframeDoc.head.appendChild(link);

                    const linkLoadPromise = new Promise((resolve, reject) => {
                        link.onload = resolve;
                        link.onerror = reject;
                    });

                    // JavaScript 파일 추가
                    const script = iframeDoc.createElement('script');
                    script.src = obj.portfolio.jsurl;
                    iframeDoc.body.appendChild(script);

                    const scriptLoadPromise = new Promise((resolve, reject) => {
                        script.onload = resolve;
                        script.onerror = reject;
                    });

                    // 모든 리소스가 로드될 때까지 기다림
                    await Promise.all([linkLoadPromise, scriptLoadPromise]);

                    // 로딩 이미지 숨기고 iframe 표시
                    loadingImage.style.display = 'none';
                    iframe.style.display = 'block';
                    console.log("All resources loaded successfully.");

                    // iframe 내의 스크롤바 숨기기
                    const style = iframeDoc.createElement('style');
                    style.textContent = `
                    body {
                        overflow: auto;
                    }
                    ::-webkit-scrollbar {
                        display: none;
                    }
                    -ms-overflow-style: none;
                    scrollbar-width: none;
                `;
                    iframeDoc.head.appendChild(style);

                } catch (error) {
                    console.error("Failed to load resources:", error);
                    // 오류 발생 시 로딩 이미지 숨기고 iframe을 다시 보이도록 설정
                    loadingImage.style.display = 'none';
                    iframe.style.display = 'block';
                }

            }

            if (iframe) {
                loadPortfolio(obj);
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
                                            <a href="/userfeeds/user-feeds.do?id=\${obj.portfolio.user_id}">
                                                <div class="modal-comment-user-logo" style="background-image: url('\${obj.portfolio.profile_image}');"></div>
                                            </a>
                                            <div class="modal-comment-main">
                                                <a href="/userfeeds/user-feeds.do?id=\${obj.portfolio.user_id}" style="text-decoration: none; color : black;">
                                                    <div class="modal-comment-main-userid"><strong>\${obj.portfolio.nickname}</strong></div>
                                                </a>
                                                <div class="modal-comment-main-content" style="margin-left:15px">\${obj.portfolio.description}</div>
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

                        let feedLink = '';
                        if (comment.comment_parent_id !== null && comment.comment_parent_id !== 0) {
                            feedLink = `<a href="/userfeeds/user-feeds.do?id=\${comment.user_id}" style="text-decoration: none; color : black;"><span>@\${comment.parent_nickname}</span></a>`;
                        }

                        const commentElement = `
                            <div class="modal-comment">
                                <form id="commentForm">
                                                <input type="hidden" name="comment_id" value="\${comment.comment_id}"/>
                                                <input type="hidden" name="nickname" value="\${comment.nickname}"/>
                                                <input type="hidden" name="user_id" value="\${comment.user_id}"/>
                                                <input type="hidden" name="likeCount" value="\${comment.likeCount}"/>
                                                <input type="hidden" name="isLiked" value = "\${comment.liked}"/>
                                </form>
                                <a href="/userfeeds/user-feeds.do?id=\${comment.user_id}">
                                    <div class="modal-comment-user-logo"
                                        style="background-image: url('\${comment.profile_image}');"></div>
                                </a>
                                <div class="modal-comment-wrapper" style="display : flex; width: 75%; flex-grow: 1;">
                                    <div class="modal-comment-main">
                                        <div class="modal-comment-main-userid">
                                            <a href="/userfeeds/user-feeds.do?id=\${comment.user_id}" style="text-decoration: none; color:black">
                                                <div style="margin-left:5px; font-weight: bold;" class="userId"><strong>\${comment.nickname}</strong>
                                            </a>
                                            </div>
                                            <div style="margin-left:5px;"> \${feedLink} \${comment.content}</div>
                                        </div>
                                        <div class="modal-comment-main-content">
                                        <div class="modal-comment-main-content">
                                            <div style="color: gray;"> \${comment.regdateStr}</div>
                                            <div style="color: gray; margin-left : 5px" id="commentLike">좋아요 \${comment.likeCount}개</div>
                                            <div class="reply-btn" style="color: gray; margin-left : 5px">답글 달기</div>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots" style="margin-left : 10px;"  viewBox="0 -2 16 16">
                                              <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3"/>
                                            </svg>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-comment-like-logo" style="display : flex; align-items : center; justify-content : center; min-width: 2vw;">
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
                        const commentLike = event.target.closest('.modal-comment').querySelector('#commentLike');

                        $.ajax({
                            url: '/main/comment-like-ajax.do',
                            type: 'post',
                            data: $(commentForm).serialize(),
                            success: (obj) => {
                                commentLike.innerHTML = `좋아요 \${obj.comment.likeCount}개`;
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
                        const modalLikeCntText = event.target.closest('.modal-portfolio-overlay-bond').querySelector('#modalLikeCntText');

                        $.ajax({
                            url: '/main/portfolio-like-ajax.do',
                            type: 'post',
                            data: $(modalPortfolioForm).serialize(),
                            success: (obj) => {
                                modalLikeCntText.innerHTML = `<p style = "margin-bottom: 0px"> 좋아요 \${obj.portfolio.likeCount}개 </p>`;
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

                        const deleteCommentBtn = document.getElementById('deleteCommentBtn');
                        const reportCommentBtn = document.getElementById('reportCommentBtn');

                        deleteCommentBtn.onclick = null;
                        reportCommentBtn.onclick = null;

                        deleteCommentBtn.onclick = function() {
                            $.ajax({
                                url: '/main/delete-comment-ajax.do',
                                type: 'post',
                                data: $(commentForm).serialize(),
                                success: (obj) => {
                                    modalCommentMain.innerHTML='';
                                    // 제일 처음은 소개문
                                    const commentElement = `
                                        <div class="modal-comment">
                                            <a href="/userfeeds/user-feeds.do?id=\${obj.portfolio.user_id}">
                                                <div class="modal-comment-user-logo" style="background-image: url('\${obj.portfolio.profile_image}');"></div>
                                            </a>
                                            <div class="modal-comment-main">
                                                <a href="/userfeeds/user-feeds.do?id=\${obj.portfolio.user_id}" style="text-decoration: none; color : black;">
                                                    <div class="modal-comment-main-userid"><strong>\${obj.portfolio.nickname}</strong></div>
                                                </a>
                                                <div class="modal-comment-main-content" style="margin-left:15px">\${obj.portfolio.description}</div>
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
                                            <a href="/userfeeds/user-feeds.do?id=\${obj.portfolio.user_id}">
                                                <div class="modal-comment-user-logo" style="background-image: url('\${obj.portfolio.profile_image}');"></div>
                                            </a>
                                            <div class="modal-comment-main">
                                                <a href="/userfeeds/user-feeds.do?id=\${obj.portfolio.user_id}" style="text-decoration: none; color : black;">
                                                    <div class="modal-comment-main-userid"><strong>\${obj.portfolio.nickname}</strong></div>
                                                </a>
                                                <div class="modal-comment-main-content" style="margin-left:15px">\${obj.portfolio.description}</div>
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

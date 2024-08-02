<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 24. 7. 30.
  Time: 오후 5:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main Page</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/darkmode.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/modal-main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/mini_project(company).css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/sidebar.css">

    <style>

        .content {
            padding: 20px;
            margin-left: 20vw;
            margin-right:5vw;
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
            }

            .card-content-item {
                margin: 2vh
            }
        }

        .notification-dropdown {
            transition: background-color 0.3s, border-color 0.3s;
        }
    </style>
</head>

<body>

<div class="modal fade" id="CompanyPortFolioModal" tabindex="-1" aria-labelledby="CompanyPortFolioModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <iframe id="imageIframe" frameborder="0"></iframe>
            </div>
        </div>
    </div>
</div>

<div class="container-content d-flex">
    <div class="sidebar">
        <div class="sidebar-content d-flex flex-column">
            <div class="sidebar-icon">
                <div class="sidebar-icon-text">Poro</div>
            </div>
            <div class="sidebar-list">
                <a href="main.html" class="active nav-link" data-page="main.html">
                    <i class="bi bi-house-door"></i>
                    <div>홈</div>
                </a>
                <a href="" class="nav-link" data-page="search.html" id="sidebar-content-search-btn">
                    <i class="bi bi-search"></i>
                    <div>검색</div>
                </a>
                <a href="userfeeds.html" class="nav-link" data-page="userfeeds.html">
                    <i class="bi bi-person-circle"></i>
                    <div>내 프로필</div>
                </a>
                <a href="mini_project.html" class="nav-link" data-page="mini_project.html">
                    <i class="bi bi-card-list"></i>
                    <div>개인 포트폴리오</div>
                </a>
                <a href="mini_project(company).html" class="nav-link" data-page="mini_project(company).html">
                    <i class="bi bi-building"></i>
                    <div>기업 채용</div>
                </a>
                <a class="nav-link" id="uploadWindowBtn">
                    <i class="bi bi-upload"></i>
                    <div>업로드</div>
                </a>
                <a class="nav-link btn-secondary alarm-dropdown" data-bs-toggle="dropdown" id="notificationIcon">
                    <i class="bi bi-bell"></i>
                    <div>알림</div>
                </a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item notification-item" href="#">
                        <div>알람1</div>
                    </a></li>
                    <li><a class="dropdown-item notification-item" href="#">
                        <div>알람2</div>
                    </a></li>
                    <li><a class="dropdown-item notification-item" href="#">
                        <div>알람3</div>
                    </a></li>
                </ul>
                <a href="#" id="darkModeToggle">
                    <i class="bi bi-brightness-low"></i>
                    <div>화면 모드</div>
                </a>
                <a href="setting.html" class="nav-link" data-page="setting.html">
                    <i class="bi bi-gear"></i>
                    <div>설정</div>
                </a>
            </div>
            <div class="sidebar-list-etc">
                <a href="#" class="nav-link" data-page="setting.html">
                    <i class="bi bi-list"></i>
                    <div>더보기</div>
                </a>
            </div>
        </div>
        <div class="sidebar-content-search">
            <div class="sidebar-content-search-top d-flex flex-column justify-content-center">
                <div class="sidebar-content-search-title h2">검색</div>

            </div>
            <div class="sidebar-content-search-body">
                <div class="sidebar-content-searchbar-area sidebar-content-body-outline">
                    <form class="d-flex justify-content-center" action="#" method="post">
                        <div class="form-control sidebar-content-search-bar d-flex align-items-center">
                            <div class="sidebar-content-search-bar-icon"><i class="bi bi-search"></i></div>
                            <input type="text" placeholder="검색" id="sidebar-search-input"
                                   class="no-border-input sidebar-search-input">
                        </div>
                    </form>
                </div>
                <div class="search-recent-body">
                    <div class="search-item-profile d-flex flex-column justify-content-start">


                    </div>
                    <div class="search-recent-body-list-empty">
                        <div class="search-recent-body-list-title d-flex align-items-center">
                            <span class="h5">최근 검색 항목</span>
                        </div>
                        <div class="search-recent-body-list d-flex justify-content-center align-items-center">
                            <span class="search-recent-body-list-empty-text">최근 검색 내역 없음</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="content d-flex flex-column justify-content-start" id="main-content">
        <div class="top-line-list d-flex justify-content-end">
            <!-- <div class="base-header d-flex justify-content-center align-items-center">
                <div class="btn-group btn-group-lg" role="group" aria-label="Basic example" id="mainTopLineBtnSet">
                    <button type="button" class="btn btn-outline-dark" id="baseViewAllBtn">
                        <i class="bi bi-collection"></i>
                        <div>전체보기</div>
                    </button>
                    <button type="button" class="btn btn-outline-dark" id="basePersonalBtn">
                        <i class="bi bi-card-list"></i>
                        <div>개인 포트폴리오</div>
                    </button>
                    <button type="button" class="btn btn-dark" id="baseCompanyBtn">
                        <i class="bi bi-building"></i>
                        <div>기업 채용</div>
                    </button>
                </div>
            </div> -->
            <div class="top-line-personal-info d-flex justify-content-start align-items-center">
                <img src="/static/img/home.png" alt="">
                <div class="top-line-personal-info-identifier d-flex flex-column justify-content-center">
                    <div>닉네임<i class="bi bi-check-circle-fill"></i></div>
                    <div>이메일</div>
                </div>
            </div>
        </div>

        <form id="companyList" action="/company/mini_project(company).do" method="get">
            <ul class="container">
                <input type="hidden" name="pageNum" value="${page.cri.pageNum}"/>
                <input type="hidden" name="amount" value="${page.cri.amount}"/>
                <input type="hidden" name="endPage" value="${page.endPage}"/>
                <c:forEach items="${companyList}" var="company">
                    <li class="item">
                        <a class="company com${company.recruitment_id}">
                                <span class="logo">
                                    <c:choose>
                                        <c:when test="${company.company_icon_url != null}">
                                            <img src="${company.company_icon_url}"
                                                 alt="">
    <%--                                        alt에 이미지가 로드되지 않을 때 어떤게 들어갈지 설정해야 함 --%>
    <%--                                        c:otherwise도 고려--%>
                                        </c:when>
                                    </c:choose>
                                </span>
                            <strong class="tit">${company.recruitment_title}</strong>
                            <span class="corp">${company.company_name}</span>
                            <ul class="desc">
                                <li>
                                    <span>${company.location}<img src="${pageContext.request.contextPath}/static/img/이모티콘/1.png" alt=""></span>
                                </li>
                                <li class="company_local">${company.career}</li>
                                <li class="company_local">${company.education}
                                    <span class="above"><img src="/static/img/이모티콘/2.png" alt=""></span>
                                </li>
                            </ul>
                            <span class="date">${company.dday}</span>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </form>
    </div>
</div>

<!--업로드 모달-->
<div class="modal fade" id="uploadModal" tabindex="-1" aria-labelledby="uploadModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="uploadModalLabel">포트폴리오 업로드</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="uploadForm" autocomplete="off">
                    <div class="upload-section">
                        <label for="uploadCodeFiles">HTML, CSS, JS 파일만 업로드 가능합니다.</label>
                        <input type="file" class="form-control" id="uploadCodeFiles" accept=".html,.css,.js"
                               multiple required>
                    </div>
                    <div class="upload-section">
                        <label for="uploadThumbnailImage">본인만의 썸네일 이미지를 올려주세요.</label>
                        <input type="file" class="form-control" id="uploadThumbnailImage" accept="image/*" required>
                        <img id="uploadThumbnailPreview" class="thumbnail-preview" src="#" alt="Thumbnail Preview">
                    </div>
                    <div class="upload-section">
                        <label for="uploadPortfolioDescription">포트폴리오 설명</label>
                        <textarea class="form-control" id="uploadPortfolioDescription" rows="3" required></textarea>
                    </div>
                    <div class="upload-section">
                        <label for="uploadPortfolioTags">태그</label>
                        <input type="text" class="form-control" id="uploadPortfolioTags"
                               placeholder="태그를 쉼표로 구분하여 입력하세요" required>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">업로드</button>
                </form>
            </div>
        </div>
    </div>
</div>



<!-- 상세보기 모달 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<!-- 메인 모달 : 부트스트랩과의 css 충돌 방지를 위해 클래스명에 -main 추가-->

<!--modal-overlay는 모달 외부까지 포함한 화면, fixed로 설정-->
<div class="modal-portfolio-overlay" id="modalPortfolioOverlay">

    <!--position : absolute를 쓰기 위한 접착용 박스-->
    <div class="modal-portfolio-overlay-bond" id="modalPortfolioOverlayBond">

        <!--modal은 렌더링한 문서가 보일 뷰포트의 크기 및 위치를 지정-->
        <div class="modal-portfolio" id="modalPortfolio">

            <!--position : absolute를 쓰기 위한 접착용 박스-->
            <!--렌더링 이외에 modal-portfolio에 부착되어야 하는 코멘트창 등이 있기 때문에 bond가 필요-->
            <div class="modal-portfolio-bond" id="modalPortfolioBond">

                <!-- iframe을 사용하여 콘텐츠 로드 -->
                <iframe class="modal-portfolio-iframe" id="modalPortfolioIframe" src="about:blank"></iframe>

                <!--코멘트창 오픈-->
                <div class="model-comment-openBtn-section" id="modalCommentOpenBtnSection">
                    <div class="model-comment-openBtn" id="modalCommentOpenBtn"><svg
                            xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor"
                            class="bi bi-chevron-left" viewBox="0 0 16 16">
                        <path
                                d="M10.354 1.646a.5.5 0 0 0-.708 0l-6 6a.5.5 0 0 0 0 .708l6 6a.5.5 0 0 0 .708-.708L5.707 8l4.647-4.646a.5.5 0 0 0 0-.708z" />
                    </svg></div>
                </div>

                <!--코멘트 모달-->
                <div class="modal-comment-section" id="modalCommentSection">
                    <div class="modal-comment-section-bond" id="modalCommentSectionBond">
                        <div class="modal-comment-content" id="modalCommentContent">

                            <!--코멘트 헤더-->
                            <div class="modal-comment-header" id="modalCommentHeader">

                                <!--사용자 로고-->
                                <div class="modal-comment-header-logo" id="modalCommentHeaderLogo"></div>

                                <!--사용자 아이디-->
                                <div class="modal-comment-header-userId"> <strong>cat1</strong></div>

                                <!--옵션 버튼-->
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

                            <!--코멘트 메인-->
                            <div class="modal-comment-main" id="modalCommentMain">
                                <!-- 여기에 코멘트 추가-->
                            </div>

                            <!--코멘트 푸터-->
                            <div class="modal-comment-footer" id="modalCommentFooter">

                                <!--좋아요-->
                                <div class="modal-likeCnt" id="modalLikeCnt">
                                    <div class="modal-like-logo" id="modalLikeLogo"> <svg width="24" height="24"
                                                                                          viewBox="0 0 50 50">
                                        <path
                                                d="M34.6 3.1c-4.5 0-7.9 1.8-10.6 5.6-2.7-3.7-6.1-5.5-10.6-5.5C6 3.1 0 9.6 0 17.6c0 7.3 5.4 12 10.6 16.5.6.5 1.3 1.1 1.9 1.7l2.3 2c4.4 3.9 6.6 5.9 7.6 6.5.5.3 1.1.5 1.6.5s1.1-.2 1.6-.5c1-.6 2.8-2.2 7.8-6.8l2-1.8c.7-.6 1.3-1.2 2-1.7C42.7 29.6 48 25 48 17.6c0-8-6-14.5-13.4-14.5z"
                                                stroke="black" stroke-width="2" fill="none"
                                                transform="translate(1, 0)" />
                                    </svg></div>

                                    <!--현재 좋아요 수-->
                                    <div class="modal-likeCnt-text" id="modalLikeCntText">
                                        <!-- js로 현재까지 클릭된 좋아요 수-->
                                    </div>
                                </div>

                                <!--댓글 입력창-->
                                <div class="modal-leaveComment" id="modalLeaveComment">
                                    <input type="text" id="modalCommentInput" class="form-control"
                                           autocomplete="off" placeholder="댓글을 입력하세요...">
                                </div>
                            </div>

                            <!--코멘트창 클로즈-->
                            <div class="modal-comment-closeBtn-section" id="modalCommentCloseBtnSection">
                                <div class="modal-comment-closeBtn" id="modalCommentCloseBtn">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32"
                                         fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                                        <path
                                                d="M5.646 1.646a.5.5 0 0 1 .708 0L12.354 8l-6 6a.5.5 0 0 1-.708-.708L10.293 8 5.646 3.354a.5.5 0 0 1 0-.708z" />
                                    </svg>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- 옵션 모달 -->
<div class="modal-options-overlay" id="modalOptionsOverlay">
    <div class="modal-options-overlay-bond" id="modalOptionsOverlayBond">
        <div class="modal-options">
            <div class="modal-options-item" id="modalOptionsItemModify" data-bs-toggle="modal"
                 data-bs-target="#modifyModal">게시글 수정</div>
            <div class="modal-options-item" id="modalOptionsItemDelete">게시글 삭제</div>
            <div class="modal-options-item" id="modalOptionsItemReport">신고</div>
            <div class="modal-options-item" id="modalOptionsItemCancle">취소</div>
        </div>
    </div>
</div>

<!--수정 모달-->
<div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="modifyModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <form id="modifyForm" autocomplete="off">
                    <div class="modify-section">
                        <label for="modifyCodeFiles">수정하신 HTML, CSS, JS 파일만 업로드 가능합니다.</label>
                        <input type="file" class="form-control" id="modifyCodeFiles" accept=".html,.css,.js"
                               multiple required>
                    </div>
                    <div class="modify-section">
                        <label for="modifyThumbnailImage">수정하신 썸네일 이미지를 올려주세요.</label>
                        <input type="file" class="form-control" id="modifyThumbnailImage" accept="image/*" required>
                        <img id="modifyThumbnailPreview" class="thumbnail-preview" src="#" alt="Thumbnail Preview">
                    </div>
                    <div class="modify-section">
                        <label for="modifyPortfolioDescription">수정하신 포트폴리오 설명</label>
                        <textarea class="form-control" id="modifyPortfolioDescription" rows="3" required></textarea>
                    </div>
                    <div class="modify-section">
                        <label for="modifyPortfolioTags">수정하신 태그</label>
                        <input type="text" class="form-control" id="modifyPortfolioTags"
                               placeholder="태그를 쉼표로 구분하여 입력하세요" required>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">수정</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 삭제 모달-->
<div class="modal-delete" id="modalDelete">
    <div class="modal-delete-bond" id="modalDeleteBond">
        <div class="modal-delete-alert" id="modalDeleteAlert">정말로 삭제하시겠습니까?</div>
        <div class="modal-deleteBtn-section" id="modalDeleteBtnSection">
            <div class="modal-deleteBtn-yes" id="modalDeleteBtnYes">예</div>
            <div class="modal-deleteBtn-no" id="modalDeleteBtnNo">아니오</div>
        </div>
    </div>
</div>


<!-- 스크립트 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.7.1.min.js"></script>

<script src="${pageContext.request.contextPath}/static/js/darkmode.js"></script>
<script src="${pageContext.request.contextPath}/static/js/sidebar.js"></script>
<script>
    $(() => {
        // Load dark mode state
        var isDarkMode = loadDarkModeState();
        applyDarkMode(isDarkMode);

        $('#darkModeToggle').on('click', function () {
            isDarkMode = !$('body').hasClass('dark-mode');
            applyDarkMode(isDarkMode);
            saveDarkModeState(isDarkMode);
        });

        // $("#baseViewAllBtn").on("click", function () {
        //     window.location.href = "main.html";
        // });
        // $("#basePersonalBtn").on("click", function () {
        //     window.location.href = "mini_project.html";
        // });
        // $("#baseCompanyBtn").on("click", function () {
        //     window.location.href = "mini_project(company).html";
        // });

        // 업로드 버튼 이벤트
        $('#uploadWindowBtn').on('click', function () {
            $('#uploadModal').modal('show');
        });
    })

</script>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<scr1ipt src="${pageContext.request.contextPath}/static/js/mini_project(company).js"></scr1ipt>
<script>
    $(() => {
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

                $('#CompanyPortFolioModal .modal-content').css({
                    width: imgWidth + 'px',
                    height: imgHeight + 'px'
                });

                $('#CompanyPortFolioModal').modal('show');

                // 이미지가 로드된 후에 iframe의 src 설정
                iframe.attr('src', imageUrl);
            };
            img.src = imageUrl;
        }

        <c:forEach items="${companyList}" var="company">
            $('.com${company.recruitment_id}').on('click', function () {
                var imageUrl = '${company.recruitment_url}'; // 이미지 URL 설정
                console.log('image URL: ', imageUrl);
                showModal(imageUrl);
            });
        </c:forEach>

        // $('.com1').on('click', function () {
        //     var imageUrl = '/static/img/웹홈페이지 더미/1.png'; // 이미지 URL 설정
        //     showModal(imageUrl);
        // });

        // $('#CompanyPortFolioModal').on('hidden.bs.modal', function () {
        //     // 모달이 숨겨질 때 iframe의 src를 초기화
        //     $('#imageIframe').attr('src', '');
        // });

    });
</script>



</body>

</html>

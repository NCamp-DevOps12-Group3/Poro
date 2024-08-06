<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Sign Up Page</title>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.bundle.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/masonry.pkgd.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/darkmode.css">
<%--    <script rel="stylesheet" href="${pageContext.request.contextPath}/static/js/darkmode.js"/>--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/modal-main.css">
    <style>
        body {
            font-family: 'Helvetica Neue', Arial, sans-serif;
            background-color: #fafafa;
            color: #262626;
        }
        .list-group .list-group-item:hover{
            background-color: #ddd;
        }
        .dark-mode {
            background-color: #121212;
            color: white;
            .top-section{
                background-color: black;
            }
            .top-section #profileImgBtn{
                background-color: black;
            }
            .list-group-item {
                background-color: black;
                color: white;
            }
            .card > *{
                border: white 1px solid ;
                border-collapse: collapse;

                background-color: #262626;
            }
            .card *{
                color: white !important;
            }

            .sidebar{
                background-color: #262626;
            }
            .sidebar *{
                color: white;
            }

            .sidebar .dropdown-menu{
                background-color: black;
                color: white;
            }
            #modalProfile *{
                background: black;
                color: white;
            }

        }
        .top-section {
            padding: 20px;
            background: #fff;
            border-bottom: 1px solid #dbdbdb;
            margin-bottom: 20px;
            height: 30vh;
        }
        .bottom-section {
            padding: 20px;
            height: 70vh;
        }
        .toggle-btn {
            display: block;
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 1;
            border: none;
            background: none;
            cursor: pointer;
        }
        .toggle-btn img {
            width: 30px;
            height: 30px;
        }
        #modalProfile {
            -ms-overflow-style: none;
        }
        #modalProfile::-webkit-scrollbar {
            display: none;
            max-width: 75vw;
            min-width: 25vw;
            min-height: 70vh;
        }
        .sil {
            cursor: pointer;
            -ms-overflow-style: none;
        }
        .sil::-webkit-scrollbar {
            display: none;
        }
        .card-img-top:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .mouse-Cursor {
            cursor: pointer;
        }
        .modal-fullscreen {
            max-width: none;
            width: 100%;
            height: 90%;
            margin: 15px auto;
        }
        .modal-content-short {
            background-color: rgba(0, 0, 0, 0.5);
            color: white;
            height: 100%;
        }
        @media (max-width: 1200px) {
            .top-section {
                display: none !important;
            }
            #profileInfoBtn {
                display: block !important;
            }
        }
        .modal-content {
            border: none;
            border-radius: 15px;
        }
        .modal-header {
            border-bottom: 1px solid #dbdbdb;
        }
        .modal-footer {
            border-top: 1px solid #dbdbdb;
        }
        .carousel-item img {
            height: 75vh;
            width: auto;
            object-fit: cover;
        }
        .modal-portfolio-btn {
            height: 2em;
            width: 4em;
            cursor: pointer;
        }
        #profileInfoBtn {
            display: none;
        }
        .modal-fullscreen .modal-content {
            height: 100vh;
            border: none;
        }
        .preview-box {
            position: absolute;
            display: none;
            background-color: #fff;
            border: 1px solid #ccc;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 10px;
            z-index: 1000;
        }
        .delete-dot {
            cursor: pointer;
            position: absolute;
            background: rgba(0, 0, 0, 0.5);
            display: none;
            z-index: 1000;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            top: 10px;
            right: 10px;
        }
        .bookmark-icon {
            cursor: pointer;
            position: absolute;
            background: rgba(0, 0, 0, 0);

            z-index: 1000;
            width: 20px;
            height: 20px;
            top: 10px;
            right: 10px;
        }
        #profileImgBtn {
            border: none;
            background: white;
            width: 30vh;
        }
        #profileImg {
            object-fit: cover;
            border-radius: 50%;
            width: 100%;
            height: 100%;
        }
        #checkImg {
            width: 1em;
            height: 1em;
        }
        .top-section > * {
            margin-left: 10px;
        }
        #toTop {
            display: none;
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 99;
            font-size: 16px;
            padding: 10px;
            border: none;
            cursor: pointer;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
        }
        .card img {
            max-height: 100%;
            max-width: 100%;
        }
        .grid-item img {
            display: block;
            width: 100%;
            transition: transform 0.2s ease-in-out;
        }
        .grid-item {
            margin-bottom: 20px;
        }
        .sidebar {
            width: 15vw;
            height: 100vh;
            top: 0;
            left: 0;
            background: #f8f9fa;
            padding-top: 20px;
        }
        .sidebar a {
            display:flex;
            justify-content: flex-start;
            align-items: center;
            padding: 10px 20px;
            color: #333;
            text-decoration: none;
        }
        .sidebar a:hover {
            background-color: #ddd;
        }
        .sidebar img{
            width:30px;
            height:auto;
        }
        .sidebar div{
            display: inline-block;
            margin-left:10px;
        }
        .sidebar i{
            font-size:1.5em;
        }
        @media screen and (max-width:900px){
            .sidebar div{
                display:none;
            }
        }

        @media screen and (max-width:770px){
            .sidebar{
                width:50px;
            }
            .sidebar a {
                padding: 10px 10px;

            }
            .sidebar div{
                display:none;
            }
        }
        .card-info-toggle{
            display: none;
        }
        .swiper-container {
            width: 100%;
            height: 100%;
        }
        .swiper-slide {
            background: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .swiper-slide iframe {
            width: 80%;
            height: 80%;
            border: none;
        }
        container{
            display: flex;
            flex-direction: column;
            max-width: 930px;
            justify-content: center;
        }
        .mouseHover:hover{
            font-weight: bold;
            cursor: pointer;
        }
        .grid-item {
            margin-bottom: 30px;
            position: relative;
        }
        .img-container {
            position: relative;
            width: 100%;
            overflow: hidden;
            padding-top: 75%; /* 4:3 Aspect Ratio */
        }
        .img-container img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover; /* Maintain aspect ratio */
        }
        .details-container {
            display: none;
            position: absolute;
            top: 0;
            left: 0%;
            width: 100%;
            height: 200%;
            background: rgba(0,0,0,0.6);
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.6);
            -ms-overflow-style: none;  /* IE and Edge */
            scrollbar-width: none;  /* Firefox */
            z-index: 100;
            overflow-y: auto;
        }
        .details-container::-webkit-scrollbar {
            display: none;  /* Chrome, Safari, Opera */
        }
        .grid-item:hover .details-container {

            display: block;
        }
        .company-icon {
            width: 50px;
            height: auto;
            display: block;
            margin-bottom: 10px;
        }
        .details-container img{
            background-color: white;
            margin-bottom: 10%;
        }
        .modal-body {
            display: flex;
            max-height: 70vh;
            overflow-y: auto;
        }

        .message-list-container {
            flex: 1;
            margin-right: 20px;
            overflow-y: auto;
        }

        .message-content-container {
            flex: 2;
            display: none;
            overflow-y: auto;
        }
    </style>
</head>
<body>
<button type="button" id="toTop">↑</button>
<div class="container-fluid  d-flex">
    <jsp:include page="${pageContext.request.contextPath}/sidebar.jsp"/>
    <div class="container d-inline-block w-100">
        <button class="btn-toggle btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalProfile" id="profileInfoBtn">
            profile
        </button>
        <div class="top-section d-flex align-items-center">
            <button class="ratio ratio-1x1 mx-3" type="button" data-bs-toggle="modal" data-bs-target="#modal-short" id="profileImgBtn">
                <c:choose>
                    <c:when test="${profile.profile_image != null}">
                        <img src="${profile.profile_image}" alt="" class="mouse-Cursor" id="profileImg">
                    </c:when>
                    <c:otherwise>
                        <img src="/static/img/default.png" alt="" class="mouse-Cursor" id="profileImg">
                    </c:otherwise>
                </c:choose>
            </button>
            <div class="w-50">
                <div class="mouse-Cursor mb-3" id="profileName">
                    <p class="d-inline-block" >${profile.name}</p>
                    <i class="bi bi-check-circle-fill d-inline-block mx-1" id="checkImg"></i>
                    <a href="#" class=" d-inline-block" style="color: #6c757d">
                        <i class="bi bi-gear d-inline-block" style="text-decoration:none">Setting</i>
                        <!-- <button type="button" id="profileEdit">edit</button> -->
                    </a>
                </div>
                <div class="mb-3">
                    <p class="d-inline-block">${profile.portfolioCnt}</p>
                    <b class="d-inline-block" id="numberOfPortfolio"></b>
                </div>
                <div>
                    <b class="mb-3">${profile.name} ${profile.email}</b>
                    <p class="overflow-x-scroll sil">
                        ${profile.introduction}
                    </p>
                </div>
            </div>
            <c:choose>
                <c:when test="${isOwner eq true}">
                    <div class="list-group text-center">
                        <!-- <a href="#" class="list-group-item">follow</a>
                        <a href="#" class="list-group-item">message</a> -->
                        <button type="button" class="list-group-item inactive" id="portfolioDelete">delete</button>
                        <button class="list-group-item message-box">message box</button>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="list-group text-center">
                        <c:choose>
                            <c:when test="${follow != true}">
                                <button type="button" class="btn btn-outline-dark followBtn d-inline-block" >follow</button>
                                <button type="button" class="btn btn-primary unfollowBtn d-none" >unfollow</button>
                            </c:when>
                            <c:otherwise>
                                <button type="button" class="btn btn-outline-dark followBtn d-none" >follow</button>
                                <button type="button" class="btn btn-primary unfollowBtn d-inline-block" >unfollow</button>
                            </c:otherwise>
                        </c:choose>
                        <button class="list-group-item">message</button>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        <c:if test="${isOwner eq true}">
            <nav class="navbar navbar-expand-lg bg-body-tertiary border border-dark rounded my-3">
                <div class="container-fluid">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse align-items-center justify-content-center" id="navbarSupportedContent">
                        <ul class="navbar-nav">
                            <li class="nav-item mx-3 mouseHover">
                                <p class="nav-link" id="linkHome">Home</p>
                            </li>
                            <li class="nav-item mx-3 mouseHover">
                                <p class="nav-link" id="linkCoperation">coperation collection</p>
                            </li>
                            <li class="nav-item mx-3 mouseHover">
                                <p class="nav-link" id="linkOtherPortfolio">portfolio collection</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </c:if>
        <div class="bottom-section">
            <form action="/userfeeds/feed-form.do" method="post" id="formFeeds">
                <input type="hidden" name="pageNum" value="${page.cri.pageNum}">
                <input type="hidden" name="amount" value="${page.cri.amount}">
                <input type="hidden" name="endPage" value="${page.endPage}">
                <input type="hidden" name="deleteList" id="deleteList" value="">
                <input type="hidden" name="id" value="${page.userid}">
                <input type="hidden" name="pageType" value="${page.pageType}">
                <div class="row grid" id="feed">
                    <c:if test="${page.pageType eq 'home'}">
                        <c:forEach items="${portfolio}" var="portfolio">
                            <div class="col-sm-12 col-lg-6 col-xxl-4 grid-item">
                                <div class="card">
                                    <div class="card-header">
                                            ${portfolio.user_id}
                                    </div>
                                    <c:choose>
                                        <c:when test="${isOwner eq true}">
                                            <input type="checkbox" class="delete-dot" value="${portfolio.portfolio_id}">
                                        </c:when>
                                        <c:otherwise>
                                            <c:choose>
                                                <c:when test="${portfolio.bookmarked}">
                                                    <label class="bookmark-icon" value="${portfolio.portfolio_id}">
                                                        <i class="bi bi-bookmark-fill"></i>
                                                    </label>
                                                </c:when>
                                                <c:otherwise>
                                                    <label class="bookmark-icon" value="${portfolio.portfolio_id}">
                                                        <i class="bi bi-bookmark"></i>
                                                    </label>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:otherwise>
                                    </c:choose>
                                    <div>
                                    <c:choose>
                                        <c:when test="${portfolio.thumbnail_url != null}">
                                            <img src="${portfolio.thumbnail_url}" class="card-img-top" alt="." id="${portfolio.portfolio_id}">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="/static/img/default.png" alt="" class="card-img-top" id="${portfolio.portfolio_id}">
                                        </c:otherwise>
                                    </c:choose>
                                    <iframe  class="card-iframe ratio ratio-1x1" style="display:none" id="${portfolio.portfolio_id}iframe"
                                             srcdoc="${portfolio.mergeCode}">
                                    </iframe>
                                    </div>
                                    <div class="card-body">
                                        <p class="card-text">
                                                ${portfolio.skillname}
                                        </p>
                                        <p class="card-text card-info-toggle">
                                                ${portfolio.description}
                                        </p>
                                    </div>
                                    <div class="card-footer">
                                        <small class="text-body-secondary"><javatime:format value="${portfolio.regdate}" pattern="yyyy-MM-dd"/></small>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${page.pageType eq 'coperation'}">
                        <c:forEach items="${coperation}" var="coperation">
                            <div class="col-sm-12 col-lg-6 col-xxl-4 grid-item">
                                <div class="card">
                                     <div class="img-container">
                                        <c:choose>
                                            <c:when test="${coperation.company_icon_url != null}">
                                                <img src="${coperation.company_icon_url}" alt="${coperation.company_name}">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="/static/img/default.png" alt="${coperation.company_name}">
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <c:if test="${isOwner eq true}">
                                        <input type="checkbox" class="delete-dot" value="${coperation.bookmark_id}">
                                    </c:if>
                                    <div class="details-container">
                                        <c:choose>
                                            <c:when test="${coperation.company_icon_url != null}">
                                                <img src="${coperation.company_icon_url}" alt="${coperation.company_name}">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="/static/img/default.png" alt="${coperation.company_name}">
                                            </c:otherwise>
                                        </c:choose>
                                        <h5>${coperation.company_name}</h5>
                                        <p>${coperation.skillname}</p>
                                        <p>${coperation.recruitment_title}</p>
                                        <p>${coperation.dday}</p>
                                        <p>${coperation.location}</p>
                                        <p>${coperation.career}</p>
                                        <p>${coperation.education}</p>
                                        <p>
                                            <javatime:format value="${coperation.regdate}" pattern="yyyy-MM-dd"/>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${page.pageType eq 'otherportfolio'}">
                        <c:forEach items="${otherportfolio}" var="portfolio">
                            <div class="col-sm-12 col-lg-6 col-xxl-4 grid-item">
                                <div class="card">
                                    <c:if test="${isOwner eq true}">
                                        <input type="checkbox" class="delete-dot" value="${portfolio.bookmark_id}">
                                    </c:if>
                                    <div class="img-container">
                                        <c:choose>
                                            <c:when test="${portfolio.thumbnail_url != null}">
                                                <img src="${portfolio.thumbnail_url}">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="/static/img/default.png">
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="details-container">
                                        <c:choose>
                                            <c:when test="${portfolio.thumbnail_url != null}">
                                                <img src="${portfolio.thumbnail_url}">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="/static/img/default.png">
                                            </c:otherwise>
                                        </c:choose>
                                        <div>
                                            <p>
                                                    ${portfolio.user_id}
                                            </p>
                                            <p>
                                                    ${portfolio.skillname}
                                            </p>
                                            <p>
                                                    ${portfolio.description}
                                            </p>
                                            <p>
                                                <javatime:format value="${portfolio.regdate}" pattern="yyyy-MM-dd"/>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </form>
        </div>
        <div class="modal fade" data-bs-backdrop="static" id="modal-short">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content modal-content-short">
                    <div class="modal-header">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                    <div class="modal-body sil" id="modal-body-div">
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                                <c:forEach items="${popularPortfolio}" var="porfol">
                                    <div class="swiper-slide">
                                        <iframe srcdoc="${porfol.mergeCode}"></iframe>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="swiper-pagination"></div>
                            <div class="swiper-button-next"></div>
                            <div class="swiper-button-prev"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>




        <!--  모달로 띄우는 유저 프로필 -->
        <div class="modal fade" id="modalProfile">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-head">
                        <h3 class="text-lg-center mt-3">정보</h3>
                    </div>
                    <div class="modal-body h-75 text-center">
                        <div class="ratio ratio-1x1 mb-3">
                            <img src="${profile.profile_image}" alt="" id="profile-vertical">
                        </div>
                        <div>
                        <pre class="overflow-x-scroll sil" id="scrollContainer">
                            ${profile.introduction}
                        </pre>
                        </div>
                        <div class="list-group">
                            <c:if test="${isOwner eq false}">
                                <c:choose>
                                    <c:when test="${follow != true}">
                                        <button type="button" class="btn btn-outline-dark  followBtn d-inline-block">follow</button>
                                        <button type="button" class="btn btn-primary unfollowBtn d-none">unfollow</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button type="button" class="btn btn-outline-dark followBtn d-none">follow</button>
                                        <button type="button" class="btn btn-primary unfollowBtn d-inline-block" >unfollow</button>
                                    </c:otherwise>
                                </c:choose>
                                <button class="list-group-item "data-bs-dismiss="modal">message</button>
                            </c:if>
                            <c:if test="${isOwner eq true}">
                                <button class="list-group-item message-box">message box</button>
                            </c:if>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                            닫기
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="messageModal" tabindex="-1" aria-labelledby="messageModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="messageModalLabel">Send Message</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="messageForm">
                    <div class="mb-3">
                        <label for="messageContent" class="form-label">Message</label>
                        <textarea class="form-control" id="messageContent" rows="4"  required></textarea>
                    </div>
                    <input type="hidden" id="recipientId" value="${profile.user_id}">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="messageModalClose">Close</button>
                <button type="button" class="btn btn-primary" id="sendMessageButton">Send Message</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="storedMessagesModal" tabindex="-1" aria-labelledby="messagesModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="messagesModalLabel">Messages</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body d-flex" style="max-height: 70vh; overflow-y: auto;">
                <div class="message-list-container" style="flex: 1; margin-right: 20px;">
                    <ul class="list-group" id="messageList">
                        <!-- 메시지 목록이 여기에 동적으로 추가됩니다. -->
                    </ul>
                </div>
                <div class="message-content-container" style="flex: 2; display: none;">
                    <h6>Message Content</h6>
                    <p id="messageText"></p>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<div id="upload-modal-container"></div>

<!--
####################################################################################################################
####################################################################################################################
####################################################################################################################
####################################################################################################################
####################################################################################################################
####################################################################################################################
####################################################################################################################
####################################################################################################################
####################################################################################################################
####################################################################################################################
####################################################################################################################
####################################################################################################################
####################################################################################################################
-->
<script>

    $(function(){
        // 초기 화면 설정, 자동 배치 위한 설정 부분
        // var isDarkMode = loadDarkModeState();
        // applyDarkMode(isDarkMode);
        // $('#darkModeToggle').on('click', function() {
        //     isDarkMode = !$('body').hasClass('dark-mode');
        //     applyDarkMode(isDarkMode);
        //     saveDarkModeState(isDarkMode);
        // });
        var msnry;
        var grid = document.querySelector('.grid');
        imagesLoaded(grid, function() {
            msnry = new Masonry(grid, {
                itemSelector: '.grid-item',
                columnWidth: '.grid-item',
                percentPosition: true
            });
        });

        //백 단까지 처리해야 하는 부분
        //삭제 버튼 클릭시 발생하는 부분
        $('#portfolioDelete').on('click',()=>{
            toggleButtonState();
        });
        //로드 하는 부분 collection,home두 부분 나눠서 로드하는 방법 필요
        let hoverTimeout;
        $(document).on('mouseenter', '.card-img-top', function() {
            hoverTimeout = setTimeout(() => {
                $(this).css("display", "none");
                $(this).siblings().first().css("display", "block");
                console.log($(this).siblings().first())
                imagesLoaded('.grid', function() {
                    msnry.reloadItems();
                    msnry.layout();
                });
            }, 1000);
        });


        $(document).on('mouseleave', '.card-img-top', function() {
            clearTimeout(hoverTimeout);
        });
        $(document).on('mouseenter', '.card-iframe', function() {
            $(this).height($(".bottom-section").height());
            imagesLoaded('.grid', function() {
                msnry.reloadItems();
                msnry.layout();
            });
        });
        $(document).on('mouseleave', '.card-iframe', function() {
            clearTimeout(hoverTimeout);
            $(this).css("transform", "scale(1)");
            $(this).siblings().first().css("display", "block");
            $(this).css("display", "none");
            imagesLoaded('.grid', function() {
                msnry.reloadItems();
                msnry.layout();
            });
        });


        $(window).on("scroll",(e)=>{

            //현재 스크롤 위치
            const scollTop=$(window).scrollTop();
            //브라우저 세로길이 스크롤 포함하지 않음
            const windowHeight=window.innerHeight;
            //웹문서 세로길이 스크롤 길이 포함
            const documentHeight=document.documentElement.scrollHeight;
            //스크롤이 바닥에 닿았는지 확인
            const isBottom=documentHeight<=scollTop+windowHeight;
            if (isBottom){
                //현재 페이지가 마지막 페이지인가?
                if($("input[name='pageNum']").val()>=$("input[name='endPage']").val()){
                    console.log("scroll not load")
                    return;
                }
                else{
                    //마지막페이지가 아니고 스크롤이 바닥에 닿으면 현재페이지값을 1 증가시킨다.
                    $("input[name='pageNum']").val(parseInt($("input[name='pageNum']").val())+1);
                    console.log("scroll load")
                    load();
                }
            }

        });



        let swiper;
        $('#modal-short').on('shown.bs.modal', function () {
            if (swiper) {
                swiper.destroy(true, true);
            }
            swiper = new Swiper('.swiper-container', {
                loop: true,
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },
                pagination: {
                    el: '.swiper-pagination',
                    clickable: true,
                },
            });

        });
        $("#linkHome").on("click",(e)=>{
            $("input[name='pageType']").val("home");
            $("#formFeeds").submit();
        })
        $("#linkCoperation").on("click",(e)=>{
            $("input[name='pageType']").val("coperation");
            $("#formFeeds").submit();
        })
        $("#linkOtherPortfolio").on("click",(e)=>{
            $("input[name='pageType']").val("otherportfolio");
            $("#formFeeds").submit();
        })
        // 단순 화면단에서 처리가능한 부분
        $('.modal-portfolio-btn').hover(
            ()=>{
                $('#modal-short').css('cursor','pointer');
                $('body').css('cursor','pointer');
            },
            ()=>{
                $('#modal-short').css('cursor','default');
                $('body').css('cursor','default');
            }
        );
        $('#profileName').on('click',()=>{
            $('#profileInfoBtn').click();
        });
        function scrollFunction() {
            if (document.documentElement.scrollTop > 3) {
                document.getElementById("toTop").style.display = "block";
            } else {
                document.getElementById("toTop").style.display = "none";
            }
        }
        $('#toTop').on('click',function scrollToTop() {
                document.documentElement.scrollTop = 0;
            }
        );
        const scrollContainer = document.getElementById('scrollContainer');

        let isDown = false;
        let startX;
        let scrollLeft;

        scrollContainer.addEventListener('mousedown', (e) => {
            isDown = true;
            scrollContainer.classList.add('active');
            startX = e.pageX - scrollContainer.offsetLeft;
            scrollLeft = scrollContainer.scrollLeft;
        });

        scrollContainer.addEventListener('mouseleave', () => {
            isDown = false;
            scrollContainer.classList.remove('active');
        });

        scrollContainer.addEventListener('mouseup', () => {
            isDown = false;
            scrollContainer.classList.remove('active');
        });

        scrollContainer.addEventListener('mousemove', (e) => {
            if (!isDown) return;
            e.preventDefault();
            const x = e.pageX - scrollContainer.offsetLeft;
            const walk = (x - startX) * 2; // 스크롤 속도 조정
            scrollContainer.scrollLeft = scrollLeft - walk;
        });
        $(document).on('mouseenter', '.card-body', function(){
            $(this).children('.card-info-toggle').css("display", "block");
            imagesLoaded('.grid', function() {
                msnry.reloadItems();
                msnry.layout();
            });
        });

        $(document).on('mouseleave', '.card-body', function(){
            $(this).children('.card-info-toggle').css("display", "none");
            imagesLoaded('.grid', function() {
                msnry.reloadItems();
                msnry.layout();
            });
        });
        $(document).on('mouseleave', '.card-info-toggle', function(){
            $(this).css("display", "none");
            imagesLoaded('.grid', function() {
                msnry.reloadItems();
                msnry.layout();
            });
        });
        $(".followBtn").on("click",(e)=>{
            $.ajax({
                url: '/userfeeds/follow.do',
                method: 'POST',
                data: { id: $("input[name='id']").val() },
                success: function(response){
                    if(response.success){
                        $(".followBtn").removeClass("d-inline-block")
                        $(".followBtn").addClass("d-none")
                        $(".unfollowBtn").removeClass("d-none")
                        $(".unfollowBtn").addClass("d-inline-block")
                        alert('팔로우에 추가되었습니다.');
                    } else {
                        alert('팔로우 추가에 실패했습니다.');
                    }
                },
                error: function(){
                    alert('오류가 발생했습니다.');
                }
            });
        })
        $(".unfollowBtn").on("click",(e)=>{
            $.ajax({
                url: '/userfeeds/unfollow.do',
                method: 'POST',
                data: { id: $("input[name='id']").val() },
                success: function(response){
                    if(response.success){
                        $(".followBtn").removeClass("d-none")
                        $(".followBtn").addClass("d-inline-block")
                        $(".unfollowBtn").removeClass("d-inline-block")
                        $(".unfollowBtn").addClass("d-none")
                        alert('팔로우에서 삭제되었습니다.');
                    } else {
                        alert('팔로우 삭제에 실패했습니다.');
                    }
                },
                error: function(){
                    alert('오류가 발생했습니다.');
                }
            });
        })

        const deleteList=[];
        //프론트 단에서 만 사용하는 함수
        const zeroDate=(date)=>{
            return date<10 ? `0\${date}` :date;
        }
        //백 단 처리에 이용되는 함수
        const makeImageElement=(file)=>{
            if(file != null && file.filetype ==='image')
                return `<img width="100%" src="/upload/\${file.filename}" />`
            return `<img width="100%" src="/static/img/search.png"/>`
        }

        function load(){
            $.ajax({
                url:'/userfeeds/feed-ajax.do',
                type:'post',
                data:$("#formFeeds").serialize(),
                success:(obj)=>{
                    $("#feed").append($.parseHTML(obj));

                    imagesLoaded(grid, function() {
                        msnry.reloadItems();
                        msnry.layout();
                    });
                },
                error:(err)=>{
                    alert("로드 실패");
                    console.log(err);
                }

            });

        }
        function toggleButtonState() {
            let button = document.getElementById('portfolioDelete');
            let isActive = button.classList.contains('active');
            if (isActive) {
                button.classList.remove('active');
                button.classList.add('inactive');
                button.textContent = 'delete';
                $('.delete-dot').css('display','none');
                deleteList.length = 0;
                let elements = document.querySelectorAll('.delete-dot:checked');
                elements.forEach(function(element) {
                    deleteList.push(element.getAttribute("value"));
                });
                $("#deleteList").val(JSON.stringify(deleteList));
                $('#formFeeds').submit();
            } else {
                button.classList.remove('inactive');
                button.classList.add('active');
                button.textContent = 'confirm';
                $('.delete-dot').css('display','inline-block');
            }
        }
        $(document).on('click', '.card-img-top', function(event) {
            const portfolioId = $(this).attr('id'); // 'this'는 클릭된 요소를 참조합니다.
            $.ajax({
                url: '/main/modal-ajax.do',
                type: 'post',
                data: {
                    portfolio_id: portfolioId // 변수명에 따옴표를 사용하지 마세요.
                },
                success: (obj) => {
                    console.log(obj)
                    openModal(obj);
                },
                error: (err) => {
                    console.log(err);
                }
            });
        });
        $(document).on('click', '.list-group-item', function(e) {
            if ($(this).text().trim() === 'message') {
                $("#modalProfile").modal('hide');
                $('#messageModal').modal('show');
            }
        });
        // 메시지 보내기 버튼 클릭 이벤트
        $(document).on('click','#sendMessageButton' ,function() {
            const messageContent = $('#messageContent').val().trim();
            const recipientId = $('#recipientId').val();
            if (messageContent) {
                // 메시지 전송 AJAX 요청
                $.ajax({
                    url: '/userfeeds/sendMessage',
                    type: 'POST',
                    data: {
                        recipientId: recipientId,
                        messageContent: messageContent
                    },
                    success: function(response) {
                        if (response.success) {
                            alert('Message sent successfully');
                            $("#messageModalClose").click();
                            $('#messageContent').val(''); // 메시지 내용 초기화
                        } else {
                            alert('Failed to send message');
                        }
                    },
                    error: function(error) {
                        console.log(error);
                        alert('An error occurred while sending the message');
                    }
                });
            } else {
                alert('Please enter a message');
            }
        });
        $(document).on('click', '.bookmark-icon', function(evt){
            const portfolioId = $(this).attr('value');
            const $this=$(this);
            $.ajax({
                url: '/userfeeds/bookmark.do',
                method: 'POST',
                data: {
                    id: portfolioId
                },
                success: function(response){
                    if(response.success){
                        alert("북마크")
                        if ($this.children().first().hasClass("bi-bookmark")){
                            $this.children().first().removeClass("bi-bookmark");
                            $this.children().first().addClass("bi-bookmark-fill");
                        }
                        else if ($this.children().first().hasClass("bi-bookmark-fill")){
                            $this.children().first().removeClass("bi-bookmark-fill");
                            $this.children().first().addClass("bi-bookmark");
                        }else {
                            console.log($this.children())
                        }

                    } else {
                        alert('실패했습니다.');
                    }
                },
                error: function(){
                    alert('오류가 발생했습니다.');
                }
            });
        });
        $(document).on('click', '.message-box', function() {
            $.ajax({
                url: '/userfeeds/getMessages',
                type: 'GET',
                success: function(response) {
                    if (response.success) {
                        const messages = response.messages;
                        const messageList = $('#messageList');
                        messageList.empty();
                        messages.forEach(message => {
                            const listItem = $('<li>')
                                .addClass('list-group-item mouseHover')
                                .text(message.sender_name)
                                .attr('data-message', message.message_content);
                            messageList.append(listItem);
                        });
                    } else {
                        alert('Failed to load messages');
                    }
                },
                error: function(error) {
                    console.log(error);
                    alert('An error occurred while loading the messages');
                }
            });

            $('#storedMessagesModal').modal('show');
        });

        $(document).on('click', '#messageList .list-group-item', function() {
            const messageContent = $(this).attr('data-message');
            $('#messageText').text(messageContent);
            $('.message-content-container').show();
        });
    });
</script>
<script>

    function openModal(obj){

        if(obj){


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
                                                                           class="bi bi-suit-heart portfolio-like-logo" viewBox="0 0 16 16">
                                                                           <path
                                                                               d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.6 7.6 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
                                                                       </svg>
                                                                       <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="red"
                                                                           class="bi bi-suit-heart-fill portfolio-like-logo hidden" viewBox="0 0 16 16">
                                                                           <path
                                                                               d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1" />
                                                                       </svg>
                                                                   </div>
                                                               </div>

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

                                                   </div>
                                               </div>
                                           </div>
                                       </div>
                                   </div>
                               </div>
                           `

            modalBox.innerHTML = htmlStr;
            document.body.appendChild(modalBox);

            let replymode = false;
            let comment_id = 0;
            let curr_reply_box = null;
            let curr_comment_box = null;

            const iframe = document.getElementById('modalPortfolioIframe');

            const modalLikeCntText = document.getElementById('modalLikeCntText');
            // 현재의 좋아요 수를 댓글창에 표시
            modalLikeCntText.innerHTML = `<p> 좋아요 \${obj.portfolio.likeCount}</p>`;

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
                        const commentBox = document.createElement('div');
                        commentBox.classList.add('comment-box');
                        container.appendChild(commentBox);
                        const commentElement = `
                            <form id="commentForm">
                                            <input type="hidden" name="comment_id" value="\${comment.comment_id}">
                            <div class="modal-comment">
                                <a href="">
                                    <div class="modal-comment-user-logo"
                                        style="background-image: url('/static/img/cat1.jpg');"></div>
                                </a>
                                <div class="modal-comment-wrapper" style="display : flex; width: 75%;">
                                    <div class="modal-comment-main">
                                        <div class="modal-comment-main-userid">
                                            <div style="margin-left:5px; font-weight: bold;" class="userId"><strong>cat\${comment.user_id}</strong>
                                            </div>
                                            <div style="margin-left:5px;">\${comment.content}</div>
                                        </div>
                                        <div class="modal-comment-main-content">
                                            <div style="color: gray;">1주</div>
                                            <div style="color: gray; margin-left : 10px">좋아요 1만개</div>
                                            <div class="reply-btn" style="color: gray; margin-left : 10px">답글 달기</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-comment-like-logo" style="display : flex; align-items : center">
                                    <div class="modal-comment-like-logo-wrapper">
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

                    console.log(event.target);
                    // 클릭된 요소가 reply-view인지 확인합니다.
                    if (event.target.classList.contains('reply-view')) {
                        const replyBox = event.target.closest('.comment-box').querySelector('.reply-box');
                        if (replyBox) {
                            replyBox.style.display = replyBox.style.display === 'none' ? 'flex' : 'none';
                        }
                    }

                    if (event.target.classList.contains('reply-btn')){
                        curr_comment_box = event.target.closest('.comment-box');
                        curr_reply_box = curr_comment_box.querySelector('.reply-box');
                        if(!curr_reply_box){
                            curr_reply_box = event.target.closest('.reply-box');
                        }

                        console.log(curr_reply_box);
                        replymode = true;
                        const modalCommentInput = document.getElementById('modalCommentInput');
                        modalCommentInput.focus();
                        const commentForm = event.target.closest('.comment-box').querySelector('form');
                        comment_id = commentForm.querySelector('input[name="comment_id"]').value;
                    }

                    if (event.target.classList.contains('form-control')){
                        replymode = false;
                        comment_id = 0;
                    }

                    if (event.target.closest('.modal-comment-like-logo-wrapper')){
                        const heartOutline = event.target.closest('.modal-comment-like-logo-wrapper').querySelector('.bi-suit-heart');
                        const heartFilled = event.target.closest('.modal-comment-like-logo-wrapper').querySelector('.bi-suit-heart-fill');
                        heartOutline.classList.toggle('hidden');
                        heartFilled.classList.toggle('hidden');
                    }

                    if (event.target.closest('.modal-portfolio-like-logo-wrapper')){
                        const heartOutline2 = event.target.closest('.modal-portfolio-like-logo-wrapper').querySelector('.bi-suit-heart');
                        const heartFilled2 = event.target.closest('.modal-portfolio-like-logo-wrapper').querySelector('.bi-suit-heart-fill');
                        heartOutline2.classList.toggle('hidden');
                        heartFilled2.classList.toggle('hidden');
                    }
                }
                modalCommentContent.addEventListener('click', modalCommentContentHandler);

                // 댓글 입력 로직 (1. 비동기로 DB에 저장  2.저장 성공시 HTML에 동적 DOM 생성하는 renderCommentToDOM 호출)
                function addComment(comment, comment_id, portfolio_id){
                    // 서버에 댓글 저장 요청
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
                    // 새로운 댓글 요소 생성 (필요한 HTML 구조에 맞게 작성)
                    const commentBox = document.createElement('div');
                    commentBox.classList.add('comment-box');

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
                                                    <div style="margin-left:5px;">\${comment}</div>
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
                                            </div>
                                        </div>
                                    </div>
                                `;

                    // 댓글 박스에 새 댓글 HTML 추가
                    commentBox.insertAdjacentHTML('beforeend', commentElement);

                    if(!replymode){
                        // 기존 댓글 목록에 새 댓글 박스 추가
                        document.getElementById('modalCommentMain').appendChild(commentBox);
                    }else{
                        if(curr_reply_box){
                            curr_reply_box.appendChild(commentBox);
                        }else{
                            curr_comment_box.insertAdjacentHTML('beforeend', '<div class="reply-view" style="color : gainsboro;"> ---- 답글 보기 ---- </div>');
                            const replyBox2 = document.createElement('div');
                            replyBox2.classList.add('reply-box');
                            replyBox2.style.display = 'none';
                            curr_comment_box.appendChild(replyBox2);
                            replyBox2.appendChild(commentBox);
                        }
                    }
                }
                // 댓글창 이벤트핸들러 (엔터키 입력시 addComment 메소드 실행이 목적)
                function createCommentInputHandler(e) {
                    if (e.key.toLowerCase() === "enter") {
                        e.preventDefault();
                        const comment = this.value.trim();
                        if (comment) {
                            addComment(comment, comment_id, obj.portfolio.portfolio_id);
                        }
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

        }
    }


</script>
</body>
</html>
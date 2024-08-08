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
        #storedMessagesModal .modal-body {
            display: flex;
            max-height: 70vh;
            overflow-y: auto;
        }

        #storedMessagesModal .message-list-container {
            flex: 1;
            margin-right: 20px;
            overflow-y: auto;
        }

        #storedMessagesModal .message-content-container {
            flex: 2;
            display: none;
            overflow-y: auto;
        }
        #messageModal .modal-body {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: calc(100% - 120px); /* modal-header와 modal-footer의 높이를 제외한 높이 설정 */
        }

        #messageModal .modal-body textarea {
            flex: 1;
            resize: none; /* 크기 조절 불가 */
        }

        #messageModal .modal-footer {
            display: flex;
            justify-content: space-between;
            padding: 10px;
        }

        #messageModal .modal-footer .btn {
            width: 100px; /* 버튼의 너비 설정 */
        }

        #messageModal .text-danger {
            margin-top: 5px;
            display: none;
        }
        #sendMessageTitle {
            border-radius: 5px;
            padding: 10px;
            width: 100%;
            border: 1px solid #ced4da;
            transition: border-color 0.2s;
        }
        #sendMessageTitle:focus {
            border-color: #80bdff;
            outline: 0;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.25);
        }
        textarea {
            resize: none;
        }
        .custom-card {
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .custom-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 30px rgba(0, 0, 0, 0.1);
        }
        .custom-img-container {
            overflow: hidden;
            height: 200px;
        }
        .custom-img-container img {
            object-fit: cover;
            width: 100%;
            height: 100%;
        }
        .custom-delete-dot {
            width: 20px;
            height: 20px;
        }
        .custom-card-title {
            font-size: 1.25rem;
            font-weight: 700;
        }
        .custom-card-text {
            margin-bottom: 0.75rem;
        }
        .custom-grid-item {
            margin-bottom: 30px;
        }
        .rotate-btn {
            display: inline-block;
            margin-top: 10px;
        }
        .rotate-btn .bi {
            margin-right: 5px;
        }
    </style>
</head>
<body>
<button type="button" id="toTop">↑</button>
<div class="container-fluid  d-flex">
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/sidebar.jsp"></jsp:include>
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
                    <c:if test="${isOwner eq true}">
                        <a href="/user/settings.do" class=" d-inline-block" style="color: #6c757d">
                            <i class="bi bi-gear d-inline-block" style="text-decoration:none">Setting</i>
                        </a>
                    </c:if>
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
                                        <c:choose>
                                            <c:when test="${portfolio.correct_PORTFOLIO_URL}">
                                                <iframe  class="card-iframe ratio ratio-1x1" style="display:none" id="${portfolio.portfolio_id}iframe"
                                                         src="${portfolio.PORTFOLIO_URL}"
                                                         data-code-type="URL">
                                                </iframe>
                                            </c:when>
                                            <c:otherwise>
                                                <iframe  class="card-iframe ratio ratio-1x1" style="display:none" id="${portfolio.portfolio_id}iframe"
                                                         srcdoc="${portfolio.mergeCode}"
                                                         data-code-type="CODE">
                                                </iframe>
                                            </c:otherwise>
                                        </c:choose>

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
                            <div class="col-sm-12 col-lg-6 col-xxl-4 custom-grid-item">
                                <div class="custom-card shadow-sm border-0 rounded-lg overflow-hidden">
                                    <div class="custom-card-header bg-white border-0">
                                        <div class="custom-img-container position-relative">
                                            <c:choose>
                                                <c:when test="${coperation.company_icon_url != null}">
                                                    <img src="${coperation.company_icon_url}" alt="${coperation.company_name}" class="img-fluid rounded">
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="/static/img/default.png" alt="${coperation.company_name}" class="img-fluid rounded">
                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${isOwner eq true}">
                                                <input type="checkbox" class="custom-delete-dot delete-dot position-absolute top-0 end-0 m-2" value="${coperation.bookmark_id}">
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="custom-card-body p-4">
                                        <h5 class="custom-card-title">${coperation.company_name}</h5>
                                        <p class="custom-card-text">${coperation.skillname}</p>
                                        <p class="custom-card-text">${coperation.recruitment_title}</p>
                                        <p class="custom-card-text">${coperation.dday}</p>
                                        <p class="custom-card-text">${coperation.location}</p>
                                        <p class="custom-card-text">${coperation.career}</p>
                                        <p class="custom-card-text">${coperation.education}</p>
                                        <p class="custom-card-text text-muted">
                                            <javatime:format value="${coperation.regdate}" pattern="yyyy-MM-dd"/>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${page.pageType eq 'otherportfolio'}">
                        <c:forEach items="${otherportfolio}" var="portfolio">
                            <div class="col-sm-12 col-lg-6 col-xxl-4 custom-grid-item">
                                <div class="custom-card shadow-sm border-0 rounded-lg overflow-hidden">
                                    <div class="custom-card-header bg-white border-0">
                                        <div class="custom-img-container position-relative">
                                            <c:choose>
                                                <c:when test="${portfolio.thumbnail_url != null}">
                                                    <img src="${portfolio.thumbnail_url}" class="img-fluid rounded">
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="/static/img/default.png" class="img-fluid rounded">
                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${isOwner eq true}">
                                                <input type="checkbox" class="custom-delete-dot delete-dot position-absolute top-0 end-0 m-2" value="${portfolio.bookmark_id}">
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="custom-card-body p-4">
                                        <h5 class="custom-card-title">${portfolio.user_id}</h5>
                                        <p class="custom-card-text">${portfolio.skillname}</p>
                                        <p class="custom-card-text">${portfolio.description}</p>
                                        <p class="custom-card-text text-muted">
                                            <javatime:format value="${portfolio.regdate}" pattern="yyyy-MM-dd"/>
                                        </p>
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
                                        <c:choose>
                                        <c:when test="${porfol.correct_PORTFOLIO_URL}">
                                            <iframe
                                                     src="${porfol.PORTFOLIO_URL}">
                                            </iframe>
                                        </c:when>
                                        <c:otherwise>
                                            <iframe
                                                     srcdoc="${porfol.mergeCode}">
                                            </iframe>
                                        </c:otherwise>
                                        </c:choose>
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
                    <div>
                        <label for="sendMessageTitle" class="form-label">title</label>
                        <input type="text" id="sendMessageTitle" maxlength="25">
                    </div>
                    <div class="mb-3">
                        <label for="messageContent" class="form-label">Message</label>
                        <textarea class="form-control overflow-y-hidden" id="messageContent" rows="4" required></textarea>
                        <div id="error-message" class="text-danger">메시지는 4줄을 넘을 수 없습니다.</div>
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
                    <form action="/userfeeds/deleteMessage.do" id="deleteMessagesModalForm">
                        <ul class="list-group" id="messageList">
                            <!-- 메시지 목록이 여기에 동적으로 추가됩니다. -->
                        </ul>
                    </form>
                </div>
                <div class="message-content-container" style="flex: 2; display: none;">
                    <h6>Message Content</h6>
                    <p id="messageText"></p>
                    <form id="replyMessageForm">
                        <input type="hidden" id="messageTextId">
                        <input type="hidden" id="messageTitle">
                        <div class="mb-3">
                            <label class="my-3 form-label" from="reply-message"/>
                            <textarea id="reply-message"  class="overflow-y-hidden form-control" style="width: 100%" rows="4"></textarea>
                        </div>
                        <button type="button" class="btn btn-primary my-3" id="replyMessageButton">Reply</button>
                    </form>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-outline-dark message-delete-list-btn">delete</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="storedMessagesModalClose">Close</button>
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
            console.log(isBottom)
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
        scrollFunction();
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
            console.log("load portfolio")
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
            const srcdoc=$(this).siblings().first().attr('srcdoc');
            $.ajax({
                url: '/main/modal-ajax.do',
                type: 'post',
                data: {
                    portfolio_id: portfolioId // 변수명에 따옴표를 사용하지 마세요.
                },
                success: (obj) => {
                    console.log(obj)
                    openModal(obj,srcdoc);
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
            const messageTitle=$('#sendMessageTitle').val().trim();
            if (messageContent) {
                // 메시지 전송 AJAX 요청
                $.ajax({
                    url: '/userfeeds/sendMessage.do',
                    type: 'POST',
                    data: {
                        recipientId: recipientId,
                        messageContent: messageContent,
                        title:messageTitle
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
        function padZero(num) {
            return num.toString().padStart(2, '0');
        }
        $(document).on('click','.message-delete-list-btn',function (){
            $.ajax({
                url: '/userfeeds/deleteMessage.do',
                type: 'post',
                data:$("#deleteMessagesModalForm").serialize(),
                success: function(response) {
                    if (response.success) {
                        $("#storedMessagesModalClose").click();
                        setTimeout(function(){
                            $(".message-box").click();
                        }, 500);
                        alert('success to delete messages')
                    } else {
                        alert('Failed to delete messages');
                    }
                },
                error: function(error) {
                    console.log(error);
                    alert('An error occurred while deleting the messages');
                }
            });
        });
        $(document).on('click', '.message-box', function() {
            $.ajax({
                url: '/userfeeds/getMessages.do',
                type: 'GET',
                success: function(response) {
                    if (response.success) {
                        const messages = response.messages;
                        const messageList = $('#messageList');

                        messageList.empty();
                        messages.forEach(message => {
                            const dateArray = message.send_date;
                            const formattedDate = dateArray[0]+"-"+(dateArray[1])+"-"+dateArray[2]+"  "+dateArray[3]+":"+dateArray[4];
                            const title =message.title+"    " + message.sender_name+" "+formattedDate;
                            const listItem = $('<li>')
                                .addClass('list-group-item mouseHover')
                                .text(title)
                                .attr('data-message', message.message_content)
                                .attr('data-message-id', message.message_id)
                                .attr('data-message-sender-id',message.sender_id)
                                .attr('data-message-title',message.title)
                            const checkBox = $('<input>')
                                .attr('type', 'checkbox')
                                .attr('name', 'messageIds')
                                .attr('value', message.message_id)
                                .addClass('form-check-input');
                            const checkBoxWrapper = $('<div>').addClass('form-check').append(checkBox);
                            listItem.append(checkBoxWrapper);
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
            $('#messageTitle').val($(this).attr("data-message-title"));
            $("#messageTextId").val($(this).attr("data-message-sender-id"));
            $('.message-content-container').show();
        });

        const messageContent = document.getElementById('messageContent');
        const errorMessage = document.getElementById('error-message');

        messageContent.addEventListener('input', function() {
            const lines = messageContent.value.split('\n').length;
            if (lines > 4) {
                errorMessage.style.display = 'block';
                messageContent.value = messageContent.value.split('\n').slice(0, 4).join('\n');
            } else {
                errorMessage.style.display = 'none';
            }
        });
        $(document).on('click', '#replyToggleIcon', function() {
            $('#reply-message').toggleClass('collapse');
            $('#replyMessageButton').toggle();
            $(this).toggleClass('bi-chevron-down bi-chevron-up');
        });

        $(document).on('click', '#replyMessageButton', function() {
            const messageContent = $('#reply-message').val().trim();
            const recipientId = $('#messageTextId').val();
            const messageTitle = $('#messageTitle').val();
            const title = (messageTitle ? messageTitle.trim() : "No Title") + "의 회신입니다.";
            if (messageContent) {
                $.ajax({
                    url: '/userfeeds/sendMessage.do',
                    type: 'POST',
                    data: {
                        recipientId: recipientId,
                        messageContent: messageContent,
                        title:title
                    },
                    success: function(response) {
                        if (response.success) {
                            alert('Message sent successfully');
                            $('#reply-message').val(''); // 메시지 내용 초기화
                            $('#replyToggleIcon').click(); // 텍스트 영역 접기
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
    });

</script>
<script>

    function openModal(obj,srcdoc){
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

            const iframe = document.getElementById('modalPortfolioIframe');
            iframe.srcdoc = srcdoc;



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
                                <div class="modal-comment-wrapper" style="display : flex; width: 75%;">
                                    <div class="modal-comment-main">
                                        <div class="modal-comment-main-userid">
                                            <a href="/userfeeds/user-feeds.do?id=\${comment.user_id}" style="text-decoration: none; color:black">
                                                <div style="margin-left:5px; font-weight: bold;" class="userId"><strong>\${comment.nickname}</strong>
                                            </a>
                                            </div>
                                            <div style="margin-left:5px;"> \${feedLink} \${comment.content}</div>
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
                                            <a href="/userfeeds/user-feeds.do?id=\${obj.portfolio.user_id}">
                                                <div class="modal-comment-user-logo" style="background-image: url('\${obj.portfolio.profile_image}');"></div>
                                            </a>
                                            <div class="modal-comment-main">
                                                <a href="/userfeeds/user-feeds.do?id=\${obj.portfolio.user_id}" style="text-decoration: none; color : black;">
                                                    <div class="modal-comment-main-userid"><strong>\${obj.portfolio.nickname}</strong></div>
                                                </a>
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
                    if(event.target.closest('.modal-comment-main-box')){
                        return;
                    }
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
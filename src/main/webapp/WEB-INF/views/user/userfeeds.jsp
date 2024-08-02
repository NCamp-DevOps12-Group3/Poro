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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/js/darkmode.js">
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
    </style>
</head>
<body>
<button type="button" id="toTop">↑</button>
<div class="container-fluid  d-flex">
    <jsp:include page="/WEB-INF/views/user/sidebar.jsp"/>
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
            <div class="list-group text-center">
                <!-- <a href="#" class="list-group-item">follow</a>
                <a href="#" class="list-group-item">message</a> -->
                <button type="button" class="list-group-item inactive" id="portfolioDelete">delete</button>
            </div>
        </div>
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
        <div class="bottom-section">
            <form action="/feed-form.do" method="post" id="formFeeds">
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
                                    <input type="checkbox" class="delete-dot" value="${portfolio.portfolio_id}">
                                    <a href="/feed-detail.do">
                                        <c:choose>
                                            <c:when test="${portfolio.thumbnail_url != null}">
                                                <img src="${portfolio.thumbnail_url}" class="card-img-top" alt=".">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="/static/img/default.png" alt="" class="card-img-top">
                                            </c:otherwise>
                                        </c:choose>
                                        <iframe  class="card-iframe ratio ratio-1x1" style="display:none" id="${portfolio.portfolio_id}iframe"
                                                 srcdoc="${portfolio.mergeCode}">
                                        </iframe>
                                    </a>
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
                            <input type="checkbox" class="delete-dot" value="${coperation.bookmark_id}">
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
                            </div>
                        </div>
                    </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${page.pageType eq 'otherportfolio'}">
                        <c:forEach items="${otherportfolio}" var="portfolio">
                            <div class="col-sm-12 col-lg-6 col-xxl-4 grid-item">
                                <div class="card">
                                <input type="checkbox" class="delete-dot" value="${portfolio.bookmark_id}">
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
                            <a href="#" class="list-group-item">follow</a>
                            <a href="#" class="list-group-item">message</a>
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
        $(".card-img-top").on("mouseenter",
            function (evt){
                hoverTimeout = setTimeout(() => {
                    $(this).css("display","none");
                    $(this).siblings().first().css("display","block");
                    imagesLoaded(grid, function() {
                        msnry.reloadItems();
                        msnry.layout();
                    });
                }, 2000);
            }
        );

        $(".card-img-top").on("mouseleave",function (evt){
                clearTimeout(hoverTimeout);
            }
        );
        $(".card-iframe").on("mouseenter",function (evt){
                $(this).height($(".bottom-section").height());
                imagesLoaded(grid, function() {
                    msnry.reloadItems();
                    msnry.layout();
                });
            }
        );
        $(".card-iframe").on("mouseleave",function (evt){
                clearTimeout(hoverTimeout);
                // $(this).attr('src',"");
                $(this).css("transform","scale(1)");
                $(this).siblings().first().css("display","block");
                $(this).css("display","none");
                imagesLoaded(grid, function() {
                    msnry.reloadItems();
                    msnry.layout();
                });
            }
        );

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
                    return;
                }
                else{
                    //마지막페이지가 아니고 스크롤이 바닥에 닿으면 현재페이지값을 1 증가시킨다.
                    $("input[name='pageNum']").val(parseInt($("input[name='pageNum']").val())+1);
                    load();
                }
            }

        });

        // $('#uploadWindowBtn').on('click', function() {
        //     $('#upload-modal-container').load('upload_modal.html', function() {
        //         $('#uploadModal').modal('show');
        //     });
        // });


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
        $(document).on('mouseenter', '.card-text', function(){
            $(this).siblings('.card-info-toggle').css("display", "block");
            imagesLoaded('.grid', function() {
                msnry.reloadItems();
                msnry.layout();
            });
        });

        $(document).on('mouseleave', '.card-text', function(){
            $(this).siblings('.card-info-toggle').css("display", "none");
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

        function mergeFile(htmlContentList,cssContentList,jsContentList){
            const merged_cssContent = cssContentList.join('\n');
            const merged_htmlContent = htmlContentList.join('\n');
            const merged_jsContent = jsContentList.join('\n');
            const merged_content = `
            &lt;!DOCTYPE html&gt;
            &lt;html lang="en"&gt;
            &lt;head&gt;
                &lt;meta charset="UTF-8"&gt;
                &lt;meta name="viewport" content="width=device-width, initial-scale=1.0"&gt;
                &lt;title&gt;Merged HTML&lt;/title&gt;
                &lt;style&gt;
                    ${merged_cssContent}
                &lt;/style&gt;
            &lt;/head&gt;
            &lt;body&gt;
                ${merged_htmlContent}
                &lt;script&gt;
                ${merged_jsContent}
                &lt;/script&gt;
            &lt;/body&gt;
            &lt;/html&gt;
            `;
            return (merged_content);
        }
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
                url:'/feed-ajax.do',
                type:'post',
                data:$("#formFeeds").serialize(),
                success:(obj)=>{
                    let htmlStr="";
                    if (obj.portfolioList) {
                        for (let i=0; i<obj.portfolioList.length; i++){
                            const srcdoc = mergeFile(obj.portfolioList[i].htmlCode,obj.portfolioList[i].cssCode,obj.portfolioList[i].jsCode);
                            htmlStr += `
                                <div class="col-sm-12 col-lg-6 col-xxl-4 grid-item">
                                    <div class="card">
                                        <div class="card-header">
                                            ${obj.portfolioList[i].user_id}
                                        </div>
                                        <input type="checkbox" class="delete-dot" value="${obj.portfolioList[i].portfolio_id}">
                                        <a href="/feed-detail.do" id="iframe${obj.portfolioList[i].portfolio_id}">
                                            <img src="${obj.portfolioList[i].thumbnail_url}" class="card-img-top" alt=".">
                                            <iframe srcdoc="${srcdoc}" class="card-iframe ratio ratio-1x1" style="display:none" id="iframe${obj.portfolioList[i].portfolio_id}"></iframe>
                                        </a>
                                        <div class="card-body">
                                            <p class="card-text">
                                                ${obj.portfolioList[i].skillname}
                                            </p>
                                            <p class="card-text card-info-toggle">
                                                ${obj.portfolioList[i].description}
                                            </p>
                                        </div>
                                        <div class="card-footer">
                                            <small class="text-body-secondary">${obj.portfolioList[i].regdate}</small>
                                        </div>
                                    </div>
                                </div>
                            `;
                        }
                    } else if (obj.recruitmentList) {
                        for (let i=0; i<obj.recruitmentList.length; i++){
                            htmlStr += `
                            <div class="col-sm-12 col-lg-6 col-xxl-4 grid-item ">
                                    <input type="checkbox" class="delete-dot" value="${obj.recruitmentList[i].bookmark_id}">
                                    <div class="img-container">
                                        <c:choose>
                                            <c:when test="${obj.recruitmentList[i].company_icon_url != null}">
                                                <img src="${obj.recruitmentList[i].company_icon_url}" alt="${obj.recruitmentList[i].company_name}">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="/static/img/default.png" alt="${obj.recruitmentList[i].company_name}">
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="details-container">
                                        <c:choose>
                                            <c:when test="${obj.recruitmentList[i].company_icon_url != null}">
                                                <img src="${obj.recruitmentList[i].company_icon_url}" alt="${obj.recruitmentList[i].company_name}">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="/static/img/default.png" alt="${obj.recruitmentList[i].company_name}">
                                            </c:otherwise>
                                        </c:choose>
                                        <h5>${obj.recruitmentList[i].company_name}</h5>
                                        <p>${obj.recruitmentList[i].skillname}</p>
                                        <p>${obj.recruitmentList[i].recruitment_title}</p>
                                        <p>${obj.recruitmentList[i].dday}</p>
                                        <p>${obj.recruitmentList[i].location}</p>
                                        <p>${obj.recruitmentList[i].career}</p>
                                        <p>${obj.recruitmentList[i].education}</p>
                                    </div>
                            </div>

                            `;
                        }
                    } else if (obj.otherPortfolioList) {
                        for (let i=0; i<obj.otherPortfolioList.length; i++){
                            htmlStr += `


                                <div class="col-sm-12 col-lg-6 col-xxl-4 grid-item">
                                <input type="checkbox" class="delete-dot" value="${obj.otherPortfolioList[i].bookmark_id}">
                                <div class="img-container">
                                    <c:choose>
                                        <c:when test="${obj.otherPortfolioList[i].thumbnail_url != null}">
                                            <img src="${obj.otherPortfolioList[i].thumbnail_url}">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="/static/img/default.png">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="details-container">
                                    <c:choose>
                                        <c:when test="${obj.otherPortfolioList[i].thumbnail_url != null}">
                                            <img src="${obj.otherPortfolioList[i].thumbnail_url}">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="/static/img/default.png">
                                        </c:otherwise>
                                    </c:choose>
                                    <div>
                                        <p>
                                                ${obj.otherPortfolioList[i].user_id}
                                        </p>
                                        <p>
                                                ${obj.otherPortfolioList[i].skillname}
                                        </p>
                                        <p>
                                                ${obj.otherPortfolioList[i].description}
                                        </p>
                                        <p>
                                            <javatime:format value="${obj.otherPortfolioList[i].regdate}" pattern="yyyy-MM-dd"/>
                                        </p>
                                    </div>
                                </div>

                                </div>


                            `;
                        }
                    }
                    $("#feed").append(htmlStr);
                    imagesLoaded(grid, function() {
                        msnry.reloadItems();
                        msnry.layout();
                    });
                },
                error:(err)=>{
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
        function setIframeContent() {
            $('.swiper-iframe').each(function() {
                var mergeCode = $(this).data('merge-code');
                var iframeDocument = this.contentWindow.document;
                iframeDocument.open();
                iframeDocument.write(mergeCode);
                iframeDocument.close();
            });
        }
    });
</script>
</body>
</html>
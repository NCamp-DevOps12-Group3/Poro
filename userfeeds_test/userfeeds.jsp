<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Sign Up Page</title>
    <link href="static/css/bootstrap.css" rel="stylesheet">
    <script src="static/js/jquery-3.7.1.min.js"></script>
    <script src="static/js/bootstrap.bundle.js"></script>
    <script src="static/js/masonry.pkgd.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="static/css/darkmode.css">
    <link rel="stylesheet" href="static/css/modal-main.css">
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
        }
    </style>
</head>
<body>
<button type="button" id="toTop">↑</button>
<div class="container-fluid  d-flex">
    <jsp:include page="../../sidebar.jsp"></jsp:include>
    <div class="container d-inline-block w-100">
        <button class="btn-toggle btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalProfile" id="profileInfoBtn">
            profile
        </button>

        <div class="top-section d-flex align-items-center">
            <button class="ratio ratio-1x1 mx-3" type="button" data-bs-toggle="modal" data-bs-target="#modal-short" id="profileImgBtn">
                <!-- <img src="/upload/${profile.profileimage}" alt="" class="mouse-Cursor" id="profileImg"> -->
            </button>
            <div class="w-50">
                <div class="mouse-Cursor mb-3" id="profileName">
                    <p class="d-inline-block" >name</p>
                    <i class="bi bi-check-circle-fill d-inline-block mx-1" id="checkImg"></i>
                    <a href="#" class=" d-inline-block" style="color: #6c757d">
                        <i class="bi bi-gear d-inline-block" style="text-decoration:none">Setting</i>
                        <!-- <button type="button" id="profileEdit">edit</button> -->
                    </a>
                </div>
                <div class="mb-3">
                    <p class="d-inline-block">게시물 숫자</p>
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
        <nav class="navbar navbar-expand-lg bg-body-tertiary border border-dark rounded">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse align-items-center justify-content-center" id="navbarSupportedContent">
                    <ul class="navbar-nav">
                        <li class="nav-item mx-3 mouseHover">
                            <a class="nav-link active" href="#">Home</a>
                        </li>
                        <li class="nav-item mx-3 mouseHover">
                            <a class="nav-link" href="#">collection</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- 이 부분  -->
        <div class="bottom-section">
            <form action="/feed-form.do" method="post" id="formFeeds">
                <input type="hidden" name="deleteList" value="">
                <div class="row grid" id="feed">
                    <!-- Masonry grid items will be appended here -->
                </div>
            </form>
        </div>
        <!-- 이 부분 iframe 내부에 집어넣을 html,css,js파일 필요 -->
        <div class="modal fade" data-bs-backdrop="static" id="modal-short">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content modal-content-short">
                    <div class="modal-header">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                    <div class="modal-body sil" id="modal-body-div">
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                    <iframe src="index.html"></iframe>
                                </div>
                                <div class="swiper-slide">
                                    <iframe src="main.html"></iframe>
                                </div>
                                <div class="swiper-slide">
                                    <iframe src="setting.html"></iframe>
                                </div>
                            </div>
                            <div class="swiper-pagination"></div>
                            <div class="swiper-button-next"></div>
                            <div class="swiper-button-prev"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 이 부분 이미지로드,소개글,팔로우 여부 정보 필요 -->
        <div class="modal fade" id="modalProfile">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-head">
                        <h3 class="text-lg-center mt-3">정보</h3>
                    </div>
                    <div class="modal-body h-75 text-center">
                        <div class="ratio ratio-1x1 mb-3">
                            <img src="/upload/${profile.profileimage}" alt="" id="profile-vertical">
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
<script>
    const deleteList=[];
    const zeroDate=(date)=>{
        return date<10 ? `0\${date}` :date;
    }
    const makeImageElement=(file)=>{
        if(file != null && file.filetype ==='image')
            return `<img width="100%" src="/upload/\${file.filename}" alt=\${file.fileoriginname}/>`
        return `<img width="100%" src="/static/img/search.png" alt=\${file.fileoriginname}/>`
    }
    const mergeFile=function (htmlContentList,cssContentList,jsContentList){
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
    function load(){
        $.ajax({
            url:'/userfeeds/feed-ajax.do',
            type:'post',
            data:$("#formFeeds").serialize(),
            success:(obj)=>{
                let htmlStr="";
                for (let i=0;i<obj.portfolioList.length ;i++){
                    htmlStr+=`
                                    <div class="col-sm-12 col-lg-6 col-xxl-4 grid-item">
        <div class="card">
            <div class="card-header">
                ${obj.portfolioList[i].id}
            </div>
            <input type="checkbox" class="delete-dot" value="${obj.portfolioList[i].id}">
            <a href="/feed-form.do">
                <img src="/upload/${obj.portfolioList[i].thumnailurl}" class="card-img-top" alt=".">
                <iframe height="1076" srcdoc=mergeFile(${obj.portfolioList[i]}) class="card-iframe ratio ratio-1x1" style="display:none"></iframe>
            </a>
            <div class="card-body">
            <p class="card-text">
                ${obj.portfolioList[i].skillname}
            </p>
            <p class="card-text card-info-toggle">
                ${obj.portfolioList[i].content}
            </p>
            </div>
            <div class="card-footer">
                <small class="text-body-secondary">${obj.portfolioList[i].regdate}</small>
            </div>
        </div>
    </div>
                                    `;
                }
                $("#feed").append(htmlStr);
            },
            error:(err)=>{
                console.log(err);
            }
        });

        imagesLoaded(grid, function() {
            msnry.reloadItems();
            msnry.layout();
        });
        $('#numberOfPortfolio').text(portfolioNum);
    }
    function toggleButtonState() {
        let button = document.getElementById('portfolioDelete');
        let isActive = button.classList.contains('active');

        if (isActive) {
            button.classList.remove('active');
            button.classList.add('inactive');
            button.textContent = 'delete';
            $('.delete-dot').css('display','none');
            let elements = document.querySelectorAll('.delete-dot:checked');
            elements.forEach(function(element) {
                deleteList.push(element.getAttribute("value"));
            });
            $('#formFeeds').submit();
        } else {
            button.classList.remove('inactive');
            button.classList.add('active');
            button.textContent = 'confirm';
            $('.delete-dot').css('display','inline-block');
        }
    }
    $(function(){
        var isDarkMode = loadDarkModeState();
        applyDarkMode(isDarkMode);

        $('#darkModeToggle').on('click', function() {
            isDarkMode = !$('body').hasClass('dark-mode');
            applyDarkMode(isDarkMode);
            saveDarkModeState(isDarkMode);
        });
        // Masonry initialization
        var msnry;
        var grid = document.querySelector('.grid');
        imagesLoaded(grid, function() {
            msnry = new Masonry(grid, {
                itemSelector: '.grid-item',
                columnWidth: '.grid-item',
                percentPosition: true
            });
        });
        //이 부분에서 삭제하는 부분 수정 필요


        $('#portfolioDelete').on('click',()=>{
            toggleButtonState();
        });
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
        const urlSources = [
            'https://rogierdeboeve.com/', 'https://des.obys.agency/', 'https://cedroweb3.ai/',
            'https://www.umault.com/', 'https://www.hellokuya.co/', 'https://dolceactivation.dolcegabbana.com/',
            'https://hailstonelabs.com/', 'https://www.kreyda.art/', 'https://awsmd.com/',
            'https://youniqlabs.io/', 'https://awsmd.com', 'https://awsmd.com/'
        ];
        let page = 1;
        //로드 하는 부분 collection,home두 부분 나눠서 로드하는 방법 필요
        load();
        let hoverTimeout;
        $(".card-img-top").on("mouseenter",
            function (evt){
                hoverTimeout = setTimeout(() => {
                    $(this).css("display","none");
                    $(this).siblings().first().attr('src',urlSources[parseInt(Math.random()*12)]);
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
                $(this).attr('src',"");
                $(this).css("transform","scale(1)");
                $(this).siblings().first().css("display","block");
                $(this).css("display","none");
                imagesLoaded(grid, function() {
                    msnry.reloadItems();
                    msnry.layout();
                });
            }
        );

        $(window).scroll(function() {

            if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
                page++;
                load();
            }
            scrollFunction();
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
        $('#uploadWindowBtn').on('click', function() {
            $('#upload-modal-container').load('upload_modal.html', function() {
                $('#uploadModal').modal('show');
            });
        });
        $('#modal-short').on('show.bs.modal', function (e) {
            $('#modal-short .modal-body .modal-content').attr("src", 'example/example.html');
        });
        $('#modal-portfolio-btn-left').on('click',function (e) {
            $('#modal-short .modal-body .modal-content').attr("src", 'example/example1.html');
        });
        $('#modal-portfolio-btn-right').on('click',function (e) {
            $('#modal-short .modal-body .modal-content').attr("src", 'example/example2.html');
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
    });
</script>
</body>

</html>
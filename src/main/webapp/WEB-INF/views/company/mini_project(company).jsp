<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/modal-main.css">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/mini_project(company).css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/sidebar.css">

    <style>

        .content {
            padding: 20px;
            margin-left: 10vw;
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

        .colorRed {
            color: red;
            font-weight: bold;
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

    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/sidebar.jsp"></jsp:include>

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

        <form id="companyList" action="/company/mini_project(company).do" method="post">
            <ul class="container company-wrapper">
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
                                <span class="date <c:choose>
                                                    <c:when test="${company.dday == 'D-Day'}">
                                                        colorRed
                                                    </c:when>
                                                  </c:choose>">${company.dday}</span>
                            </a>
                        </li>
                    </c:forEach>
<%--                </p>--%>
            </ul>
        </form>
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

        $(window).on("scroll", (e) => {
            const scrollTop = $(window).scrollTop();
            const windowHeight = window.innerHeight;
            const documentHeight = document.documentElement.scrollHeight;
            const isBottom = documentHeight <= scrollTop + windowHeight;

            if (isBottom) {
                if ($("input[name='pageNum']").val() >= $("input[name='endPage']").val()) {
                    return;
                } else {
                    $("input[name='pageNum']").val(parseInt($("input[name='pageNum']").val()) + 1);
                    $.ajax({
                        url: '/company/company-list-ajax.do',
                        type: 'post',
                        data: $("#companyList").serialize(),
                        success: (obj) => {
                            let htmlStr = "";
                            for (let i = 0; i < obj.companyList.length; i++) {
                                const companyIconUrl = obj.companyList[i].companyDto.company_icon_url; // 회사 아이콘 URL을 가져옵니다.

                                let logoHtml = `<span class="logo">`;

                                if (companyIconUrl) {
                                    logoHtml += `<img src="\${companyIconUrl}" alt="">`;
                                }
                                logoHtml += `</span>`;

                                htmlStr += `
                                    <li class="item">
                                        <a class="company com\${obj.companyList[i].companyDto.recruitment_id}">
                                                \${logoHtml}
                                            <strong class="tit">\${obj.companyList[i].companyDto.recruitment_title}</strong>
                                            <span class="corp">\${obj.companyList[i].companyDto.company_name}</span>
                                            <ul class="desc">
                                                <li>
                                                    <span>\${obj.companyList[i].companyDto.location}<img src="/static/img/이모티콘/1.png" alt=""></span>
                                                </li>
                                                <li class="company_local">\${obj.companyList[i].companyDto.career}</li>
                                                <li class="company_local">\${obj.companyList[i].companyDto.education}
                                                    <span class="above"><img src="/static/img/이모티콘/2.png" alt=""></span>
                                                </li>
                                            </ul>
                                             <span class="date \${obj.companyList[i].companyDto.dday == 'D-Day' ? 'colorRed' : ''}">\${obj.companyList[i].companyDto.dday}</span>
                                        </a>
                                    </li>
                               `;

                            }

                            $(".company-wrapper").append(htmlStr);

                            $('.company-wrapper').on('click', '.company', function () {
                                const recruitmentId = $(this).attr('class').match(/com(\d+)/)[1]; // 클릭한 회사의 ID 추출
                                console.log(recruitmentId);
                                const company = obj.companyList.find(c => c.companyDto.recruitment_id == recruitmentId); // 해당 회사 정보 찾기
                                console.log(company);
                                // 회사 정보가 존재하는지 확인
                                if (company && company.companyDto) {
                                    const imageUrl = company.companyDto.recruitment_url; // 이미지 URL 설정
                                    showModal(imageUrl); // 모달 호출
                                } else {
                                    console.error('회사 정보를 찾을 수 없습니다.');
                                }
                            });

                        },
                        error: (err) => {
                            console.log(err);
                        }
                    });


                }


            }

        });


    });
</script>
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
                showModal(imageUrl);
            });
        </c:forEach>
    });
</script>

</body>

</html>

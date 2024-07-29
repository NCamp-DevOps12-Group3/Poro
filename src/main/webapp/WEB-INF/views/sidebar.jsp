<%--
  Created by IntelliJ IDEA.
  User: BITCAMP
  Date: 24. 7. 29.
  Time: 오후 2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
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
                            <input type="text" placeholder="검색" id="sidebar-search-input" class="no-border-input sidebar-search-input">
                            <div class="sidebar-content-search-delete-icon"><i class="bi bi-x-circle"></i></div>
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
</body>
</html>

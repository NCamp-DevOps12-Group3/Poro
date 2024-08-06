
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Main Page</title>
	
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
	      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<!-- Font Awesome CSS -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
	<!-- Bootstrap Icons CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<!-- Custom CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/add-main.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/darkmode.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/modal-main.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/sidebar.css">
	<style>
        .content {
            padding: 20px;
            margin-left: 20vw;
            margin-right: 5vw;
            height: 100vh;

        }

        /* 상단 바 */
        .top-line-list {
            position: fixed;
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


        .notification-dropdown {
            transition: background-color 0.3s, border-color 0.3s;
        }
	</style>
</head>
<body style="z-index: 99999; position: relative !important;  ">
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
			<a href="/user/settings.do" class="nav-link" data-page="/settings.do">
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
	<div class="sidebar-content-search" style="z-index: 99999;   ">
		<div class="sidebar-content-search-top d-flex flex-column justify-content-center">
			<div class="sidebar-content-search-title h2">검색</div>
		
		</div>
		<div class="sidebar-content-search-body" >
			<div class="sidebar-content-searchbar-area sidebar-content-body-outline">
				<form class="d-flex justify-content-center" action="#" method="post">
					<div class="form-control sidebar-content-search-bar d-flex align-items-center">
						<div class="sidebar-content-search-bar-icon"><i class="bi bi-search"></i></div>
						<input type="text" placeholder="검색" id="sidebar-search-input" class="no-border-input sidebar-search-input"
						       value="searchKeyword">
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
<!-- Optional JavaScript -->
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!-- Custom JavaScript -->
<script src="${pageContext.request.contextPath}/static/js/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/darkmode.js"></script>
<script src="${pageContext.request.contextPath}/static/js/modal-main.js"></script>
<script src="${pageContext.request.contextPath}/static/js/sidebar.js"></script>
</body>
</html>

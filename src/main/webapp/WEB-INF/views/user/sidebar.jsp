<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .sidebar {
            display: inline-block;
            height: 100%;
            width: 15vw;
            background-color: #f8f9fa;
            padding-top: 20px;
        }
        .sidebar a {
            display: block;
            padding: 10px 20px;
            color: #333;
            text-decoration: none;
        }
        .sidebar a:hover {
            background-color: #ddd;
        }

    </style>
</head>
<body>

<div class="sidebar">
    <a href="main.html" class="active nav-link" data-page="main.html">
        <i class="bi bi-house-door"></i><div>홈</div>
    </a>
    <a href="setting.html" class="nav-link" data-page="setting.html">
        <i class="bi bi-gear"></i>
        <div>설정</div>
    </a>
    <a href="#" class="nav-link" data-page="search.html">
        <i class="bi bi-search"></i>
        <div>검색</div>
    </a>
    <a href="userfeeds.html" class="nav-link" data-page="userfeeds.html">
        <i class="bi bi-person-circle"></i>
        <div>내 프로필</div></a>
    <a class="nav-link" id="uploadWindowBtn">
        <i class="bi bi-upload"></i>
        <div>업로드</div>
    </a>
    <a class="nav-link btn-secondary alarm-dropdown" data-bs-toggle="dropdown" id="notificationIcon" >
        <i class="bi bi-bell"></i>
        <div>알림</div></a>
    <ul class="dropdown-menu">
        <li><a class="dropdown-item notification-item" href="#"><div>알람1</div></a></li>
        <li><a class="dropdown-item notification-item" href="#"><div>알람2</div></a></li>
        <li><a class="dropdown-item notification-item" href="#"><div>알람3</div></a></li>
    </ul>
    <a href="#" id="darkModeToggle">
        <i class="bi bi-brightness-low"></i>
        <div>다크모드</div>
    </a>
    <a href="#">..</a>
</div>
</body>
</html>

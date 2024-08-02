<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>3-Step Modal Upload with Image</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/cstyles.css.css">
</head>
<body>
<div id="modal" class="modal">
    <div class="modal-content">
        <span class="close-button" id="closeModal">&times;</span>
        <form id="uploadForm" method="post" enctype="multipart/form-data" action="/cupload">
            <div id="step1" class="step">
                <div class="content-center">
                    <h2>Step 1: 긴 사진 파일을 올려주세요.</h2>
                    <input type="file" id="imageFile" name="imageFile" accept="image/*">
                    <img id="imagePreview" src="#" alt="Image Preview" style="display: none; width: 100%;"/>
                </div>
                <button id="toStep2" type="button" class="modal-button center-button">다음</button>
            </div>
            <div id="step2" class="step">
                <h2>Step 2: 제목, 설명, 태그 추가</h2><br>
                <div class="step2-content">
                    <img id="imagePreviewStep2" src="#" alt="Image Preview" style="width: 50%;"/>
                    <div class="description-tags">
                        <h3>제목</h3>
                        <textarea id="title" name="title" placeholder="Enter title" class="modal-textarea"></textarea>
                        <h3>Dday 날짜</h3>
                        <input type="date" id="dday" name="dday" class="modal-input">
                    </div>
                </div>
                <button id="backToStep1" type="button" class="modal-button center-button">이전</button>
                <button id="toStep3" type="button" class="modal-button center-button">다음</button>
            </div>
            <div id="step3" class="step">
                <h2>Step 3: Dday날짜와 위치, 경력, 학력 추가</h2><br>
                <div class="step3-content">
                    <img id="imagePreviewStep3" src="#" alt="Image Preview" style="width: 50%;"/>
                    <div class="additional-info">
                        <h3>위치</h3>
                        <input type="text" id="location" name="location" placeholder="Enter location" class="modal-input">
                        <h3>경력</h3>
                        <textarea id="experience" name="experience" placeholder="Enter experience" class="modal-textarea"></textarea>
                        <h3>학력</h3>
                        <textarea id="education" name="education" placeholder="Enter education" class="modal-textarea"></textarea>
                    </div>
                </div>
                <button id="backToStep2" type="button" class="modal-button center-button">이전</button>
                <button id="submit" type="submit" class="modal-button center-button">업로드</button>
            </div>
        </form>
    </div>
</div>

<script src="${pageContext.request.contextPath}/static/js/commonScripts.js"></script>
</body>
</html>

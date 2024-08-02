<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>upload</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/styles.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.7.1/jszip.min.js"></script>
</head>
<body>
<h1>Portfolio Upload</h1>
<div id="year"></div>

<div id="modal" class="modal" style="display:none;">
    <div class="modal-content">
        <span class="close-button" id="closeModal">&times;</span>
        <form id="uploadForm" enctype="multipart/form-data" action="${pageContext.request.contextPath}/upload" method="post">
            <div id="step1" class="step">
                <div class="content-center">
                    <h2>Step 1: 포트폴리오 Zip 파일로 올려주세요.</h2>
                    <h3>주의사항</h3>
                    <p>
                        1. 파일은 항상 zip 확장자로 압축 후 올려주세요. <br>
                        2. 미리보기로 보여줄 페이지는 index.html 파일입니다. (업로드 전에 확인 부탁드립니다.) <br>
                        3. 썸네일을 같이 올려주세요. 업로드하지 않으면 기본이미지로 적용됩니다. <br>
                        4. 태그는 띄어쓰기로 구분합니다. 주의바랍니다.
                    </p>
                    <input type="file" id="zipFile" name="zipFile" accept=".zip">
                </div>
                <button type="button" id="toStep2" class="modal-button center-button">다음</button>
            </div>
            <div id="step2" class="step" style="display:none;">
                <h2>Step 2: index.html 프리뷰 / 썸네일 추가(선택)</h2>
                <div class="step2-content">
                    <iframe id="preview" style="width:100%; height:400px;"></iframe>
                    <div class="thumbnail-preview">
                        <input type="file" id="thumbnailFile" name="thumbnailFile" accept="image/*">
                        <img id="thumbnailPreview" src="#" alt="Thumbnail Preview" style="display: none;"/>
                    </div>
                </div>
                <button type="button" id="backToStep1" class="modal-button center-button">이전</button>
                <button type="button" id="toStep3" class="modal-button center-button">다음</button>
            </div>
            <div id="step3" class="step" style="display:none;">
                <h2>Step 3: 설명, 태그 추가</h2><br>
                <div class="step3-content">
                    <iframe id="previewStep3" style="width:100%; height:400px;"></iframe>
                    <div class="description-tags">
                        <h3 style="margin-left: 20px;">설명</h3>
                        <textarea id="description" name="description" placeholder="Enter description" class="modal-textarea"></textarea>
                        <h3 style="margin-left: 20px;">태그</h3>
                        <textarea id="tags" name="tags" placeholder="Enter tags" class="modal-textarea"></textarea>
                    </div>
                </div>
                <button type="button" id="backToStep2" class="modal-button center-button">이전</button>
                <button type="submit" id="submit" class="modal-button center-button">업로드</button>
            </div>
        </form>
    </div>
</div>

<script type="module" src="${pageContext.request.contextPath}/static/js/uploadScripts.js"></script>
</body>
</html>

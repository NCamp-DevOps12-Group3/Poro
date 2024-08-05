document.addEventListener('DOMContentLoaded', function () {
    // const portfolioList111 = JSON.parse(document.getElementById("test").value);
    //
    // console.log(portfolioList111);

//    // 댓글 헤더의 옵션버튼 클릭하면 옵션창이 뜸
//    document.getElementById('modalCommentHeaderOptionBtn').addEventListener('click', function (e) {
//        document.getElementById('modalOptionsOverlay').classList.add('modal-options-active');
//    });

    let currentPortfolioIndex = null;


    // // 업로드 모달에서 썸네일 이미지가 올라갔을때 (change) 실행되는 콜백
    // document.getElementById('uploadThumbnailImage').addEventListener('change', function () {
    //     const reader = new FileReader();
    //     reader.onload = function (e) {
    //         const upload_thumbnailPreview = document.getElementById('uploadThumbnailPreview');
    //         upload_thumbnailPreview.src = e.target.result;
    //         upload_thumbnailPreview.style.display = 'block';
    //     };
    //     reader.readAsDataURL(this.files[0]);
    // });

    // $('#uploadModal').on('hidden.bs.modal', function () {
    //     // 폼을 초기화
    //     $('#uploadForm')[0].reset();
    //     // 썸네일 미리보기도 초기화
    //     const thumbnailPreview = document.getElementById('uploadThumbnailPreview');
    //     thumbnailPreview.src = '';
    //     thumbnailPreview.style.display = 'none';
    // });

    // // 업로드 버튼 클릭(submit)시 실행되는 콜백
    // document.getElementById('uploadForm').addEventListener('submit', function (e) {

    //     e.preventDefault();

    //     // 실제 로컬 스토리지 저장 형태는 [{...}, {...}, {...}] 형태
    //     const portfolioData = JSON.parse(localStorage.getItem('portfolioData') || '[]');

    //     // 포트폴리오 데이터 형식 지정
    //     // html, css, js, 썸네일 이미지, 소개글, 태그, 댓글
    //     const newPortfolio = {
    //         htmlContent: '',
    //         cssContent: '',
    //         jsContent: '',
    //         thumbnailImage: '',
    //         portfolioDescription: document.getElementById('uploadPortfolioDescription').value,
    //         portfolioTags: document.getElementById('uploadPortfolioTags').value,
    //         comments: []
    //     };

    //     // FileReader 객체 생성
    //     const thumbnailReader = new FileReader();

    //     // thumbnailReader의 onload 이벤트시 콜백함수 선언
    //     thumbnailReader.onload = function (e) {
    //         newPortfolio.thumbnailImage = e.target.result;

    //         const files = document.getElementById('uploadCodeFiles').files;
    //         const fileReaders = [];

    //         const htmlFiles = [];
    //         const cssFiles = [];
    //         const jsFiles = [];

    //         for (let i = 0; i < files.length; i++) {
    //             const file = files[i];
    //             if (file.name.endsWith('.html')) {
    //                 htmlFiles.push(file);
    //             } else if (file.name.endsWith('.css')) {
    //                 cssFiles.push(file);
    //             } else if (file.name.endsWith('.js')) {
    //                 jsFiles.push(file);
    //             }
    //         }

    //         const orderedFiles = htmlFiles.concat(cssFiles, jsFiles);

    //         orderedFiles.forEach(function (file) {
    //             const reader = new FileReader();

    //             const promise = new Promise(function (resolve, reject) {
    //                 reader.onload = function (e) {
    //                     if (file.name.endsWith('.html')) {
    //                         newPortfolio.htmlContent = e.target.result;
    //                     } else if (file.name.endsWith('.css')) {
    //                         newPortfolio.cssContent = e.target.result;
    //                     } else if (file.name.endsWith('.js')) {
    //                         newPortfolio.jsContent = e.target.result;
    //                     }
    //                     resolve();
    //                 };

    //                 reader.onerror = function (e) {
    //                     reject(e);
    //                 };
    //             });

    //             reader.readAsText(file);
    //             fileReaders.push(promise);
    //         });

    //         Promise.all(fileReaders).then(function () {
    //             portfolioData.push(newPortfolio);
    //             localStorage.setItem('portfolioData', JSON.stringify(portfolioData));
    //             alert('대기열에 등록되었습니다! 감사합니다.');
    //             $('#uploadModal').modal('hide');
    //             document.getElementById('uploadForm').reset();
    //             document.getElementById('uploadThumbnailPreview').style.display = 'none';
    //             loadPortfolios();
    //         }).catch(function (error) {
    //             console.error('파일 읽기 중 오류 발생:', error);
    //         });
    //     };

    //     thumbnailReader.readAsDataURL(document.getElementById('uploadThumbnailImage').files[0]);
    // });

    // function addComment(comment) {
    //
    //     const commentElement = `
    //         <div class="modal-comment">
    //             <a href="">
    //                 <div class="modal-comment-user-logo"
    //                     style="background-image: url('/static/img/cat1.jpg');"></div>
    //             </a>
    //
    //             <div class="modal-comment-main">
    //                 <div class="modal-comment-main-userid">
    //                     <div style="margin-left:5px; font-weight: bold;" class="userId"><strong>cat1</strong>
    //                     </div>
    //                     <div style="margin-left:5px;">${comment}</div>
    //                 </div>
    //                 <div class="modal-comment-main-content">
    //                     <div style="color: gray;">1주</div>
    //                     <div style="color: gray; margin-left : 10px">좋아요 1만개</div>
    //                     <div class="reply-btn" style="color: gray; margin-left : 10px">답글 달기</div>
    //                 </div>
    //             </div>
    //         </div>
    //         <div class="reply-view" style="color : gainsboro"> ---- 답글 보기 ---- </div>
    //     `;
    //
    //     document.getElementById('modalCommentMain').insertAdjacentHTML('beforeend', commentElement);
    // }
    //
    // function addCommentReply(comment) {
    //
    //     const commentElement = `
    //         <div class="modal-comment reply">
    //             <a href="userfeeds.html">
    //                 <div class="modal-comment-user-logo"
    //                     style="background-image: url('/static/img/cat2.jpg');"></div>
    //             </a>
    //
    //             <div class="modal-comment-main">
    //                 <div class="modal-comment-main-userid">
    //                     <div style="margin-left:5px; font-weight: bold;" class="userId">cat2
    //                     </div>
    //                     <div style="margin-left:5px;">@cat1 ${comment}</div>
    //                 </div>
    //                 <div class="modal-comment-main-content">
    //                     <div style="color: gray;">1주</div>
    //                     <div style="color: gray; margin-left : 10px">좋아요 1만개</div>
    //                     <div class="reply-btn" style="color: gray; margin-left : 10px">답글 달기
    //                     </div>
    //                 </div>
    //             </div>
    //         </div>
    //     `;
    //
    //     document.getElementById('modalCommentMain').insertAdjacentHTML('beforeend', commentElement);
    // }

// iframe 외부 스크롤 이벤트 핸들러 설정
    window.addEventListener('wheel', function(event) {
        const iframe = document.getElementById('modalPortfolioIframe');
        if (iframe) {
            const iframeDoc = iframe.contentDocument || iframe.contentWindow.document;
            if (iframeDoc) {
                iframeDoc.documentElement.scrollTop += event.deltaY;
            }
        }
    });

    // window.addEventListener('click', function(e) {
    //     console.log('Clicked element:', e.target.id);
    // });

    // // 모달이 떴을 때 iframe 외부를 클릭하면 닫히는 방식으로 이벤트 핸들러 추가
    // document.getElementById('modalPortfolioOverlay').addEventListener('click', function (e) {
    //     if (e.target.id === 'modalPortfolioOverlayBond' || e.target.id === 'modalPortfolioOverlay') {
    //         document.getElementById('modalPortfolioOverlay').classList.remove('modal-portfolio-overlay-show');
    //         document.getElementById('modalCommentSection').classList.remove('modal-comment-section-active');
    //         document.getElementById('modalPortfolioIframe').classList.remove('modal-portfolio-iframe-faded');
    //         // 전체화면의 스크롤 복구
    //         document.body.style.overflow = '';
    //     }
    // });

    // const modalOverlay = document.getElementById('modalPortfolioOverlay');
    //
    // function closeModal() {
    //     modalOverlay.classList.remove('modal-portfolio-overlay-show');
    //     document.getElementById('modalCommentSection').classList.remove('modal-comment-section-active');
    //     document.getElementById('modalPortfolioIframe').classList.remove('modal-portfolio-iframe-faded');
    //     document.body.style.overflow = '';
    //     modalOverlay.removeEventListener('click', handleOverlayClick); // 리스너 제거
    // }
    //
    // function handleOverlayClick(e) {
    //     if (e.target.id === 'modalPortfolioOverlayBond' || e.target.id === 'modalPortfolioOverlay') {
    //         closeModal();
    //     }
    // }
    //
    // // 모달을 열 때 이벤트 리스너 추가
    // function openModal() {
    //     modalOverlay.classList.add('modal-portfolio-overlay-show');
    //     document.getElementById('modalCommentSection').classList.add('modal-comment-section-active');
    //     document.getElementById('modalPortfolioIframe').classList.add('modal-portfolio-iframe-faded');
    //     document.body.style.overflow = 'hidden';
    //     modalOverlay.addEventListener('click', handleOverlayClick); // 리스너 추가
    // }

//    // openBtn과 코멘트창이 스크롤시 따라옴
//    document.getElementById('modalPortfolioOverlay').addEventListener('scroll', function (e) {
//        const scrollTop = this.scrollTop;
//        document.getElementById('modalCommentSection').style.top = scrollTop + 'px';
//    });
//
//    // 댓글 헤더의 옵션버튼 클릭하면 옵션창이 뜸
//    document.getElementById('modalCommentHeaderOptionBtn').addEventListener('click', function (e) {
//        document.getElementById('modalOptionsOverlay').classList.add('modal-options-active');
//    });
//
//    // 옵션창 외부 클릭시 옵션창 닫힘
//    document.getElementById('modalOptionsOverlay').addEventListener('click', function (e) {
//        if (e.target === document.getElementById('modalOptions'))
//            document.getElementById('modalOptionsOverlay').classList.remove('modal-options-active');
//    });
//
//    // 취소 클릭시도 옵션창 닫힘
//    document.getElementById('modalOptionsItemCancle').addEventListener('click', function (e) {
//        document.getElementById('modalOptionsOverlay').classList.remove('modal-options-active');
//    });
//
//    // 삭제 클릭시 삭제 모달 열림
//    document.getElementById('modalOptionsItemDelete').addEventListener('click', function (event) {
//        document.getElementById('modalDelete').classList.add('modal-delete-active');
//    });
//
//    // 예 클릭시 실제로 삭제되고 모달 전부 꺼짐
//    document.getElementById('modalDeleteBtnYes').addEventListener('click', function (event) {
//        if (currentPortfolioIndex !== null) {
//            const portfolioData = JSON.parse(localStorage.getItem('portfolioData') || '[]');
//            if (portfolioData.length > currentPortfolioIndex) {
//                portfolioData.splice(currentPortfolioIndex, 1);
//                localStorage.setItem('portfolioData', JSON.stringify(portfolioData));
//                alert('포트폴리오가 삭제되었습니다.');
//
//                // 모달 전부 꺼짐
//                document.getElementById('modalPortfolioOverlay').classList.remove('modal-portfolio-overlay-show');
//                document.getElementById('modalCommentSection').classList.remove('modal-comment-section-active');
//                document.getElementById('modalPortfolioIframe').classList.remove('modal-portfolio-iframe-faded');
//                document.getElementById('modalOptionsOverlay').classList.remove('modal-options-active');
//                document.getElementById('modalDelete').classList.remove('modal-delete-active');
//
//                // 포트폴리오 목록 업데이트
//                loadPortfolios();
//
//                currentPortfolioIndex = null;
//            }
//        }
//    });
//
//    // 아니오 클릭시 옵션창까지 꺼짐
//    document.getElementById('modalDeleteBtnNo').addEventListener('click', function (event) {
//        document.getElementById('modalOptionsOverlay').classList.remove('modal-options-active');
//        document.getElementById('modalDelete').classList.remove('modal-delete-active');
//    });
//
//    // 신고 클릭시 신고하는 이유 물어봄
//    document.getElementById('modalOptionsItemReport').addEventListener('click', function (event) {
//        console.log('asdsad');
//        window.alert("신고하시는 이유가 무엇인가요?");
//    });
//
//    // 수정 클릭시 수정하는 모달 열기
//    document.getElementById('modalOptionsItemModify').addEventListener('click', function (event) {
//        console.log(currentPortfolioIndex);
//        document.getElementById('modalOptionsOverlay').classList.remove('modal-options-active');
//        const portfolioData = JSON.parse(localStorage.getItem('portfolioData') || '[]');
//        const portfolio = portfolioData[currentPortfolioIndex];
//        if (portfolio) {
//            // 수정 폼에 기존 포트폴리오 데이터 채우기
//            console.log(currentPortfolioIndex);
//            document.getElementById('modifyPortfolioDescription').value = portfolio.portfolioDescription;
//            document.getElementById('modifyPortfolioTags').value = portfolio.portfolioTags;
//            const thumbnailPreview = document.getElementById('modifyThumbnailPreview');
//            thumbnailPreview.src = portfolio.thumbnailImage;
//            thumbnailPreview.style.display = 'block';
//
//            // 수정 모달 열기
//            const modifyModal = new bootstrap.Modal(document.getElementById('modifyModal'));
//            modifyModal.show();
//        }
//    });

    // // 썸네일 이미지 변경 시 미리보기 업데이트
    // document.getElementById('modifyThumbnailImage').addEventListener('change', function () {
    //     const reader = new FileReader();
    //     reader.onload = function (e) {
    //         const thumbnailPreview = document.getElementById('modifyThumbnailPreview');
    //         thumbnailPreview.src = e.target.result;
    //         thumbnailPreview.style.display = 'block';
    //     };
    //     reader.readAsDataURL(this.files[0]);
    // });
    //
    // // 수정 폼 제출 시 로컬 스토리지 업데이트
    // document.getElementById('modifyForm').addEventListener('submit', function (e) {
    //     e.preventDefault();
    //
    //     const portfolioData = JSON.parse(localStorage.getItem('portfolioData') || '[]');
    //     const portfolio = portfolioData[currentPortfolioIndex];
    //     if (portfolio) {
    //         portfolio.portfolioDescription = document.getElementById('modifyPortfolioDescription').value;
    //         portfolio.portfolioTags = document.getElementById('modifyPortfolioTags').value;
    //
    //         const files = document.getElementById('modifyCodeFiles').files;
    //         const fileReaders = [];
    //
    //         const htmlFiles = [];
    //         const cssFiles = [];
    //         const jsFiles = [];
    //
    //         for (let i = 0; i < files.length; i++) {
    //             const file = files[i];
    //             if (file.name.endsWith('.html')) {
    //                 htmlFiles.push(file);
    //             } else if (file.name.endsWith('.css')) {
    //                 cssFiles.push(file);
    //             } else if (file.name.endsWith('.js')) {
    //                 jsFiles.push(file);
    //             }
    //         }
    //
    //         const orderedFiles = htmlFiles.concat(cssFiles, jsFiles);
    //
    //         orderedFiles.forEach(function (file) {
    //             const reader = new FileReader();
    //
    //             const promise = new Promise(function (resolve, reject) {
    //                 reader.onload = function (e) {
    //                     if (file.name.endsWith('.html')) {
    //                         portfolio.htmlContent = e.target.result;
    //                     } else if (file.name.endsWith('.css')) {
    //                         portfolio.cssContent = e.target.result;
    //                     } else if (file.name.endsWith('.js')) {
    //                         portfolio.jsContent = e.target.result;
    //                     }
    //                     resolve();
    //                 };
    //
    //                 reader.onerror = function (e) {
    //                     reject(e);
    //                 };
    //             });
    //
    //             reader.readAsText(file);
    //             fileReaders.push(promise);
    //         });
    //
    //         Promise.all(fileReaders).then(function () {
    //             if (document.getElementById('modifyThumbnailImage').files[0]) {
    //                 const thumbnailReader = new FileReader();
    //                 thumbnailReader.onload = function (e) {
    //                     portfolio.thumbnailImage = e.target.result;
    //                     saveUpdatedPortfolioData(portfolioData);
    //                 };
    //                 thumbnailReader.readAsDataURL(document.getElementById('modifyThumbnailImage').files[0]);
    //             } else {
    //                 saveUpdatedPortfolioData(portfolioData);
    //             }
    //         }).catch(function (error) {
    //             console.error('파일 읽기 중 오류 발생:', error);
    //         });
    //     }
    // });
    //
    // function saveUpdatedPortfolioData(portfolioData) {
    //     console.log("여");
    //     localStorage.setItem('portfolioData', JSON.stringify(portfolioData));
    //     alert('포트폴리오가 수정되었습니다.');
    //
    //     $('#modifyModal').modal('hide');
    //     document.querySelector('.modal-backdrop').remove();
    //     document.getElementById('modalPortfolioOverlay').classList.remove('modal-portfolio-overlay-show');
    //     document.getElementById('modalCommentSection').classList.remove('modal-comment-section-active');
    //     document.getElementById('modalPortfolioIframe').classList.remove('modal-portfolio-iframe-faded');
    //     document.getElementById('modalOptionsOverlay').classList.remove('modal-options-active');
    //     loadPortfolios();
    // }

});

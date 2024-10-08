<%--
  Created by IntelliJ IDEA.
  User: BITCAMP
  Date: 24. 7. 26.
  Time: 오후 3:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>


<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>설정</title>
	
	<style>
        .modal-content{
	        z-index: 9999;
        }
        .modal-backdrop {
            z-index: 0 !important;
        }
        a.list-group-item.active {
            display: flex;
            flex-direction: column;
            height: 70px;
            width: auto;
            background: #f3f3f3;
            text-align: center;
            line-height: 60px;
            padding: 30px;
            position: relative;
            border-color:#dee2e6;
            margin-left: 5%;
            margin-right: 5%;
            color: #606060;
			
        }
        .accordion-button {
            
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            
            color: white;
            border: none;
            
            transition:none;
            background-color: #ddd;
	        padding-bottom: 20px; margin: 0; border-top-left-radius:
                15px; border-top-right-radius: 15px;
        }

        .accordion-button:hover {
            background-color: #2980b9;
            transform: none;
        }
        body {
            font-family: Arial, sans-serif;
            position: relative;

        }

        a {

            color: black;
            text-decoration: none;
        }


        h3 {
            margin-bottom: 0;
        }

        .col-9 {
            padding-right: 10%;
           
        }

        .content {
            padding: 20px;
            margin-left: 20vw;
            margin-right: 5vw;
            height: 100vh;

        }

        .pobox {
            position: fixed;
            height: 100vh;
            background: #f8f9fa;
            width: 200px;
            display: inline-block;
            margin-left: 15vw;
            border-right: 1px solid #dbdbdb;
            box-shadow: 1px 0 10px 1px #eeeeee;
           

        }

        .pobox a {

            display: flex;
            flex-direction: column;
            height: 70px;
            width: auto;
            background: #f3f3f3;
            text-align: center;
            line-height: 60px;
            padding: 30px;
            position: relative;
            
            margin-left: 5%;
            margin-right: 5%;
            color: #606060;
	        
	        
        }
        
        /* 수정 */
        .boardt {
            margin-left: 10%;
           
            margin-right: 20%;

            padding-bottom: 200px;

        }

        .scrollspy {
            width: 100%;
            max-width: 100%;
            height: 100%;

            justify-content: center;
            /* min-width:300px ; */

            padding: 20px;
            position: relative;
            margin-bottom: 250px;
        }


        .col-9 h4 {
            margin: 30px 0;
            font-weight: bolder;
        }


        .termsofuse {
            margin-top: 200px;
            width: 100%;

            margin-bottom: 50px;

        }


        

        .accordion-button {
            background-color: #ddd;
        }

        .accordion {
            width: 100%;
        }

        .modal-body {
            text-align: center;

        }

        .modal-body h3 {
            text-align: center;
            margin-top: 10px;

        }

        .box {
            background: #e4e4e4;

        }

        img {
            border-radius: 50%;
            width: 40%;
            height: 40%;
        }

        #website {
            border-radius: 7px;
            background: white;
            height: 2.5rem;
        }

        #intro {
            background: white;
            border-radius: 7px;
            resize: none;
        }

        .alert {
            color: red;
        }

        @media screen and (max-width: 1400px) {

            .sidebar {
                height: 100vh;
                position: fixed;
                top: 0;
                left: 0;
                width: 200px;

            }

            .sidebar a {
                text-align: center;
                padding: 20px 20px;

            }

            .pobox {

                height: 100vh;
                background: #f8f9fa;
                width: 190px;
                display: inline-block;
                
                border-left: none;
            }

            .boardt {
                margin-right: 10%;
            }
        }

        @media screen and (max-width: 1100px) {
            .pobox {
                display: none;
            }
        }

        @media screen and (max-width: 1025px) {
            .col-3 {
                padding-right: 0;

            }

            .col-9 {
                padding-left: 0;

            }

            .col-9 h4 {
                margin-bottom: 30px;
                font-weight: bolder;

            }


            .scrollspy {
                padding: 20px 0;
            }

            .sidebar {
                height: 100vh;
                position: fixed;
                top: 0;
                left: 0;
                width: 150px;
                border-right: none;
            }

            .boardt {
                margin-left: 0;
                box-shadow: none;
                border-left: none;


                margin-right: 10%;
            }

            .sidebar a {
                text-align: center;
                padding: 20px 20px;

            }

            .scrollspy {
                padding: 30px 20px 0;
            }

            button {
                margin-right: 10px;
            }
        }

        @media screen and (max-width: 770px) {
            .col-3 {
                width: 20%;
            }

            .sidebar {
                display: none;
            }

            .sidebar a {
                padding: 10px 10px;

            }

            .sidebar div {
                display: none;
            }

            .sidebar li div {
                display: inline-block;
                margin-left: 10px;
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
	
	</style>
</head>
<body style="overflow-x: hidden; ">


<div class="row">
<%--	<!--업로드 모달-->--%>
<%--	<div class="modal fade" id="uploadModal" tabindex="-1" aria-labelledby="uploadModalLabel" aria-hidden="true">--%>
<%--		<div class="modal-dialog">--%>
<%--			<div class="modal-content"--%>
<%--			     style="border: 1px solid rgb(201, 201, 201);padding: 0;  border-radius: 15px;">--%>
<%--				<div class="modal-header" style="  border-radius: 14px;">--%>
<%--					<h5 class="modal-title" id="uploadModalLabel">포트폴리오 업로드</h5>--%>
<%--					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--				</div>--%>
<%--				<div class="modal-body" style="  border-radius: 14px;">--%>
<%--					<form id="uploadForm" autocomplete="off">--%>
<%--						--%>
<%--						<div class="upload-section">--%>
<%--							<label for="uploadCodeFiles">HTML, CSS, JS 파일만 업로드 가능합니다.</label>--%>
<%--							<input type="file" class="form-control" id="uploadCodeFiles" accept=".html,.css,.js"--%>
<%--							       multiple required>--%>
<%--						</div>--%>
<%--						<div class="upload-section">--%>
<%--							<label for="uploadThumbnailImage">본인만의 썸네일 이미지를 올려주세요.</label>--%>
<%--							<input type="file" class="form-control" id="uploadThumbnailImage" accept="image/*"--%>
<%--							       required>--%>
<%--							<img id="uploadThumbnailPreview" class="thumbnail-preview" src="#"--%>
<%--							     alt="Thumbnail Preview">--%>
<%--						</div>--%>
<%--						<div class="upload-section">--%>
<%--							<label for="uploadPortfolioDescription">포트폴리오 설명</label>--%>
<%--							<textarea class="form-control" id="uploadPortfolioDescription" rows="3"--%>
<%--							          required></textarea>--%>
<%--						</div>--%>
<%--						<div class="upload-section">--%>
<%--							<label for="uploadPortfolioTags">태그</label>--%>
<%--							<input type="text" class="form-control" id="uploadPortfolioTags"--%>
<%--							       placeholder="태그를 쉼표로 구분하여 입력하세요" required>--%>
<%--						</div>--%>
<%--						<button type="submit" class="btn  btn-block"--%>
<%--						        style=" color: white; background-color:#0D6EFD; ">업로드--%>
<%--						</button>--%>
<%--					</form>--%>
<%--				</div>--%>
<%--				<div class="modal-footer">--%>
<%--				--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--	</div>--%>
	
	
	
	
	
	
	
	<div class="col-3">
		<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/sidebar.jsp"/>
		
		
		
		<div class="pobox">
			
			<div id="#setting-list" class=" list-group">
				<a id="list-profileh" class="p-1 rounded list-group-item list-group-item-action mt-4 "
				   href="#list-profile">프로필</a><br>
				<a class="p-1 rounded list-group-item list-group-item-action "  href="#list-history">내 활동</a>                       <br>
				<a class="p-1 rounded list-group-item list-group-item-action "  href="#list-locksandsecurity">잠금과 보안</a>                       <br>
				<a class="p-1 rounded list-group-item list-group-item-action "  href="#list-account">계정</a><br>
				<a class="p-1 rounded list-group-item list-group-item-action "  href="#list-termsofuse">이용약관</a>
			</div>
		
		</div>
	</div>
	

	
	
	<div class="col-9">
		
		
			
			<div data-bs-spy="scroll" data-bs-target="setting-list" data-bs-offset="0" data-bs-smooth-scroll="true"
			     class="scrollspy" tabindex="-2"><br><br>
				<div class="boardt">
				
				<form action="/user/modify.do" method="post" id="modify-form" enctype="multipart/form-data">
					<div  id="list-profile" class="container " style="border-radius: 15px; padding-left: 0">
						
						
						<h4 style="margin-top: 2%;">프로필</h4>
						
						<header class="w-auto h-auto box d-flex align-items-center justify-content-around"
						        style="background-color: #ddd; padding-bottom: 20px; margin: 0; border-top-left-radius:
	                                 15px; border-top-right-radius: 15px;">
							
							<%--	프로필사진모달--%>
							
							<div class="modal fade" id="modalPic">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-head">
											<h3 class="text-lg-center m-3">사진변경</h3>
										</div>
										<div class="modal-body h-75">
											<div class="mb-3">
												<label for="uploadFiles" class="form-label">변경할 프로필 사진</label>
												<input class="form-control" type="file" name="uploadFiles" id="uploadFiles">
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn"
											        style="color: white; background-color:#0D6EFD;" data-bs-dismiss="modal">
												닫기
											</button>
										</div>
									</div>
								</div>
							</div>
							
							<div class="d-inline-block" style="border-radius: 16px; margin-left:
	                            10px;background-color: #ddd; ">
								<div id="imagePreview" style="background-color: #ddd; max-width: 200px">
									<img id="changeFilesPreview" class="profile-img" alt="${loginUser.profile_image}"
									     src="${loginUser.profile_image}"
									     style="background-color: #ddd; min-width: 100px">
									<div id="imgAlertholder" style="padding: 0; margin: 0; color: red; }"></div>
								</div>
							</div>
							<div class="d-inline-block"
							     style="background-color: #ddd; margin-right: 20px;margin-left: 20px">
								
								<h5 style="background-color: #ddd; color: black; margin-top:
	                                        30px">${loginUser.nickname}</h5>
								<p style="background-color: #ddd; color: black;">${loginUser.name}</p>
								<p style="background-color: #ddd; color: black;">${loginUser.email}</p>
<%--								<p style="background-color: #ddd; color: black;">${loginUser.gender}</p>--%>
								<p style="background-color: #ddd; color: black;">${loginUser.phonenumber}</p>
<%--								<p style="background-color: #ddd; color: black;">${loginUser.role}</p>--%>
								<p style="background-color: #ddd; color: black;">${loginUser.site_url}</p>
							
							</div>
							<div class="d-inline-block" style="background-color: #ddd; margin-right: 20px;">
								<p style="background-color: #ddd; color: black;
	                               ">${loginUser.introduction}</p>
							</div>
						</header>
						
						<div class="accordion" id="accordionExample" style="background-color: #ddd;">
							<div class="accordion-item" style="border: none;">
								<h2 class="accordion-header" id="headingOne">
									<button class=" accordion-button collapsed" style="background-color: #ddd;
	                                    border-radius: 0; border: none;" type="button" data-bs-toggle="collapse"
									        data-bs-target="#changeProfile" aria-expanded="false"
									        aria-labelledby="headingOne" aria-controls="changeProfile">프로필 정보 변경하기
									</button>
								</h2>
								<div id="changeProfile" class="accordion-collapse collapse"
								     data-bs-parent="accordionExample">
									<div class="accordion-body">
										<div style="padding: 10px;">
											<button type="button"
											        style="width: 100px; padding-top: 12px; padding-bottom: 12px; border-radius: 10px; border: 1px solid #ddd;"
											        class="btn" data-bs-toggle="modal" data-bs-target="#modalPic"
											        id="Pic">
												사진 변경
											</button>
										</div>
										
										<div style="padding: 10px;">
											<label for="Nickname" class="form-label">닉네임</label>
											<input type="text" name="Nickname" id="Nickname"
											       value="${loginUser.nickname}" class="w-100 form-control">
											<div class="form-text">변경할 닉네임을 입력해주세요</div>
											<input type="hidden" name="user_id" value="${loginUser.user_id}">
											<input type="hidden" name="email" value="${loginUser.email}">
										</div>
										<div style="padding: 10px;">
											<label for="name" class="form-label">이름</label>
											<input type="text" name="name" id="name" value="${loginUser.name}"
											       class="w-100 form-control">
											<div class="form-text">변경할 이름을 입력해 주세요</div>
										</div>
										<div style="padding: 10px;">
											<label for="gender" class="form-label">성별</label>
											<input type="text" name="gender" id="gender" value="${loginUser.gender}"
											       class="w-100 form-control">
											<div class="form-text">변경할 성별을 입력해 주세요</div>
										</div>
										<div style="padding: 10px;">
											<label for="phonenumber" class="form-label">전화번호</label>
											<input type="tel" name="phonenumber" id="phonenumber"
											       value="${loginUser.phonenumber}" class="w-100 form-control">
											<div class="form-text">변경할 전화번호를 입력해 주세요</div>
										</div>
										<div style="padding: 10px;">
											<label for="job" class="form-label">상태</label>
											<textarea name="job" id="job"
											          class="w-100 form-control">${loginUser.job}</textarea>
											<div class="form-text">변경할 직업을 입력해주세요</div>
										</div>
										<div style="padding: 10px;">
											<label for="introduction" class="form-label">소개</label>
											<textarea type="text" name="introduction" id="introduction"
											          class="w-100 form-control">${loginUser.introduction}</textarea>
											<div class="form-text">유저 상세페이지 상단에 출력되는 글입니다</div>
										</div>
										<div style="padding: 10px;">
											<label for="gender" class="form-label">외부사이트</label>
											<input type="text" name="site_url" id="site_url"
											       value="${loginUser.site_url}" class="w-100 form-control">
											<div class="form-text">변경할 외부사이트주소를 입력해 주세요</div>
										</div>
										<div style="padding: 10px;">
											<button type="submit" class="btn w-25"
											        style="margin: 10px; background-color: #ddd; color: black;">제출
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
				
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
				
				<h4 id="list-history" style="margin-top: 0;">내 활동</h4>
				<div style="border: 1px solid rgb(201, 201, 201);padding: 20px;  border-radius: 7px; ">
					<div class="container">
						<table class="table table-hover text-center" style="justify-content: center">
							<thead>
							<tr style="justify-content: center">
								<th style="width: auto">활동 내용</th>
								<th style="width: auto">활동 유형</th>
								<th style="width: auto">활동일</th>
							</tr>
							</thead>
							<tbody class="table-group-divider">
							<c:forEach items="${historylog}" var="historylog">
								<tr class="board-tr" onclick="">
									<c:choose>
										<c:when test="${historylog.portfolio_id ==0 && historylog.comment_id== 0}">
											<td style="width: auto">기록없음</td>
											<td style="width: auto">기록없음</td>
											<td style="width: auto">기록없음</td>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${historylog.commentModDate != null}">
													<td style="width: auto">${historylog.commentContent}</td>
												</c:when>
												<c:otherwise>
													<td style="width: auto">${historylog.portfolioContent}</td>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${historylog.commentModDate != null}">
													<td style="width: auto">댓글</td>
												</c:when>
												<c:otherwise>
													<td style="width: auto">포트폴리오 업로드</td>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${historylog.commentModDate != null}">
													<td style="width: auto">
														<javatime:format value="${historylog.commentModDate}"
														                 pattern="yyyy-MM-dd"/>
													</td>
												</c:when>
												<c:otherwise>
													<td style="width: auto">
														<javatime:format value="${historylog.portfolioModDate}"
														                 pattern="yyyy-MM-dd"/>
													</td>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				
				</div>
				
				
				<br><br><br><br><br><br><br><br>
				
				
				<h4 id="list-locksandsecurity" style="margin-top: 0;">잠금과 보안</h4>
				<div style="border: 1px solid rgb(201, 201, 201);padding: 20px;  border-radius: 7px; ">
					<div style="margin: 20px auto;">
						<h5>비밀번호 변경</h5>
						<p>사용자님의 개인정보보호와 안전한 사이트사용을 위해 3개월마다 비밀번호 변경을 권장하고있습니다 <br>비밀번호 가 사용된지 3개월이지났다면 변경을 권장하는
							바입니다 </p><br>
						<h5>비밀번호 변경 시 유의사항</h5><br>
						<ul>
							<li>이동전화/주민번호/생일 등의 개인정보와 관련 없는 번호로 변경하시기 바랍니다.</li>
							<br>
							<li>현재 아이디와 유사하거나 유추하기 쉬운 비밀번호를 피하시기 바랍니다.</li>
							<br>
							<li>변경후 로그인 되어있는 다른기기에서 로그아웃됩니다</li>
							<br>
							<li>타 사이트에서 사용하는 비밀번호와 같은 번호로 설정하면 보안이 취약해질수있습니다</li>
							<br>
							<li><b>추측이나 유추가 어렵도록</b> 설정해주시길바랍니다</li>
							<br>
							<li>비밀번호가 제3자에게 노출되었을때 반드시 <b>새 비밀번호로 변경</b>해야합니다</li>
							<br>
							<li>단순한 증감의 <b>내용의 번갈아 사용하는 것은 자제</b>해주십시오</li>
							<br>
							<li>단순 혹은 시도해볼법한 내용으로 비밀번호를 지정하지마세요 (예시) <br>
								<ul>
									<li>password1234!</li>
									<li>!1q2w3e4r</li>
									<li>이름+생년월일조합</li>
									<li>abcdefgh1234!</li>
									<li>qwerasdf1234!</li>
									<li>Password1!</li>
								</ul>
							</li>
							<li><a href="https://nordpass.com/blog/top-worst-passwords-2019/" target="_blank">비밀번호가 다음
								사이트의 200 개의 비밀번호목록과 유사점이있다면 즉시 비밀번호를 변경하십시오</a></li>
						</ul>
					</div>
					<div>
						
						<button type="button" class="btn" style="background-color: #ddd; color: black;"
						        data-bs-toggle="modal" data-bs-target="#staticpassswordBackdrop">
							비밀번호 변경
						</button>
						<%--		비밀번호변경모달--%>
						
						<div class="modal fade" id="staticpassswordBackdrop" data-bs-keyboard="false" tabindex="-1"
						     aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header"
									     style=" margin: 0; text-align: center; justify-content: center;">
										<h1 class="modal-title fs-5" id="staticBackdropLabel">비밀번호 변경</h1>
									
									</div>
									<div class="modal-body">
										<h3>비밀번호를 변경 하시겠습니까?</h3>
									</div>
									<div class="modal-footer"
									     style=" margin: 0; text-align: center; justify-content: center;">
										<button type="button" class="btn btn-primary" data-bs-dismiss="modal"
										        style="background-color:#0D6EFD;">취소
										</button>
										
										<button type="button"
										        style="background-color:#DB3545;" class="btn btn-danger"
										        id="passwordchange"><a href="passwordchangesChk.do" style="color: white;"></a>
											비밀번호 변경
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<br><br><br><br><br><br><br><br>
				
				
				<div><br><br>
					<h4 id="list-account" style="margin-top: 20px;">계정</h4>
					<div  style="margin: 20px auto;border: 1px solid rgb(201, 201, 201);padding:
						20px;  border-radius: 7px;">
						
						
						<h5 style="color: #DB3545 ;">계정 삭제시 유의사항</h5>
						<ul>
							<li>회원정보 삭제
								<ul>
									<li>회원 탈퇴와 함께 PORO 에 등록된 모든 개인정보는 삭제, 폐기 처리되며 복구되지 않습니다.</li>
									
									<li>
										탈퇴 시 해당 아이디는 즉시 탈퇴 처리 되며, 탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가 하오니 신중하게 선택하시기 바랍니다.
									</li>
									<li>
										탈퇴 후에도 게시판에 등록한 게시물은 그대로 남아 있습니다.
										홈페이지에 올린 게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있으므로, 삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 삭제하시기
										바랍니다.
									</li>
								
								</ul>
							</li>
						
						</ul>
						
						
						<button type="button" class="btn "
						        style="background-color:#DB3545; color: white; border-radius: 10px;"
						        data-bs-toggle="modal" data-bs-target="#staticBackdrop">
							계정 삭제
						</button>
						<%--	계정삭제모달--%>
						
						<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
						     tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="deleteaccount">계정 삭제</h1>
									
									</div>
									<div class="modal-body">
										정말로계정을 삭제 하시겠습니까?
									</div>
									<div class="modal-footer">
										<form action="/user/delete-account.do" id="ChangePassword-form"
										      method="post">
											<input type="hidden" name="user_id" value="${loginUser.user_id}">
											<input type="hidden" name="email" value="${loginUser.email}">
											<button type="button" style=" color: white; background-color:#0D6EFD; "
											        class="btn " data-bs-dismiss="modal">취소
											</button>
											<button type="submit" style=" background-color: #DB3545; "
											        class="btn btn-danger"
											        id="Unsubscribe">계정 삭제
											</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					
					</div>
				</div>
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
				
				
				<div class="termsofuse">
					<h4 id="list-termsofuse">이용약관</h4>
					<div style="border: 1px solid rgb(201, 201, 201);padding: 20px;  border-radius: 7px;">
						<p style="margin: 10px;">
							저희가 명시적으로 별도의 약관(본 약관이 아님)이 적용된다고 밝히지 않는 한
							본 이용 약관(또는 '약관')이 회원님의 PORO 이용에 적용되며
							아래 설명된 PORO 서비스('서비스')에 대한 정보를 제공합니다. <br>
							회원님이 PORO 계정을 만들거나 PORO 을 이용하는 경우,
							회원님은 본 약관에 동의하는 것으로 간주됩니다. PORO 서비스 약관은
							이 서비스에 적용되지 않습니다.
						
						</p>
						<div class="accordion" id="accordion2">
							<div class="accordion-item" style="margin: 10px;">
								<h2 class="accordion-header">
									<button class="accordion-button collapsed" style="background-color: #ddd;"
									        type="button" data-bs-toggle="collapse" data-bs-target="#collapse"
									        aria-expanded="false" aria-controls="#collapse">
										<h3 style="background-color: rgba(0, 0, 0, 0) ; color: black;"> 이용약관</h3>
									</button>
								</h2>
								<div id="collapse" class="accordion-collapse collapse " data-bs-parent="#accordion2">
									<div class="accordion-body">
										<p>
										<h4>PORO 에 오신 것을 환영합니다!</h4>
										<br>
										
										
										PORO 서비스는 PORO Platforms, Inc.에서 회원님에게 제공하는 PORO 제품 중 하나입니다. 따라서 본 이용 약관은 회원님과
										PORO Platforms, Inc. 사이의 계약에 해당됩니다.<br><br>
										<h4><b>PORO 서비스</b></h4>
										저희는 회원님에게 PORO 서비스를 제공하는 것에 동의합니다.
										서비스에는 저희가 PORO 의 사명을 실현하기 위해 제공하는 모든 PORO 제품, 기능, 앱, 서비스, 기술, 소프트웨어가 포함됩니다.
										PORO 은 회원님이 사랑하는 사람들과 사항들을 더 가까이 접할 기회를 마련하는 것을 사명으로 삼습니다.
										서비스는 다음과 같은 부분으로 구성됩니다.<br><br>
										<ul>
											
											
											<li>
												<b>창작, 연결, 커뮤니케이션, 발견, 공유를 위한 맞춤화된 기회를 제공합니다.</b>
												사람들은 다양합니다. 따라서 저희는 회원님이 PORO 안팎에서
												창작하고, 공유하고, 인지도를 높이고, 사람들과 소통하는 데 도움이 되는 여러 가지 유형의 계정과 기능을 제공합니다.
												저희는 또한 회원님이 실제로 관심을 가지는 경험을 공유함으로써 관계를 강화하길 원합니다.
												따라서 저희는 회원님 및 다른 사람들이 관심 있는 사람과 사항을 파악하는 시스템을 구축하고, 파악한 정보를 이용하여 회원님이
												중요한 경험을
												생성하고, 발견하며, 이에 참여하고, 이를 공유하도록 돕습니다. 그 일환으로 회원님 및 다른 사람들이
												PORO 안팎에서 하는 활동에 기초하여 회원님이 관심을 가질 만한 콘텐츠, 기능, 혜택, 계정을 더 잘 보여드리고 회원님에게
												PORO 을 경험하는 방법을 제안하기도 합니다.
											</li>
											
											
											<li>
												<b>긍정적이고 포괄적이며 안전한 환경을 조성합니다.</b>
												저희는 저희 커뮤니티 회원들이 도움을 필요로 한다고 생각하는 경우를 포함하여 회원들의 경험을 긍정적이고 폭넓게 만들도록 도구를
												개발 및 사용하고, 자원을 제공합니다. 또한 저희는 저희 약관 및 정책의 남용 및 위반과 유해하고 사기적인 행위를 방지하기 위한
												팀과 시스템을 갖추고 있습니다. 저희는 저희 플랫폼의 보안을 유지하기 위해 저희가 보유한 모든 정보(회원님의 정보 포함)를
												이용합니다. 또한 저희는 오용 또는 유해한 콘텐츠에 관한 정보를 다른 PORO Companies 또는 사법당국과 공유할 수
												있습니다. 개인정보처리방침에서 자세히 알아보세요.
												성장하고 있는 저희 커뮤니티에 지속적으로 서비스를 제공하는 데 도움이 되는 기술을 개발하고 사용합니다. <br><br>
											</li>
											
											
											<li><b>성장하고 있는 저희 커뮤니티를 위해 정보를 구성하고 분석하는 것이 저희 서비스의 핵심입니다.</b><br>
												저희 서비스에서 큰 부분을 차지하는 것은 광범위한 글로벌 커뮤니티를 위하여 엄청나게 큰 규모로 저희 서비스를 맞춤화하고,
												보호하며,
												개선시키는 데 도움이 되는 첨단 기술을 개발하고 사용하는 것입니다. 인공 지능 및 머신 러닝과 같은 기술은 저희가 저희 서비스
												전체에
												복잡한 프로세스를 적용할 수 있게 합니다. 자동화 기술 또한 저희 서비스의 기능성과 무결성 보장에 기여합니다.
											</li>
											
											
											<br> <br>
											<li>
												<b>PORO Company 제품 전반에 걸쳐 일관되고 원활한 경험을 제공합니다.</b><br>
												
												
												PORO 은 PORO Companies에 포함된 제품으로서, PORO Companies는 보다 우수하고 안전하며 보안이 강화된
												서비스를 제공하기 위해 기술, 시스템, 인사이트, 정보를 공유합니다.
												그 정보에는 저희가 보유하는 회원님에 대한 정보가 포함되며, 자세한 내용은 개인정보처리방침에서 알아보세요. 또한 저희는 회원님이
												사용하는 여러 PORO Company 제품과 상호
												작용하는 방법을 제공하며, 회원님이 선택에 따라 PORO Company 제품 전반에서 일관적이고 원활한 경험을 얻을 수 있도록
												하는 시스템을 설계했습니다.
												<br> <br></li>
											<br>
											
											<li>
												<b>저희 서비스 접근에 대한 보장.</b><br>
												
												글로벌 서비스를 운영하기 위해 저희는 회원님의 거주 국가 이외 지역을 비롯하여 전 세계에 있는 시스템에 정보를 저장하고 이전해야
												합니다. 서비스를 제공하기 위해서는 본 글로벌 인프라의 사용이 필수적입니다. 해당 인프라는 PORO Platforms, Inc.,
												PORO Platforms Ireland Limited 또는 그 계열사가 소유하거나 운영할 수 있습니다.<br><br>
												<b> 회원님이 관심 있는 방식으로 회원님과 브랜드, 제품, 서비스를 연결합니다.</b><br>
											</li>
											저희는 회원님에게 의미 있다고 생각되는 광고, 제안, 기타 홍보 콘텐츠를 보여드리기 위해 PORO 및 다른 PORO Company 제품의
											정보 외에도 제3자의 정보를 이용합니다. 그리고 저희는 해당 콘텐츠를 회원님의 PORO 에서의 다른 경험만큼 관련성 있게 만들기 위해
											노력합니다.<br><br>
											<b>연구 및 혁신.</b><br>
											저희는 보유하고 있는 정보를 이용하여 저희 서비스를 연구하고, 다른 사람들과 협력하여 저희 서비스를 보다 개선하고 저희 커뮤니티의 복지에
											기여하기 위한 연구를 수행합니다.<br><br>
										
										</ul>
										<h4><b>PORO 서비스의 재정 조달 방식</b></h4><br>
										PORO 의 사용료를 지불하지 않는 대신, 본 약관이 적용되는 서비스를 사용함으로써, 회원님은 비즈니스 및 단체들이 홍보를 위해 저희에게 비용을
										지불한 광고를 PORO Company 제품 내외부에서 보게 될 수 있다는 것을 인정합니다. 저희는 회원님에게 회원님과 관련성이 높은 광고를
										보여드리기 위해 회원님의 활동 및 관심사에 대한 정보 등 회원님의 개인정보를 활용합니다. <br><br>
										저희는 회원님에게 회원님과 관련성 있고 유용한 광고를 노출하되, 광고주에게 회원님의 신원을 알리지는 않습니다. 저희는 회원님의 개인정보를
										판매하지 않습니다. 저희는 광고주가 저희에게 비즈니스 목표, 광고를 노출하고자 하는 대상의 유형 등을 알릴 수 있도록 허용합니다. 저희는 그 후
										관심이 있을 만한 사람에게 해당 광고를 노출합니다.
										
										<br><br>
										저희는 또한 사람들이 PORO 내부와 외부에서 광고주의 콘텐츠와 어떻게 상호작용하고 있는지 광고주들이 이해할 수 있도록 광고주들에게 광고의 성과
										보고서를 제공합니다.
										예를 들어 광고주가 광고의 타겟을 더 잘 이해할 수 있도록 저희는 일반적 인구 통계 정보 및 관심사 정보를 광고주에게 제공할 수 있습니다.
										저희는 회원님이 구체적으로 허락하지 않는 한 회원님을 직접적으로 식별할 수 있는 정보(이름 또는 이메일 주소와 같이 그 정보만으로 회원님에게
										연락을 취하는 데 이용될 수 있거나
										회원님을 식별할 수 있는 정보)를 공유하지 않습니다. <br><br>
										여기에서 PORO 광고의 작동 방식에 대해 자세히 알아보세요.
										콘텐츠에 언급되어 있는 비즈니스 파트너와의 상업적 관계를 기반으로 제품 또는 서비스를 홍보하는 계정의 소유자가 게시한 브랜디드 콘텐츠가 PORO
										에 표시될 수 있습니다. 이와 관련해서는 여기에서 자세히 알아보세요.
										<br><br>
										<h4><b>개인정보처리방침</b></h4>
										저희 서비스를 제공하기 위해서 회원님의 정보를 수집하고 이용해야 합니다.
										개인정보처리방침은 여러 PORO 제품에서 저희가 정보를 수집, 이용하고 공유하는 방법에 대해 설명합니다.
										또한 PORO 개인정보 보호 및 보안 설정을 포함해 회원님이 회원님의 정보를 관리할 수 있는 여러 방법에 대해 설명합니다.
										PORO 을 사용하려면 개인정보처리방침에 동의해야 합니다. <br><br>
										
										<h4><b>회원님의 약속</b></h4>
										서비스 제공에 대한 저희의 약속에 상응하여 회원님은 다음과 같은 약속을 해주셔야 합니다. <br><br>
										<b>PORO 을 이용할 수 있는 주체</b>. 저희는 PORO 서비스가 가능한 개방적이고 포괄적인 서비스가 되기를 원하지만,
										또한 본 서비스가 안전하고, 보안성을 갖추며, 법을 준수하는 서비스가 되기를 원합니다.
										따라서 회원님이 PORO 커뮤니티에 참여하려면 몇 가지 제한 사항을 준수해야 합니다. <br><br>
										
										<li>만 14세 이상이어야 합니다.</li>
										<br>
										
										<li>관련 법률에 따라 PORO 서비스를 받는 것이 일부라도 금지된 사람 또는 관련 제재 대상 명단에 있어 결제 관련 PORO 서비스를
											이용하는 것이 금지된 사람이 아니어야 합니다.
										</li>
										<br>
										
										<li>과거에 저희가 회원님의 계정을 법률 또는 PORO 정책 위반을 이유로 하여 비활성화한 적이 없어야 합니다.</li>
										<br>
										<li>유죄 확정판결을 받은 성범죄자가 아니어야 합니다.</li>
										<br><br>
										
										<b>PORO 을 사용할 수 없는 경우.</b> 광범위한 커뮤니티에 안전하고 개방적인 PORO 서비스가 제공되기 위해서는 우리 모두가 각자의
										본분을 다해야 합니다. <br><br>
										
										<li>
											<b>다른 사람을 사칭하거나 부정확한 정보를 제공하면 안 됩니다.</b>
											PORO 에서 회원님의 신원을 공개할 필요는 없지만, 회원님은 저희에게 정확한 최신 정보(등록 정보 포함)를 제공해야 하며 개인정보를
											제공해야 할 수도 있습니다.
											또한 본인이 아닌 다른 사람이나 단체를 사칭해서는 안 되며, 다른 사람의 명시적인 허락 없이 다른 사람의 이름으로 계정을 만들 수
											없습니다.
										</li>
										<br>
										<li><b>불법적이거나, 오해의 소지가 있거나, 사기적인 행위 또는 불법적이거나 허가받지 않은 목적을 위한 어떠한 행위도 하면 안
											됩니다.</b></li>
										<br>
										
										<li>
											<b>
												특히 회원님은 PORO 커뮤니티 가이드라인, PORO 플랫폼 이용 약관 및 개발자 정책, 음악 가이드라인을 포함하여 본 약관 또는
												저희 정책을 위반할 수 없으며,
												다른 사람들이 이를 위반하도록 돕거나 조장해서도 안 됩니다.
											</b>
											브랜디드 콘텐츠를 게시하는 경우 회원님은 저희의 브랜디드 콘텐츠 정책을 준수해야 하며, 이에 따라 저희의 브랜디드 콘텐츠 도구를 사용해야
											합니다.
											행동 또는 콘텐츠를 신고하는 방법은 고객 센터에서 알아보세요.
										</li>
										<br>
										
										
										<li>
											<b>회님은 서비스의 정상적인 운영을 방해하거나 지장을 주는 어떠한 행동도 해서는 안 됩니다.</b>
											여기에는 사기성이 짙거나 근거 없는 신고 또는 재고 요청 등 신고, 분쟁 또는 재고 요청 채널의 오용이 포함됩니다.
										</li>
										<br>
										
										
										<li>
											<b>허가받지 않은 방법으로 계정을 만들거나 정보에 접근하거나 정보를 수집하려 해서는 안 됩니다.</b>
											기에는 저희의 명시적 허락 없이 자동화된 방법으로 계정을 만들거나 정보를 수집하는 것이 포함됩니다.
										</li>
										<br>
										<li>
											<b>회원님은 저희 또는 저희 서비스를 통해 확보한 계정이나 정보를 판매하거나, 라이선스를 부여하거나, 구매해서는 안 됩니다.</b>
											여기에는 회원님 계정의 일부(사용자 이름 포함) 또는 전부에 대한 구매, 판매 또는 양도가 포함되며,
											다른 사용자의 로그인 정보나 배지를 요청, 수집 또는 이용하는 행위 및 PORO 사용자 이름, 비밀번호, 부적절한 액세스 토큰에 대한
											요청 또는 수집 행위가 포함됩니다.
										</li>
										<br>
										
										<li>
											<b>
												회원님은 다른 사람의 사생활 정보 또는 기밀 정보를 허가 없이 게시할 수 없으며
												지식재산권을 포함하여 다른 사람의 권리를 침해하는 행위(예: 저작권 침해, 상표권 침해, 위조, 불법복제품)를 하여서는 안
												됩니다.
											</b>
											회님은 관련법의 저작권 및 관련 권리에 관한 예외 또는 제한 사항에 따라 다른 사람의 저작물을 사용할 수 있습니다.
											회원님은 콘텐츠를 게시하거나 공유하기 위한 모든 권리를 소유하고 있거나 얻었음을 진술합니다.
											여기에서 회원님의 지식재산권을 침해한다고 생각되는 콘텐츠를 신고하는 방법을 포함한 자세한 내용을 알아보세요.
										</li>
										<br>
										
										<li>
											<b>
												회원님은 저희의 제품 또는 그 구성 요소를 수정, 변환할 수 없으며, 그 2차적 저작물을 제작하거나 역설계를 수행해서는 안
												됩니다.
												저희의 사전 서면 동의 없이 회원님의 사용자 이름에 도메인 이름이나 URL을 사용하면 안 됩니다.
											</b>
										</li>
										<br>
										
										
										<b>원님이 저희에게 부여한 권한.</b> 본 계약의 일부로서, 회원님은 또한 저희가 회원님에게 서비스를 제공하기 위해 필요로 하는 권한을
										저희에게 부여합니다.<br><br>
										
										<li>
											<b>저희가 회원님의 콘텐츠에 대한 소유권을 주장하지 않는 것과는 별개로, 회원님은 저희에게 회원님 콘텐츠 사용을 허용하는 라이선스를
												부여합니다.</b><br>
											회원님의 콘텐츠에 대한 회원님의 권리에 있어 변경되는 사항은 없습니다.
											저희는 회원님이 서비스에 또는 서비스를 통해 게시하는 콘텐츠에 대한 소유권을 주장하지 않으며
											회원님은 원하는 곳 어디에서나 다른 사람들과 자유롭게 콘텐츠를 공유할 수 있습니다. 그러나 저희가
											서비스를 제공하기 위해서는 회원님으로부터 특정 법적 권한('라이선스')을 부여받아야 합니다. 회원님이
											저희 서비스에서 또는 저희 서비스와 관련하여 지식재산권이 적용되는 콘텐츠(사진 또는 동영상 등)를
											공유, 게시 또는 업로드하는 경우, 회원님은 회원님의 콘텐츠를 호스팅, 사용, 배포, 수정, 실행, 복사, 공개적으로
											수행 또는 표시, 번역 및 그 파생된 저작물을 생성할 수 있는 비독점적이고, 사용료가 없으며, 양도 가능하고, 재라이선스가 가능하며,
											전 세계적인 라이선스를 저희에게 부여합니다(회원님의 개인정보처리방침 및 애플리케이션 설정과 일치함).
											이러한 라이선스는 저희 서비스에 접속하고 이를 이용하는 회원님 및 다른 사람들에게 저희 서비스 이용을 가능하게 하기 위한 것입니다.
											회원님은 회원님의 콘텐츠를 개별적으로 삭제하거나 계정 삭제를 통해 한 번에 모두 삭제할 수 있습니다.
											저희의 정보 이용 방법과 회원님의 콘텐츠를 관리하거나 삭제하는 방법에 관한 자세한 내용을 확인하시려면,
											개인정보처리방침을 살펴보시고 PORO 고객 센터를 방문하세요.
										</li>
										<br>
										
										
										<li>
											<b>회원님의 사용자 이름, 프로필 사진, 계정·광고·홍보 콘텐츠에 대한 회원님의 관계 및 행동 관련 정보를 이용할 수 있는
												권한.</b>
											회원님은 저희에게 회원님의 사용자 이름, 프로필 사진 및 회원님의 활동(예: '좋아요')
											또는 관계(예: '팔로우')에 관한 정보를 Mea 제품 전반에 표시되는 계정, 광고, 제안 및 회원님이
											팔로우하거나 참여하는 기타 홍보 콘텐츠와 함께 또는 이와 관련하여 표시할 수 있는 권한을 무상으로 부여합니다.
											예를 들어, 저희는 회원님이 PORO 에 유료로 광고를 게재하는 브랜드의 홍보 게시물에 좋아요를 눌렀다는 점을 표시할 수 있습니다.
											다른 콘텐츠에서의 행동 및 다른 계정에 대한 팔로우와 마찬가지로, 홍보 콘텐츠에서의 행동 및 홍보 계정에 대한 팔로우도
											해당 콘텐츠나 팔로우를 볼 수 있는 권한이 있는 사람들에게만 표시됩니다. 저희는 회원님의 광고 설정 또한 존중합니다.
											여기에서 회원님의 광고 설정에 대해 자세히 알아보실 수 있습니다.
										</li>
										<br>
										
										<li><b>회원님은 저희가 회원님의 기기에서 서비스 업데이트를 다운로드하고 설치할 수 있다는 것에 동의합니다.</b></li>
										<br><br><br><br>
										
										
										<h4><b>저희가 보유하는 추가적인 권리</b></h4>
										<li>
											회원님이 회원님의 계정을 위해 사용자 이름 또는 이와 유사한 식별자를 선정할 경우,
											저희는 적절하거나 필요하다고 판단될 경우 이를 변경할 수 있습니다
											(예: 타인의 지식재산권을 침해하거나 다른 사용자를 사칭하는 경우).
										</li>
										<br>
										<li>
											저희가 소유하고 저희 서비스 내에서 사용하도록 한 지식재산권의 적용을 받는 콘텐츠
											(예: 회원님이 생성하거나 공유하는 콘텐츠에 추가되는 저희가 제공한 이미지, 디자인, 동영상 또는 사운드)를 회원님이 사용하는 경우
											, 저희는 해당 콘텐츠에 대해 모든 권리를 보유하되 회원님 고유의 콘텐츠에 대한 권리는 보유하지 않습니다.
										</li>
										<br>
										<li>
											회원님은 저희의 브랜드 가이드라인이나 사전 서면 허락을 통해 명백하게 허락을 받은 경우에만
											저희의 지식재산권 및 상표 또는 비슷한 표시를 사용할 수 있습니다.
										</li>
										<br>
										<li>
											회원님이 저희의 소스 코드를 수정하거나, 소스 코드에 대한 2차적 저작물을 제작하거나, 소스 코드를 역컴파일하거나
											기타 방법으로 소스 코드 추출을 시도하기 위해서는 저희의 서면 허락 또는 오픈 소스 라이선스에 의거한 허락을 받아야 합니다.
										</li>
										<br>
										
										<h4><b>콘텐츠 삭제 및 계정 비활성화 또는 해지</b></h4>
										<li>
											회원님이 서비스에서 공유하는 콘텐츠나 정보가 본 이용 약관, 저희 정책(저희 PORO 커뮤니티 가이드라인 포함)에 위배된다고 판단되거나
											법에 따라 삭제해야 할 경우,
											저희는 이를 삭제할 수 있습니다. 저희는 저희 커뮤니티 또는 서비스를 보호하기 위해 또는 회원님이 저희에게 위험 또는 법적 문제를
											일으키거나
											, 본 약관 또는 저희 정책(저희 PORO 커뮤니티 가이드라인 포함)을 위반하거나, 다른 사람의 지식재산권을 반복적으로 침해하거나,
											법률에 따라 허용되거나 요구되는 경우에 회원님에게 서비스 전부 또는 일부를 제공하는 것을 즉시 중단하거나 거부할 수 있습니다
											(회원님의 PORO 제품 및 PORO Company 제품 액세스 해지 또는 비활성화 포함). 저희에게 법적으로 불리하거나
											규제적 영향을 끼치는 상황을 피하거나 줄이기 위해 필요하다고 합리적으로 판단되면, 저희는 서비스를 해지 또는 변경하거나,
											서비스에서 공유된 콘텐츠 또는 정보를 삭제 또는 차단하거나, 서비스 전부 또는 일부를 제공하는 것을 중단할 수 있습니다.
											회원님의 계정이 오류로 인해 해지되었다고 생각되는 경우 또는 회원님의 계정을 비활성화하거나 영구 삭제하고 싶은 경우에는
											저희 고객 센터로 문의하세요. 콘텐츠 또는 계정의 삭제를 요청하는 경우 삭제 프로세스는 요청 후 30일 이내에 자동으로 시작됩니다.
											삭제 프로세스가 시작된 후 콘텐츠 삭제에는 최대 90일이 걸릴 수 있습니다. 이러한 콘텐츠 삭제 프로세스가 진행되는 동안 콘텐츠는
											사용자에게 표시되지 않지만 계속해서 본 이용 약관 및 개인정보처리방침의 적용을 받습니다. 콘텐츠가 삭제된 후에는 백업과 재난 복구
											시스템에서
											삭제하는 데 최대 90일이 더 걸릴 수 있습니다.
										</li>
										<br>
										<ul>
											<li>다음과 같은 경우에는 콘텐츠는 계정 삭제 또는 콘텐츠 삭제 프로세스가 시작된 후 90일 이내에 삭제되지 않습니다.
												<ul>
													<li>다른 사람이 이 라이선스에 따라 콘텐츠를 이용하였고 아직 삭제하지 않은 경우(이 경우 콘텐츠가 삭제될 때까지 해당
														라이선스가 계속 적용됨) 또는
													</li>
													<br>
													<li>저희 시스템의 기술적 제한으로 인해 90일 이내 삭제가 가능하지 않은 경우(그러한 경우 저희는 기술적으로 가능해지는
														즉시 콘텐츠를 삭제함) 또는
													</li>
													<br>
													<li>즉시 삭제하면 다음과 같은 저희의 조치가 제한될 수 있는 경우
														<ul>
															<li>불법 활동 또는 저희 약관 및 정책 위반 사항에 대한 조사 또는 규명(예: 저희 제품 또는 시스템
																오용 사례의 조사 또는 규명)
															</li>
															<li>저희 제품, 시스템, 사용자의 안전 및 보안 보호</li>
															<li>증거 보존 등 법적 의무의 준수 또는
																사법 또는 행정 당국, 법 집행 기관 또는 정부 기관의 요청 준수,
															</li>
														</ul>
													</li>
													<li>이 경우, 콘텐츠는 콘텐츠 유지 목적을 위해 필요한 기간 동안에만 유지됩니다(정확한 기간은 사례별로 다름).
													</li>
												
												
												</ul>
											</li>
											<li>회원님이 계정을 삭제하거나 비활성화하면 본 약관은 회원님과 저희의 계약과 마찬가지로 해지되나, 본 조항 및 아래 조항('계약 및
												상호 의견이 합치되지 않는 경우')은 계정이 해지, 비활성화 또는 삭제된 후에도 여전히 적용됩니다.
											</li>
										</ul>
										<br><br>
										
										
										<h4><b>계약 및 상호 의견이 합치되지 않는 경우</b></h4>
										<b>저희와의 계약.</b><br>
										
										<ul>
											<li>
												서비스를 통한 회원님의 음악 사용 역시 저희 음악 가이드라인의 적용을 받으며, 회원님의 저희 API 사용에는 저희의 PORO
												플랫폼 약관 및 개발자 정책이 적용됩니다.
												회원님이 기타 특정 기능 또는 관련 서비스를 이용하는 경우, 회원님은 추가 약관에 대해 동의할 기회를 제공받으며, 추가 약관은
												저희와 회원님 간의 계약의 일부를 구성합니다.
												예를 들어, 회원님이 결제 기능을 사용하는 경우, 회원님은 커뮤니티 결제 약관에 동의해야 합니다. 추가 약관이 본 계약과 상충될
												경우 추가 약관이 우선합니다.
											</li>
											<br>
											<li>본 계약의 일부가 이행 불가능한 경우에도, 나머지 부분은 계속해서 효력을 갖습니다.
											
											</li>
											<br>
											<li>
												본 계약의 개정이나 면제는 저희가 작성하고 서명한 서면으로만 가능합니다. 저희가 본 계약의 일부를 이행하지 못하더라도, 이는
												계약의 포기로 간주되지 않습니다.
											</li>
											<br>
											<li>
												저희는 회원님에게 명시적으로 부여된 권한을 제외한 모든 권한을 보유합니다.
											</li>
										</ul>
										
										
										<b>본 계약에 따른 권리 보유자.</b><br>
										<ul>
											<li>
												본 계약은 제3자에게 권리를 부여하지 않습니다.
											</li>
											<br>
											<li>
												회원님은 본 계약에 따른 회원님의 권리나 의무를 저희의 동의 없이 타인에게 양도할 수 없습니다.
											</li>
											<br>
											<li>
												저희의 권리와 의무는 타인에게 양도될 수 있습니다. 이러한 양도는, 예를 들어, (인수합병이나 자산매각으로 인해) 저희의 소유권이
												변경되는 경우 또는 법률에 의해 이뤄질 수 있습니다.
											</li>
											<br>
										
										</ul>
										<b>유사시의 책임자.</b><br>
										<ul>
											<li>
												저희 서비스는 '있는 그대로' 제공되며, 저희는 저희의 서비스가 안전성과 보안성을 갖춘 채 제공된다거나 항상 완벽하게 작동한다고
												보장할 수 없습니다. 또한,
												관련 법률이 허용하는 한도 내에서 저희는 상업성, 특정 목적을 위한 적합성,
												권원 및 비침해성에 대한 묵시적 보증을 포함하여 모든 명시적이든 묵시적이든 일체의 보증을 부인합니다.
											</li>
											<br>
											<li>
												또한 저희는 사람들의 활동이나 말을 통제하지 않으며, 사람들(또는 회원님)의 활동이나 행동(온라인, 오프라인 불문) 또는
												콘텐츠(불법 또는 유해 콘텐츠 포함)에 대해 책임지지 않습니다.
												또한 저희는 다른 사람이나 기업에서 제공하는 서비스와 기능에 대해서도 책임지지 않습니다. 회원님이 저희 서비스를 통해 이러한
												서비스와 기능에 접속하더라도 마찬가지입니다.
											</li>
											<br>
											<li>
												서비스에서 발생하는 모든 사안에 대한 저희의 책임은 법률이 허용하는 범위 내에서 최대한도로 제한됩니다. 저희는 저희 서비스에
												문제가 있는 때
												해당 문제가 끼칠 수 있는 모든 발생 가능한 영향을 알 수 없습니다. 회원님은 본 약관으로부터 또는 본 약관과 관련하여 발생하는
												수익, 수입, 정보 또는 데이터의 손실이나 파생적, 특수적, 간접적, 전형적, 징벌적 또는 부수적 손해에 대해,
												저희가 그 발생 가능성을 알고 있었는지 여부를 불문하고, 저희는 책임지지 않는다는 것에 동의합니다.
												여기에는 저희가 회원님의 콘텐츠, 정보 또는 계정을 삭제하는 경우도 포함됩니다.
											</li>
											<br>
											<li>
												단, 위와 같은 규정에도 불구하고, 관련 법률에 의해 위 규정에 따른 책임 제한이나 면제가 허용되지 않을 수 있습니다. 이 경우,
												저희는 해당 법률이 규정하고 있는 범위 내에서 책임을 부담합니다.
											</li>
											<br>
										</ul>
										<br>
										
										
										<h4><b>분쟁 해결 방법.</b></h4><br>
										회원님이 소비자인 경우 또는 관련 법률이 요구하는 경우, 회원님이 거주하는 국가의 법률이 본 약관과 관련하여 발생하는 회원님의 모든 청구,
										소송 사유 또는 분쟁('청구')에 적용되고, 회원님은 관할권이 있는 국가의 관할 법원에서 해당 청구를 해결할 수 있습니다. 다른 모든 경우에
										회원님은 해당 청구가 미국 캘리포니아 북부 지방 법원 또는 샌머테이오 카운티에 소재한 주 법원에서만 해결되어야 하며, 해당 청구의 소송 목적에
										대해
										이러한 법원 중 한 곳의 속인적 관할권을 따르고, 법 조항의 상충 여부와 관계없이 본 이용 약관 및 모든 청구에 캘리포니아 주법이 적용된다는
										것에 동의합니다.
										앞선 내용을 침해하지 않는 범위에서, 회원님이 저희 제품에 대해 악용, 방해 또는 무단 사용을 시도하는 경우 PORO Platforms
										Inc.는 단독 재량에 따라 회원님이
										거주하며 청구의 관할권이 있는 국가에서 회원님에 대한 관련 청구를 제출할 수 있음에 회원님은 동의합니다. <br><br>
										
										<b>요청하지 않은 자료.</b><br><br>
										
										저희는 피드백 또는 기타 제안을 언제든 환영하지만, 이를 어떠한 제한 또는 보상 의무 없이 활용할 수 있고, 이를 기밀로 유지할 의무가
										없습니다. <br><br>
										
										<h4><b>본 약관 개정</b></h4><br>
										
										저희는 PORO 서비스 및 정책을 변경할 수 있고, PORO 서비스 및 정책이 정확하게 반영되도록 하기 위해 본 약관을 변경해야 할 경우가
										있습니다. 법적으로 달리 요구되지 않는 한 저희는 본 약관을 변경하기 전에 회원님에게 통지하여, 약관의 효력이 발생하기 최소 30일 전에 검토할
										기회를 제공합니다. 변경 발효일 이후에도 회원님이 계속 PORO 서비스를 이용하실 경우, 회원님은 개정된 약관의 적용을 받게 됩니다. 본 약관
										또는 개정된 약관에 동의하지 않을 경우에는 여기서 회원님의 계정을 삭제하면 됩니다.
										<br><br>시행일: 2022년 7월 26일</p>
									
									</div>
								</div>
							</div>
						</div>
						<h6 style="margin: 10px; line-height: 40px;">
							PORO 은 사람들이 자유롭게 자신을 표현하고 서로
							영감을 얻을 수 있는 공간입니다. 계속해서 안전하고
							믿을 수 있는 PORO 을 만들어 갈 수 있도록 함께 도와주세요.
							본인 소유의 사진과 동영상만 게시할 수 있으며
							항상 법률을 준수해야 합니다. 다른 PORO 사용자를 존중하고
							스팸을 보내거나 나체 이미지를 게시하는 행동은 삼가세요.</h6>
					
					</div>
				</div>
			
			</div>
		</div>
	</div>
</div>




<script>
    $(() => {


        const imgAlertholder = document.getElementById('imgAlertholder');
        const uploadFiles = document.getElementById('uploadFiles');
        const previewContainer = document.getElementById('imagePreview');

        // 경고 메시지 추가 함수
        const appendimgAlert = (message, type) => {
            const wrapper = document.createElement('div'); /*wrapper선언하고 div만들기*/
            wrapper.innerHTML = [  /*wrapper 의 내용물(String 배열) 넣기*/`<div class="alert" role="alert">`,
                /*div 열고 wrapper 스타일 부트스트랩*/` <div>\${message}</div>`, /*wrapper에들어갈메세지*/'</div>'
                /*div닫기*/].join(''); /*위내용을 문자열로 바꾸기 */
            const alerts = imgAlertholder.querySelectorAll('.alert');
            if (alerts.length >= 1) {
                imgAlertholder.removeChild(alerts[0]);
            }
            imgAlertholder.append(wrapper); /*Alert holder 에 써 넣기*/
            setTimeout(() => {
                wrapper.remove();
            }, 10000);
        };

        // 파일 선택 변경 이벤트 처리
        uploadFiles.addEventListener('change', function (event) {
            const input = event.target;
            const file = input.files[0];

            // 파일이 선택되지 않았을 경우 아무 작업도 하지 않음
            if (!file) {
                return;
            }

            const fileName = file.name.toLowerCase();
            const validExtensions = /\.(jpg|jpeg|png|gif|svg|bmp)$/;

            if (validExtensions.test(fileName)) {
                const reader = new FileReader();

                reader.onload = function (e) {
                    const imgElement = document.createElement('img');
                    imgElement.src = e.target.result;
                    imgElement.classList.add('img-fluid', 'mt-2');

                    // 기존 이미지를 제거하고 새 이미지를 추가
                    previewContainer.innerHTML = '';
                    previewContainer.appendChild(imgElement);
                };

                reader.readAsDataURL(file);
            } else {
                appendimgAlert("이미지 파일만 선택해주세요", "danger");
                // 입력 필드 초기화 (파일이 이미지가 아니면 아무 작업도 하지 않음)
                event.target.value = '';
            }
        });

        // 페이지 로드 시 기존 이미지가 있는 경우 유지하기 위해 초기화
        window.addEventListener('load', () => {
            // 추가적인 로직이 필요하다면 여기에 작성
        });


        $('#imagePreview').on('click', () => {
            $('#Pic').click();
        });


        // Load dark mode state
        let isDarkMode = loadDarkModeState();
        applyDarkMode(isDarkMode);

        $('#darkModeToggle').on('click', function () {
            isDarkMode = !$('body').hasClass('dark-mode');
            applyDarkMode(isDarkMode);
            saveDarkModeState(isDarkMode);
        });

        $("#baseViewAllBtn").on("click", function () {
            window.location.href = "main.html";
        });
        $("#basePersonalBtn").on("click", function () {
            window.location.href = "mini_project.html";
        });
        $("#baseCompanyBtn").on("click", function () {
            window.location.href = "mini_project(company).html";
        });

        // 업로드 버튼 이벤트
        $('#uploadWindowBtn').on('click', function () {
            $('#uploadModal').modal('show');
        });





        document.addEventListener('DOMContentLoaded', function() {
            // 요소가 화면에 보이는지 확인하는 함수
            function checkVisible(element, check = 'visible') {
                // 요소의 위치 및 크기를 가져옴
                const rect = element.getBoundingClientRect();
                // 뷰포트 높이를 가져옴
                const viewportHeight = window.innerHeight || document.documentElement.clientHeight;

                // 요소가 화면에 보이는지 확인
                if (check === 'visible') {
                    return (
                        rect.top >= 0 &&               // 요소의 상단이 뷰포트 상단 이상인지
                        rect.bottom <= viewportHeight  // 요소의 하단이 뷰포트 하단 이하인지
                    );
                }

                return false;
            }

            // 스크롤 시 실행될 함수
            const onScroll = function() {
                // id="list-profile" 요소를 가져옴
                const profileElement = document.getElementById('list-profile');
                // 해당 요소로 이동하는 a 요소를 가져옴
                const linkElement = document.querySelector('a[href="#list-profile"]');

                // 요소와 링크가 존재하는지 확인
                if (profileElement && linkElement) {
                    // 요소가 화면에 보이는지 확인
                    const isVisible = checkVisible(profileElement, 'visible');

                    // 요소가 보이면 a 요소에 스타일을 추가
                    if (isVisible) {
                        linkElement.style.backgroundColor = '#ddd';
                        linkElement.style.borderTop = '2px solid black';
                        linkElement.style.borderLeft = '2px solid black';
                        linkElement.style.borderBottom = '2px solid black';
                        linkElement.style.borderRight = '2px solid black';
                        linkElement.style.color = 'black';
                        linkElement.style.fontWeight = 'bolder';
                        linkElement.style.textTransform = 'uppercase';
                        linkElement.style.fontSize = 'larger';
                    }
                    // 요소가 보이지 않으면 a 요소의 스타일을 제거
                    else {
                        linkElement.style.backgroundColor = '';
                        linkElement.style.borderTop = '';
                        linkElement.style.borderLeft = '';
                        linkElement.style.borderBottom = '';
                        linkElement.style.borderRight = '';
                        linkElement.style.color = '';
                        linkElement.style.fontWeight = '';
                        linkElement.style.textTransform = '';
                        linkElement.style.fontSize = '';
                    }
                }
            };

            // 스크롤 이벤트가 발생할 때 onScroll 함수 실행
            window.addEventListener('scroll', onScroll);

            // 페이지 로드 시 초기 상태 체크
            onScroll();
        });


    });
</script>
</body>
</html>
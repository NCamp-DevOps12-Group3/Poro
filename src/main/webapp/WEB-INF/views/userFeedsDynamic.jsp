<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 24. 8. 5.
  Time: 오전 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<c:if test="${type eq 'home' }">
    <c:forEach items="${portfolioList}" var="portfolio">
        <div class="col-sm-12 col-lg-6 col-xxl-4 grid-item">
            <div class="card">
                <div class="card-header">
                        ${portfolio.user_id}
                </div>
                <c:choose>
                    <c:when test="${isOwner eq true}">
                        <input type="checkbox" class="delete-dot" value="${portfolio.portfolio_id}">
                    </c:when>
                    <c:otherwise>
                        <c:choose>
                            <c:when test="${portfolio.bookmarked}">
                                <label class="bookmark-icon" value="${portfolio.portfolio_id}">
                                    <i class="bi bi-bookmark-fill"></i>
                                </label>
                            </c:when>
                            <c:otherwise>
                                <label class="bookmark-icon" value="${portfolio.portfolio_id}">
                                    <i class="bi bi-bookmark"></i>
                                </label>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose>
                <div>
                    <c:choose>
                        <c:when test="${portfolio.thumbnail_url != null}">
                            <img src="${portfolio.thumbnail_url}" class="card-img-top" alt=".">
                        </c:when>
                        <c:otherwise>
                            <img src="/static/img/default.png" alt="" class="card-img-top">
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${portfolio.correct_PORTFOLIO_URL}">
                            <iframe  class="card-iframe ratio ratio-1x1" style="display:none" id="${portfolio.portfolio_id}iframe"
                                     src="${portfolio.PORTFOLIO_URL}"
                                     data-code-type="URL">
                            </iframe>
                        </c:when>
                        <c:otherwise>
                            <iframe  class="card-iframe ratio ratio-1x1" style="display:none" id="${portfolio.portfolio_id}iframe"
                                     srcdoc="${portfolio.mergeCode}"
                                     data-code-type="CODE">
                            </iframe>
                        </c:otherwise>
                    </c:choose>
                </div>
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
        <div class="col-sm-12 col-lg-6 col-xxl-4 custom-grid-item">
            <div class="custom-card shadow-sm border-0 rounded-lg overflow-hidden">
                <div class="custom-card-header bg-white border-0">
                    <div class="custom-img-container position-relative">
                        <c:choose>
                            <c:when test="${coperation.company_icon_url != null}">
                                <img src="${coperation.company_icon_url}" alt="${coperation.company_name}" class="img-fluid rounded">
                            </c:when>
                            <c:otherwise>
                                <img src="/static/img/default.png" alt="${coperation.company_name}" class="img-fluid rounded">
                            </c:otherwise>
                        </c:choose>
                        <c:if test="${isOwner eq true}">
                            <input type="checkbox" class="custom-delete-dot delete-dot position-absolute top-0 end-0 m-2" value="${coperation.bookmark_id}">
                        </c:if>
                    </div>
                </div>
                <div class="custom-card-body p-4">
                    <h5 class="custom-card-title">${coperation.company_name}</h5>
                    <p class="custom-card-text">${coperation.skillname}</p>
                    <p class="custom-card-text">${coperation.recruitment_title}</p>
                    <p class="custom-card-text">${coperation.dday}</p>
                    <p class="custom-card-text">${coperation.location}</p>
                    <p class="custom-card-text">${coperation.career}</p>
                    <p class="custom-card-text">${coperation.education}</p>
                    <p class="custom-card-text text-muted">
                        <javatime:format value="${coperation.regdate}" pattern="yyyy-MM-dd"/>
                    </p>
                </div>
            </div>
        </div>
    </c:forEach>
</c:if>
<c:if test="${page.pageType eq 'otherportfolio'}">
    <c:forEach items="${otherportfolio}" var="portfolio">
        <div class="col-sm-12 col-lg-6 col-xxl-4 custom-grid-item">
            <div class="custom-card shadow-sm border-0 rounded-lg overflow-hidden">
                <div class="custom-card-header bg-white border-0">
                    <div class="custom-img-container position-relative">
                        <c:choose>
                            <c:when test="${portfolio.thumbnail_url != null}">
                                <img src="${portfolio.thumbnail_url}" class="img-fluid rounded">
                            </c:when>
                            <c:otherwise>
                                <img src="/static/img/default.png" class="img-fluid rounded">
                            </c:otherwise>
                        </c:choose>
                        <c:if test="${isOwner eq true}">
                            <input type="checkbox" class="custom-delete-dot delete-dot position-absolute top-0 end-0 m-2" value="${portfolio.bookmark_id}">
                        </c:if>
                    </div>
                </div>
                <div class="custom-card-body p-4">
                    <h5 class="custom-card-title">${portfolio.user_id}</h5>
                    <p class="custom-card-text">${portfolio.skillname}</p>
                    <p class="custom-card-text">${portfolio.description}</p>
                    <p class="custom-card-text text-muted">
                        <javatime:format value="${portfolio.regdate}" pattern="yyyy-MM-dd"/>
                    </p>
                </div>
            </div>
        </div>
    </c:forEach>
</c:if>
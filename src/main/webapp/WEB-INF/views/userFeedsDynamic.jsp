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
                    <iframe  class="card-iframe ratio ratio-1x1" style="display:none" id="${portfolio.portfolio_id}iframe"
                             srcdoc="${portfolio.mergeCode}">
                    </iframe>
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
<c:if test="${type eq 'coperation'}">
    <c:forEach items="${coperationList}" var="coperation">
        <div class="col-sm-12 col-lg-6 col-xxl-4 grid-item">
            <div class="card">
                <div class="img-container">
                    <c:choose>
                        <c:when test="${coperation.company_icon_url != null}">
                            <img src="${coperation.company_icon_url}" alt="${coperation.company_name}">
                        </c:when>
                        <c:otherwise>
                            <img src="/static/img/default.png" alt="${coperation.company_name}">
                        </c:otherwise>
                    </c:choose>
                </div>
                <c:if test="${isOwner eq true}">
                    <input type="checkbox" class="delete-dot" value="${coperation.bookmark_id}">
                </c:if>
                <div class="details-container">
                    <c:choose>
                        <c:when test="${coperation.company_icon_url != null}">
                            <img src="${coperation.company_icon_url}" alt="${coperation.company_name}">
                        </c:when>
                        <c:otherwise>
                            <img src="/static/img/default.png" alt="${coperation.company_name}">
                        </c:otherwise>
                    </c:choose>
                    <h5>${coperation.company_name}</h5>
                    <p>${coperation.skillname}</p>
                    <p>${coperation.recruitment_title}</p>
                    <p>${coperation.dday}</p>
                    <p>${coperation.location}</p>
                    <p>${coperation.career}</p>
                    <p>${coperation.education}</p>
                    <p>
                        <javatime:format value="${coperation.regdate}" pattern="yyyy-MM-dd"/>
                    </p>
                </div>
            </div>
        </div>
    </c:forEach>
</c:if>
<c:if test="${type eq 'otherportfolio'}">
    <c:forEach items="${otherPortfolioList}" var="portfolio">
        <div class="col-sm-12 col-lg-6 col-xxl-4 grid-item">
            <div class="card">
                <c:if test="${isOwner eq true}">
                    <input type="checkbox" class="delete-dot" value="${portfolio.bookmark_id}">
                </c:if>
                <div class="img-container">
                    <c:choose>
                        <c:when test="${portfolio.thumbnail_url != null}">
                            <img src="${portfolio.thumbnail_url}">
                        </c:when>
                        <c:otherwise>
                            <img src="/static/img/default.png">
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="details-container">
                    <c:choose>
                        <c:when test="${portfolio.thumbnail_url != null}">
                            <img src="${portfolio.thumbnail_url}">
                        </c:when>
                        <c:otherwise>
                            <img src="/static/img/default.png">
                        </c:otherwise>
                    </c:choose>
                    <div>
                        <p>
                                ${portfolio.user_id}
                        </p>
                        <p>
                                ${portfolio.skillname}
                        </p>
                        <p>
                                ${portfolio.description}
                        </p>
                        <p>
                            <javatime:format value="${portfolio.regdate}" pattern="yyyy-MM-dd"/>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</c:if>
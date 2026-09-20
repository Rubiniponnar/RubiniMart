<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="pageTitle" value="${product.name}" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(320px, 1fr)); gap: 2.5rem; background: white; padding: 2rem; border-radius: var(--radius); border: 1px solid var(--border-color); box-shadow: var(--shadow);">
    <div>
        <c:choose>
            <c:when test="${not empty product.imageUrl}">
                <img src="<c:out value='${product.imageUrl}'/>" alt="<c:out value='${product.name}'/>"
                     style="width: 100%; max-height: 400px; object-fit: cover; border-radius: var(--radius); border: 1px solid var(--border-color);"
                     onerror="this.src='https://placehold.co/500x400?text=Product+Image'">
            </c:when>
            <c:otherwise>
                <div style="width: 100%; height: 350px; background: #f1f5f9; display: flex; align-items: center; justify-content: center; font-size: 3rem; border-radius: var(--radius);">📦</div>
            </c:otherwise>
        </c:choose>
    </div>

    <div>
        <span class="card-category"><c:out value="${product.category}"/></span>
        <h1 style="font-size: 2rem; margin-bottom: 0.5rem;"><c:out value="${product.name}"/></h1>

        <div style="display: flex; align-items: center; gap: 0.5rem; margin-bottom: 1.25rem;">
            <span class="star-rating">
                <c:forEach begin="1" end="5" var="star">
                    <c:choose>
                        <c:when test="${avgRating >= star}">★</c:when>
                        <c:otherwise>☆</c:otherwise>
                    </c:choose>
                </c:forEach>
            </span>
            <span style="font-weight: bold; font-size: 1.1rem;">
                <c:out value="${String.format('%.1f', avgRating)}"/>
            </span>
            <span style="color: var(--text-muted);">
                (<c:out value="${fn:length(reviews)}"/> customer reviews)
            </span>
        </div>

        <div style="font-size: 2rem; font-weight: bold; color: var(--primary); margin-bottom: 1.25rem;">
            &#8377;<c:out value="${product.price}"/>
        </div>

        <p style="color: var(--secondary); line-height: 1.6; margin-bottom: 1.5rem;">
            <c:out value="${product.description}"/>
        </p>

        <div style="margin-bottom: 1.5rem; font-size: 0.95rem;">
            <p style="margin-bottom: 0.35rem;">
                <strong>Sold by:</strong> <c:out value="${product.sellerName}"/>
            </p>
            <p>
                <strong>Availability:</strong>
                <c:choose>
                    <c:when test="${product.stockQty > 0}">
                        <span style="color: var(--success); font-weight: 600;">In Stock (<c:out value="${product.stockQty}"/> available)</span>
                    </c:when>
                    <c:otherwise>
                        <span style="color: var(--danger); font-weight: 600;">Out of Stock</span>
                    </c:otherwise>
                </c:choose>
            </p>
        </div>

        <%-- Add to Cart Form --%>
        <c:choose>
            <c:when test="${product.stockQty > 0}">
                <form action="${pageContext.request.contextPath}/cart/add" method="POST" style="display: flex; gap: 1rem; align-items: center; max-width: 350px;">
                    <input type="hidden" name="productId" value="${product.id}">
                    <div style="width: 100px;">
                        <label class="form-label" for="quantity">Quantity</label>
                        <input type="number" id="quantity" name="quantity" class="form-control"
                               value="1" min="1" max="${product.stockQty}" required>
                    </div>
                    <button type="submit" class="btn btn-primary" style="margin-top: 1.5rem; flex-grow: 1;">
                        🛒 Add to Cart
                    </button>
                </form>
            </c:when>
            <c:otherwise>
                <button class="btn btn-secondary" disabled style="width: 100%; max-width: 350px;">
                    Item Unavailable
                </button>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<%-- Reviews Section --%>
<div style="margin-top: 2.5rem; background: white; padding: 2rem; border-radius: var(--radius); border: 1px solid var(--border-color); box-shadow: var(--shadow);">
    <h3 style="margin-bottom: 1.5rem;">Customer Reviews & Ratings</h3>

    <c:choose>
        <c:when test="${empty reviews}">
            <p style="color: var(--text-muted); font-style: italic;">No reviews yet for this product. Be the first to review after purchasing!</p>
        </c:when>
        <c:otherwise>
            <div style="display: flex; flex-direction: column; gap: 1rem;">
                <c:forEach var="rev" items="${reviews}">
                    <div style="padding: 1rem; border-bottom: 1px solid var(--border-color);">
                        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 0.35rem;">
                            <strong><c:out value="${rev.buyerName}"/></strong>
                            <span style="color: var(--text-muted); font-size: 0.8rem;">
                                <c:out value="${rev.createdAt}"/>
                            </span>
                        </div>
                        <div class="star-rating" style="margin-bottom: 0.5rem;">
                            <c:forEach begin="1" end="${rev.rating}">★</c:forEach><c:forEach begin="${rev.rating + 1}" end="5">☆</c:forEach>
                        </div>
                        <p style="color: var(--secondary);"><c:out value="${rev.comment}"/></p>
                    </div>
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

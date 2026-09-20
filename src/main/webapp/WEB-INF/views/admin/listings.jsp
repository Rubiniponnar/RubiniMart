<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="pageTitle" value="Product Listing Moderation" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 1.5rem;">
    <h2>Product Listing Moderation</h2>
    <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-secondary btn-sm">&larr; Back to Dashboard</a>
</div>

<div class="table-responsive">
    <table class="table">
        <thead>
            <tr>
                <th>Product</th>
                <th>Seller</th>
                <th>Category</th>
                <th>Price</th>
                <th>Stock</th>
                <th>Status</th>
                <th>Moderation Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="p" items="${products}">
                <tr>
                    <td style="display: flex; align-items: center; gap: 1rem;">
                        <c:choose>
                            <c:when test="${not empty p.imageUrl}">
                                <img src="<c:out value='${p.imageUrl}'/>" alt="<c:out value='${p.name}'/>"
                                     style="width: 45px; height: 45px; object-fit: cover; border-radius: 4px;"
                                     onerror="this.src='https://placehold.co/100x100?text=Item'">
                            </c:when>
                            <c:otherwise>
                                <div style="width: 45px; height: 45px; background: #f1f5f9; display: flex; align-items: center; justify-content: center; border-radius: 4px;">📦</div>
                            </c:otherwise>
                        </c:choose>
                        <div>
                            <a href="${pageContext.request.contextPath}/products/detail?id=${p.id}" target="_blank" style="font-weight: 600; color: var(--text-main); text-decoration: none;">
                                <c:out value="${p.name}"/>
                            </a>
                        </div>
                    </td>
                    <td><c:out value="${p.sellerName}"/></td>
                    <td><c:out value="${p.category}"/></td>
                    <td>&#8377;<c:out value="${p.price}"/></td>
                    <td><c:out value="${p.stockQty}"/></td>
                    <td>
                        <c:choose>
                            <c:when test="${p.isActive}">
                                <span class="badge" style="background-color: #dcfce7; color: #15803d;">Active</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge" style="background-color: #fee2e2; color: #b91c1c;">Disabled</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <form action="${pageContext.request.contextPath}/admin/listings/toggle" method="POST">
                            <input type="hidden" name="id" value="${p.id}">
                            <input type="hidden" name="active" value="${!p.isActive}">
                            <button type="submit" class="btn ${p.isActive ? 'btn-danger' : 'btn-primary'} btn-sm">
                                <c:out value="${p.isActive ? 'Disable Listing' : 'Enable Listing'}"/>
                            </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

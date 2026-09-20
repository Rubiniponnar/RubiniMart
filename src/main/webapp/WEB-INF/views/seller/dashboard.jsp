<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="pageTitle" value="Seller Dashboard" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
    <div>
        <h2>Seller Dashboard</h2>
        <p style="color: var(--text-muted);">Manage your product inventory and track stock levels</p>
    </div>
    <a href="${pageContext.request.contextPath}/seller/product/new" class="btn btn-primary">
        + Add New Product
    </a>
</div>

<c:choose>
    <c:when test="${empty products}">
        <div style="text-align: center; padding: 4rem 1rem; background: white; border-radius: var(--radius); border: 1px solid var(--border-color); box-shadow: var(--shadow);">
            <p style="font-size: 1.25rem; color: var(--text-muted); margin-bottom: 1.5rem;">You haven't listed any products yet.</p>
            <a href="${pageContext.request.contextPath}/seller/product/new" class="btn btn-primary">Create Your First Listing</a>
        </div>
    </c:when>
    <c:otherwise>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Stock Level</th>
                        <th>Rating</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="p" items="${products}">
                        <tr>
                            <td style="display: flex; align-items: center; gap: 1rem;">
                                <c:choose>
                                    <c:when test="${not empty p.imageUrl}">
                                        <img src="<c:out value='${p.imageUrl}'/>" alt="<c:out value='${p.name}'/>"
                                             style="width: 50px; height: 50px; object-fit: cover; border-radius: 4px;"
                                             onerror="this.src='https://placehold.co/100x100?text=Item'">
                                    </c:when>
                                    <c:otherwise>
                                        <div style="width: 50px; height: 50px; background: #f1f5f9; display: flex; align-items: center; justify-content: center; border-radius: 4px;">📦</div>
                                    </c:otherwise>
                                </c:choose>
                                <div>
                                    <a href="${pageContext.request.contextPath}/products/detail?id=${p.id}" style="font-weight: 600; color: var(--text-main); text-decoration: none;">
                                        <c:out value="${p.name}"/>
                                    </a>
                                </div>
                            </td>
                            <td><c:out value="${p.category}"/></td>
                            <td style="font-weight: 600;">&#8377;<c:out value="${p.price}"/></td>
                            <td>
                                <c:choose>
                                    <c:when test="${p.stockQty == 0}">
                                        <span class="badge" style="background-color: #fee2e2; color: #b91c1c;">0 (Out of stock)</span>
                                    </c:when>
                                    <c:when test="${p.stockQty < 5}">
                                        <span class="badge" style="background-color: #fef3c7; color: #b45309;"><c:out value="${p.stockQty}"/> (Low stock)</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge" style="background-color: #dcfce7; color: #15803d;"><c:out value="${p.stockQty}"/> in stock</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                ★ <c:out value="${p.averageRating != null ? String.format('%.1f', p.averageRating) : '0.0'}"/> (<c:out value="${p.reviewCount}"/>)
                            </td>
                            <td>
                                <div style="display: flex; gap: 0.5rem;">
                                    <a href="${pageContext.request.contextPath}/seller/product/edit?id=${p.id}" class="btn btn-secondary btn-sm">Edit</a>
                                    <form action="${pageContext.request.contextPath}/seller/product/delete" method="POST" onsubmit="return confirmAction('Are you sure you want to delete this listing?');">
                                        <input type="hidden" name="id" value="${p.id}">
                                        <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </c:otherwise>
</c:choose>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="pageTitle" value="Shopping Cart" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<h2 style="margin-bottom: 1.5rem;">Your Shopping Cart</h2>

<c:choose>
    <c:when test="${empty cart.items}">
        <div style="text-align: center; padding: 4rem 1rem; background: white; border-radius: var(--radius); border: 1px solid var(--border-color); box-shadow: var(--shadow);">
            <p style="font-size: 1.25rem; color: var(--text-muted); margin-bottom: 1.5rem;">Your cart is currently empty.</p>
            <a href="${pageContext.request.contextPath}/products" class="btn btn-primary">Start Shopping</a>
        </div>
    </c:when>
    <c:otherwise>
        <div style="display: grid; grid-template-columns: 2fr 1fr; gap: 2rem; align-items: start;">
            <%-- Items Table --%>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Unit Price</th>
                            <th>Quantity</th>
                            <th>Subtotal</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${cart.items}">
                            <tr>
                                <td style="display: flex; align-items: center; gap: 1rem;">
                                    <c:choose>
                                        <c:when test="${not empty item.productImageUrl}">
                                            <img src="<c:out value='${item.productImageUrl}'/>" alt="<c:out value='${item.productName}'/>"
                                                 style="width: 50px; height: 50px; object-fit: cover; border-radius: 4px;"
                                                 onerror="this.src='https://placehold.co/100x100?text=Item'">
                                        </c:when>
                                        <c:otherwise>
                                            <div style="width: 50px; height: 50px; background: #f1f5f9; display: flex; align-items: center; justify-content: center; border-radius: 4px;">📦</div>
                                        </c:otherwise>
                                    </c:choose>
                                    <div>
                                        <a href="${pageContext.request.contextPath}/products/detail?id=${item.productId}" style="font-weight: 600; color: var(--text-main); text-decoration: none;">
                                            <c:out value="${item.productName}"/>
                                        </a>
                                    </div>
                                </td>
                                <td>&#8377;<c:out value="${item.unitPrice}"/></td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/cart/update" method="POST" style="display: flex; align-items: center; gap: 0.5rem;">
                                        <input type="hidden" name="productId" value="${item.productId}">
                                        <input type="number" name="quantity" value="${item.quantity}" min="1" max="${item.availableStock}"
                                               class="form-control" style="width: 70px; padding: 0.3rem 0.5rem;">
                                        <button type="submit" class="btn btn-secondary btn-sm">Update</button>
                                    </form>
                                </td>
                                <td style="font-weight: 600; color: var(--primary);">
                                    &#8377;<c:out value="${item.subtotal}"/>
                                </td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/cart/remove" method="POST" onsubmit="return confirmAction('Remove this item from your cart?');">
                                        <input type="hidden" name="productId" value="${item.productId}">
                                        <button type="submit" class="btn btn-danger btn-sm">Remove</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <%-- Order Summary Box --%>
            <div style="background: white; padding: 1.5rem; border-radius: var(--radius); border: 1px solid var(--border-color); box-shadow: var(--shadow);">
                <h3 style="margin-bottom: 1.25rem;">Order Summary</h3>
                <div style="display: flex; justify-content: space-between; margin-bottom: 0.75rem; color: var(--secondary);">
                    <span>Total Items:</span>
                    <span><c:out value="${cart.totalItems}"/></span>
                </div>
                <div style="display: flex; justify-content: space-between; margin-bottom: 1.25rem; font-size: 1.25rem; font-weight: bold;">
                    <span>Total Amount:</span>
                    <span style="color: var(--primary);">&#8377;<c:out value="${cart.totalAmount}"/></span>
                </div>

                <a href="${pageContext.request.contextPath}/checkout" class="btn btn-primary" style="width: 100%; margin-bottom: 0.75rem;">
                    Proceed to Checkout &rarr;
                </a>
                <a href="${pageContext.request.contextPath}/products" class="btn btn-secondary" style="width: 100%;">
                    Continue Shopping
                </a>
            </div>
        </div>
    </c:otherwise>
</c:choose>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

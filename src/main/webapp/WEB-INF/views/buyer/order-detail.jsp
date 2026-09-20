<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="pageTitle" value="Order #${order.id}" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<c:if test="${isNewlyPlaced}">
    <div class="alert alert-success" style="margin-bottom: 2rem;">
        <div>
            <h3 style="margin-bottom: 0.25rem;">🎉 Thank you for your order!</h3>
            <p>Your order <strong>#<c:out value="${order.id}"/></strong> has been successfully placed.</p>
        </div>
    </div>
</c:if>

<div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 1.5rem;">
    <h2>Order #<c:out value="${order.id}"/> Details</h2>
    <span class="badge badge-${fn:toLowerCase(order.status)}" style="font-size: 0.95rem; padding: 0.35rem 0.75rem;">
        Status: <c:out value="${order.status}"/>
    </span>
</div>

<div style="display: grid; grid-template-columns: 2fr 1fr; gap: 2rem; align-items: start;">
    <div>
        <%-- Itemized List --%>
        <div class="table-responsive" style="margin-bottom: 2rem;">
            <table class="table">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Unit Price</th>
                        <th>Quantity</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${order.items}">
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
                            <td><c:out value="${item.quantity}"/></td>
                            <td style="font-weight: 600; color: var(--primary);">&#8377;<c:out value="${item.subtotal}"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <%-- Reviews Section for Completed/Shipped/Delivered Orders --%>
        <c:if test="${order.status == 'CONFIRMED' || order.status == 'SHIPPED' || order.status == 'DELIVERED'}">
            <div style="background: white; padding: 1.5rem; border-radius: var(--radius); border: 1px solid var(--border-color); box-shadow: var(--shadow);">
                <h3 style="margin-bottom: 1rem;">Rate & Review Items in this Order</h3>
                <c:forEach var="item" items="${order.items}">
                    <div style="border-top: 1px solid var(--border-color); padding-top: 1rem; margin-top: 1rem;">
                        <h4 style="margin-bottom: 0.5rem;"><c:out value="${item.productName}"/></h4>
                        <form action="${pageContext.request.contextPath}/reviews/submit" method="POST">
                            <input type="hidden" name="orderId" value="${order.id}">
                            <input type="hidden" name="productId" value="${item.productId}">

                            <div style="display: flex; gap: 1rem; align-items: center; margin-bottom: 0.75rem;">
                                <label class="form-label" style="margin-bottom: 0;">Rating:</label>
                                <select name="rating" class="form-control" style="width: 140px;">
                                    <option value="5">★★★★★ (5/5)</option>
                                    <option value="4">★★★★☆ (4/5)</option>
                                    <option value="3">★★★☆☆ (3/5)</option>
                                    <option value="2">★★☆☆☆ (2/5)</option>
                                    <option value="1">★☆☆☆☆ (1/5)</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <textarea name="comment" class="form-control" rows="2" placeholder="Write your review here..." required></textarea>
                            </div>

                            <button type="submit" class="btn btn-primary btn-sm">Submit Review</button>
                        </form>
                    </div>
                </c:forEach>
            </div>
        </c:if>
    </div>

    <%-- Order Info Sidebar --%>
    <div style="background: white; padding: 1.5rem; border-radius: var(--radius); border: 1px solid var(--border-color); box-shadow: var(--shadow);">
        <h3 style="margin-bottom: 1.25rem;">Order Information</h3>

        <div style="margin-bottom: 1rem;">
            <span style="color: var(--text-muted); font-size: 0.85rem; display: block;">Placed on:</span>
            <strong><c:out value="${order.createdAt}"/></strong>
        </div>

        <div style="margin-bottom: 1rem;">
            <span style="color: var(--text-muted); font-size: 0.85rem; display: block;">Shipping Address:</span>
            <p style="margin-top: 0.25rem; line-height: 1.5;"><c:out value="${order.shippingAddress}"/></p>
        </div>

        <div style="margin-bottom: 1rem;">
            <span style="color: var(--text-muted); font-size: 0.85rem; display: block;">Payment Status:</span>
            <span class="badge" style="background-color: #dcfce7; color: #15803d;"><c:out value="${order.paymentStatus}"/></span>
        </div>

        <div style="border-top: 1px solid var(--border-color); padding-top: 1rem; margin-top: 1rem;">
            <div style="display: flex; justify-content: space-between; font-size: 1.25rem; font-weight: bold;">
                <span>Total Amount:</span>
                <span style="color: var(--primary);">&#8377;<c:out value="${order.totalAmount}"/></span>
            </div>
        </div>

        <div style="margin-top: 1.5rem;">
            <a href="${pageContext.request.contextPath}/orders" class="btn btn-secondary" style="width: 100%;">
                &larr; Back to Orders
            </a>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="pageTitle" value="Seller Orders" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<h2 style="margin-bottom: 0.5rem;">Incoming Orders</h2>
<p style="color: var(--text-muted); margin-bottom: 2rem;">Manage order fulfillment and update shipping status for your products</p>

<c:choose>
    <c:when test="${empty orders}">
        <div style="text-align: center; padding: 4rem 1rem; background: white; border-radius: var(--radius); border: 1px solid var(--border-color); box-shadow: var(--shadow);">
            <p style="font-size: 1.25rem; color: var(--text-muted);">No incoming orders found for your products.</p>
        </div>
    </c:when>
    <c:otherwise>
        <div style="display: flex; flex-direction: column; gap: 1.5rem;">
            <c:forEach var="order" items="${orders}">
                <div style="background: white; border: 1px solid var(--border-color); border-radius: var(--radius); padding: 1.5rem; box-shadow: var(--shadow);">
                    <div style="display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid var(--border-color); padding-bottom: 0.75rem; margin-bottom: 1rem;">
                        <div>
                            <strong>Order #<c:out value="${order.id}"/></strong>
                            <span style="color: var(--text-muted); font-size: 0.9rem; margin-left: 0.5rem;">
                                Placed on <c:out value="${order.createdAt}"/> by <c:out value="${order.buyerName}"/> (<c:out value="${order.buyerEmail}"/>)
                            </span>
                        </div>
                        <span class="badge badge-${fn:toLowerCase(order.status)}">
                            <c:out value="${order.status}"/>
                        </span>
                    </div>

                    <%-- Items in this order belonging to seller --%>
                    <div style="margin-bottom: 1rem;">
                        <table class="table" style="box-shadow: none; border: none;">
                            <thead>
                                <tr>
                                    <th>Item</th>
                                    <th>Quantity</th>
                                    <th>Unit Price</th>
                                    <th>Subtotal</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${order.items}">
                                    <tr>
                                        <td><c:out value="${item.productName}"/></td>
                                        <td><c:out value="${item.quantity}"/></td>
                                        <td>&#8377;<c:out value="${item.unitPrice}"/></td>
                                        <td style="font-weight: 600;">&#8377;<c:out value="${item.subtotal}"/></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <div style="display: flex; justify-content: space-between; align-items: center; background: #f8fafc; padding: 1rem; border-radius: var(--radius);">
                        <div>
                            <span style="font-size: 0.85rem; color: var(--text-muted); display: block;">Shipping Destination:</span>
                            <span style="font-weight: 500;"><c:out value="${order.shippingAddress}"/></span>
                        </div>

                        <%-- Update Status Form --%>
                        <form action="${pageContext.request.contextPath}/seller/orders/status" method="POST" style="display: flex; align-items: center; gap: 0.5rem;">
                            <input type="hidden" name="orderId" value="${order.id}">
                            <label class="form-label" style="margin-bottom: 0;">Update Status:</label>
                            <select name="status" class="form-control" style="width: 140px; padding: 0.35rem 0.5rem;">
                                <option value="PENDING" ${order.status == 'PENDING' ? 'selected' : ''}>Pending</option>
                                <option value="CONFIRMED" ${order.status == 'CONFIRMED' ? 'selected' : ''}>Confirmed</option>
                                <option value="SHIPPED" ${order.status == 'SHIPPED' ? 'selected' : ''}>Shipped</option>
                                <option value="DELIVERED" ${order.status == 'DELIVERED' ? 'selected' : ''}>Delivered</option>
                                <option value="CANCELLED" ${order.status == 'CANCELLED' ? 'selected' : ''}>Cancelled</option>
                            </select>
                            <button type="submit" class="btn btn-secondary btn-sm">Update</button>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:otherwise>
</c:choose>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

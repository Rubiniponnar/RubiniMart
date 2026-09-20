<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="pageTitle" value="My Orders" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<h2 style="margin-bottom: 1.5rem;">My Order History</h2>

<c:choose>
    <c:when test="${empty orders}">
        <div style="text-align: center; padding: 4rem 1rem; background: white; border-radius: var(--radius); border: 1px solid var(--border-color); box-shadow: var(--shadow);">
            <p style="font-size: 1.25rem; color: var(--text-muted); margin-bottom: 1.5rem;">You haven't placed any orders yet.</p>
            <a href="${pageContext.request.contextPath}/products" class="btn btn-primary">Start Shopping</a>
        </div>
    </c:when>
    <c:otherwise>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Order #</th>
                        <th>Date</th>
                        <th>Total Amount</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <td><strong>#<c:out value="${order.id}"/></strong></td>
                            <td style="color: var(--text-muted); font-size: 0.9rem;">
                                <c:out value="${order.createdAt}"/>
                            </td>
                            <td style="font-weight: 600; color: var(--primary);">
                                &#8377;<c:out value="${order.totalAmount}"/>
                            </td>
                            <td>
                                <span class="badge badge-${fn:toLowerCase(order.status)}">
                                    <c:out value="${order.status}"/>
                                </span>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/orders/detail?id=${order.id}" class="btn btn-secondary btn-sm">
                                    View Details
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </c:otherwise>
</c:choose>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
